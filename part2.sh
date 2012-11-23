#! /bin/bash
source config.sh


echo "Renaming sites/all/migrate to sites/all/modules."
echo "sites/all/modules contains symbolic links to sites/all/not-modules."
echo "The only modules in the current sites/all/modules are related to updating content fields."
#sudo mv ../all/migrate ../all/modules
#mv ../all/migrate ../all/modules
echo

echo "Download modules to migrate fields"
$DRUSH dl cck references link content_taxonomy date ctools features admin_menu         

echo "Enable the required content modules located in sites/all/modules + features & admin menu."
echo
$DRUSH -y en content_migrate content_taxonomy content_taxonomy_migrate date link file image node_reference ctools features
echo

echo "Run database update on the content modules."
$DRUSH updb -y
echo

echo "[Part 2 Done]"
echo

