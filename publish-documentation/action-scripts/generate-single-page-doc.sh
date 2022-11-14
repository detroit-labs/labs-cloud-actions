#!/usr/bin/env sh

go install github.com/nocd5/md2html@latest

md2html -e -t $LIST_OF_PATHS_TO_MARKDOWN_FILES \
-c $PATH_TO_CSS_FILE \
-o $DOCUMENTATION_FILE_NAME

sed -E 's|<a href=".[^.]*/(.*)?/(.*).md">(.*)</a>|<a href="#\1-\2">\3</a>|' $DOCUMENTATION_FILE_NAME # update relative markdown file links to headings
sed -E 's|<a href="https://github.com.*">(.*)</a>|\1|' $DOCUMENTATION_FILE_NAME # remove github links
sed -E 's|<title>index</title>|<title>$PAGE_TITLE</title>|' $DOCUMENTATION_FILE_NAME # set page title
