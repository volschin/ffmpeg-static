FROM debian:bookworm-slim AS ffmpeg
ADD https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz /download/
RUN apt-get -qqy update && apt-get -qqy install --no-install-recommends xz-utils \
  && cd /download \
  && tar -xvf ffmpeg-release-amd64-static.tar.xz --wildcards */ffmpeg \
  && grep -lR **/ffmpeg | mv {} .. \
  && ./ffmpeg -version
