#! /bin/bash
DRUSH="$HOME/drush/drush"
DRUPAL="$HOME/duy.v3k.net"

echo "Disable modules don't necesary"
$DRUSH -y en php
echo

cd $DRUPAL/sites/all/modules
echo "Download and enable features"
git clone https://github.com/tuongduy/features_hcam.git

$DRUSH -y en features_hcam
echo
