%include inc/require-system_compiler
%include inc/require-no_mpi

NAME:           mariadb-10_4
VERSION:        10.4.12
RELEASE:        1
SUMMARY:        MariaDB: a very fast and reliable SQL database server
LICENSE:        Oracle
GROUP:          Research/Development
URL:            http://www.mysql.com/

%include inc/setup

BUILDREQUIRES:  git gunzip GNU tar gcc 3.4.6 or later g++ make bison libncurses libevent-dev cmake gnutls/openssl
SOURCE0:        %{cname}-%{version}.tar.gz

%description
%include inc/description

MariaDB is a community-developed, commercially supported fork of the MySQL relational database management system (RDBMS), 
intended to remain free and open-source software under the GNU General Public License. Development is led by some of the 
original developers of MySQL, who forked it due to concerns over its acquisition by Oracle Corporation in 2009


%prep
%include inc/prep

%setup -n %{cname}-%{version}

%build
%include inc/build

module load cmake
mkdir build-mariadb && build-mariadb
cmake . -DCMAKE_INSTALL_PREFIX='%{INSTALL_DIR}' \
        -DBUILD_CONFIG=mysql_release \
        -DRPM=centos7 \
        -DWITH_SSL=system \
        -DWITH_JEMALLOC=OFF \ 

make -j
make install DESTDIR="$RPM_BUILD_ROOT"


# append to module file
cat >> "%{MODULE_FILE}" <<'EOF'
help([[
Define Environment Variables:

         $MYSQL_DIR - root
         $MYSQL_BIN - binaries
         $MYSQL_INC - includes
         $MYSQL_LIB - libraries

Prepend Environment Variables:

               PATH += %{INSTALL_DIR}/bin
               PATH += %{INSTALL_DIR}/sbin
            MANPATH += %{INSTALL_DIR}/share/man


To initialize a new database directory run:

    mysql_install_db --socket=$HOME/mysql/mysql.sock --datadir=$HOME/mysql/data --log-error=$HOME/mysql/mysql.log --pid-file=$HOME/mysql/mysql.pid --user=$USER 


To start the mysql service run:
NOTE: only one mysql service is allowed to run on the given port at a time.

    mysqld_safe --socket=$HOME/mysql/mysql.sock --datadir=$HOME/mysql/data --log-error=$HOME/mysql/mysql.log --pid-file=$HOME/mysql/mysql.pid --port=3306


To stop the mysql service press CTRL + \ or run:

    mysqladmin shutdown --socket=$HOME/mysql/mysql.sock --user=root

To connect to the running mysql service run:

    mysql --socket=$HOME/mysql/mysql.sock --user=root
]])

setenv("MYSQL_DIR", "%{INSTALL_DIR}")
setenv("MYSQL_BIN", "%{INSTALL_DIR}/bin")
setenv("MYSQL_SBIN", "%{INSTALL_DIR}/sbin")
setenv("MYSQL_INC", "%{INSTALL_DIR}/include/mysql")
setenv("MYSQL_LIB", "%{INSTALL_DIR}/lib64")

prepend_path("PATH", "%{INSTALL_DIR}/bin")
prepend_path("PATH", "%{INSTALL_DIR}/sbin")
prepend_path("MANPATH", "%{INSTALL_DIR}/share/man")
prepend_path("INCLUDE", "%{INSTALL_DIR}/include/mysql")
prepend_path("LD_LIBRARY_PATH", "%{INSTALL_DIR}/lib64")
EOF


%files -n %{package_name}
%include inc/files


%post -n %{package_name}
%include inc/post


%postun -n %{package_name}
%include inc/postun


%clean
%include inc/clean
