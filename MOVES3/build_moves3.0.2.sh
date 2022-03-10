# https://mariadb.com/kb/en/source-building-mariadb-on-centos/
# https://mariadb.com/kb/en/generic-build-instructions/
# https://mariadb.org/get-involved/getting-started-for-developers/get-code-build-test/
# https://centos.pkgs.org/7/centos-x86_64/gnutls-devel-3.3.29-9.el7_6.x86_64.rpm.html
# https://github.com/USEPA/EPA_MOVES_Model
# https://mariadb.com/kb/en/authentication-from-mariadb-104/

/groups/deq/cascades/models/MOVES3.0.2/Windows

# module purge
# module load cmake/3.17.2 gcc
# cd /groups/deq/Shared/Xiaolong/build/mariadb-10.4.12/build-mariadb
# cmake .. -LH
# cmake .. -DBUILD_CONFIG=mysql_release -DWITH_SSL=system -DCMAKE_INSTALL_PREFIX='/groups/deq/cascades/apps/mariadb/10.4.12' -DWITH_JEMALLOC=OFF # -DWITH_SAFEMALLO=OFF
#         # -DINSTALL_LAYOUT=RPM \
#         # -DCMAKE_BUILD_TYPE=RelWithDebInfo
# cmake --build . --parallel 5
# # >>> 1. camke couldn't find openssl or gnutls
# # https://stackoverflow.com/questions/16248775/cmake-not-able-to-find-openssl-library
# # http://lists.busybox.net/pipermail/buildroot/2019-February/242149.html
# # openssl version
#
# # >>> 2. cmake couldn't find jemalloc
# make install DESTDIR="/groups/deq/Shared/Xiaolong/apps/mariadb/10.4.12"

cd /groups/deq/cascades/models/MOVES3.0.2/sources/MOVES3_src
module purge
module load cmake/3.17.2 gcc jdk/1.11.0.9 go/1.13.5
export PATH=/groups/deq/cascades/apps/mariadb/10.4.12/bin:$PATH
export PATH=/groups/deq/cascades/models/MOVES3.0.2/sources/MOVES3_src/ant/bin:$PATH

#
csh
cd /groups/deq/cascades/models/MOVES3.0.2/sources/MOVES3_src
module purge
module load cmake/3.17.2 gcc jdk/1.11.0.9 go/1.13.5
setenv PATH /groups/deq/cascades/apps/mariadb/10.4/bin:$PATH
setenv PATH /groups/deq/cascades/models/MOVES3.0.2/sources/MOVES3_src/ant/bin:$PATH
ant compileall
# Buildfile: /groups/deq/cascades/models/MOVES3.0.2/sources/MOVES3_src/build.xml
# compile:
#     [javac] Compiling 480 source files

ant rungui

TMPDIR=/groups/deq/Shared/Xiaolong/sql-test


#>>>>>>>>>>>>>>>>> go progams
env GOOS=linux go build externalcalculatorgo.go
env GOOS=linux go build externalgenerator.go


