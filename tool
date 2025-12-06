@echo off
:: -----------------------------------
:: TỰ YÊU CẦU QUYỀN ADMIN
:: -----------------------------------
>nul 2>&1 net session
if %errorLevel% NEQ 0 (
    echo Dang yeu cau quyen Administrator...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

title NETWORK OPTIMIZER - HUY DEV
color 0a

:MENU
cls
echo =======================================
echo         TOOL TOI UU MANG - HUY DEV
echo =======================================
echo 1. Flush DNS (Xoa DNS Cache)
echo 2. Reset Winsock (Sua loi mang)
echo 3. Reset TCP/IP
echo 4. Renew IP (Cap moi dia chi IP)
echo 5. Reset Firewall ve mac dinh
echo 6. Toi uu mang toan dien (All-in-One)
echo 7. Thoat
echo =======================================
set /p choice=Nhap lua chon (1-7): 

if "%choice%"=="1" goto FLUSH
if "%choice%"=="2" goto WINSOCK
if "%choice%"=="3" goto TCPIP
if "%choice%"=="4" goto RENEW
if "%choice%"=="5" goto FIREWALL
if "%choice%"=="6" goto FULL
if "%choice%"=="7" exit
goto MENU

:: -------------------------
:: 1. FLUSH DNS
:: -------------------------
:FLUSH
cls
echo Dang xoa DNS cache...
ipconfig /flushdns
echo Hoan tat!
pause
goto MENU

:: -------------------------
:: 2. RESET WINSOCK
:: -------------------------
:WINSOCK
cls
echo Dang reset Winsock...
netsh winsock reset
echo Hoan tat!
pause
goto MENU

:: -------------------------
:: 3. RESET TCP/IP
:: -------------------------
:TCPIP
cls
echo Dang reset TCP/IP...
netsh int ip reset
echo Hoan tat!
pause
goto MENU

:: -------------------------
:: 4. RENEW IP
:: -------------------------
:RENEW
cls
echo Dang cap lai dia chi IP...
ipconfig /release
ipconfig /renew
echo Da cap moi IP!
pause
goto MENU

:: -------------------------
:: 5. RESET FIREWALL
:: -------------------------
:FIREWALL
cls
echo Dang reset Windows Firewall ve mac dinh...
netsh advfirewall reset
echo Hoan tat!
pause
goto MENU

:: -------------------------
:: 6. FULL NETWORK OPTIMIZATION
:: -------------------------
:FULL
cls
echo Dang toi uu mang toan dien...
ipconfig /flushdns
ipconfig /registerdns
ipconfig /release
ipconfig /renew
netsh winsock reset
netsh int ip reset
netsh advfirewall reset
echo.
echo =======================================
echo     TOI UU MANG TOAN DIEN HOAN TAT!
echo =======================================
pause
goto MENU