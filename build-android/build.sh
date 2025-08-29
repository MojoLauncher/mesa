#!/bin/sh
rm build-crossfile
envsubst <crossfile >build-crossfile
meson setup "build-android" \
        --prefix=/tmp/zink \
        --cross-file "build-crossfile" \
            -Dbuildtype=release \
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
            -Dandroid-libbacktrace=disabled \
            -Dgallium-drivers=zink \
            -Dglx-read-only-text=true \
       ..
#            -Db_lto=true \
#            -Db_lto_mode=thin \
#            -Dstrip=true \

ninja -C "build-android" install
