# !!! not maintained any more !!!
# can't make new buildozer versions work inside a container 
# use official buildozer VM instead
# sorry :(


# kivy-buildozer

Docker container built for buildozer kivy tool.
Only python 2.7 has been tested so far.

### Usage:

> `cd dir_where_is_my_spec_file`

> `docker run --rm -ti -v $(pwd):/src extra/kivy-buildozer android debug`

- To skip Google's SDK and NDK download each time just use a persistent volume:
> `docker run --rm -ti -v $(pwd):/src -v package-name:/home/kivy/.buildozer:rw extra/kivy-buildozer android debug`

- If you need to access your device via USB with deploy run or logcat command, add usb support to your docker container (don't forget to enable usb debugging on the device):
> `docker run --rm --privileged -ti -v /dev/bus/usb:/dev/bus/usb -v $(pwd):/src -v package-name:/home/kivy/.buildozer:rw extra/kivy-buildozer android debug deploy run logcat`



if your application needs extra packages (libsomething-dev, ...) just add their names, one per line, in a packages.txt in the same directory as your spec file
