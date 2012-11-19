#! /bin/bash

echo "setup $DRUSH"
DRUSH="$HOME/drush/drush"

echo "Begin Part 1 - Update core database tables."
echo

echo "Put site into maintenance mode."
$DRUSH vset --always-set site_offline 1
echo

echo "Disabling Vertical Response and the PHP input format module."
$DRUSH -y dis cookie_cache_bypass php vr
echo

echo "Creating enabled.txt file with enabled modules."
$DRUSH pml --no-core --type=module --status=enabled --pipe > enabled.txt
echo

echo "Disabling all the enabled modules."
xargs $DRUSH -y dis < enabled.txt
echo

echo "Set the default theme to garland."
$DRUSH vset theme_default garland
echo

echo "Use sites/default/settings-d7.php for d7 settings.php."
# sudo cp settings-d7.php settings.php
cp settings-d7.php settings.php
echo

echo "Files directory must be 777."
chmod 777 files

echo "Renaming sites/all/modules dir to sites/all/not-modules."
# sudo mv ../all/modules/ ../all/not-modules
mv ../all/modules/ ../all/not-modules
echo




echo "Switch to the drupal7 branch."
#sudo su gituser -c "git checkout drupal7"
path="$(basename $(dirname $(dirname $(dirname $PWD))))";
echo "Dir sites to tmp"
mv ../../../sites /tmp/ 

echo "Remove drupal 6"
cd  ../../../../ 
chomd 777 $path/ -R
rm $path/* -Rf
echo

echo "dowload drupal 7"
wget http://ftp.drupal.org/files/projects/drupal-7.17.tar.gz 
tar xvf drupal-7.17.tar.gz
cp drupal-7.17/* $path/ -rf
chmod 777 $path/ -R
echo "Remove sites"	
rm $path/sites -Rf
ls -la $path
chmod 777 /tmp/sites -R
mv /tmp/sites $path/

echo "Go to dir current script"
cd $path/sites/all/migrate_scripts




echo


echo "No contributed modules are accessible by drupal at this point."
echo

echo "This next command will conclude Part 1."
echo

echo "Running update.php with verbose debug information printed."
$DRUSH updb -vy
echo

echo "Update image style"
$DRUSH scr migrate.php
echo 


echo "Enable standard profile"
$DRUSH pm-enable standard
echo

echo "Core database tables have been migrated."
echo
echo "[Part 1 Done]"
echo
