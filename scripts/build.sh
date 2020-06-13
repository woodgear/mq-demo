set -e
rm -rf out
mkdir -p build
cd build
cmake ../scripts  -DCMAKE_INSTALL_PREFIX=/mnt/sm/temp/mq-demo/out
make
make install 
# mkdir -p ../out
# cp ./mq-demo-bin-dynmic ../out/mq-demo-bin-dynmic
# cp ./libmq-demo-lib-dynmic.so ../out/libmq-demo-lib-dynmic.so

# cp ./mq-demo-bin-static ../out/mq-demo-bin-static
# cp ./libmq-demo-lib-static.a ../out/libmq-demo-lib-static.a