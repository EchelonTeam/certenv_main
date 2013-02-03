#!/bin/bash

DATE=$(date +%F-%H-%M-%S)
O_DIR="./forensics-reports-$DATE"


echo Starting forensic analysis...

echo Creating dirs layout...
mkdir $O_DIR
mkdir $O_DIR/hardware

echo Collecting hardware info...

sudo lshw -html > $O_DIR/hardware/lshw.html
sudo lshw -json > $O_DIR/hardware/lshw.json
sudo lshw -xml > $O_DIR/hardware/lshw.xml

echo Checksuming results...
sha256deep -r $O_DIR > "./forensics-reports-$DATE.trh"

