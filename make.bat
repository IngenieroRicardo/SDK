@echo off
set SRC=main.c
set OUT=main.exe

:: Verifica el argumento
if "%1"=="sdk" goto sdk
if "%1"=="compile" goto compile
if "%1"=="run" goto run

echo Uso: make [ sdk | compile | run ]
goto end

:: FUNCION: Descarga y construye SDKs
:sdk
echo === Descargando y construyendo SDKs ===
git clone https://github.com/IngenieroRicardo/array.git
cd array
go build -o array.dll -buildmode=c-shared array.go
cd ..

git clone https://github.com/IngenieroRicardo/json.git
cd json
go build -o json.dll -buildmode=c-shared json.go
cd ..

git clone https://github.com/IngenieroRicardo/http.git
cd http
go build -o http.dll -buildmode=c-shared http.go
cd ..

git clone https://github.com/IngenieroRicardo/db.git
cd db
go build -o db.dll -buildmode=c-shared db.go
cd ..

git clone https://github.com/IngenieroRicardo/file.git
cd file
go build -o file.dll -buildmode=c-shared file.go
cd ..

git clone https://github.com/IngenieroRicardo/curl.git
cd curl
go build -o curl.dll -buildmode=c-shared curl.go
cd ..

git clone https://github.com/IngenieroRicardo/ftp.git
cd ftp
go build -o ftp.dll -buildmode=c-shared ftp.go
cd ..

git clone https://github.com/IngenieroRicardo/env.git
cd env
go build -o env.dll -buildmode=c-shared env.go
cd ..

mkdir bin 2>nul
copy /Y array\array.dll bin\
copy /Y json\json.dll bin\
copy /Y http\http.dll bin\
copy /Y db\db.dll bin\
copy /Y file\file.dll bin\
copy /Y curl\curl.dll bin\
copy /Y ftp\ftp.dll bin\
copy /Y env\env.dll bin\

mkdir sdk 2>nul
copy /Y array\array.h sdk\
copy /Y array\array.dll sdk\
copy /Y json\json.h sdk\
copy /Y json\json.dll sdk\
copy /Y http\http.h sdk\
copy /Y http\http.dll sdk\
copy /Y db\db.h sdk\
copy /Y db\db.dll sdk\
copy /Y file\file.h sdk\
copy /Y file\file.dll sdk\
copy /Y curl\curl.h sdk\
copy /Y curl\curl.dll sdk\
copy /Y ftp\ftp.h sdk\
copy /Y ftp\ftp.dll sdk\
copy /Y env\env.h sdk\
copy /Y env\env.dll sdk\
copy /Y array\array.h ejemplos\C\
copy /Y array\array.dll ejemplos\C\
copy /Y json\json.h ejemplos\C\
copy /Y json\json.dll ejemplos\C\
copy /Y http\http.h ejemplos\C\
copy /Y http\http.dll ejemplos\C\
copy /Y db\db.h ejemplos\C\
copy /Y db\db.dll ejemplos\C\
copy /Y file\file.h ejemplos\C\
copy /Y file\file.dll ejemplos\C\
copy /Y curl\curl.h ejemplos\C\
copy /Y curl\curl.dll ejemplos\C\
copy /Y ftp\ftp.h ejemplos\C\
copy /Y ftp\ftp.dll ejemplos\C\
copy /Y env\env.h ejemplos\C\
copy /Y env\env.dll ejemplos\C\
copy /Y array\array.dll ejemplos\assembly\
copy /Y json\json.dll ejemplos\assembly\
copy /Y http\http.dll ejemplos\assembly\
copy /Y db\db.dll ejemplos\assembly\
copy /Y file\file.dll ejemplos\assembly\
copy /Y curl\curl.dll ejemplos\assembly\
copy /Y ftp\ftp.dll ejemplos\assembly\
copy /Y env\env.dll ejemplos\assembly\

cd ejemplos\C
gcc -o ARRAYstrings.exe ARRAYstrings.c ./array.dll 
gcc -o ARRAYconversiones.exe ARRAYconversiones.c ./array.dll
gcc -o ARRAYcomparaciones.exe ARRAYcomparaciones.c ./array.dll
gcc -o JSONleer.exe JSONleer.c ./json.dll ./array.dll
gcc -o JSONcrear.exe JSONcrear.c ./json.dll
gcc -o HTTPwebservice.exe HTTPwebservice.c ./http.dll ./array.dll
gcc -o HTTPautenticacion.exe HTTPautenticacion.c ./http.dll ./array.dll
gcc -o HTTPvalidarip.exe HTTPvalidarip.c ./http.dll ./array.dll
gcc -o FILESlistar.exe FILESlistar.c ./file.dll ./array.dll

gcc -o DBconsultas.exe DBconsultas.c ./db.dll ./array.dll
gcc -o DBejecutar.exe DBejecutar.c ./db.dll ./array.dll

