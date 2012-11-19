#! /bin/bash

echo "This MUST be run while the active directory is /sites/default"
echo


echo "Moving sites/all/not-modules back to sites/all/modules"
# sudo mv ../all/not-modules ../all/modules
mv ../all/d7-modules ../all/modules

echo "Enable drupal 7 modules"
cat ../all/list/enable.txt | xargs drush -y en
echo

echo "Update contributed modules"
drush updb -y
echo



echo "Login link:"
echo "$LOGIN"
echo
