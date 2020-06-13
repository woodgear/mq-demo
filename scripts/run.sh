set -e
./scripts/build.sh
echo "static link bin"
./out/bin/static/mq-demo-bin-static

echo "dynamic link bin"
./out/bin/dyn/mq-demo-bin-dynmic