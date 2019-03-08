#!/bin/fish


set BASE_DIR (dirname (readlink -m (status filename)))/..

set DEP_DIR $BASE_DIR/dependencies

rm -rf -v $DEP_DIR
mkdir -p -v $DEP_DIR
cd $DEP_DIR

git clone git@github.com:EsGeh/fishshell-cmd-opts.git
cd fishshell-cmd-opts/
git checkout e446daf1741b416ecb83e4741b4cb7f99645bc11
cd -

git clone git@github.com:EsGeh/structuredData.git
cd structuredData
git checkout 64c0722b6fe1e4fa97bebd02cd1e944634025580
eval "./scripts/install_deps.fish"
cd -

git clone git@github.com:EsGeh/sdScript.git
cd sdScript
git checkout 720888e75a085deeba009cef47a2c834cbcc8093
eval "./scripts/install_deps.fish"
cd -
