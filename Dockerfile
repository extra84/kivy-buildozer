FROM debian:stretch
MAINTAINER Extra <extra84@gmail.com>

RUN  dpkg --add-architecture i386 \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ant \
		build-essential \
		ccache \
		curl \
		cython \
		git \
		gcc \
		lsb-release \
		openjdk-8-jdk \
		python-dev \
		python-pip \
		python-setuptools \
		python-wheel \
		unzip \
		vim \
		wget \
		xclip \ 
		xsel \
		zlib1g-dev \
                zlib1g:i386 libncurses5:i386 libstdc++6:i386 \
	&& apt-get clean 
RUN pip install pip --upgrade \
	&& pip install cython buildozer \
	&& useradd -u 1000 kivy \
	&& mkdir -p /data /home/kivy/.buildozer \
	&& mkdir -p /data /home/kivy/.local \
	&& mkdir -p /data /home/kivy/.android \
	&& chown 1000 /data \
	&& chmod -R 777 /home/kivy \
	&& chown -R kivy.kivy /home/kivy/

COPY make_apk /usr/bin/make_apk

WORKDIR /home/kivy

ENTRYPOINT ["make_apk"]
