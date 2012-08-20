@echo off
title PHPToolChain Installer
set path=%~dp0bin;%path%
echo downloading...
rem SET SF_MIRROR=nchc
SET SF_MIRROR=jaist
SET NGINX_VERSION=1.2.3
SET MYSQL_VERSION=5.5.27
SET MYSQL_MIRROR=http://ftp.jaist.ac.jp/pub/mysql/
SET PHPMYADMIN_VERSION=3.5.2.2
SET PHP_VERSION=5.3.16
SET GIT_VERSION=1.7.11
SET GIT_RELEASE=preview20120710
SET HEIDISQL_VERSION=7.0
SET SVN_VERSION=1.6.17


IF NOT EXIST downloads/nginx-%NGINX_VERSION%.zip (
	wget -P downloads/ http://nginx.org/download/nginx-%NGINX_VERSION%.zip
)
IF NOT EXIST downloads/mysql-%MYSQL_VERSION%-win32.zip (
	wget -P downloads/ http://dev.mysql.com/get/Downloads/MySQL-5.5/mysql-%MYSQL_VERSION%-win32.zip/from/%MYSQL_MIRROR%
)
IF NOT EXIST downloads/php-%PHP_VERSION%-nts-Win32-VC9-x86.zip (
	wget -P downloads/ http://windows.php.net/downloads/releases/php-%PHP_VERSION%-nts-Win32-VC9-x86.zip
)
IF NOT EXIST downloads/phpMyAdmin-%PHPMYADMIN_VERSION%-english.7z (
	wget -P downloads/ "http://downloads.sourceforge.net/project/phpmyadmin/phpMyAdmin/%PHPMYADMIN_VERSION%/phpMyAdmin-%PHPMYADMIN_VERSION%-english.7z?use_mirror=%SF_MIRROR%"
)
IF NOT EXIST downloads/HeidiSQL_%HEIDISQL_VERSION%_Portable.zip (
	wget -P downloads/ http://heidisql.googlecode.com/files/HeidiSQL_%HEIDISQL_VERSION%_Portable.zip
)
IF NOT EXIST downloads/SysinternalsSuite.zip (
	wget -P downloads/ http://download.sysinternals.com/files/SysinternalsSuite.zip
)
IF NOT EXIST downloads/PortableGit-%GIT_VERSION%-%GIT_RELEASE%.7z (
	wget -P downloads/ http://msysgit.googlecode.com/files/PortableGit-%GIT_VERSION%-%GIT_RELEASE%.7z
)
IF NOT EXIST downloads/svn-win32-%SVN_VERSION%.zip (
	wget -P downloads/ "http://downloads.sourceforge.net/project/win32svn/%SVN_VERSION%/svn-win32-%SVN_VERSION%.zip?use_mirror=%SF_MIRROR%"
)
IF NOT EXIST downloads/putty.zip (
	wget -P downloads/ http://the.earth.li/~sgtatham/putty/latest/x86/putty.zip
)
echo extracting...
7z x downloads/HeidiSQL_%HEIDISQL_VERSION%_Portable.zip -oHeidiSQL
7z x downloads/PortableGit-%GIT_VERSION%-%GIT_RELEASE%.7z -ogit
7z x downloads/svn-win32-%SVN_VERSION%.zip
7z x downloads/putty.zip -obin
7z x downloads/SysinternalsSuite.zip -oSysinternalsSuite
7z x downloads/nginx-%NGINX_VERSION%.zip
7z x downloads/php-%PHP_VERSION%-nts-Win32-VC9-x86.zip -oPHP
7z x downloads/phpMyAdmin-%PHPMYADMIN_VERSION%-english.7z -owww
7z x downloads/mysql-%MYSQL_VERSION%-win32.zip

rename mysql-%MYSQL_VERSION%-win32 MySQL
rename svn-win32-%SVN_VERSION% svn
rename nginx-%NGINX_VERSION% nginx
pushd www
rename phpMyAdmin-%PHPMYADMIN_VERSION%-english pma
popd

echo configuring
copy/Y php_memcache.dll PHP\ext\
copy/Y php_xdebug.dll PHP\ext\
copy/Y php.ini PHP\php.ini
copy/Y my.ini MySQL\my.ini
copy/Y nginx.conf nginx\conf\nginx.conf
echo done
@echo on