@echo off
title PHPToolChain Installer
set path=%~dp0bin;%path%
echo downloading...
wget -P downloads/ http://nginx.org/download/nginx-1.1.12.zip
wget -P downloads/ http://dev.mysql.com/get/Downloads/MySQL-5.5/mysql-5.5.20-win32.zip/from/http://mysql.stu.edu.tw/
wget -P downloads/ http://windows.php.net/downloads/releases/php-5.3.10-nts-Win32-VC9-x86.zip
wget -P downloads/ http://downloads.sourceforge.net/project/phpmyadmin/phpMyAdmin/3.4.7.1/phpMyAdmin-3.4.7.1-english.7z?r=http%3A%2F%2Fwww.phpmyadmin.net%2Fhome_page%2Fdownloads.php&ts=1321757623&use_mirror=nchc
wget -P downloads/ http://heidisql.googlecode.com/files/HeidiSQL_6.0_Portable.zip
wget -P downloads/ http://download.sysinternals.com/Files/SysinternalsSuite.zip
wget -P downloads/ http://msysgit.googlecode.com/files/PortableGit-1.7.9-preview20120201.7z
wget -P downloads/ http://downloads.sourceforge.net/project/win32svn/1.6.17/svn-win32-1.6.17.zip?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fwin32svn%2Ffiles%2F1.6.17%2F&ts=1328605348&use_mirror=nchc
wget -P downloads/ http://the.earth.li/~sgtatham/putty/latest/x86/putty.zip

echo extracting...
7z x downloads/HeidiSQL_6.0_Portable.zip -oHeidiSQL
7z x downloads/PortableGit-1.7.9-preview20120201.7z -ogit
7z x downloads/svn-win32-1.6.17.zip
7z x downloads/putty.zip -obin
7z x downloads/SysinternalsSuite.zip -oSysinternalsSuite
7z x downloads/nginx-1.1.12.zip
7z x downloads/php-5.3.10-nts-Win32-VC9-x86.zip -oPHP
7z x downloads/phpMyAdmin-3.4.7.1-english.7z -owww\phpMyAdmin
7z x downloads/mysql-5.5.20-win32.zip

rename mysql-5.5.20-win32 MySQL
rename svn-win32-1.6.17 svn
rename nginx-1.1.12 nginx

echo configuring
copy/Y php_memcache.dll PHP\ext\
copy/Y php_xdebug.dll PHP\ext\
copy/Y php.ini PHP\php.ini
copy/Y my.ini MySQL\my.ini
copy/Y nginx.conf nginx\conf\nginx.conf
echo done
@echo on