echo $PWD;
path="$(basename $(dirname $(dirname $(dirname $PWD))))";
echo $path;
cd  /var/aegir/platforms/$path
pwd
#echo $(basename $(basename $(basename $(dirname $(dirname $PWD)))));

