# EK RA8D1 Blinky example

RA8D1 Evaluation Board Blinky Example

## Quick build

Configure CMake
```sh
cmake -B build -D CMAKE_TOOLCHAIN_FILE=cmake/toolchains/arm-none-eabi-gcc.cmake
```

Enter build directory and run makefile
```sh
cd build
make
```

## Debug support

Install the VSCode `cortex-debug` extension and follow online tutorials on how to use it.
Debug configuration is ready in `.vscode/launch.json` file.
