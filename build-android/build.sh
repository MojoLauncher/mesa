#!/bin/sh
rm build-crossfile
envsubst <crossfile >build-crossfile
meson setup "build-android" \
        --prefix=/tmp/zink \
        --cross-file "build-crossfile" \
            -Dplatforms=android \
            -Dplatform-sdk-version=26 \
            -Dandroid-stub=true \
            -Dllvm=disabled \
            -Dxlib-lease=disabled \
            -Degl=disabled \
            -Dgbm=disabled \
            -Dglx=disabled \
            -Dgles1=disabled \
            -Dgles2=disabled \
            -Dopengl=true \
            -Dosmesa=true \
            -Dvulkan-drivers= \
            -Dshared-glapi=disabled \
            -Degl-lib-suffix=-mojo \
            -Dandroid-libbacktrace=disabled \
            -Dgallium-drivers=softpipe,zink \
       ..
ninja -C "build-android" install
