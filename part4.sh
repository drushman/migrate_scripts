#! /bin/bash
source config.sh


echo "Migrate content fields from d6 cck to d6 fields."
echo "You could also visit /admin/structure/content_migrate"
echo

echo "Migrate field-image"
$DRUSH content-migrate-field-structure field_image
$DRUSH content-migrate-field-data field_image
echo "Done"

echo "Migrate field_video"
$DRUSH content-migrate-field-structure field_video
$DRUSH content-migrate-field-data field_video
echo "Done"

echo "Migrate field_catagory"
$DRUSH content-migrate-field-structure field_category
$DRUSH content-migrate-field-data field_category
echo "Done"

echo "Migrate field_date"
$DRUSH content-migrate-field-structure field_date
$DRUSH content-migrate-field-data field_date
echo "Done"

echo "Migrate field_video_link"
$DRUSH content-migrate-field-structure field_video_link
$DRUSH content-migrate-field-data field_video_link
echo "Done"

echo "Migrate field_photo"
$DRUSH content-migrate-field-structure field_photo
$DRUSH content-migrate-field-data field_photo
echo "Done"

echo "Remove field_category"
$DRUSH -y field-delete field_category --bundle=all

echo "Done migrating fields."
echo

echo "Convert Image field description to Alt on image field"
$DRUSH scr $DRUPAL/sites/all/migrate_scripts/image_descriptions.php
echo "Done"

echo "All content fields have been updated."
echo
echo "[Part 3 Done]"
echo
