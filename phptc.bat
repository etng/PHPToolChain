@echo off
title PHPToolChain Loader
rem Windows Nginx MySQL Memcached PHP
SET EXTRA_PATH=%~dp0bin;%~dp0php;%~dp0mysql\bin;%~dp0SysinternalsSuite;%~dp0git;%~dp0svn\bin;
set path=%EXTRA_PATH%%path%
echo 请将以下内容加入 PATH环境变量
echo %EXTRA_PATH%
echo 正在停止Nginx进程......
taskkill /f /im nginx.exe >nul

echo 正在停止 Memcached 进程......
taskkill /f /im memcached.exe >nul

echo 正在停止 MySQL 进程......
taskkill /f /im mysqld.exe >nul

echo 正在停止PHP(FastCGI)进程......
taskkill /f /im php-cgi.exe>nul

echo Nginx+PHP已停止。

pause
@echo off

RunHiddenConsole.exe mysqld
RunHiddenConsole.exe memcached
rem
echo 正在启动PHP(FastCGI)进程......
RunHiddenConsole.exe php-cgi.exe  -b 127.0.0.1:7001
RunHiddenConsole.exe php-cgi.exe  -b 127.0.0.1:7002
RunHiddenConsole.exe php-cgi.exe  -b 127.0.0.1:7003
RunHiddenConsole.exe php-cgi.exe  -b 127.0.0.1:7004
RunHiddenConsole.exe php-cgi.exe  -b 127.0.0.1:7005
echo PHP已启动。
nginx\nginx.exe -v
nginx\nginx.exe -t -c nginx\conf\nginx.conf
echo 正在启动Nginx进程......
RunHiddenConsole.exe nginx\nginx.exe -c nginx\conf\nginx.conf

echo Nginx+PHP已启动。
pause