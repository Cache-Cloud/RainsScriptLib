@echo off
set /P C=[Choice]: 
if "%C" == "" goto info
setlocal enabledelayedexpansion
tasklist /fi "pid eq %C" | find "%C" > nul && (
  tasklist /fi "pid eq %C"
  echo.
  set /p str="�Ƿ�Ҫ���� PID Ϊ %1 �Ľ���(Y/N)? "
  if /I "!str!" == "Y" taskkill /f /pid %C
) || echo û���ҵ� PID Ϊ %C �Ľ���
goto end
:info
echo ʹ�÷�����kill ^<��Ҫ�����Ľ��̺�(PID)^>
:end
echo on
