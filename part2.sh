#! /bin/bash
source config.sh

echo

echo "Download modules to migrate fields"
$DRUSH dl cck references link content_taxonomy date ctools features admin_menu         
echo "Download complete"

echo "Enable the required content modules located in sites/all/modules + features & admin menu."
$DRUSH -y en content_migrate content_taxonomy content_taxonomy_migrate date link file image node_reference ctools features
echo "Enable complete"

echo "Run database update on the content modules."
$DRUSH updb -y
echo

echo "[Part 2 Done]"
echo

