#!/bin/bash
file=$@;

match="\/Users\/spope\/boulot\/betterise-api";
replace="/var/www/html";

function string_replace {
    #DOC: "${string/match/replace}"
    string=$1
    echo "${string/$2/$3}"
}

corrected=$(string_replace "$file" "$match" "$replace")
correctedTwo=$(string_replace "$corrected" "errorFormat" "error-format")

#echo $correctedTwo;

docker-compose exec -T php ./vendor/bin/phpstan $correctedTwo
