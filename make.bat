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
copy /Y array\array.h ejemplos\
copy /Y array\array.dll ejemplos\
copy /Y json\json.h ejemplos\
copy /Y json\json.dll ejemplos\
copy /Y http\http.h ejemplos\
copy /Y http\http.dll ejemplos\
copy /Y db\db.h ejemplos\
copy /Y db\db.dll ejemplos\
copy /Y file\file.h ejemplos\
copy /Y file\file.dll ejemplos\
copy /Y curl\curl.h ejemplos\
copy /Y curl\curl.dll ejemplos\
copy /Y ftp\ftp.h ejemplos\
copy /Y ftp\ftp.dll ejemplos\
copy /Y env\env.h ejemplos\
copy /Y env\env.dll ejemplos\

cd ejemplos\C
gcc -o ARRAYstrings.bin ARRAYstrings.c ./array.so 
gcc -o ARRAYconversiones.bin ARRAYconversiones.c ./array.so
gcc -o ARRAYcomparaciones.bin ARRAYcomparaciones.c ./array.so
gcc -o JSONleer.bin JSONleer.c ./json.so ./array.so
gcc -o JSONcrear.bin JSONcrear.c ./json.so
gcc -o HTTPwebservice.bin HTTPwebservice.c ./http.so ./array.so
gcc -o HTTPautenticacion.bin HTTPautenticacion.c ./http.so ./array.so
gcc -o HTTPvalidarip.bin HTTPvalidarip.c ./http.so ./array.so
gcc -o FILESlistar.bin FILESlistar.c ./file.so ./array.so
gcc -o DBconsultas.bin DBconsultas.c ./db.so ./array.so
gcc -o FILESfiles.bin FILESfiles.c ./file.so ./array.so
gcc -o FILEcontent.bin FILEcontent.c ./file.so ./array.so
gcc -o CURLpeticion.bin CURLpeticion.c ./curl.so ./array.so
gcc -o FTPacciones.bin FTPacciones.c ./ftp.so ./array.so
gcc -o ENVentorno.bin ENVentorno.c ./env.so ./array.so
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
gcc -S -fPIC -O2 CURLpeticion.c -o ../assembly/CURLpeticion.s
gcc -S -fPIC -O2 FTPacciones.c -o ../assembly/FTPacciones.s
gcc -S -fPIC -O2 ENVentorno.c -o ../assembly/ENVentorno.s
cd ..\assembly
gcc -o ARRAYstrings.bin ARRAYstrings.s ./array.so
gcc -o ARRAYconversiones.bin ARRAYconversiones.s ./array.so
gcc -o ARRAYcomparaciones.bin ARRAYcomparaciones.s ./array.so
gcc -o JSONleer.bin JSONleer.s ./json.so ./array.so
gcc -o JSONcrear.bin JSONcrear.s ./json.so
gcc -o HTTPwebservice.bin HTTPwebservice.s ./http.so ./array.so
gcc -o HTTPautenticacion.bin HTTPautenticacion.s ./http.so ./array.so
gcc -o HTTPvalidarip.bin HTTPvalidarip.s ./http.so ./array.so
gcc -o FILESfiles.bin FILESfiles.s ./file.so ./array.so
gcc -o FILESlistar.bin FILESlistar.s ./file.so ./array.so
gcc -o FILEcontent.bin FILEcontent.s ./file.so ./array.so
gcc -o DBconsultas.bin DBconsultas.s ./db.so ./array.so
gcc -o CURLpeticion.bin CURLpeticion.s ./curl.so ./array.so
gcc -o FTPacciones.bin FTPacciones.s ./ftp.so ./array.so
gcc -o ENVentorno.bin ENVentorno.s ./env.so ./array.so
cd ..\Golang
go build -o JSONleer.bin JSONleer.go
go build -o JSONcrear.bin JSONcrear.go
go build -o HTTPwebservice.bin HTTPwebservice.go
go build -o HTTPautenticacion.bin HTTPautenticacion.go
go build -o HTTPvalidarip.bin HTTPvalidarip.go
go build -o FILEcontent.bin FILEcontent.go
go build -o FILESfiles.bin FILESfiles.go
go build -o FILESlistar.bin FILESlistar.go
go build -o DBconsultas.bin DBconsultas.go
go build -o CURLpeticion.bin CURLpeticion.go
go build -o FTPacciones.bin FTPacciones.go
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
