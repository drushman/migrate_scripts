echo "Switch to the drupal7 branch."
#sudo su gituser -c "git checkout drupal7"
path="$(basename $(dirname $(dirname $(dirname $PWD))))";
echo "Dir sites to tmp"
cd ../../sites 

echo "dir sites"
pwd
echo "Remove drupal 6"
cd  ../../../../ -v
echo "current"
pwd
echo "$path/* -Rvf"
echo

echo "dowload drupal 7"
echo "drush -y dl drupal-7.17 --drupal-project-rename=$path -v"
echo "Remove sites"	
echo "$path/sites/* -Rvf"
echo " /tmp/sites $path/"

