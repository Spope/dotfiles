import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import qs.Commons
import qs.Ui

// Per-monitor workspaces: monitors are numbered left to right and monitor i
// owns workspaces i*10+1 .. i*10+10 (see ~/.config/hypr/bindings.lua). Each
// bar shows only its own monitor's set, labelled 1..0.
BarWidget {
  id: root
  moduleName: "thomas.workspaces"

  readonly property var barScreen: root.QsWindow.window ? root.QsWindow.window.screen : null

  readonly property int base: {
    if (!barScreen) return 0
    var screens = Quickshell.screens.slice()
    screens.sort(function(a, b) { return a.x !== b.x ? a.x - b.x : a.y - b.y })
    for (var i = 0; i < screens.length; i++) {
      if (screens[i].name === barScreen.name) return i * 10
    }
    return 0
  }

  function workspaceById(id) {
    var values = Hyprland.workspaces.values
    for (var i = 0; i < values.length; i++) {
      if (values[i].id === id) return values[i]
    }

    return null
  }

  function workspaceIds() {
    var ids = []
    for (var n = 1; n <= 5; n++) ids.push(root.base + n)

    var values = Hyprland.workspaces.values
    for (var i = 0; i < values.length; i++) {
      var id = values[i].id
      if (id > root.base && id <= root.base + 10 && ids.indexOf(id) === -1) ids.push(id)
    }

    ids.sort(function(left, right) { return left - right })
    return ids
  }

  function focusWorkspace(id) {
    if (!root.bar) return
    root.bar.run("hyprctl dispatch " + Util.shellQuote("hl.dsp.focus({ workspace = \"" + id + "\" })"))
  }

  readonly property real trailingGap: root.vertical ? 0 : Style.spaceReal(1.5)

  implicitWidth: grid.implicitWidth + trailingGap
  implicitHeight: grid.implicitHeight

  GridLayout {
    id: grid
    anchors.fill: parent
    anchors.rightMargin: root.trailingGap
    columns: root.vertical ? 1 : root.workspaceIds().length
    columnSpacing: root.vertical ? 0 : Style.space(1)
    rowSpacing: root.vertical ? Style.space(2) : 0

    Repeater {
      model: root.workspaceIds()

      WidgetButton {
        required property int modelData

        readonly property int number: modelData - root.base
        readonly property var workspace: root.workspaceById(modelData)
        readonly property bool occupied: workspace !== null && workspace.toplevels.values.length > 0
        readonly property bool focused: workspace !== null && workspace.active

        bar: root.bar
        text: focused ? "󱓻" : (number === 10 ? "0" : String(number))
        opacity: occupied || focused ? 1 : 0.5
        horizontalMargin: 6
        verticalPadding: 6
        fixedWidth: root.vertical ? root.barSize : Style.space(20)
        fixedHeight: root.barSize
        onPressed: function() { root.focusWorkspace(modelData) }
      }
    }
  }
}
