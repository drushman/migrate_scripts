#! /bin/bash
source config.sh

echo "Disable modules don't necesary"
$DRUSH -y en php admin_menu_toolbar 
$DRUSH -y ven taxonomy_term
$DRUSH -y dis shortcut toolbar overlay field_ui rdf syslog update dblog
echo "Done"

echo "Go to sites/all/modules"
cd $DRUPAL/sites/all/modules
echo "Download and enable features"
git clone https://github.com/tuongduy/features_hcam.git


echo "Download modules vc_footer_block"
git clone https://github.com/tuongduy/vc_footer_block.git


$DRUSH dl entity rules
$DRUSH -y en features_hcam
echo

$DRUSH -y en vc_footer_block
echo

echo "Features revert"
$DRUSH fr features_hcam -y



echo "Edit node 71"
$DRUSH scr $DRUPAL/sites/all/migrate_scripts/edit_node_71.php
echo "clear cache"
$DRUSH cc all -v

echo "Disable Logging and error"
$DRUSH vset error_level 1
echo
echo "Download ckeditor"
cd $DRUPAL/sites/all/modules/ckeditor
mv ckeditor ckeditor_1
wget http://download.cksource.com/CKEditor/CKEditor/CKEditor%203.6.5/ckeditor_3.6.5.tar.gz -O- | tar xz
echo done

