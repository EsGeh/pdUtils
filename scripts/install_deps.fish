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
git checkout d1cb758e2eba84082fac32814ff81f6bf4c3fac4
eval "./scripts/install_deps.fish"
cd -

git clone git@github.com:EsGeh/sdScript.git
cd sdScript
git checkout e35ae897ccd92b74e5157805452da5faab14a11a
eval "./scripts/install_deps.fish"
cd -
