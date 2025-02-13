FROM registry.cn-hangzhou.aliyuncs.com/nicklin99/golang-runtime:1.23.1

# 安装 FFmpeg
RUN apt update && apt install ffmpeg

CMD [ "ffmpeg", "-version" ]