#!/bin/sh
dir=$(dirname "$(which $0)")
source $dir/flags.sh

docker run --rm -w /usr/src/myapp/build32 \
-v "$dir/build32":/usr/src/myapp/build32 \
-v "$dir/src":/usr/src/myapp/src \
-v "$dir/build":/usr/src/myapp/build \
\
-e MAKEFLAGS="                  -j8" \
-e LDFLAGS="                    -fstack-protector-strong -Wl,-O2,--sort-common,--as-needed,-z,relro,-z,now" \
-e CXXFLAGS="                   $FLAGS" \
-e CPPFLAGS="                   $FLAGS" \
-e CFLAGS="                     $FLAGS" \
\
debian:unstable                 /bin/bash -c \
"dpkg --add-architecture        i386; \
apt-get -y                      update; \
apt-get -y                      install \
xterm                           gcc-8-multilib \
g++-8-multilib                  g++-mingw-w64-i686 \
gcc-mingw-w64-i686              oss4-dev; \
apt-get -y                      install \
flex:i386                       bison:i386 \
libgstreamermm-1.0-dev:i386     libudev-dev:i386 \
libglu1-mesa-dev:i386           ocl-icd-opencl-dev:i386 \
libpcap-dev:i386                libncurses-dev:i386 \
libgphoto2-dev:i386             libfreetype6-dev:i386 \
libcapi20-dev:i386              libcups2-dev:i386 \
libgsm1-dev:i386                libldap2-dev:i386 \
libosmesa6-dev:i386             libv4l-dev:i386 \
libsdl2-dev:i386                libvulkan-dev:i386 \
libpulse-dev:i386               libsane-dev:i386 \
libmpg123-dev:i386              libvkd3d-dev:i386 \
libkrb5-dev:i386                liblcms2-dev:i386 \
libopenal-dev:i386              libfontconfig1-dev:i386 \
libxcomposite-dev:i386          libxslt1-dev:i386 \
libgnutls28-dev:i386; \
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
--with-x                        --disable-win64 \
--with-wine64=../build; \
\
make"

