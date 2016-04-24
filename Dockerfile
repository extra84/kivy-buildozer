FROM ubuntu:16.04
MAINTAINER Extra <extra84@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y python-pip vim build-essential ccache git gcc openjdk-8-jdk lsb-release unzip wget
RUN apt-get install -y python-dev zlib1g-dev zlib1g:i386 libncurses5:i386 libstdc++6:i386
RUN pip install cython
RUN pip install buildozer
RUN adduser -u 1000 kivy && \
    mkdir -p /data /home/kivy/.buildozer && chown 1000 /data && \
    chown -R kivy.kivy /home/kivy/.buildozer


VOLUME ["/data"]
WORKDIR /home/kivy

USER kivy
RUN buildozer init
USER root
ENTRYPOINT ["/bin/bash"]
