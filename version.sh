#!/bin/sh

cd "$(dirname $0)/source"
v=$(git describe --long --match "release-*")
echo ${v#release-}
