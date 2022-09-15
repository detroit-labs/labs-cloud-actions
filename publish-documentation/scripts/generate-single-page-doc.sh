#!/usr/bin/env sh

mkdir build
cd build || exit
BUILDDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

mkdir bin
echo "$BUILDDIR/bin"
GOBIN="$BUILDDIR/bin" go/bin/go install github.com/nocd5/md2html@latest

bin/md2html -e -t $LIST_OF_PATHS_TO_MARKDOWN_FILES
-c $PATH_TO_CSS_FILE \
-o documentation.html

sed -i.tmp -e 's/<a href=\"[^http|https|#].*\">\(.*\)<\/a>/\1/gi' documentation.html
sed -i.tmp -e 's/<title>index<\/title>/<title>$PAGE_TITLE<\/title>/gi' documentation.html