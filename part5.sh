#! /bin/bash
DRUSH="$HOME/drush/drush"
echo "This MUST be run while the active directory is /sites/default"
echo


echo "Dowload modules "

$DRUSH -y dl acl content_access admin_menu content \
content_taxonomy content_taxonomy_autocomplete \
content_taxonomy_options link nodereference \
optionwidgets text kt_hcam_cancel_notify hcamtv_playlist\
kt_hcam_fbstream hcamtv_slideshow_email kt_hcam_slideshow_notify calendar \
calendar_ical jcalendar date date_api date_popup date_timezone pathologic \
mimemail simplenews nodequeue blocks404 backup_migrate gravatar \
imce menu_attributes pathauto mollom scheduler search_config \
taxonomy_title token transliteration service_links general_services \
googleanalytics ckeditor jquery_update views views_ui webform
echo

echo "Dowload contribute "
$DRUSH -y en acl content_access admin_menu content \
content_taxonomy content_taxonomy_autocomplete \
content_taxonomy_options link nodereference \
optionwidgets text kt_hcam_cancel_notify hcamtv_playlist\
kt_hcam_fbstream hcamtv_slideshow_email kt_hcam_slideshow_notify calendar \
calendar_ical jcalendar date date_api date_popup date_timezone pathologic \
mimemail simplenews nodequeue blocks404 backup_migrate gravatar \
imce menu_attributes pathauto mollom scheduler search_config \
taxonomy_title token transliteration service_links general_services \
googleanalytics ckeditor jquery_update views views_ui webform

echo "Update contributed modules"
$DRUSH updb -y
echo



echo "Login link:"
echo "$LOGIN"
echo
