#! /bin/bash
source config.sh

echo $DRUPAL
echo $DRUSH
#$DRUSH/sites/all/migrate_scripts/part2.sh

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


echo "Renaming modules dir to old-modules."
# sudo mv ../all/modules/ ../all/not-modules
mv $DRUPAL/sites/all/modules/ $DRUPAL/sites/all/old-modules
mv $DRUPAL/sites/default/modules $DRUPAL/sites/old-modules
mv $DRUPAL/sites/default/themes $DRUPAL/sites/default/old-themes
echo

echo "Update core code."
echo "Lock sites"
#rm /tmp/ms_backup -rf
#mkdir /tmp/ms_backup
#chmod 777 /tmp/ms_backup -R
chmod 0440 $DRUPAL/sites -R;
#mv $DRUPAL/sites /tmp/ms_backup/ 
echo

echo "Remove drupal 6"
cd $PARRENT_DIR ;
mv $DRUPAL "$DRUPAL'_old'"
exit;
echo

echo "dowload drupal 7"

wget http://ftp.drupal.org/files/projects/drupal-7.17.tar.gz -O- | tar xz;
chmod 777 drupal-7.17/ -R
rm drupal-7.17/sites -rvf
cp drupal-7.17/* $DRUPAL/ -rf;

echo "remove drupal 7 downloaded"
rm drupal-7.17 -rf

echo "change permission to 777"
chmod 777 $DRUPAL/ -R
#echo "Remove sites new drupal"	
#rm $DRUPAL/sites -rvf

#echo "restores sites old drupal"
#chmod 777 /tmp/ms_backup/sites -R
#mv /tmp/ms_backup/sites $DRUPAL/

echo "cd to default"
cd $DRUPAL/sites/default
echo


echo "No contributed modules are accessible by drupal at this point."
echo

echo "This next command will conclude Part 1."
echo

echo "Running update.php with verbose debug information printed."
$DRUSH updb -vy
echo

echo "Enable standard profile"
$DRUSH -y pm-enable standard
echo

echo "Update image style"
$DRUSH scr $DRUPAL/sites/all/migrate_scripts/migrate.php
echo 

echo "Core database tables have been migrated."
echo
echo "[Part 1 Done]"
echo
