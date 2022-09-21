#!/usr/bin/env sh

go install github.com/nocd5/md2html@latest

md2html -e -t $LIST_OF_PATHS_TO_MARKDOWN_FILES \
-c $PATH_TO_GITHUB_ACTION/$PATH_TO_CSS_FILE \
-o $PATH_TO_GITHUB_ACTION/documentation.html

sed -i.tmp -e 's/<a href=\"[^http|https|#].*\">\(.*\)<\/a>/\1/gi' $PATH_TO_GITHUB_ACTION/documentation.html
sed -i.tmp -e 's/<title>index<\/title>/<title>$PAGE_TITLE<\/title>/gi' $PATH_TO_GITHUB_ACTION/documentation.html