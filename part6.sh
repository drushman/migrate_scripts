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

$DRUSH -y en features_hcam
echo

echo "clear cache"
$DRUSH cc all -v
