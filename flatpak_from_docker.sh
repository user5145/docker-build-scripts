#!/bin/sh
DIR=$(dirname "$(which $0)")
APP=org.dev.App.yml

docker run --rm --privileged -v "${DIR}/src:/app/src" -v "${DIR}/repo:/app/repo" -w /app/src -it ubuntu:18.10 bash -c "apt-get -qy update && apt-get -qy install flatpak-builder && flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo &&  flatpak-builder --repo=/app/repo --install-deps-from=flathub --force-clean build-dir ${APP}"


