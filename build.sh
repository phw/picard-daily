#!/bin/bash

APPIMAGECRAFT_URL="https://github.com/TheAssassin/appimagecraft/releases/download/continuous/appimagecraft-x86_64.AppImage"
ROOT_DIR=$(dirname "$0")
BUILD_DIR="$ROOT_DIR/build/"
SOURCE_DIR="$ROOT_DIR/source/"

cd "$ROOT_DIR"

wget -q "$APPIMAGECRAFT_URL"
chmod +x appimagecraft-x86_64.AppImage

[ ! -d "$SOURCE_DIR" ] || rm -rf "$SOURCE_DIR"
git clone --depth 500 --branch master "https://github.com/metabrainz/picard.git" "$SOURCE_DIR"
pushd "$SOURCE_DIR"
git fetch --depth=1 origin "+refs/tags/release-*:refs/tags/release-*"
popd

mkdir -p "$BUILD_DIR"
rm -rf "$BUILD_DIR"/*
./appimagecraft-x86_64.AppImage -d "$BUILD_DIR"
