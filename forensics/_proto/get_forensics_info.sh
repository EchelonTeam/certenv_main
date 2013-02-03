#!/bin/bash

DATE=$(date +%F-%H-%M-%S)
OUTPUT_DIR="./forensics-reports-$DATE"


echo Starting forensic analysis...

echo Creating dirs layout...
mkdir $OUTPUT_DIR



echo Checksuming results...
sha256deep -r $OUTPUT_DIR > "./forensics-reports-$DATE.trh"

