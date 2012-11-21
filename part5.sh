#! /bin/bash
DRUSH="$HOME/drush/drush"
DRUPAL="$HOME/duy.v3k.net"


cd $DRUPAL/sites/all/modules

echo "Dowload modules "

$DRUSH -y dl acl content_access admin_menu \
content_taxonomy link reference text calendar \
date pathologic \
mimemail simplenews nodequeue backup_migrate gravatar \
imce menu_attributes pathauto mollom scheduler search_config \
taxonomy_title token transliteration service_links general_services \
google_analytics ckeditor jquery_update views views_ui webform
echo

echo "Enable contribute "
$DRUSH -y en acl content_access content \
content_taxonomy content_taxonomy_autocomplete \
content_taxonomy_options link node_reference \
text calendar \
calendar_ical jcalendar date date_api date_popup date_timezone pathologic \
mimemail simplenews nodequeue  backup_migrate gravatar \
imce menu_attributes pathauto mollom scheduler search_config \
taxonomy_title token transliteration service_links general_services \
googleanalytics ckeditor jquery_update views views_ui webform


echo "Get custom module from git"

git clone https://duynguyen@bitbucket.org/duynguyen/hcam.git
$DRUSH -y en kt_hcam_cancel_notify hcamtv_playlist kt_hcam_fbstream hcamtv_slideshow_email kt_hcam_slideshow_notify
echo


echo "Update contributed modules"
$DRUSH updb -y
echo




$DRUSH vset --always-set site_offline 0

echo "enable themes"
mkdir $DRUPAL/sites/default/themes
cd $DRUPAL/sites/default/themes
git clone https://github.com/tuongduy/hcamtv
$DRUSH -y en hcamtv
$DRUSH vset theme_default hcamtv
echo

echo "Setting file system"
mkdir $DRUPAL/sites/default/temp
chmod 777 $DRUPAL/sites/default/temp -R
chmod 777 $DRUPAL/sites/default/files -R


echo "Login link:"
echo "$LOGIN"
echo
