#!/usr/bin/env sh

go install github.com/nocd5/md2html@latest

md2html -e -t $LIST_OF_PATHS_TO_MARKDOWN_FILES \
-c $PATH_TO_CSS_FILE \
-o documentation.html

readlink -f documentation.html

sed -i.tmp -e 's/<a href=\"[^http|https|#].*\">\(.*\)<\/a>/\1/gi' documentation.html
sed -i.tmp -e 's/<title>index<\/title>/<title>$PAGE_TITLE<\/title>/gi' documentation.html