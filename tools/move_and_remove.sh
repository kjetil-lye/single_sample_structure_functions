#!/bin/bash
set -e
rsync -rltqP $1 $2
rm -rf $1/*.nc
