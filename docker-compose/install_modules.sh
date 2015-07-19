#!/bin/bash

REPDIR=`cd "$(dirname $0)" && pwd -P`

PREFIX="/python"
cd $REPDIR
echo "Installing modules from $REPDIR/modules"
[ -d modules ] || halt "no $REPDIR/modules directory found"
for x in modules/*; do 
  if [ $x == "modules/requirements.txt" ] ; then
    echo "processing $x" 
    $REPDIR/exec.sh "pip install -r ${PREFIX}_$x"
    continue
  fi
  [ ! -d $x ] && continue
  echo $REPDIR/exec.sh "pip install ${PREFIX}_$x" 
  $REPDIR/exec.sh "pip install ${PREFIX}_$x" 
done
