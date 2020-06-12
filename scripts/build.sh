set -e
mkdir -p build
cd build
cmake ../scripts
make
mkdir -p ../out
cp ./mq-demo ../out/mq-demo