#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> MariaDB usage <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#
# chown: changing ownership of ‘/groups/deq/cascades/apps/mariadb/10.4.12/lib/plugin/auth_pam_tool_dir/auth_pam_tool’: Operation not permitted
# Couldn't set an owner to '/groups/deq/cascades/apps/mariadb/10.4.12/lib/plugin/auth_pam_tool_dir/auth_pam_tool'.
# It must be root, the PAM authentication plugin doesn't work otherwise..
#
# Installing MariaDB/MySQL system tables in '/scratch-local/529694/mysql/data' ...
# OK
#
# To start mysqld at boot time you have to copy
# support-files/mysql.server to the right place for your system
#
#
# Two all-privilege accounts were created.
# One is root@localhost, it has no password, but you need to
# be system 'root' user to connect. Use, for example, sudo mysql
# The second is lxiaol9@localhost, it has no password either, but
# you need to be the system 'lxiaol9' user to connect.
# After connecting you can set the password, if you would need to be
# able to connect as any of these users with a password and without sudo
#
# # >>>>>>>>>>>>>>>> with normal
# chown: changing ownership of ‘/groups/deq/cascades/apps/mariadb/10.4.12/lib/plugin/auth_pam_tool_dir/auth_pam_tool’: Operation not permitted
# Couldn't set an owner to '/groups/deq/cascades/apps/mariadb/10.4.12/lib/plugin/auth_pam_tool_dir/auth_pam_tool'.
# It must be root, the PAM authentication plugin doesn't work otherwise..
#
# Installing MariaDB/MySQL system tables in '/scratch-local/529696/mysql/data' ...
#
# OK
#
# To start mysqld at boot time you have to copy
# support-files/mysql.server to the right place for your system
#
#
# PLEASE REMEMBER TO SET A PASSWORD FOR THE MariaDB root USER !
# To do so, start the server, then issue the following commands:
#
# '/groups/deq/cascades/apps/mariadb/10.4.12/bin/mysqladmin' -u root password 'new-password'
# '/groups/deq/cascades/apps/mariadb/10.4.12/bin/mysqladmin' -u root -h ca009 password 'new-password'
#
# Alternatively you can run:
# '/groups/deq/cascades/apps/mariadb/10.4.12/bin/mysql_secure_installation'
#
# which will also give you the option of removing the test
# databases and anonymous user created by default.  This is
# strongly recommended for production servers.
#
# See the MariaDB Knowledgebase at http://mariadb.com/kb or the
# MySQL manual for more instructions.
#
# You can start the MariaDB daemon with:
# cd '/groups/deq/cascades/apps/mariadb/10.4.12' ; /groups/deq/cascades/apps/mariadb/10.4.12/bin/mysqld_safe --datadir='/scratch-local/529696/mysql/data'
#
# You can test the MariaDB daemon with mysql-test-run.pl
# cd '/groups/deq/cascades/apps/mariadb/10.4.12/mysql-test' ; perl mysql-test-run.pl
#



#  CONNECT storage engine with REST support
# CONNECT_WITH_REST:BOOL=ON

# // Compile CONNECT storage engine with VCT support
# CONNECT_WITH_VCT:BOOL=ON

# // Compile CONNECT storage engine with index file mapping support
# CONNECT_WITH_XMAP:BOOL=ON

# // Compile CONNECT storage engine with ZIP support
# CONNECT_WITH_ZIP:BOOL=ON

# // Don't build shared libraries, compile code as position-dependent
# DISABLE_SHARED:BOOL=OFF

# // Enable profiling
# ENABLED_PROFILING:BOOL=ON

# // Enable dtrace
# ENABLE_DTRACE:BOOL=ON

# // Enable gcov (debug, Linux builds only)
# ENABLE_GCOV:BOOL=OFF

# // Single output directory for building all executables.
# EXECUTABLE_OUTPUT_PATH:PATH=

# //  Selection of features. Options are
#  - xsmall :
#  - small: embedded
#  - classic: embedded + archive + federated + blackhole
#  - large :  embedded + archive + federated + blackhole + innodb
#  - xlarge:  embedded + archive + federated + blackhole + innodb + partition
#  - community:  all  features (currently == xlarge)

# FEATURE_SET:STRING=community

# // Groonga's default DB key management algorithm
# GRN_DEFAULT_DB_KEY:STRING=auto

# // Groonga's default document root
# GRN_DEFAULT_DOCUMENT_ROOT:PATH=/usr/local/mysql/share/groonga/html/admin

# // Groonga's default document root base path
# GRN_DEFAULT_DOCUMENT_ROOT_BASE:PATH=html/admin

# // Groonga's default encoding
# GRN_DEFAULT_ENCODING:STRING=utf8

# // Groonga's default match escalation threshold
# GRN_DEFAULT_MATCH_ESCALATION_THRESHOLD:STRING=0

# // Groonga's default relative document root
# GRN_DEFAULT_RELATIVE_DOCUMENT_ROOT:PATH=share/groonga/html/admin

# // Build as a static library to embed into an application
# GRN_EMBED:BOOL=ON

# // timeout to acquire a lock.
# GRN_LOCK_TIMEOUT:STRING=900000

# // wait time in nanosecond to acquire a lock.
# GRN_LOCK_WAIT_TIME_NANOSECOND:STRING=1000000

