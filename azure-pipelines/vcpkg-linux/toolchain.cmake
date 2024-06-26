set(CMAKE_SYSTEM_NAME Linux)
set(LINUX 1)
set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_SYSTEM_PROCESSOR x86_64)
set(CMAKE_SYSROOT "/crossrootfs/x64")
set(COMMON_ARGS "-B/crossrootfs/x64/usr/lib/x86_64-linux-gnu/ -isystem /crossrootfs/x64/usr/lib/gcc/x86_64-linux-gnu/9/include-fixed -isystem /crossrootfs/x64/usr/lib/gcc/x86_64-linux-gnu/9/include -isystem /crossrootfs/x64/usr/include/x86_64-linux-gnu -isystem /crossrootfs/x64/usr/include -static-libgcc -nostdinc")
set(CMAKE_C_FLAGS_INIT "${COMMON_ARGS}")
set(CMAKE_CXX_FLAGS_INIT "-isystem /crossrootfs/x64/usr/include/x86_64-linux-gnu/c++/9 -isystem /crossrootfs/x64/usr/include/c++/9 ${COMMON_ARGS} -static-libstdc++ -L/crossrootfs/x64/usr/lib/gcc/x86_64-linux-gnu/9/")
set(CMAKE_C_COMPILER_EXTERNAL_TOOLCHAIN "/crossrootfs/x64/usr")
set(CMAKE_CXX_COMPILER_EXTERNAL_TOOLCHAIN "/crossrootfs/x64/usr")
set(CMAKE_ASM_COMPILER_EXTERNAL_TOOLCHAIN "/crossrootfs/x64/usr")
function(add_toolchain_linker_flag Flag)
  set("CMAKE_EXE_LINKER_FLAGS_INIT" "${CMAKE_EXE_LINKER_FLAGS_INIT} ${Flag}" PARENT_SCOPE)
  set("CMAKE_SHARED_LINKER_FLAGS_INIT" "${CMAKE_SHARED_LINKER_FLAGS_INIT} ${Flag}" PARENT_SCOPE)
endfunction()

add_toolchain_linker_flag("-Wl,--rpath-link=/crossrootfs/x64/lib/x86_64-linux-gnu")
add_toolchain_linker_flag("-Wl,--rpath-link=/crossrootfs/x64/usr/lib/x86_64-linux-gnu")

set(CMAKE_C_COMPILER /usr/bin/gcc)
set(CMAKE_CXX_COMPILER /usr/bin/g++)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
