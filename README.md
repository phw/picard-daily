# Daily builds for MusicBrainz Picard

This repository provides daily inofficial binary builds for the latest
development version of [MusicBrainz Picard](https://github.com/metabrainz/picard).

> [!NOTE]
> *These builds are for the latest development version of MusicBrainz Picard 3. There is
> not yet a stable release of Picard 3, and some changes are still work-in-progress.
> Specifically Picard 3 features a completely new plugin system, and plugins written for
> older versions are not compatible. Several existing plugins have been ported to the
> new system, but many plugins won't be available. You will need to check whether plugins
> you rely on are available.*


## Packages

> [!WARNING]
> *The binary packages provided here are built from Picard's latest development
> code and might be unstable or contain bugs. The packages are provided as is
> without any warranty.
> **Use at your own risk and always make backups of your files.***

The latest builds are always available on the [release page](https://github.com/phw/picard-daily/releases/tag/continuous).
The following builds are provided:

### Linux AppImage
📦 [MusicBrainz-Picard-daily-x86_64.AppImage](https://github.com/phw/picard-daily/releases/download/continuous/MusicBrainz-Picard-daily-x86_64.AppImage)

> [!TIP]
> *See [Running AppImages](https://docs.appimage.org/user-guide/run-appimages.html).
> I recommend installing [AppImageLauncher](https://github.com/TheAssassin/AppImageLauncher)
> to integrate AppImage easily into the desktop environment.*
> 
> *You can store Picard's configuration next to the AppImage by creating a folder with the same name as the AppImage but with
> `.config` appended. If you keep the default name create a folder `MusicBrainz-Picard-daily-x86_64.AppImage.config`. For more details
> see [Using Portable Mode](https://docs.appimage.org/user-guide/portable-mode.html) in the AppImage user documentation.*

### Windows Portable
📦 [MusicBrainz-Picard-daily.exe](https://github.com/phw/picard-daily/releases/download/continuous/MusicBrainz-Picard-daily.exe)


## Feedback and issue reports
For feedback, feature requests and issues regarding the daily builds please discuss on the
[MetaBrainz community forums](https://community.metabrainz.org/t/picard-daily-builds/650945) before
opening an [issue on GitHub](https://github.com/phw/picard-daily/issues).

Any general feature requests and bug reports for Picard should be reported to the official [ticket system](https://tickets.metabrainz.org/projects/PICARD).
If in doubt if an issue effects Picard in general or the daily builds specifically ask on the
[MetaBrainz community forums](https://community.metabrainz.org/t/picard-daily-builds/650945) first.
