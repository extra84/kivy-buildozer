FROM ubuntu:16.04
MAINTAINER Extra <extra84@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y python-pip vim build-essential ccache git gcc openjdk-8-jdk \
            lsb-release unzip wget curl python-dev zlib1g-dev ant \ 
            zlib1g:i386 libncurses5:i386 libstdc++6:i386

RUN pip install cython
RUN pip install buildozer
RUN adduser -u 1000 kivy && \
    mkdir -p /data /home/kivy/.buildozer && chown 1000 /data && \
    chown -R kivy.kivy /home/kivy/.buildozer

VOLUME ["/data"]


USER kivy
WORKDIR /home/kivy
RUN buildozer init

# TEMP. just in case some customization is needed
USER root

EXPOSE 8000

ENTRYPOINT ["/bin/bash"]
