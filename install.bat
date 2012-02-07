@echo off

echo downloading...
wget http://nginx.org/download/nginx-1.1.12.zip
wget http://dev.mysql.com/get/Downloads/MySQL-5.5/mysql-5.5.20-win32.zip/from/http://mysql.stu.edu.tw/
wget http://windows.php.net/downloads/releases/php-5.3.10-nts-Win32-VC9-x86.zip
wget http://downloads.sourceforge.net/project/phpmyadmin/phpMyAdmin/3.4.7.1/phpMyAdmin-3.4.7.1-english.7z?r=http%3A%2F%2Fwww.phpmyadmin.net%2Fhome_page%2Fdownloads.php&ts=1321757623&use_mirror=nchc
wget http://heidisql.googlecode.com/files/HeidiSQL_6.0_Portable.zip
wget http://download.sysinternals.com/Files/SysinternalsSuite.zip
wget http://msysgit.googlecode.com/files/PortableGit-1.7.9-preview20120201.7z
wget http://downloads.sourceforge.net/project/win32svn/1.6.17/svn-win32-1.6.17.zip?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fwin32svn%2Ffiles%2F1.6.17%2F&ts=1328605348&use_mirror=nchc
wget http://the.earth.li/~sgtatham/putty/latest/x86/putty.zip

echo extracting...
7z x HeidiSQL_6.0_Portable.zip -oHeidiSQL
7z x PortableGit-1.7.9-preview20120201.7z -ogit
7z x svn-win32-1.6.17.zip -osvn
7z x putty.zip -obin
7z x SysinternalsSuite.zip -oSysinternalsSuite
7z x nginx-1.1.12.zip -onginx
7z x php-5.3.10-nts-Win32-VC9-x86.zip -oPHP
7z x phpMyAdmin-3.4.7.1-english.7z -owww\phpMyAdmin
7z x mysql-5.5.20-win32.zip -oMySQL

echo configureing
copy php_memcache.dll PHP\ext\
copy php_xdebug.dll PHP\ext\
copy PHP\php.ini-development PHP\php.ini
copy my.ini MySQL\my.ini
copy nginx.conf nginx\conf\nginx.conf
echo done
@echo on