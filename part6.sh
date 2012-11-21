#! /bin/bash
source config.sh

echo "Disable modules don't necesary"
$DRUSH -y en php admin_menu_toolbar 
$DRUSH -y ven taxonomy_term
$DRUSH -y dis shortcut toolbar overlay field_ui rdf syslog update dblog
echo

cd $DRUPAL/sites/all/modules
echo "Download and enable features"
git clone https://github.com/tuongduy/features_hcam.git


$DRUSH dl entity rules
$DRUSH -y en features_hcam
echo

echo "Features revert"
$DRUSH fe features_hcam


echo "Edit node 71"
$DRUSH scr $DRUPAL/sites/all/migrate_scripts/edit_node_71.php
echo "clear cache"
$DRUSH cc all -v
