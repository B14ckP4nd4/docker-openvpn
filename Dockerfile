FROM lsiobase/ubuntu:bionic

# set version label
ARG BUILD_DATE
ARG VERSION
ARG OPENVPNAS_VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="aptalca"

# environment settings
ARG DEBIAN_FRONTEND="noninteractive"

ENV DEBIAN_FRONTEND noninteractive

#openvpn
ENV port=1194
ENV proto=udp
ENV configPath=/config

RUN \
 echo "**** install dependencies ****" && \
 apt-get update && \
 apt-get install -y \
	bridge-utils \
	gnupg \
	iproute2 \
	iptables \
	liblzo2-2 \
	libmariadbclient18 \
	libmysqlclient-dev \
	net-tools \
	python \
	python-mysqldb \
	python-pkg-resources \
	python-pyrad \
	python-serial \
	rsync \
	wget \
	sqlite3 \
	ucarp

# add local files
COPY /root /

# ports and volumes
EXPOSE 1194/udp 1194/tcp 443/udp 443/tcp

VOLUME /config
