
SRC = main.c
OUT = main.bin

sdk:
	# Descargar y compilar librerias
	git clone https://github.com/IngenieroRicardo/array.git
	cd array && go build -o array.so -buildmode=c-shared array.go && cd ..
	git clone https://github.com/IngenieroRicardo/json.git
	cd json && go build -o json.so -buildmode=c-shared json.go && cd ..
	git clone https://github.com/IngenieroRicardo/http.git
	cd http && go build -o http.so -buildmode=c-shared http.go && cd ..
	git clone https://github.com/IngenieroRicardo/db.git
	cd db && go build -o db.so -buildmode=c-shared db.go && cd ..
	git clone https://github.com/IngenieroRicardo/file.git
	cd file && go build -o file.so -buildmode=c-shared file.go && cd ..
	git clone https://github.com/IngenieroRicardo/curl.git
	cd curl && go build -o curl.so -buildmode=c-shared curl.go && cd ..
	git clone https://github.com/IngenieroRicardo/ftp.git
	cd ftp && go build -o ftp.so -buildmode=c-shared ftp.go && cd ..
	git clone https://github.com/IngenieroRicardo/env.git
	cd env && go build -o env.so -buildmode=c-shared env.go && cd ..

	# Preparar carpeta donde generar binario de main.c
	mkdir bin
	cp array/array.so bin/array.so
	cp json/json.so bin/json.so
	cp http/http.so bin/http.so
	cp db/db.so bin/db.so
	cp file/file.so bin/file.so
	cp curl/curl.so bin/curl.so
	cp ftp/ftp.so bin/ftp.so
	cp env/env.so bin/env.so

	# Preparar carpeta donde compilar main.c
	mkdir sdk
	cp array/array.h sdk/array.h
	cp array/array.so sdk/array.so
	cp json/json.h sdk/json.h
	cp json/json.so sdk/json.so
	cp http/http.h sdk/http.h
	cp http/http.so sdk/http.so
	cp db/db.h sdk/db.h
	cp db/db.so sdk/db.so
	cp file/file.h sdk/file.h
	cp file/file.so sdk/file.so
	cp curl/curl.h sdk/curl.h
	cp curl/curl.so sdk/curl.so
	cp ftp/ftp.h sdk/ftp.h
	cp ftp/ftp.so sdk/ftp.so
	cp env/env.h sdk/env.h
	cp env/env.so sdk/env.so

	# Copiar librerias para Ejemplos C
	cp array/array.h ejemplos/C/array.h
	cp array/array.so ejemplos/C/array.so
	cp json/json.h ejemplos/C/json.h
	cp json/json.so ejemplos/C/json.so
	cp http/http.h ejemplos/C/http.h
	cp http/http.so ejemplos/C/http.so
	cp db/db.h ejemplos/C/db.h
	cp db/db.so ejemplos/C/db.so
	cp file/file.h ejemplos/C/file.h
	cp file/file.so ejemplos/C/file.so
	cp curl/curl.h ejemplos/C/curl.h
	cp curl/curl.so ejemplos/C/curl.so
	cp ftp/ftp.h ejemplos/C/ftp.h
	cp ftp/ftp.so ejemplos/C/ftp.so
	cp env/env.h ejemplos/C/env.h
	cp env/env.so ejemplos/C/env.so

	# Copiar librerias para Ejemplos assembly
	cp array/array.so ejemplos/assembly/array.so
	cp json/json.so ejemplos/assembly/json.so
	cp http/http.so ejemplos/assembly/http.so
	cp db/db.so ejemplos/assembly/db.so
	cp file/file.so ejemplos/assembly/file.so
	cp curl/curl.so ejemplos/assembly/curl.so
	cp ftp/ftp.so ejemplos/assembly/ftp.so
	cp env/env.so ejemplos/assembly/env.so

	# Compilar los ejemplos en C
	cd ejemplos/C/ && gcc -o ARRAYstrings.bin ARRAYstrings.c ./array.so && gcc -S -fPIC -O2 ARRAYstrings.c -o ../assembly/ARRAYstrings.s && cd ..
	cd ejemplos/C/ && gcc -o ARRAYconversiones.bin ARRAYconversiones.c ./array.so && gcc -S -fPIC -O2 ARRAYconversiones.c -o ../assembly/ARRAYconversiones.s && cd ..
	cd ejemplos/C/ && gcc -o ARRAYcomparaciones.bin ARRAYcomparaciones.c ./array.so && gcc -S -fPIC -O2 ARRAYcomparaciones.c -o ../assembly/ARRAYcomparaciones.s && cd ..
	cd ejemplos/C/ && gcc -o JSONleer.bin JSONleer.c ./json.so ./array.so && gcc -S -fPIC -O2 JSONleer.c -o ../assembly/JSONleer.s && cd ..
	cd ejemplos/C/ && gcc -o JSONcrear.bin JSONcrear.c ./json.so && gcc -S -fPIC -O2 JSONcrear.c -o ../assembly/JSONcrear.s && cd ..
	cd ejemplos/C/ && gcc -o HTTPwebservice.bin HTTPwebservice.c ./http.so ./array.so && gcc -S -fPIC -O2 HTTPwebservice.c -o ../assembly/HTTPwebservice.s && cd ..
	cd ejemplos/C/ && gcc -o HTTPautenticacion.bin HTTPautenticacion.c ./http.so ./array.so && gcc -S -fPIC -O2 HTTPautenticacion.c -o ../assembly/HTTPautenticacion.s && cd ..
	cd ejemplos/C/ && gcc -o HTTPvalidarip.bin HTTPvalidarip.c ./http.so ./array.so && gcc -S -fPIC -O2 HTTPvalidarip.c -o ../assembly/HTTPvalidarip.s && cd ..
	cd ejemplos/C/ && gcc -o FILESlistar.bin FILESlistar.c ./file.so ./array.so && gcc -S -fPIC -O2 FILESfiles.c -o ../assembly/FILESfiles.s && cd ..
	cd ejemplos/C/ && gcc -o DBconsultas.bin DBconsultas.c ./db.so ./array.so && gcc -S -fPIC -O2 FILESlistar.c -o ../assembly/FILESlistar.s && cd ..
	cd ejemplos/C/ && gcc -o FILESfiles.bin FILESfiles.c ./file.so ./array.so && gcc -S -fPIC -O2 FILEcontent.c -o ../assembly/FILEcontent.s && cd ..
	cd ejemplos/C/ && gcc -o FILEcontent.bin FILEcontent.c ./file.so ./array.so && gcc -S -fPIC -O2 DBconsultas.c -o ../assembly/DBconsultas.s && cd ..
	cd ejemplos/C/ && gcc -o CURLpeticion.bin CURLpeticion.c ./curl.so ./array.so && gcc -S -fPIC -O2 CURLpeticion.c -o ../assembly/CURLpeticion.s && cd ..
	cd ejemplos/C/ && gcc -o FTPacciones.bin FTPacciones.c ./ftp.so ./array.so && gcc -S -fPIC -O2 FTPacciones.c -o ../assembly/FTPacciones.s && cd ..
	cd ejemplos/C/ && gcc -o ENVentorno.bin ENVentorno.c ./env.so ./array.so && gcc -S -fPIC -O2 ENVentorno.c -o ../assembly/ENVentorno.s && cd ..

	# Compilar los ejemplos en assembly
	cd ejemplos/assembly/ && gcc -o ARRAYstrings.bin ARRAYstrings.s ./array.so && cd ..
	cd ejemplos/assembly/ && gcc -o ARRAYconversiones.bin ARRAYconversiones.s ./array.so && cd ..
	cd ejemplos/assembly/ && gcc -o ARRAYcomparaciones.bin ARRAYcomparaciones.s ./array.so && cd ..
	cd ejemplos/assembly/ && gcc -o JSONleer.bin JSONleer.s ./json.so ./array.so && cd ..
	cd ejemplos/assembly/ && gcc -o JSONcrear.bin JSONcrear.s ./json.so && cd ..
	cd ejemplos/assembly/ && gcc -o HTTPwebservice.bin HTTPwebservice.s ./http.so ./array.so && cd ..
	cd ejemplos/assembly/ && gcc -o HTTPautenticacion.bin HTTPautenticacion.s ./http.so ./array.so && cd ..
	cd ejemplos/assembly/ && gcc -o HTTPvalidarip.bin HTTPvalidarip.s ./http.so ./array.so && cd ..
	cd ejemplos/assembly/ && gcc -o FILESfiles.bin FILESfiles.s ./file.so ./array.so && cd ..
	cd ejemplos/assembly/ && gcc -o FILESlistar.bin FILESlistar.s ./file.so ./array.so && cd ..
	cd ejemplos/assembly/ && gcc -o FILEcontent.bin FILEcontent.s ./file.so ./array.so && cd ..
	cd ejemplos/assembly/ && gcc -o DBconsultas.bin DBconsultas.s ./db.so ./array.so && cd ..
	cd ejemplos/assembly/ && gcc -o CURLpeticion.bin CURLpeticion.s ./curl.so ./array.so && cd ..
	cd ejemplos/assembly/ && gcc -o FTPacciones.bin FTPacciones.s ./ftp.so ./array.so && cd ..
	cd ejemplos/assembly/ && gcc -o ENVentorno.bin ENVentorno.s ./env.so ./array.so && cd ..
	
	# Compilar los ejemplos en Golang
	cd ejemplos/Golang/ && go build -o JSONleer.bin JSONleer.go && cd ..
	cd ejemplos/Golang/ && go build -o JSONcrear.bin JSONcrear.go && cd ..
	cd ejemplos/Golang/ && go build -o HTTPwebservice.bin HTTPwebservice.go && cd ..
	cd ejemplos/Golang/ && go build -o HTTPautenticacion.bin HTTPautenticacion.go && cd ..
	cd ejemplos/Golang/ && go build -o HTTPvalidarip.bin HTTPvalidarip.go && cd ..
	cd ejemplos/Golang/ && go build -o FILEcontent.bin FILEcontent.go && cd ..
	cd ejemplos/Golang/ && go build -o FILESfiles.bin FILESfiles.go && cd ..
	cd ejemplos/Golang/ && go build -o FILESlistar.bin FILESlistar.go && cd ..
	cd ejemplos/Golang/ && go build -o DBconsultas.bin DBconsultas.go && cd ..
	cd ejemplos/Golang/ && go build -o CURLpeticion.bin CURLpeticion.go && cd ..
	cd ejemplos/Golang/ && go build -o FTPacciones.bin FTPacciones.go && cd ..
	
	
compile:
	# Con este comando generas el assemblyd de tu codigo C: gcc -S -fPIC -O2 main.c -o main.s
	-@cp -f * sdk/ 2>/dev/null || true
	rm sdk/Makefile
	cd sdk/ && gcc -o ../bin/$(OUT) $(SRC) ./array.so ./json.so ./http.so ./db.so ./file.so ./curl.so ./ftp.so ./env.so && cd ..

run:
	cd bin && ./$(OUT)
