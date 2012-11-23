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
echo

echo "Move $DRUPAL to $DRUPAL-old"
cd $PARRENT_DIR ;
mv $DRUPAL $DRUPAL-old
echo "Move done"

echo "Dowload drupal 7"
wget http://ftp.drupal.org/files/projects/drupal-7.17.tar.gz -O- | tar xz;
chmod 777 drupal-7.17/ -R
mv drupal-7.17 $DRUPAL
mv $DRUPAL/sites $DRUPAL/sites_empty
echo "Download done"

echo "Move sites from old sites to new sites"
mv $DRUPAL-old/sites $DRUPAL/
echo "Move done"

echo "cd to default"
cd $DRUPAL/sites/default
echo "Now systme run at"
pwd

echo "Running update.php with verbose debug information printed."
$DRUSH updb -vy
echo "Update done db to drupal 7"

echo "Enable standard profile"
$DRUSH -y pm-enable standard
echo "Enable done"


echo "Update image style"
$DRUSH scr $DRUPAL/sites/all/migrate_scripts/migrate.php
echo "Update image complete"

echo "Core database tables have been migrated."
echo
echo "[Part 1 Done]"
echo
