#!/bin/bash
set -e

cd "$(dirname $0)/source"
RELEASE_TAG=$(git describe --match "release-*" --abbrev=0 --always HEAD)
CHANGE_COUNT=$(git rev-list --count "$RELEASE_TAG..HEAD")
COMMIT_HASH=$(git rev-parse --short HEAD)

python setup.py patch_version --platform="$CHANGE_COUNT-$COMMIT_HASH"

echo $(python -c "import picard; print(picard.__version__)")
