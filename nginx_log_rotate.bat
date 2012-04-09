@echo off
set YMD=%date:~0,4%%date:~5,2%%date:~8,2%
set LOG_FILE=
FOR /F "eol=; delims=, " %%i in (nginx_log.lst) do (
	echo "%%i"
	move "%%i" "%%i.%YMD%"
)
pushd C:\PHPToolChain\nginx
nginx -s reopen
popd
pause
@echo on