# // log file path
# GRN_LOG_PATH:FILEPATH=/usr/local/mysql/var/log/groonga/groonga.log

# // mecab-config path
# GRN_MECAB_CONFIG:FILEPATH=mecab-config

# // Path to a program.
# GRN_MECAB_CONFIG_ABSOLUTE_PATH:FILEPATH=GRN_MECAB_CONFIG_ABSOLUTE_PATH-NOTFOUND

# // DANGER!!! Groonga's stack size. Normarlly, you should not change this variable.
# GRN_STACK_SIZE:STRING=1024

# // use bundled LZ4
# GRN_WITH_BUNDLED_LZ4:BOOL=OFF

# // use bundled MeCab
# GRN_WITH_BUNDLED_MECAB:BOOL=OFF

# // use bundled MessagePack
# GRN_WITH_BUNDLED_MESSAGE_PACK:BOOL=OFF

# // enable debug build.
# GRN_WITH_DEBUG:BOOL=OFF

# // use KyTea for morphological analysis
# GRN_WITH_KYTEA:STRING=auto

# // use libevent for suggestion
# GRN_WITH_LIBEVENT:STRING=auto

# // use libstemmer for stemming token filter
# GRN_WITH_LIBSTEMMER:STRING=auto

# // Support data compression by LZ4.
# GRN_WITH_LZ4:STRING=auto

# // use MeCab for morphological analysis
# GRN_WITH_MECAB:STRING=auto

# // use MessagePack for suggestion
# GRN_WITH_MESSAGE_PACK:STRING=auto

# // use mruby
# GRN_WITH_MRUBY:BOOL=OFF

# // use NFKC based UTF8 normalization.
# GRN_WITH_NFKC:BOOL=ON

# // use ZeroMQ for suggestion
# GRN_WITH_ZEROMQ:STRING=auto

# // Support data compression by zlib.
# GRN_WITH_ZLIB:STRING=auto

# // Build as a static library to embed into an application
# GROONGA_NORMALIZER_MYSQL_EMBED:BOOL=ON

# //
# GSSAPI_FOUND:STRING=TRUE

# // Installation directory layout. Options are: STANDALONE (as in zip or tar.gz installer) RPM DEB SVR4
# INSTALL_LAYOUT:STRING=STANDALONE

# // Single output directory for building all libraries.
# LIBRARY_OUTPUT_PATH:PATH=

# // Max number of indexes
# MAX_INDEXES:STRING=64

# // Whether to build Mroonga for embedded server or not. You can't use Mroonga built for embedded server with non embedded server.
# MRN_BUILD_FOR_EMBEDDED_SERVER:BOOL=OFF

# // The default fulltext parser (Deprecated. Use MRN_DEFAULT_TOKENIZER instead.)
# MRN_DEFAULT_PARSER:STRING=

# // The default tokenizer for fulltext index
# MRN_DEFAULT_TOKENIZER:STRING=

# // Embed libgroonga
# MRN_GROONGA_EMBED:BOOL=ON

# // Embed groonga-normalizer-mysql Groonga plugin
# MRN_GROONGA_NORMALIZER_MYSQL_EMBED:BOOL=ON

# // Mutex type: event, sys or futex
# MUTEXTYPE:STRING=event

# // default MySQL data directory
# MYSQL_DATADIR:PATH=/usr/local/mysql/data

# // MySQL maintainer-specific development environment. Options are: ON OFF AUTO.
# MYSQL_MAINTAINER_MODE:STRING=AUTO

# // Allow linking with GPLv2-incompatible system libraries. Only set it you never plan to distribute the resulting binaries
# NOT_FOR_DISTRIBUTION:BOOL=OFF

# // Default nested parentheses limit. See PARENS_NEST_LIMIT in config.h.in for details.
# PCRE_PARENS_NEST_LIMIT:STRING=250

# // Show the final configuration report
# PCRE_SHOW_REPORT:BOOL=OFF

# // How to build plugin ARCHIVE. Options are: NO STATIC DYNAMIC YES AUTO.
# PLUGIN_ARCHIVE:STRING=DYNAMIC