gcc -o FILESfiles.exe FILESfiles.c ./file.dll ./array.dll
gcc -o FILEcontent.exe FILEcontent.c ./file.dll ./array.dll
gcc -o CURLpeticion.exe CURLpeticion.c ./curl.dll ./array.dll
gcc -o FTPacciones.exe FTPacciones.c ./ftp.dll ./array.dll
gcc -o ENVentorno.exe ENVentorno.c ./env.dll ./array.dll
gcc -S -fPIC -O2 ARRAYstrings.c -o ../assembly/ARRAYstrings.s
gcc -S -fPIC -O2 ARRAYconversiones.c -o ../assembly/ARRAYconversiones.s
gcc -S -fPIC -O2 ARRAYcomparaciones.c -o ../assembly/ARRAYcomparaciones.s
gcc -S -fPIC -O2 JSONleer.c -o ../assembly/JSONleer.s
gcc -S -fPIC -O2 JSONcrear.c -o ../assembly/JSONcrear.s
gcc -S -fPIC -O2 HTTPwebservice.c -o ../assembly/HTTPwebservice.s
gcc -S -fPIC -O2 HTTPautenticacion.c -o ../assembly/HTTPautenticacion.s
gcc -S -fPIC -O2 HTTPvalidarip.c -o ../assembly/HTTPvalidarip.s
gcc -S -fPIC -O2 FILESfiles.c -o ../assembly/FILESfiles.s
gcc -S -fPIC -O2 FILESlistar.c -o ../assembly/FILESlistar.s
gcc -S -fPIC -O2 FILEcontent.c -o ../assembly/FILEcontent.s

gcc -S -fPIC -O2 DBconsultas.c -o ../assembly/DBconsultas.s
gcc -S -fPIC -O2 DBejecutar.c -o ../assembly/DBejecutar.s

gcc -S -fPIC -O2 CURLpeticion.c -o ../assembly/CURLpeticion.s
gcc -S -fPIC -O2 FTPacciones.c -o ../assembly/FTPacciones.s
gcc -S -fPIC -O2 ENVentorno.c -o ../assembly/ENVentorno.s
cd ..\assembly
gcc -o ARRAYstrings.exe ARRAYstrings.s ./array.dll
gcc -o ARRAYconversiones.exe ARRAYconversiones.s ./array.dll
gcc -o ARRAYcomparaciones.exe ARRAYcomparaciones.s ./array.dll
gcc -o JSONleer.exe JSONleer.s ./json.dll ./array.dll
gcc -o JSONcrear.exe JSONcrear.s ./json.dll
gcc -o HTTPwebservice.exe HTTPwebservice.s ./http.dll ./array.dll
gcc -o HTTPautenticacion.exe HTTPautenticacion.s ./http.dll ./array.dll
gcc -o HTTPvalidarip.exe HTTPvalidarip.s ./http.dll ./array.dll
gcc -o FILESfiles.exe FILESfiles.s ./file.dll ./array.dll
gcc -o FILESlistar.exe FILESlistar.s ./file.dll ./array.dll
gcc -o FILEcontent.exe FILEcontent.s ./file.dll ./array.dll

gcc -o DBconsultas.exe DBconsultas.s ./db.dll ./array.dll
gcc -o DBejecutar.exe DBejecutar.s ./db.dll ./array.dll

gcc -o CURLpeticion.exe CURLpeticion.s ./curl.dll ./array.dll
gcc -o FTPacciones.exe FTPacciones.s ./ftp.dll ./array.dll
gcc -o ENVentorno.exe ENVentorno.s ./env.dll ./array.dll
cd ..\Golang
go build -o JSONleer.exe JSONleer.go
go build -o JSONcrear.exe JSONcrear.go
go build -o HTTPwebservice.exe HTTPwebservice.go
go build -o HTTPautenticacion.exe HTTPautenticacion.go
go build -o HTTPvalidarip.exe HTTPvalidarip.go
go build -o FILEcontent.exe FILEcontent.go
go build -o FILESfiles.exe FILESfiles.go
go build -o FILESlistar.exe FILESlistar.go

go build -o DBconsultas.exe DBconsultas.go
go build -o DBejecutar.exe DBejecutar.go

go build -o CURLpeticion.exe CURLpeticion.go
go build -o FTPacciones.exe FTPacciones.go
cd ..\..
goto end

:: FUNCION: Compilar el main
:compile
echo === Compilando %SRC% ===
xcopy /Y * sdk\ >nul
del sdk\Makefile >nul 2>&1
cd sdk
gcc -o ..\bin\%OUT% %SRC% ./array.dll ./json.dll ./http.dll ./db.dll ./file.dll ./curl.dll ./ftp.dll ./env.dll
cd ..
goto end

:: FUNCION: Ejecutar el binario
:run
echo === Ejecutando %OUT% ===
cd bin
%OUT%
cd ..
goto end

:end
