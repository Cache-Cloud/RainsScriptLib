@echo off
cls
color 0a
TITLE KillPort Power By xx

:main
ECHO. ********************************************************************
ECHO. * *
ECHO. * *  1.ȫ���˿��б�
ECHO. * *  2.��ѯ�˿���Ϣ
ECHO. * *  3.��ѯPID��Ӧ����
ECHO. * *  4.����˿�ռ��
ECHO. * *
ECHO. ********************************************************************
	echo.
set /p X=��������ѡ����:

if %X%==1 (
	goto findAllPort
)else if %x%==2 (
goto mPort
)else if %x%==3 (
goto findPid
)else if %x%==4 (
goto killPort
)

:findAllPort
cls
	echo.	
	netstat -aon
	echo.
	goto main
	
:mPort
cls
    set /p mport=������Ҫ���ҵĶ˿�:
	echo.	
	echo   Э��   ���ص�ַ          	�ⲿ��ַ        	״̬           PID
	netstat -aon|findstr %mport%
	echo.
	goto main

:findPid
cls
    set /p mPid=������˿ڶ�Ӧ��PID��:
	tasklist|findstr %mPid%
	echo.
	goto main
	
:killPort
cls
set /p port=������˿ںţ�
for /f "tokens=1-5" %%i in ('netstat -ano^|findstr ":%port%"') do (
    echo kill the process %%m who use the port %port%
    tasklist|findstr %%m
    echo.
    taskkill /f /pid %%m
)
	echo.
	goto main