# //
# PLUGIN_AUTH_SOCKET:STRING=STATIC

# // How to build plugin BLACKHOLE. Options are: NO STATIC DYNAMIC YES AUTO.
# PLUGIN_BLACKHOLE:STRING=DYNAMIC

# // How to build plugin CONNECT. Options are: NO STATIC DYNAMIC YES AUTO.
# PLUGIN_CONNECT:STRING=DYNAMIC

# // How to build plugin EXAMPLE. Options are: NO STATIC DYNAMIC YES AUTO.
# PLUGIN_EXAMPLE:STRING=DYNAMIC

# // How to build plugin FEDERATED. Options are: NO STATIC DYNAMIC YES AUTO.
# PLUGIN_FEDERATED:STRING=DYNAMIC

# // How to build plugin FEDERATEDX. Options are: NO STATIC DYNAMIC YES AUTO.
# PLUGIN_FEDERATEDX:STRING=DYNAMIC

# // How to build plugin INNOBASE. Options are: NO STATIC DYNAMIC YES AUTO.
# PLUGIN_INNOBASE:STRING=STATIC

# // How to build plugin MROONGA. Options are: NO STATIC DYNAMIC YES AUTO.
# PLUGIN_MROONGA:STRING=DYNAMIC

# // How to build plugin PERFSCHEMA. Options are: NO STATIC DYNAMIC YES AUTO.
# PLUGIN_PERFSCHEMA:STRING=STATIC

# // How to build plugin ROCKSDB. Options are: NO STATIC DYNAMIC YES AUTO.
# PLUGIN_ROCKSDB:STRING=DYNAMIC

# // How to build plugin SEQUENCE. Options are: NO STATIC DYNAMIC YES AUTO.
# PLUGIN_SEQUENCE:STRING=STATIC

# // How to build plugin SPHINX. Options are: NO STATIC DYNAMIC YES AUTO.
# PLUGIN_SPHINX:STRING=DYNAMIC

# // How to build plugin SPIDER. Options are: NO STATIC DYNAMIC YES AUTO.
# PLUGIN_SPIDER:STRING=DYNAMIC

# // How to build plugin TEST_SQL_DISCOVERY. Options are: NO STATIC DYNAMIC YES AUTO.
# PLUGIN_TEST_SQL_DISCOVERY:STRING=DYNAMIC

# // How to build plugin TOKUDB. Options are: NO STATIC DYNAMIC YES AUTO.
# PLUGIN_TOKUDB:STRING=DYNAMIC

# // Path to a program.
# RUBY:FILEPATH=RUBY-NOTFOUND

# // Use security-enhancing compiler features (stack protector, relro, etc)
# SECURITY_HARDENED:BOOL=ON

# // PATH to MySQL TMP dir. Defaults to the P_tmpdir macro in <stdio.h>
# TMPDIR:PATH=

# // Update submodules automatically
# UPDATE_SUBMODULES:BOOL=ON

# // Use Aria for temporary tables
# USE_ARIA_FOR_TMP_TABLES:BOOL=ON

# // Build only the client library and clients
# WITHOUT_SERVER:BOOL=OFF

# // Enable address sanitizer
# WITH_ASAN:BOOL=OFF

# //
# WITH_EMBEDDED_SERVER:BOOL=ON

# //
# WITH_EXTRA_CHARSETS:STRING=all

# // build with fallocate
# WITH_FALLOCATE:BOOL=ON

# // Include innodb_adaptive_hash_index
# WITH_INNODB_AHI:BOOL=ON

# // Build with bzip2. Possible values are 'ON', 'OFF', 'AUTO' and default is 'AUTO'
# WITH_INNODB_BZIP2:STRING=AUTO

# // InnoDB freeze writes patch from Google
# WITH_INNODB_DISALLOW_WRITES:BOOL=ON

# // Enable extra InnoDB debug checks
# WITH_INNODB_EXTRA_DEBUG:BOOL=OFF

# // Build with lz4. Possible values are 'ON', 'OFF', 'AUTO' and default is 'AUTO'
# WITH_INNODB_LZ4:STRING=AUTO

