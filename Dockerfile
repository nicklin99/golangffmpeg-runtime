FROM registry.cn-hangzhou.aliyuncs.com/nicklin99/golang-runtime:1.23.1

RUN apt-get update

RUN apt-get install -y \
	build-essential \
	git \
	pkg-config \
	yasm \
	libpng-dev

RUN \
	mkdir -p /opt/ffmpeg/src

WORKDIR /opt/ffmpeg/src

RUN \
	git clone https://github.com/FFmpeg/FFmpeg /opt/ffmpeg/src && \
	git checkout n7.0

RUN \
	./configure --prefix=.. --enable-openssl && \
	make && \
	make install

ENV CGO_LDFLAGS=-L/opt/ffmpeg/lib/
ENV CGO_CFLAGS=-I/opt/ffmpeg/include/
ENV PKG_CONFIG_PATH=/opt/ffmpeg/lib/pkgconfig

RUN rm -rf /opt/ffmpeg/src

CMD [ "ffmpeg", "-version" ]