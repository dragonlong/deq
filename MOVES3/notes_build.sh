> -DPLUGIN_AUTH_PAM=NO -DPLUGIN_AUTH_PAM_V1=NO \
> -DWITH_SSL=system -DIGNORE_AIO_CHECK=ON \
> -DCMAKE_INSTALL_PREFIX='/work/lxiaol9/deq/apps/mariadb/10.4.12' \
> -DWITH_JEMALLOC=OFF \
>
-- Running cmake version 3.16.4
CMake Warning (dev) at CMakeLists.txt:79 (PROJECT):
  Policy CMP0048 is not set: project() command manages VERSION variables.
  Run "cmake --help-policy CMP0048" for policy details.  Use the cmake_policy
  command to set the policy and suppress this warning.

  The following variable(s) would be set to empty:

    CMAKE_PROJECT_VERSION
    CMAKE_PROJECT_VERSION_MAJOR
    CMAKE_PROJECT_VERSION_MINOR
    CMAKE_PROJECT_VERSION_PATCH
This warning is for project developers.  Use -Wno-dev to suppress it.

-- MariaDB 10.4.12
-- Wsrep-lib version: 1.0.0
== Configuring MariaDB Connector/C
CMake Warning (dev) at cmake/dtrace.cmake:150 (GET_TARGET_PROPERTY):
  Policy CMP0026 is not set: Disallow use of the LOCATION target property.
  Run "cmake --help-policy CMP0026" for policy details.  Use the cmake_policy
  command to set the policy and suppress this warning.

  The LOCATION property should not be read from target "archive".  Use the
  target name directly with add_custom_command, or use the generator
  expression $<TARGET_FILE>, as appropriate.

Call Stack (most recent call first):
  cmake/plugin.cmake:140 (DTRACE_INSTRUMENT)
  storage/archive/CMakeLists.txt:17 (MYSQL_ADD_PLUGIN)
This warning is for project developers.  Use -Wno-dev to suppress it.

CMake Warning (dev) at cmake/dtrace.cmake:150 (GET_TARGET_PROPERTY):
  Policy CMP0026 is not set: Disallow use of the LOCATION target property.
  Run "cmake --help-policy CMP0026" for policy details.  Use the cmake_policy
  command to set the policy and suppress this warning.

  The LOCATION property should not be read from target "blackhole".  Use the
  target name directly with add_custom_command, or use the generator
  expression $<TARGET_FILE>, as appropriate.

Call Stack (most recent call first):
  cmake/plugin.cmake:140 (DTRACE_INSTRUMENT)
  storage/blackhole/CMakeLists.txt:17 (MYSQL_ADD_PLUGIN)
This warning is for project developers.  Use -Wno-dev to suppress it.

-- =====> REST support is ON
CMake Warning (dev) at cmake/dtrace.cmake:150 (GET_TARGET_PROPERTY):
  Policy CMP0026 is not set: Disallow use of the LOCATION target property.
  Run "cmake --help-policy CMP0026" for policy details.  Use the cmake_policy
  command to set the policy and suppress this warning.

  The LOCATION property should not be read from target "csv".  Use the target
  name directly with add_custom_command, or use the generator expression
  $<TARGET_FILE>, as appropriate.

Call Stack (most recent call first):
  cmake/plugin.cmake:140 (DTRACE_INSTRUMENT)
  storage/csv/CMakeLists.txt:17 (MYSQL_ADD_PLUGIN)
This warning is for project developers.  Use -Wno-dev to suppress it.

CMake Warning (dev) at cmake/dtrace.cmake:150 (GET_TARGET_PROPERTY):
  Policy CMP0026 is not set: Disallow use of the LOCATION target property.
  Run "cmake --help-policy CMP0026" for policy details.  Use the cmake_policy
  command to set the policy and suppress this warning.

  The LOCATION property should not be read from target "federatedx".  Use the
  target name directly with add_custom_command, or use the generator
  expression $<TARGET_FILE>, as appropriate.

Call Stack (most recent call first):
  cmake/plugin.cmake:140 (DTRACE_INSTRUMENT)
  storage/federatedx/CMakeLists.txt:4 (MYSQL_ADD_PLUGIN)
This warning is for project developers.  Use -Wno-dev to suppress it.

