@echo off
title PHPToolChain Loader
rem Windows Nginx MySQL Memcached PHP
SET EXTRA_PATH=%~dp0bin;%~dp0php;%~dp0mysql\bin;%~dp0SysinternalsSuite;%~dp0git;%~dp0svn\bin;
set path=%EXTRA_PATH%%path%
echo �뽫�������ݼ��� PATH��������
echo %EXTRA_PATH%
echo ����ֹͣNginx����......
taskkill /f /im nginx.exe >nul

echo ����ֹͣ Memcached ����......
taskkill /f /im memcached.exe >nul

echo ����ֹͣ MySQL ����......
taskkill /f /im mysqld.exe >nul

echo ����ֹͣPHP(FastCGI)����......
taskkill /f /im php-cgi.exe>nul

echo Nginx+PHP��ֹͣ��

pause
@echo off

RunHiddenConsole.exe mysqld
RunHiddenConsole.exe memcached
rem
echo ��������PHP(FastCGI)����......
RunHiddenConsole.exe php-cgi.exe  -b 127.0.0.1:7001
RunHiddenConsole.exe php-cgi.exe  -b 127.0.0.1:7002
RunHiddenConsole.exe php-cgi.exe  -b 127.0.0.1:7003
RunHiddenConsole.exe php-cgi.exe  -b 127.0.0.1:7004
RunHiddenConsole.exe php-cgi.exe  -b 127.0.0.1:7005
echo PHP��������
nginx\nginx.exe -v
nginx\nginx.exe -t -c nginx\conf\nginx.conf
echo ��������Nginx����......
RunHiddenConsole.exe nginx\nginx.exe -c nginx\conf\nginx.conf

echo Nginx+PHP��������
pause