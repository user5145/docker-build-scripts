#!/bin/sh
dir=$(dirname "$(which $0)")
source $dir/flags.sh

docker run --rm -w /usr/src/myapp/build \
-v "$dir/build":/usr/src/myapp/build \
-v "$dir/src":/usr/src/myapp/src \
\
-e MAKEFLAGS="                  -j8" \
-e LDFLAGS="                    -fstack-protector-strong -Wl,-O2,--sort-common,--as-needed,-z,relro,-z,now" \
-e CXXFLAGS="                    $FLAGS" \
-e CPPFLAGS="                    $FLAGS" \
-e CFLAGS="                      $FLAGS" \
\
debian:unstable                 /bin/bash -c \
"apt-get -y                     update; \
apt-get -y                      install \
g++                             gcc \
gcc-mingw-w64                   g++-mingw-w64 \
xterm                           flex \
bison                           libgstreamermm-1.0-dev \
libudev-dev                     libldap2-dev \
libosmesa6-dev                  libsane-dev \
libv4l-dev                      liblcms2-dev \
libpulse-dev                    libxslt1-dev \
libjpeg-dev                     libgnutls28-dev \
libvkd3d-dev                    libvkd3d-dev \
libsdl2-dev                     libkrb5-dev \
libgssapi-krb5-2                libmpg123-dev \
libopenal-dev                   libtiff-dev \
libvulkan-dev                   oss4-dev \
libpcap-dev                     libncurses-dev \
libgphoto2-dev                  libcapi20-dev \
libcups2-dev                    libgsm1-dev \
ocl-icd-opencl-dev              libfreetype6-dev \
libfontconfig1-dev              libxcomposite-dev \
libgettextpo-dev; \
\
../src/configure                --with-alsa \
--with-capi                     --with-cms \
--with-coreaudio                --with-cups \
--with-curses                   --with-dbus \
--with-fontconfig               --with-freetype \
--with-gettext                  --without-gettextpo \
--with-gphoto                   --with-glu \
--with-gnutls                   --with-gsm \
--with-gssapi                   --with-gstreamer \
--without-hal                   --with-jpeg \
--with-krb5                     --with-ldap \
--with-mpg123                   --with-netapi \
--with-openal                   --with-opencl \
--with-opengl                   --with-osmesa \
--with-oss                      --with-pcap \
--with-png                      --with-pthread \
--with-pulse                    --with-sane \
--with-sdl                      --with-tiff \
--with-udev                     --with-v4l \
--with-vkd3d                    --with-vulkan \
--with-xcomposite               --with-xcursor \
--with-xfixes                   --with-xinerama \
--without-xinput                --with-xinput2 \
--with-xml                      --with-xrandr \
--with-xrender                  --with-xshape \
--with-xshm                     --with-xslt \
--with-xxf86vm                  --with-zlib \
--with-x                        --enable-win64; \
\
make"

