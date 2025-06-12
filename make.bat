@echo off
setlocal enabledelayedexpansion

set SRC=main.c
set OUT=main.exe

if "%1"=="sdk" (
    echo Descargar y compilar librerias
    git clone https://github.com/IngenieroRicardo/array.git
    cd array && go build -o array.dll -buildmode=c-shared array.go && cd ..
    git clone https://github.com/IngenieroRicardo/json.git
    cd json && go build -o json.dll -buildmode=c-shared json.go && cd ..
    git clone https://github.com/IngenieroRicardo/http.git
    cd http && go build -o http.dll -buildmode=c-shared http.go && cd ..
    git clone https://github.com/IngenieroRicardo/db.git
    cd db && go build -o db.dll -buildmode=c-shared db.go && cd ..
    git clone https://github.com/IngenieroRicardo/file.git
    cd file && go build -o file.dll -buildmode=c-shared file.go && cd ..
    git clone https://github.com/IngenieroRicardo/curl.git
    cd curl && go build -o curl.dll -buildmode=c-shared curl.go && cd ..
    git clone https://github.com/IngenieroRicardo/ftp.git
    cd ftp && go build -o ftp.dll -buildmode=c-shared ftp.go && cd ..

    echo Preparar carpeta donde generar binario de main.c
    if not exist bin mkdir bin
    copy array\array.dll bin\array.dll
    copy json\json.dll bin\json.dll
    copy http\http.dll bin\http.dll
    copy db\db.dll bin\db.dll
    copy file\file.dll bin\file.dll
    copy curl\curl.dll bin\curl.dll
    copy ftp\ftp.dll bin\ftp.dll

    echo Preparar carpeta donde compilar main.c
    if not exist sdk mkdir sdk
    copy array\array.h sdk\array.h
    copy array\array.dll sdk\array.dll
    copy json\json.h sdk\json.h
    copy json\json.dll sdk\json.dll
    copy http\http.h sdk\http.h
    copy http\http.dll sdk\http.dll
    copy db\db.h sdk\db.h
    copy db\db.dll sdk\db.dll
    copy file\file.h sdk\file.h
    copy file\file.dll sdk\file.dll
    copy curl\curl.h sdk\curl.h
    copy curl\curl.dll sdk\curl.dll
    copy ftp\ftp.h sdk\ftp.h
    copy ftp\ftp.dll sdk\ftp.dll

    echo Copiar librerias para Ejemplos C
    if not exist ejemplos\C mkdir ejemplos\C
    copy array\array.h ejemplos\C\array.h
    copy array\array.dll ejemplos\C\array.dll
    copy json\json.h ejemplos\C\json.h
    copy json\json.dll ejemplos\C\json.dll
    copy http\http.h ejemplos\C\http.h
    copy http\http.dll ejemplos\C\http.dll
    copy db\db.h ejemplos\C\db.h
    copy db\db.dll ejemplos\C\db.dll
    copy file\file.h ejemplos\C\file.h
    copy file\file.dll ejemplos\C\file.dll
    copy curl\curl.h ejemplos\C\curl.h
    copy curl\curl.dll ejemplos\C\curl.dll
    copy ftp\ftp.h ejemplos\C\ftp.h
    copy ftp\ftp.dll ejemplos\C\ftp.dll

    echo Copiar librerias para Ejemplos assembly
    if not exist ejemplos\assembly mkdir ejemplos\assembly
    copy array\array.dll ejemplos\assembly\array.dll
    copy json\json.dll ejemplos\assembly\json.dll
    copy http\http.dll ejemplos\assembly\http.dll
    copy db\db.dll ejemplos\assembly\db.dll
    copy file\file.dll ejemplos\assembly\file.dll
    copy curl\curl.dll ejemplos\assembly\curl.dll
    copy ftp\ftp.dll ejemplos\assembly\ftp.dll

    echo Compilar los ejemplos en C
    cd ejemplos\C\ && gcc -o ARRAYstrings.exe ARRAYstrings.c .\array.dll && gcc -S -fPIC -O2 ARRAYstrings.c -o ..\assembly\ARRAYstrings.s && cd ..\..
    cd ejemplos\C\ && gcc -o ARRAYconversiones.exe ARRAYconversiones.c .\array.dll && gcc -S -fPIC -O2 ARRAYconversiones.c -o ..\assembly\ARRAYconversiones.s && cd ..\..
    cd ejemplos\C\ && gcc -o ARRAYcomparaciones.exe ARRAYcomparaciones.c .\array.dll && gcc -S -fPIC -O2 ARRAYcomparaciones.c -o ..\assembly\ARRAYcomparaciones.s && cd ..\..
    cd ejemplos\C\ && gcc -o JSONleer.exe JSONleer.c .\json.dll .\array.dll && gcc -S -fPIC -O2 JSONleer.c -o ..\assembly\JSONleer.s && cd ..\..
    cd ejemplos\C\ && gcc -o JSONcrear.exe JSONcrear.c .\json.dll && gcc -S -fPIC -O2 JSONcrear.c -o ..\assembly\JSONcrear.s && cd ..\..
    cd ejemplos\C\ && gcc -o HTTPwebservice.exe HTTPwebservice.c .\http.dll .\array.dll && gcc -S -fPIC -O2 HTTPwebservice.c -o ..\assembly\HTTPwebservice.s && cd ..\..
    cd ejemplos\C\ && gcc -o HTTPautenticacion.exe HTTPautenticacion.c .\http.dll .\array.dll && gcc -S -fPIC -O2 HTTPautenticacion.c -o ..\assembly\HTTPautenticacion.s && cd ..\..
    cd ejemplos\C\ && gcc -o HTTPvalidarip.exe HTTPvalidarip.c .\http.dll .\array.dll && gcc -S -fPIC -O2 HTTPvalidarip.c -o ..\assembly\HTTPvalidarip.s && cd ..\..
    cd ejemplos\C\ && gcc -o FILESlistar.exe FILESlistar.c .\file.dll .\array.dll && gcc -S -fPIC -O2 FILESfiles.c -o ..\assembly\FILESfiles.s && cd ..\..
    cd ejemplos\C\ && gcc -o DBconsultas.exe DBconsultas.c .\db.dll .\array.dll && gcc -S -fPIC -O2 FILESlistar.c -o ..\assembly\FILESlistar.s && cd ..\..
    cd ejemplos\C\ && gcc -o FILESfiles.exe FILESfiles.c .\file.dll .\array.dll && gcc -S -fPIC -O2 FILEcontent.c -o ..\assembly\FILEcontent.s && cd ..\..
    cd ejemplos\C\ && gcc -o FILEcontent.exe FILEcontent.c .\file.dll .\array.dll && gcc -S -fPIC -O2 DBconsultas.c -o ..\assembly\DBconsultas.s && cd ..\..
    cd ejemplos\C\ && gcc -o CURLpeticion.exe CURLpeticion.c .\curl.dll .\array.dll && gcc -S -fPIC -O2 CURLpeticion.c -o ..\assembly\CURLpeticion.s && cd ..\..
    cd ejemplos\C\ && gcc -o FTPacciones.exe FTPacciones.c .\ftp.dll .\array.dll && gcc -S -fPIC -O2 FTPacciones.c -o ..\assembly\FTPacciones.s && cd ..\..

    echo Compilar los ejemplos en assembly
    cd ejemplos\assembly\ && gcc -o ARRAYstrings.exe ARRAYstrings.s .\array.dll && cd ..\..
    cd ejemplos\assembly\ && gcc -o ARRAYconversiones.exe ARRAYconversiones.s .\array.dll && cd ..\..
    cd ejemplos\assembly\ && gcc -o ARRAYcomparaciones.exe ARRAYcomparaciones.s .\array.dll && cd ..\..
    cd ejemplos\assembly\ && gcc -o JSONleer.exe JSONleer.s .\json.dll .\array.dll && cd ..\..
    cd ejemplos\assembly\ && gcc -o JSONcrear.exe JSONcrear.s .\json.dll && cd ..\..
    cd ejemplos\assembly\ && gcc -o HTTPwebservice.exe HTTPwebservice.s .\http.dll .\array.dll && cd ..\..
    cd ejemplos\assembly\ && gcc -o HTTPautenticacion.exe HTTPautenticacion.s .\http.dll .\array.dll && cd ..\..
    cd ejemplos\assembly\ && gcc -o HTTPvalidarip.exe HTTPvalidarip.s .\http.dll .\array.dll && cd ..\..
    cd ejemplos\assembly\ && gcc -o FILESfiles.exe FILESfiles.s .\file.dll .\array.dll && cd ..\..
    cd ejemplos\assembly\ && gcc -o FILESlistar.exe FILESlistar.s .\file.dll .\array.dll && cd ..\..
    cd ejemplos\assembly\ && gcc -o FILEcontent.exe FILEcontent.s .\file.dll .\array.dll && cd ..\..
    cd ejemplos\assembly\ && gcc -o DBconsultas.exe DBconsultas.s .\db.dll .\array.dll && cd ..\..
    cd ejemplos\assembly\ && gcc -o CURLpeticion.exe CURLpeticion.s .\curl.dll .\array.dll && cd ..\..
    cd ejemplos\assembly\ && gcc -o FTPacciones.exe FTPacciones.s .\ftp.dll .\array.dll && cd ..\..
    
    echo Compilar los ejemplos en Golang
    cd ejemplos\Golang\ && go build -o JSONleer.exe JSONleer.go && cd ..\..
    cd ejemplos\Golang\ && go build -o JSONcrear.exe JSONcrear.go && cd ..\..
    cd ejemplos\Golang\ && go build -o HTTPwebservice.exe HTTPwebservice.go && cd ..\..
    cd ejemplos\Golang\ && go build -o HTTPautenticacion.exe HTTPautenticacion.go && cd ..\..
    cd ejemplos\Golang\ && go build -o HTTPvalidarip.exe HTTPvalidarip.go && cd ..\..
    cd ejemplos\Golang\ && go build -o FILEcontent.exe FILEcontent.go && cd ..\..
    cd ejemplos\Golang\ && go build -o FILESfiles.exe FILESfiles.go && cd ..\..
    cd ejemplos\Golang\ && go build -o FILESlistar.exe FILESlistar.go && cd ..\..
    cd ejemplos\Golang\ && go build -o DBconsultas.exe DBconsultas.go && cd ..\..
    cd ejemplos\Golang\ && go build -o CURLpeticion.exe CURLpeticion.go && cd ..\..
    cd ejemplos\Golang\ && go build -o FTPacciones.exe FTPacciones.go && cd ..\..
) else if "%1"=="compile" (
    echo Compilando...
    copy * sdk\ >nul 2>&1
    del sdk\Makefile >nul 2>&1
    del sdk\make.bat >nul 2>&1
    cd sdk\ && gcc -o ..\bin\%OUT% %SRC% .\array.dll .\json.dll .\http.dll .\db.dll .\file.dll .\curl.dll .\ftp.dll && cd ..
) else if "%1"=="run" (
    echo Ejecutando...
    cd bin && .\%OUT%
) else (
    echo Uso: make [sdk|compile|run]
    echo.
    echo sdk     - Descarga y compila las librerias
    echo compile - Compila el programa principal
    echo run     - Ejecuta el programa principal
)

endlocal