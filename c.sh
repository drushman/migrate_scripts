
DRUPAL=$HOME"/duy.v3k.net"
DRUSH=$HOME"/drush/drush"
cat part1.sh

echo $DRUPAL 
echo $DRUSH
$DRUSH vset --always-set site_offline 1


exit



echo "Switch to the drupal7 branch."
sudo su gituser -c "git checkout drupal7"
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

