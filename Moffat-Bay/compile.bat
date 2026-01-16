@echo off
cd /d "%~dp0"

echo Using JDK 21 compiler...
echo Compiling Moffat Bay reservation classes...

REM ================================
REM Set your Tomcat home here
REM Change this path if needed
REM ================================
set TOMCAT_HOME=C:\Java\TomCat11

REM ================================
REM Build classpath for Tomcat 10/11
REM jakarta.servlet-api.jar is required
REM mysql jar should match your WEB-INF\lib name
REM ================================
set CP=%TOMCAT_HOME%\lib\servlet-api.jar;WEB-INF\lib\mysql-connector-j-9.4.0.jar

"%JAVA_HOME%\bin\javac.exe" ^
    -cp "%CP%" ^
    -d WEB-INF\classes ^
    src\com\moffatbay\reservations\RoomType.java ^
    src\com\moffatbay\reservations\DBConnection.java ^
    src\com\moffatbay\reservations\UserSession.java ^
    src\com\moffatbay\reservations\ReservationData.java ^
    src\com\moffatbay\reservations\ReservationController.java

if %errorlevel% neq 0 (
    echo.
    echo Compile failed.
    pause
    exit /b %errorlevel%
)

echo.
echo Compile succeeded.
pause
