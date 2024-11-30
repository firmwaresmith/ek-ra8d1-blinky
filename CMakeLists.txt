# Currently shipped on my Linux distro
cmake_minimum_required(VERSION 3.22)

# Compile commands json file is used to configure VSCode
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# This project will utilise sources written in C and ASM and possibly C++
project(ek-ra8d1-blinky C CXX ASM)

# Define main artifact
add_executable(ek-ra8d1-blinky)

# List of files copied from E2 Studio build log
target_sources(ek-ra8d1-blinky
    PRIVATE
        ek-ra8d1-blinky/src/hal_entry.c
        ek-ra8d1-blinky/ra_gen/common_data.c
        ek-ra8d1-blinky/ra_gen/hal_data.c
        ek-ra8d1-blinky/ra_gen/main.c
        ek-ra8d1-blinky/ra_gen/pin_data.c
        ek-ra8d1-blinky/ra_gen/vector_data.c
        ek-ra8d1-blinky/ra/fsp/src/bsp/mcu/all/bsp_clocks.c
        ek-ra8d1-blinky/ra/fsp/src/r_ioport/r_ioport.c
        ek-ra8d1-blinky/ra/fsp/src/bsp/mcu/all/bsp_common.c
        ek-ra8d1-blinky/ra/fsp/src/bsp/mcu/all/bsp_delay.c
        ek-ra8d1-blinky/ra/fsp/src/bsp/mcu/all/bsp_group_irq.c
        ek-ra8d1-blinky/ra/fsp/src/bsp/mcu/all/bsp_guard.c
        ek-ra8d1-blinky/ra/fsp/src/bsp/mcu/all/bsp_io.c
        ek-ra8d1-blinky/ra/fsp/src/bsp/mcu/all/bsp_irq.c
        ek-ra8d1-blinky/ra/fsp/src/bsp/mcu/all/bsp_macl.c
        ek-ra8d1-blinky/ra/fsp/src/bsp/mcu/all/bsp_register_protection.c
        ek-ra8d1-blinky/ra/fsp/src/bsp/mcu/all/bsp_rom_registers.c
        ek-ra8d1-blinky/ra/fsp/src/bsp/mcu/all/bsp_sbrk.c
        ek-ra8d1-blinky/ra/fsp/src/bsp/mcu/all/bsp_sdram.c
        ek-ra8d1-blinky/ra/fsp/src/bsp/mcu/all/bsp_security.c
        ek-ra8d1-blinky/ra/fsp/src/bsp/cmsis/Device/RENESAS/Source/startup.c
        ek-ra8d1-blinky/ra/fsp/src/bsp/cmsis/Device/RENESAS/Source/system.c
        ek-ra8d1-blinky/ra/board/ra8d1_ek/board_init.c
        ek-ra8d1-blinky/ra/board/ra8d1_ek/board_leds.c
)

# List of directories where header files are placed
target_include_directories(ek-ra8d1-blinky
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/ek-ra8d1-blinky/ra/fsp/inc
        ${CMAKE_CURRENT_SOURCE_DIR}/ek-ra8d1-blinky/ra/fsp/inc/api
        ${CMAKE_CURRENT_SOURCE_DIR}/ek-ra8d1-blinky/ra/fsp/inc/instances
        ${CMAKE_CURRENT_SOURCE_DIR}/ek-ra8d1-blinky/ra/fsp/src/rm_freertos_port
        ${CMAKE_CURRENT_SOURCE_DIR}/ek-ra8d1-blinky/ra/board/ra8d1_ek
        ${CMAKE_CURRENT_SOURCE_DIR}/ek-ra8d1-blinky/ra/arm/CMSIS_6/CMSIS/Core/Include
        ${CMAKE_CURRENT_SOURCE_DIR}/ek-ra8d1-blinky/ra_gen
        ${CMAKE_CURRENT_SOURCE_DIR}/ek-ra8d1-blinky/ra_cfg/fsp_cfg/bsp
        ${CMAKE_CURRENT_SOURCE_DIR}/ek-ra8d1-blinky/ra_cfg/fsp_cfg
        ${CMAKE_CURRENT_SOURCE_DIR}/ek-ra8d1-blinky/ra_cfg/aws
)

target_compile_options(ek-ra8d1-blinky
    PRIVATE
        # ABI
        -mthumb
        -mfloat-abi=hard
        -mcpu=cortex-m85+nopacbti
        # Warning flags
        -Wall
        -Werror
        # Debug / optimisation options
        -g2
        -Og
        # Link time optimisation
        -ffunction-sections
        -fdata-sections
)

target_link_options(ek-ra8d1-blinky
    PRIVATE
        # ABI
        -mthumb
        -mfloat-abi=hard
        -mcpu=cortex-m85+nopacbti
        # Link script location
        -T ${CMAKE_CURRENT_SOURCE_DIR}/ek-ra8d1-blinky/script/fsp.ld
        # Newlib library spec
        --specs=nano.specs
        # Debug output
        -Wl,-Map=ek-ra8d1-blinky.map,--gc-sections,--cref,--print-memory-usage
)
