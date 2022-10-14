#!/usr/bin/env sh

# this is a workaround to explicitily state version wanted, more info here: https://maelvls.dev/go111module-everywhere/
# do not use `go install github.com/nocd5/md2html@latest` as this will install incorrect version
GO111MODULE=on go get github.com/nocd5/md2html@v2.0.0

md2html -e -t $LIST_OF_PATHS_TO_MARKDOWN_FILES \
-c $PATH_TO_CSS_FILE \
-o $DOCUMENTATION_FILE_NAME

sed -i.tmp -e 's/<a href=\"[^http|https|#].*\">\(.*\)<\/a>/\1/gi' $DOCUMENTATION_FILE_NAME
sed -i.tmp -e 's/<title>index<\/title>/<title>$PAGE_TITLE<\/title>/gi' $DOCUMENTATION_FILE_NAME