CMake Warning (dev) at cmake/dtrace.cmake:150 (GET_TARGET_PROPERTY):
  Policy CMP0026 is not set: Disallow use of the LOCATION target property.
  Run "cmake --help-policy CMP0026" for policy details.  Use the cmake_policy
  command to set the policy and suppress this warning.

  The LOCATION property should not be read from target "heap".  Use the
  target name directly with add_custom_command, or use the generator
  expression $<TARGET_FILE>, as appropriate.

Call Stack (most recent call first):
  cmake/plugin.cmake:140 (DTRACE_INSTRUMENT)
  storage/heap/CMakeLists.txt:22 (MYSQL_ADD_PLUGIN)
This warning is for project developers.  Use -Wno-dev to suppress it.

CMake Warning (dev) at cmake/dtrace.cmake:150 (GET_TARGET_PROPERTY):
  Policy CMP0026 is not set: Disallow use of the LOCATION target property.
  Run "cmake --help-policy CMP0026" for policy details.  Use the cmake_policy
  command to set the policy and suppress this warning.

  The LOCATION property should not be read from target "innobase".  Use the
  target name directly with add_custom_command, or use the generator
  expression $<TARGET_FILE>, as appropriate.

Call Stack (most recent call first):
  cmake/plugin.cmake:140 (DTRACE_INSTRUMENT)
  storage/innobase/CMakeLists.txt:149 (MYSQL_ADD_PLUGIN)
This warning is for project developers.  Use -Wno-dev to suppress it.

CMake Warning (dev) at cmake/dtrace.cmake:150 (GET_TARGET_PROPERTY):
  Policy CMP0026 is not set: Disallow use of the LOCATION target property.
  Run "cmake --help-policy CMP0026" for policy details.  Use the cmake_policy
  command to set the policy and suppress this warning.

  The LOCATION property should not be read from target "aria".  Use the
  target name directly with add_custom_command, or use the generator
  expression $<TARGET_FILE>, as appropriate.

Call Stack (most recent call first):
  cmake/plugin.cmake:140 (DTRACE_INSTRUMENT)
  storage/maria/CMakeLists.txt:58 (MYSQL_ADD_PLUGIN)
This warning is for project developers.  Use -Wno-dev to suppress it.

CMake Warning (dev) at cmake/dtrace.cmake:150 (GET_TARGET_PROPERTY):
  Policy CMP0026 is not set: Disallow use of the LOCATION target property.
  Run "cmake --help-policy CMP0026" for policy details.  Use the cmake_policy
  command to set the policy and suppress this warning.

  The LOCATION property should not be read from target "myisam".  Use the
  target name directly with add_custom_command, or use the generator
  expression $<TARGET_FILE>, as appropriate.

Call Stack (most recent call first):
  cmake/plugin.cmake:140 (DTRACE_INSTRUMENT)
  storage/myisam/CMakeLists.txt:30 (MYSQL_ADD_PLUGIN)
This warning is for project developers.  Use -Wno-dev to suppress it.

CMake Warning (dev) at cmake/dtrace.cmake:150 (GET_TARGET_PROPERTY):
  Policy CMP0026 is not set: Disallow use of the LOCATION target property.
  Run "cmake --help-policy CMP0026" for policy details.  Use the cmake_policy
  command to set the policy and suppress this warning.

  The LOCATION property should not be read from target "myisammrg".  Use the
  target name directly with add_custom_command, or use the generator
  expression $<TARGET_FILE>, as appropriate.

Call Stack (most recent call first):
  cmake/plugin.cmake:140 (DTRACE_INSTRUMENT)
  storage/myisammrg/CMakeLists.txt:23 (MYSQL_ADD_PLUGIN)
This warning is for project developers.  Use -Wno-dev to suppress it.

CMake Warning (dev) at cmake/dtrace.cmake:150 (GET_TARGET_PROPERTY):
  Policy CMP0026 is not set: Disallow use of the LOCATION target property.
  Run "cmake --help-policy CMP0026" for policy details.  Use the cmake_policy
  command to set the policy and suppress this warning.

  The LOCATION property should not be read from target "perfschema".  Use the
  target name directly with add_custom_command, or use the generator
  expression $<TARGET_FILE>, as appropriate.

Call Stack (most recent call first):
  cmake/plugin.cmake:140 (DTRACE_INSTRUMENT)
  storage/perfschema/CMakeLists.txt:191 (MYSQL_ADD_PLUGIN)
This warning is for project developers.  Use -Wno-dev to suppress it.

