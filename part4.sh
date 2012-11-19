#! /bin/bash
DRUSH="$HOME/drush/drush"
echo "Moving sites/all/modules back to sites/all/migrate."
# sudo ../all/modules ../all/migrate
mv ../all/modules ../all/migrate
echo

#echo "Moving sites/all/not-modules back to sites/all/modules"
# sudo mv ../all/not-modules ../all/modules
#mv ../all/not-modules ../all/modules
echo

echo "Clearing all drupal cache."
echo
$DRUSH cc all
echo

echo "[Part 4 Done]"
echo
