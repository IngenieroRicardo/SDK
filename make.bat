@echo off
set SRC=main.c
set OUT=main.exe

:: Verifica el argumento
if "%1"=="sdk" goto sdk
if "%1"=="compile" goto compile
if "%1"=="run" goto run

echo Uso: build.bat [sdk ^| compile ^| run]
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

mkdir bin 2>nul
copy /Y array\array.dll bin\
copy /Y json\json.dll bin\
copy /Y http\http.dll bin\
copy /Y db\db.dll bin\
copy /Y file\file.dll bin\
copy /Y curl\curl.dll bin\

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

cd ejemplos
gcc -o strings.exe strings.c ./array.dll
gcc -o conversiones.exe conversiones.c ./array.dll
gcc -o comparaciones.exe comparaciones.c ./array.dll
gcc -o leerJSON.exe leerJSON.c ./json.dll ./array.dll
gcc -o crearJSON.exe crearJSON.c ./json.dll
gcc -o webservice.exe webservice.c ./http.dll ./array.dll
gcc -o autenticacion.exe autenticacion.c ./http.dll ./array.dll
gcc -o validarip.exe validarip.c ./http.dll ./array.dll
gcc -o listar.exe listar.c ./file.dll ./array.dll
gcc -o files.exe files.c ./file.dll ./array.dll
gcc -o content.exe content.c ./file.dll ./array.dll
gcc -o peticion.exe peticion.c ./curl.dll ./array.dll
cd ..
goto end

:: FUNCION: Compilar el main
:compile
echo === Compilando %SRC% ===
xcopy /Y * sdk\ >nul
del sdk\Makefile >nul 2>&1
cd sdk
gcc -o ..\bin\%OUT% %SRC% ./array.dll ./json.dll ./http.dll ./db.dll ./file.dll ./curl.dll
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
