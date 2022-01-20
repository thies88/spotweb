FROM 3-alpine-nginx

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thies88"

# environment settings
ENV giturl="https://github.com/spotweb/spotweb.git"

# install spotweb packages
RUN \
echo "**** install build packages ****" && \
apk add --no-cache \
	git && \
echo "**** cleanup ****" && \
apk del --purge \
    curl && \
rm -rf \
	/tmp/*

#Copy local files
COPY root/ /
