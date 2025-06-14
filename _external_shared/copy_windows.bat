@echo off

set "PROJECT_NAME=KalaTestProject"

echo Starting to copy %PROJECT_NAME%...
echo.

set "PROJECT_ROOT=%~dp0"

set "CRASH_RELEASE_DLL_ORIGIN=%PROJECT_ROOT%\KalaCrashHandler\release\KalaCrashHandler.dll"
set "CRASH_DEBUG_DLL_ORIGIN=%PROJECT_ROOT%\KalaCrashHandler\debug\KalaCrashHandlerD.dll"

set "WINDOW_RELEASE_DLL_ORIGIN=%PROJECT_ROOT%\KalaWindow\release\KalaWindow.dll"
set "WINDOW_DEBUG_DLL_ORIGIN=%PROJECT_ROOT%\KalaWindow\debug\KalaWindowD.dll"

if not exist "%CRASH_RELEASE_DLL_ORIGIN%" (
	echo Failed to find crash origin release dll from '%CRASH_RELEASE_DLL_ORIGIN%'!
	pause
	exit /b 1
)
if not exist "%CRASH_DEBUG_DLL_ORIGIN%" (
	echo Failed to find crash origin debug dll from '%CRASH_DEBUG_DLL_ORIGIN%'!
	pause
	exit /b 1
)

if not exist "%WINDOW_RELEASE_DLL_ORIGIN%" (
	echo Failed to find window origin release dll from '%WINDOW_RELEASE_DLL_ORIGIN%'!
	pause
	exit /b 1
)
if not exist "%WINDOW_DEBUG_DLL_ORIGIN%" (
	echo Failed to find window origin debug dll from '%WINDOW_DEBUG_DLL_ORIGIN%'!
	pause
	exit /b 1
)

set "TARGET_ROOT=%PROJECT_ROOT%..\files\external dlls"

if not exist "%TARGET_ROOT%" (
	echo Failed to find target root from '%TARGET_ROOT%'!
	pause
	exit /b 1
)

if not exist "%TARGET_ROOT%\release" mkdir "%TARGET_ROOT%\release"
if not exist "%TARGET_ROOT%\debug" mkdir "%TARGET_ROOT%\debug"

set "CRASH_RELEASE_DLL_TARGET=%TARGET_ROOT%\release\KalaCrashHandler.dll"
set "CRASH_DEBUG_DLL_TARGET=%TARGET_ROOT%\debug\KalaCrashHandlerD.dll"

set "WINDOW_RELEASE_DLL_TARGET=%TARGET_ROOT%\release\KalaWindow.dll"
set "WINDOW_DEBUG_DLL_TARGET=%TARGET_ROOT%\debug\KalaWindowD.dll"

:: Copy dll to target path
copy /Y "%CRASH_RELEASE_DLL_ORIGIN%" "%CRASH_RELEASE_DLL_TARGET%"
copy /Y "%CRASH_DEBUG_DLL_ORIGIN%" "%CRASH_DEBUG_DLL_TARGET%"

copy /Y "%WINDOW_RELEASE_DLL_ORIGIN%" "%WINDOW_RELEASE_DLL_TARGET%"
copy /Y "%WINDOW_DEBUG_DLL_ORIGIN%" "%WINDOW_DEBUG_DLL_TARGET%"

echo.
echo Finished copying %PROJECT_NAME% DLLs!

pause
exit /b 0
