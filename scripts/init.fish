#!/bin/fish


set BASE_DIR (dirname (readlink -m (status filename)))/..
set DEP_DIR $BASE_DIR/dependencies

rm -rf -v $DEP_DIR
mkdir -p -v $DEP_DIR
cd $DEP_DIR

# cmd line utils
git clone git@github.com:EsGeh/fishshell-cmd-opts.git
cd fishshell-cmd-opts/
git checkout e446daf1741b416ecb83e4741b4cb7f99645bc11
cd -

# structuredData
git clone git@github.com:EsGeh/structuredData.git
cd structuredData
git checkout ec60c2b3f3efad15f198e672da50b3f64542855a
cd -

# sdScript
git clone git@github.com:EsGeh/sdScript.git
cd sdScript
git checkout edd473670a14e80f163a9277ee447719ad9f7d30
cd -
