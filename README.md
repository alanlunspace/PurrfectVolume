## Purrfect Volume App

Keeps your ears safe limiting the maximum volume for your Mac. Now with Headphone detection.

## Credits

[Lucas Andión](https://medium.com/trabe/limiting-your-macs-volume-in-2019-f314e20408ab)
[andion](https://github.com/andion/PurrfectVolume)
[Ranhiru Jude Cooray](https://medium.com/@ranhiru/limiting-your-macs-headphone-volume-13671b64e569)

## Build

```bash
brew install switchaudio-osx
open -a 'Script Editor' PurrfectVolume.scpt
# Change script type to javascript
# Edit line 6 to update deviceName.
# Edit line 39 to update maximum volume.
# Edit line 44 to update check interval.
# Export as Application with 'Stay open after run handler' option.
cp app/applet.icns app/PurrfectVolume.app/Contents/Resources/applet.icns
```

### osacompile doesn't work.

```bash
# osacompile -l JavaScript -s -o app/PurrfectVolume.app PurrfectVolume.scpt
```

## Run

```
open app/PurrfectVolume.app
```
