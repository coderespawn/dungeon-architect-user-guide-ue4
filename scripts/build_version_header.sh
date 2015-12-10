#!/bin/bash

OUTPUT=templates/header_version.html
FILENAME_PREFIX="user_guide_"
FILENAME_POSTFIX=".html"

HEADER=$(cat <<EOF
			<div id="version-block">
			  <div class="dropdown">
			    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Version
			    <span class="caret"></span></button>
			    <ul class="dropdown-menu">
EOF
)

FOOTER=$(cat <<EOF
			    </ul>
			  </div>
			</div>
EOF
)

echo $HEADER > $OUTPUT
cat VERSIONS | while read version 
do
  echo "			      <li><a href="$FILENAME_PREFIX$version$FILENAME_POSTFIX">$version</a></li>" >> $OUTPUT
done < "${1:-/dev/stdin}"

echo $FOOTER >> $OUTPUT

