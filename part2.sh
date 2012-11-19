#! /bin/bash
DRUSH="$HOME/drush/drush"
echo "Renaming sites/all/migrate to sites/all/modules."
echo "sites/all/modules contains symbolic links to sites/all/not-modules."
echo "The only modules in the current sites/all/modules are related to updating content fields."
#sudo mv ../all/migrate ../all/modules
mv ../all/migrate ../all/modules
echo

echo "Enable the required content modules located in sites/all/modules + features & admin menu."
echo
$DRUSH -y en content_migrate content_taxonomy content_taxonomy_migrate date link image node_reference ctools features admin_menu
echo

echo "Run database update on the content modules."
$DRUSH updb -y
echo

echo "[Part 2 Done]"
echo
