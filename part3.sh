#! /bin/bash
echo "Migrate content fields from d6 cck to d6 fields."
echo "You could also visit /admin/structure/content_migrate"
#drush -y content-migrate-fields
echo

echo
drush conent-migrate-field-structure field_image
drush content-migrate-field-data field_image
echo
drush content-migrate-field-structure field_video
drush content-migrate-field-data field_video
echo
drush content-migrate-field-structure field_category
drush content-migrate-field-data field_category
echo
drush content-migrate-field-structure field_date
drush content-migrate-field-data field_date
echo
drush content-migrate-field-structure field_video_link
drush content-migrate-field-data field_video_link
echo
drush content-migrate-field-structure field_photo
drush content-migrate-field-data field_photo
echo

echo "Done migrating fields."
echo
echo "All content fields have been updated."
echo
echo "[Part 3 Done]"
echo
