#!/bin/bash

CONFIG_mux="tmux"
CONFIG_id="mucks$$"
CONFIG_dir=.
CONFIG_name="mucks - `dirname .`"

[ -d "$TMPDIR" ] && TMP="$TMPDIR" || TMP=/tmp

trim() {
    echo "$1" | sed -e 's/#.*$//' -e 's/[[:space:]]*$//' -e 's/^[[:space:]]*//'
}

parse_header() {
    k=`echo "$1" | sed -e 's/:.*$//'`
    v=`echo "$1" | sed -e 's/^[^:]*:[[:space:]]*//'`
    k=`trim "$k"`
    v=`trim "$v"`
    # TODO check if $k is a valid key
    eval CONFIG_$k="\"$v\""
}

parse_layout() {
    cmd="`echo $1 | sed -e 's/^-[[:space:]]*/-/' -e 's/[[:space:]].*$//'`"
    args="`echo $1 | sed -e 's/^-[[:space:]]*[^ \t]*[[:space:]]*//'`"
    case $cmd in
        "-split" | "-hsplit")
            mux_hsplit
            ;;
        "-vsplit")
            mux_vsplit
            ;;
        "-layout")
            mux_layout $args
            ;;
        "-sleep")
            mux_sleep $args
            ;;
        *)
            if [ `expr substr $cmd 1 1` = "-" ]; then
                echo "Invalid command: $cmd"
                exit 1
            else
                mux_send $1
            fi
            ;;
    esac
    true
}

parse_config() {
    IFS=''
    header_flag=1
    while read line <&3 ; do
        line=`trim "$line"`
        [ -z $line ] && continue
        section=`echo $line | sed -e 's/^\[\(.*\)\]$/\1/'`
        if [ "x$section" != "x$line" ] ; then # new layout section
            mux_new_window $section
            header_flag=0
            continue
        fi
        [ $header_flag -eq 1 ] && parse_header "$line" || parse_layout "$line"
    done
    mux_finalize
}

mux_new_window() {
    if [ -z $STARTED ] ; then
        STARTED=1
        cd $CONFIG_dir
        [ -n $CONFIG_pre ] && eval $CONFIG_pre
        cd $CONFIG_dir
        printf "\033]0;$CONFIG_name\007"
        WINDOW_NAME=`echo $1 | sed -e 's/[\*]//g'`
        case $CONFIG_mux in
            "tmux")
                tmux new-session -d -s "$CONFIG_name" -n "$WINDOW_NAME"
                ;;
            "screen")
                screen -d -m -S "$CONFIG_name" -t "$WINDOW_NAME" $SHELL
                ;;
        esac
        WINDEX=0
    else
        case $CONFIG_mux in
            "tmux") tmux new-window -t "$CONFIG_name" -n "$1" ;;
            "screen") screen -S "$CONFIG_name" -X screen -t "$1" $SHELL ;;
        esac
        WINDEX=$((WINDEX+1))
    fi
    if [[ $1 =~ [\*]$ ]] ; then
        SELECT_INDEX=$((WINDEX+1))
    fi
    [ -n $CONFIG_prewnd ] && mux_send $CONFIG_prewnd
    LAST_WINDOW_NAME="$1"
}

mux_hsplit() {
    case $CONFIG_mux in
        "tmux") tmux split-window -v "$CONFIG_name" -t ;;
        "screen") mux_new_window $LAST_WINDOW_NAME ;;
    esac
}

mux_vsplit() {
    case $CONFIG_mux in
        "tmux") tmux split-window -h -t "$CONFIG_name" ;;
        "screen") mux_new_window $LAST_WINDOW_NAME ;;
    esac
}

mux_layout() {
    case $CONFIG_mux in
        "tmux") tmux select-layout $1 -t "$CONFIG_name" ;;
    esac
}

mux_window() {
    case $CONFIG_mux in
        "tmux")
            tmux select-window -t "$CONFIG_name:$SELECT_INDEX"
            ;;
    esac
}

mux_sleep() {
    sleep $1
}

mux_send() {
    case $CONFIG_mux in
        "tmux") tmux send-keys -t "$CONFIG_name" "$1" "C-m" ;;
        "screen")
            screen -S "$CONFIG_name" -p $WINDEX -X stuff "$1"
            ;;
    esac
}

mux_finalize() {
    if [ -n "$SELECT_INDEX" ] ; then
        mux_window
    fi

    case $CONFIG_mux in
        "tmux")
            tmux -2 attach-session -t "$CONFIG_name"
            rm -f "$CONFIG_name"
            ;;
        "screen") screen -r "$CONFIG_name" ;;
    esac
}

main() {
    if [ $# -eq 1 ] ; then
        if [ -f "$1" ] ; then
            parse_config 3< "$1"
        else
            echo "Error: not found $1"
            exit 1
        fi
    elif [ -f .mucksrc ] ; then
        parse_config 3< .mucksrc
    else
        echo "Error: .mucksrc not specified and not found in the current directory"
        exit 1
    fi
}

[ -z $TEST ] && main $*

