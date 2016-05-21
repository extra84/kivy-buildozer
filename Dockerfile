FROM ubuntu:16.04
MAINTAINER Extra <extra84@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386 && \
            apt-get update && \
            apt-get install -y python-pip cython vim build-essential ccache git gcc openjdk-8-jdk \
                lsb-release unzip wget curl python-dev zlib1g-dev ant \ 
                zlib1g:i386 libncurses5:i386 libstdc++6:i386 && \
            apt-get clean && \
            pip install pip --upgrade && \
            pip install cython buildozer && \
            adduser -u 1000 kivy && \
            mkdir -p /data /home/kivy/.buildozer && chown 1000 /data && \
            chown -R kivy.kivy /home/kivy/.buildozer

COPY make_apk /usr/bin/make_apk

WORKDIR /home/kivy

ENTRYPOINT ["make_apk"]
