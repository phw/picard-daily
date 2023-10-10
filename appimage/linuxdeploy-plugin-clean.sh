#! /bin/bash

# Performs some project specific cleanup on the AppDir
set -e

appdir=""

show_usage() {
    echo "Usage: bash $0 --appdir <AppDir>"
}

while [ "$1" != "" ]; do
    case "$1" in
        --plugin-api-version)
            echo "0"
            exit 0
            ;;
        --appdir)
            appdir="$2"
            shift
            shift
            ;;
        *)
            echo "Invalid argument: $1"
            echo
            show_usage
            exit 2
    esac
done

if [[ "$appdir" == "" ]]; then
    show_usage
    exit 2
fi

echo "Cleaning AppDir $appdir..."
set -x
rm -vrf "$appdir"/usr/conda/include/
rm -v "$appdir"/usr/conda/lib/*.a
rm -v "$appdir"/usr/conda/lib/libstdc++.so*

# Mitigate libwebp vulnerability allowing for arbitrary code execution (CVE-2023-4863).
# Disable the Qt webp imageformat plugin.
rm -v "$appdir"/usr/conda/lib/python3.11/site-packages/PyQt5/Qt5/plugins/imageformats/libqwebp.so
