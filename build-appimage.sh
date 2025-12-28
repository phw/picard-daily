#!/bin/bash
set -e

APPIMAGECRAFT_URL="https://github.com/TheAssassin/appimagecraft/releases/download/continuous/appimagecraft-x86_64.AppImage"
ROOT_DIR=$(dirname "$0")
BUILD_DIR="$ROOT_DIR/build/"
SOURCE_DIR="$ROOT_DIR/source/"

cd "$ROOT_DIR"

if [ ! -d "$SOURCE_DIR" ]; then
  echo "Picard source code must be checked out in $SOURCE_DIR"
  exit 1
fi

pushd "$SOURCE_DIR"
# patch -p1 < ../appimage/appimage.patch
uv sync
uv run ../patch-version.sh
uv run python setup.py build --disable-locales
uv run python setup.py build_locales
uv run python setup.py build_ext -i
popd

curl -Lo appimagecraft.AppImage "$APPIMAGECRAFT_URL"
chmod +x appimagecraft.AppImage

mkdir -p "$BUILD_DIR"
rm -rf "$BUILD_DIR"/*
./appimagecraft.AppImage --build-dir "$BUILD_DIR" \
  --config-file appimagecraft.yml
