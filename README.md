# kivy-buildozer

Docker container built for buildozer kivy tool.

### Usage:

> `docker run -ti extra/kivy-buildozer`

- Customize the container if needed as root. Then switch to kivy user :

> `su kivy`

- Download your kivy app sources. (wget, git ...)
- Replace the default Buildozer.spec file with yours. Default file is just here if you need to test the container
- Build the apk
> `buildozer android debug`

### Tips:
- To skip Google's SDK and NDK download each time just use a persistent volume:
> `docker run -ti -v package-name:/home/kivy/.buildozer:rw extra/kivy-buildozer`
- To transfer your apk from docker to your device or computer you could use python http module from the folder containing your apk
> `docker run -ti -p 80:8000 -v  tmp:/home/kivy/.buildozer:rw extra/kivy-buildozer`

> `python -m SimpleHTTPserver`

