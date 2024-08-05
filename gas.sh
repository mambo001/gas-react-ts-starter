#! /bin/bash
echo -e "\n### GAS: Build for Google Apps Script ###\n"

GAS_DIR="./gas"
GAS_CLIENT_DIR="./gas/client"
DIST_DIR="./dist"

# Check if the ./dist folder created
if [ ! -d $DIST_DIR ]; then
    echo -e "\n### GAS: You Need to Build the Project First! ###\n"
    return 0
fi

# Create Root Folder gas if not created
if [ ! -d $GAS_DIR ]; then
    mkdir $GAS_DIR
fi

# Create gas client folder if not created
if [ ! -d $GAS_CLIENT_DIR ]; then
    mkdir $GAS_CLIENT_DIR
fi

# add gas/index.html file
touch gas/client/index.html

# Copy ./dist/index.html to ./gas/index.html
cat dist/index.html | sed -E "s/<script.+script>/<?!= includes(\"client\/js.html\"); ?>/" | sed -E "s/<link rel=\"stylesheet\".+>/<?!= includes(\"client\/css.html\"); ?>/" >./gas/client/index.html

echo -e "### GAS: client/index.html Created! ###"

# Copy ./dist/assets/index.*.js ./gas/client/javascript.html
echo "<script type=\"module\" crossorigin>" >./gas/client/js.html
cat ./dist/assets/index-*.js >>./gas/client/js.html
echo "</script>" >>./gas/client/js.html
echo -e "### GAS: client/js.html Created! ###"

# Copy ./dist/assets/index.*.css ./gas/client/css.html
echo "<style>" >./gas/client/css.html
cat ./dist/assets/index-*.css >>./gas/client/css.html
echo "</style>" >>./gas/client/css.html
echo -e "### GAS: css.html Created! ###"

echo -e "\n### GAS: Done! ###\n"
