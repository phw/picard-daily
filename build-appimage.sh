#!/bin/bash
set -e

APPIMAGECRAFT_URL="https://github.com/TheAssassin/appimagecraft/releases/download/continuous/appimagecraft-x86_64.AppImage"
ROOT_DIR=$(dirname "$0")
BUILD_DIR="$ROOT_DIR/build/"
SOURCE_DIR="$ROOT_DIR/source/"

cd "$ROOT_DIR"

[ ! -d "$SOURCE_DIR" ] || rm -rf "$SOURCE_DIR"
git clone --depth 500 --branch 2.x "https://github.com/metabrainz/picard.git" "$SOURCE_DIR"
pushd "$SOURCE_DIR"
git fetch --depth=1 origin "+refs/tags/release-*:refs/tags/release-*"
patch -p1 < ../appimage/appimage.patch
popd

./patch-version.sh

curl -Lo appimagecraft.AppImage "https://github.com/TheAssassin/appimagecraft/releases/download/continuous/appimagecraft-x86_64.AppImage"
chmod +x appimagecraft.AppImage

mkdir -p "$BUILD_DIR"
rm -rf "$BUILD_DIR"/*
./appimagecraft.AppImage --build-dir "$BUILD_DIR" \
  --config-file appimagecraft.yml
