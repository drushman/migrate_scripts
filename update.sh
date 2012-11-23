#! /bin/bash

source config.sh

cat $DRUPAL/sites/all/migrate_scripts/part1.sh
exit

TODAY=`date "+%Y%m%d"`-`date +%H%M%S`
echo "FYI Today is $TODAY"
echo

echo "Saving a db snapshot called site-db-d6.sql."
#$DRUSH sql-dump --skip-tables-key=common > site-db-d6.sql
echo

echo "Change into sites/default directory."
cd $DRUPAL/sites/default
echo


echo
echo "* * * * Beginning Part 1. * * * *"
echo

echo "Running part1.sh"
echo
$DRUPAL/sites/all/migrate_scripts/part1.sh
echo

echo "Saving a db snapshot called site-db-part1.sql."
#$DRUSH sql-dump --skip-tables-key=common > site-db-part1.sql
echo


echo
echo "* * * * Beginning Part 2. * * * *"
echo

echo "Running part2.sh"
echo
$DRUPAL/sites/all/migrate_scripts/part2.sh
echo

echo "Saving a db snapshot called site-db-part2.sql."
#$DRUSH sql-dump --skip-tables-key=common > site-db-part2.sql
echo


echo
echo "* * * * Beginning Part 3. * * * *"
echo

echo "Running part3.sh"
echo
$DRUPAL/sites/all/migrate_scripts/part3.sh
echo

echo "Saving a db snapshot called site-db-part3.sql."
echo
#$DRUSH sql-dump --skip-tables-key=common > site-db-part3.sql
echo


echo
echo "* * * * Beginning Part 4. * * * *"
echo

echo "Running part4.sh"
echo
$DRUPAL/sites/all/migrate_scripts/part4.sh
echo

echo "Part 4 does NOT get a database backup."
echo


echo
echo "* * * * Beginning Part 5. * * * *"
echo

echo "Running part5.sh"
echo
$DRUPAL/sites/all/migrate_scripts/part5.sh
echo

echo "Saving a db snapshot called site-db-part5.sql."
echo
#$DRUSH sql-dump --skip-tables-key=common > site-db-part5.sql
echo


echo
echo "* * * * Beginning Part 6. * * * *"
echo

echo "Running part6.sh"
echo
$DRUPAL/sites/all/migrate_scripts/part6.sh
echo

echo "Saving a db snapshot called site-db-part6.sql."
echo
#$DRUSH sql-dump --skip-tables-key=common > site-db-part6.sql
echo


echo
echo "* * * * We are all done! * * * *"
echo
echo "[ALL DONE!]"
