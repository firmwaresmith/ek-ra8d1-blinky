# cmake/toolchains/arm-none-eabi-gcc.cmake file

# MCU type
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

# Compiler executables to be searched
set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER arm-none-eabi-g++)

# Other executables shipped with toolchain
set(CMAKE_OBJCOPY arm-none-eabi-objcopy)
set(CMAKE_SIZE_UTIL arm-none-eabi-size)

# Stop CMake from trying build executable test, without setting some flags it will fail
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
