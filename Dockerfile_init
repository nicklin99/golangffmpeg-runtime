FROM registry.cn-hangzhou.aliyuncs.com/nicklin99/golang-runtime:1.23.1

# 安装 FFmpeg
RUN apt-get update && \
    apt-get install -y ffmpeg \
    libavcodec-dev \
    libavdevice-dev \
    libavfilter-dev \
    libavformat-dev \
    libswresample-dev \
    libavutil-dev \
    libpng-dev \
    libswscale-dev && \
    rm -rf /var/lib/apt/lists/*

CMD [ "ffmpeg", "-version" ]