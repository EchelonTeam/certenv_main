#!/bin/bash

DATE=$(date +%F-%H-%M-%S)
O_DIR="./forensics-reports-$DATE"
declare -a DR_IMG=('sdb')

echo Starting forensic analysis...

echo Creating dirs layout...
mkdir $O_DIR
mkdir $O_DIR/hardware
mkdir $O_DIR/drive-img

set -x verbose

echo Collecting hardware info...
#sudo lshw -html > $O_DIR/hardware/lshw.html
#sudo lshw -json > $O_DIR/hardware/lshw.json
#sudo lshw -xml > $O_DIR/hardware/lshw.xml

echo Producing drives images...
sudo aimage --batch -l $O_DIR/drive-img/aimage.log  /dev/${DR_IMG[@]} $O_DIR/drive-img/aimage-${DR_IMG[@]}.aff > $O_DIR/drive-img/aimage-results.log

echo Checksuming results...
sha256deep -r $O_DIR > "./forensics-reports-$DATE.trh"