CMake Warning (dev) at cmake/dtrace.cmake:150 (GET_TARGET_PROPERTY):
  Policy CMP0026 is not set: Disallow use of the LOCATION target property.
  Run "cmake --help-policy CMP0026" for policy details.  Use the cmake_policy
  command to set the policy and suppress this warning.

  The LOCATION property should not be read from target "sequence".  Use the
  target name directly with add_custom_command, or use the generator
  expression $<TARGET_FILE>, as appropriate.

Call Stack (most recent call first):
  cmake/plugin.cmake:140 (DTRACE_INSTRUMENT)
  storage/sequence/CMakeLists.txt:1 (MYSQL_ADD_PLUGIN)
This warning is for project developers.  Use -Wno-dev to suppress it.

CMake Warning at storage/tokudb/CMakeLists.txt:51 (MESSAGE):
  TokuDB is enabled, but jemalloc is not.  This configuration is not
  supported


CMake Warning (dev) at cmake/dtrace.cmake:150 (GET_TARGET_PROPERTY):
  Policy CMP0026 is not set: Disallow use of the LOCATION target property.
  Run "cmake --help-policy CMP0026" for policy details.  Use the cmake_policy
  command to set the policy and suppress this warning.

  The LOCATION property should not be read from target "auth_socket".  Use
  the target name directly with add_custom_command, or use the generator
  expression $<TARGET_FILE>, as appropriate.

Call Stack (most recent call first):
  cmake/plugin.cmake:140 (DTRACE_INSTRUMENT)
  plugin/auth_socket/CMakeLists.txt:68 (MYSQL_ADD_PLUGIN)
This warning is for project developers.  Use -Wno-dev to suppress it.

CMake Warning (dev) at cmake/dtrace.cmake:150 (GET_TARGET_PROPERTY):
  Policy CMP0026 is not set: Disallow use of the LOCATION target property.
  Run "cmake --help-policy CMP0026" for policy details.  Use the cmake_policy
  command to set the policy and suppress this warning.

  The LOCATION property should not be read from target "feedback".  Use the
  target name directly with add_custom_command, or use the generator
  expression $<TARGET_FILE>, as appropriate.

Call Stack (most recent call first):
  cmake/plugin.cmake:140 (DTRACE_INSTRUMENT)
  plugin/feedback/CMakeLists.txt:20 (MYSQL_ADD_PLUGIN)
This warning is for project developers.  Use -Wno-dev to suppress it.

CMake Warning (dev) at cmake/dtrace.cmake:150 (GET_TARGET_PROPERTY):
  Policy CMP0026 is not set: Disallow use of the LOCATION target property.
  Run "cmake --help-policy CMP0026" for policy details.  Use the cmake_policy
  command to set the policy and suppress this warning.

  The LOCATION property should not be read from target "user_variables".  Use
  the target name directly with add_custom_command, or use the generator
  expression $<TARGET_FILE>, as appropriate.

Call Stack (most recent call first):
  cmake/plugin.cmake:140 (DTRACE_INSTRUMENT)
  plugin/user_variables/CMakeLists.txt:1 (MYSQL_ADD_PLUGIN)
This warning is for project developers.  Use -Wno-dev to suppress it.

CMake Warning (dev) at cmake/dtrace.cmake:150 (GET_TARGET_PROPERTY):
  Policy CMP0026 is not set: Disallow use of the LOCATION target property.
  Run "cmake --help-policy CMP0026" for policy details.  Use the cmake_policy
  command to set the policy and suppress this warning.

  The LOCATION property should not be read from target "userstat".  Use the
  target name directly with add_custom_command, or use the generator
  expression $<TARGET_FILE>, as appropriate.

Call Stack (most recent call first):
  cmake/plugin.cmake:140 (DTRACE_INSTRUMENT)
  plugin/userstat/CMakeLists.txt:3 (MYSQL_ADD_PLUGIN)
This warning is for project developers.  Use -Wno-dev to suppress it.

CMake Error at cmake/plugin.cmake:284 (MESSAGE):
  Plugin AUTH_PAM cannot be built
Call Stack (most recent call first):
  CMakeLists.txt:406 (CONFIGURE_PLUGINS)


-- Configuring incomplete, errors occurred!
See also "/work/lxiaol9/deq/build/mariadb-10.4.12/build-mariadb/CMakeFiles/CMakeOutput.log".
See also "/work/lxiaol9/deq/build/mariadb-10.4.12/build-mariadb/CMakeFiles/CMakeError.log".
[lxiaol9@tinkercliffs1 build-mariadb]$