# // Build with lzma. Possible values are 'ON', 'OFF', 'AUTO' and default is 'AUTO'
# WITH_INNODB_LZMA:STRING=AUTO

# // Build with lzo. Possible values are 'ON', 'OFF', 'AUTO' and default is 'AUTO'
# WITH_INNODB_LZO:STRING=AUTO

# // Cache index root block descriptors
# WITH_INNODB_ROOT_GUESS:BOOL=ON

# //
# WITH_INNODB_SNAPPY:STRING=OFF

# //
# WITH_JEMALLOC:STRING=static

# // Compile with tcp wrappers support
# WITH_LIBWRAP:BOOL=OFF

# // Include mariabackup
# WITH_MARIABACKUP:BOOL=ON

# // Enable memory sanitizer
# WITH_MSAN:BOOL=OFF

# //
# WITH_NUMA:BOOL=0

# // Which pcre to use (possible values are 'bundled', 'system', or 'auto')
# WITH_PCRE:STRING=auto

# // Use bundled readline
# WITH_READLINE:BOOL=OFF

# // Build RocksDB  with BZIP2 compression. Possible values are 'ON', 'OFF', 'AUTO' and default is 'AUTO'
# WITH_ROCKSDB_BZIP2:STRING=AUTO

# // build RocksDB with JeMalloc
# WITH_ROCKSDB_JEMALLOC:BOOL=OFF

# // Build RocksDB  with LZ4 compression. Possible values are 'ON', 'OFF', 'AUTO' and default is 'AUTO'
# WITH_ROCKSDB_LZ4:STRING=AUTO

# // Build RocksDB  with snappy compression. Possible values are 'ON', 'OFF', 'AUTO' and default is 'AUTO'
# WITH_ROCKSDB_snappy:STRING=AUTO

# // Build RocksDB  with zstd compression. Possible values are 'ON', 'OFF', 'AUTO' and default is 'AUTO'
# WITH_ROCKSDB_zstd:STRING=AUTO

# // Use safemalloc memory debugger. Will result in slower execution. Options are: ON OFF AUTO.
# WITH_SAFEMALLOC:STRING=AUTO

# //
# WITH_SSL:STRING=system

# // Enable systemd scripts and notification support
# WITH_SYSTEMD:STRING=auto

# // Enable thread sanitizer
# WITH_TSAN:BOOL=OFF

# // Enable undefined behavior sanitizer
# WITH_UBSAN:BOOL=OFF

# // Compile MySQL with unit tests
# WITH_UNIT_TESTS:BOOL=ON

# // Valgrind instrumentation
# WITH_VALGRIND:BOOL=OFF

# // WSREP replication API (to use, e.g. Galera Replication library)
# WITH_WSREP:BOOL=ON

# // Build all components of WSREP (unit tests, sample programs)
# WITH_WSREP_ALL:BOOL=OFF

# //
# WITH_ZLIB:STRING=bundled

# // Fail compilation on any warnings
# WSREP_LIB_MAINTAINER_MODE:BOOL=OFF

# // Compile with strict build flags
# WSREP_LIB_STRICT_BUILD_FLAGS:BOOL=OFF

# // Enable address sanitizer
# WSREP_LIB_WITH_ASAN:BOOL=OFF

# // Compile with coverage instrumentation
# WSREP_LIB_WITH_COVERAGE:BOOL=OFF

# // Compile sample dbsim program
# WSREP_LIB_WITH_DBSIM:BOOL=OFF

# // Generate documentation
# WSREP_LIB_WITH_DOCUMENTATION:BOOL=OFF

# // Enable thread sanitizer
# WSREP_LIB_WITH_TSAN:BOOL=OFF

# // Compile unit tests
# WSREP_LIB_WITH_UNIT_TESTS:BOOL=OFF

# // The directory containing a CMake configuration file for cpprestsdk.
# cpprestsdk_DIR:PATH=cpprestsdk_DIR-NOTFOUND

# // The directory containing a CMake configuration file for libmongoc-1.0.
# libmongoc-1.0_DIR:PATH=libmongoc-1.0_DIR-NOTFOUND
