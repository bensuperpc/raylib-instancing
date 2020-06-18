#!/usr/bin/bash
RAYLIB_DIR=src/raylib
FLAGS="-g -Wall -Werror -Wno-missing-braces"
INCLUDES="-I./src -I$RAYLIB_DIR/src -I$RAYLIB_DIR/src/external"
LIBRARIES="-L$RAYLIB_DIR/src -lraylib -lGL -lm -lpthread -ldl -lrt -lX11"

mkdir -p build

# Clean build output
find build -type f -executable -delete

# Build custom raylib
make -C $RAYLIB_DIR/src

# Build instancing examples
cc -o build/asteroids_instanced src/asteroids_instanced.c $FLAGS $INCLUDES $LIBRARIES

cc -o build/particles_instanced src/particles_instanced.c $FLAGS $INCLUDES $LIBRARIES

cc -o build/textures_bunnymark_instanced src/textures_bunnymark_instanced.c $FLAGS $INCLUDES $LIBRARIES

cc -o build/quads_instanced src/quads_instanced.c $FLAGS $INCLUDES $LIBRARIES

cc -o build/test_instanced_2d src/test_instanced_2d.c $FLAGS $INCLUDES $LIBRARIES

cc -o build/test_instanced_3d src/test_instanced_3d.c $FLAGS $INCLUDES $LIBRARIES
