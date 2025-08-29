#!/bin/sh
rm build-crossfile
envsubst <crossfile >build-crossfile
export RELEASEFLAGS="-Dbuildtype=release -Db_lto=true -Db_lto_mode=thin -Dstrip=true"
meson setup "build-android" \
        --prefix=/tmp/zink-$MESON_CPU_FAMILY \
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
            -Dandroid-libbacktrace=disabled \
            -Dgallium-drivers=zink \
            -Dglx-read-only-text=true \
            $RELEASEFLAGS \
       ..

ninja -C "build-android" install
