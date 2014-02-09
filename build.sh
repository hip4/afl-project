echo "Building"
mvn clean install

echo "copy files"
mkdir ./build
mkdir ./build/ch/
mkdir ./build/ch/m02/
mkdir ./build/ch/m02/comet/
mkdir ./build/ch/m02/comet/afl/
mkdir ./build/ch/m02/comet/afl/applet/
mkdir ./build/ch/m02/comet/afl/parser/

cp -R ./applet/target/classes/ch/m02/comet/afl/applet/*.class ./build/ch/m02/comet/afl/applet/
cp -R ./parser/target/classes/ch/m02/comet/afl/parser/*.class ./build/ch/m02/comet/afl/parser/
cp -R ./parser/target/generated-sources/logo/ch/m02/comet/afl/parser/*.html ./build/
cp -R ./parser/target/generated-sources/logo/ch/m02/comet/afl/parser/*.java ./build/
echo "done"