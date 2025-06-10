
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

	# Preparar carpeta donde generar binario de main.c
	mkdir bin
	cp array/array.so bin/array.so
	cp json/json.so bin/json.so
	cp http/http.so bin/http.so
	cp db/db.so bin/db.so
	cp file/file.so bin/file.so
	cp curl/curl.so bin/curl.so
	cp ftp/ftp.so bin/ftp.so

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

	# Copiar librerias para Ejemplos assembly
	cp array/array.so ejemplos/assembly/array.so
	cp json/json.so ejemplos/assembly/json.so
	cp http/http.so ejemplos/assembly/http.so
	cp db/db.so ejemplos/assembly/db.so
	cp file/file.so ejemplos/assembly/file.so
	cp curl/curl.so ejemplos/assembly/curl.so
	cp ftp/ftp.so ejemplos/assembly/ftp.so

	# Compilar los ejemplos en C
	cd ejemplos/C/ && gcc -o strings.bin strings.c ./array.so && cd ..
	cd ejemplos/C/ && gcc -o conversiones.bin conversiones.c ./array.so && cd ..
	cd ejemplos/C/ && gcc -o comparaciones.bin comparaciones.c ./array.so && cd ..
	cd ejemplos/C/ && gcc -o leerJSON.bin leerJSON.c ./json.so ./array.so && cd ..
	cd ejemplos/C/ && gcc -o crearJSON.bin crearJSON.c ./json.so && cd ..
	cd ejemplos/C/ && gcc -o webservice.bin webservice.c ./http.so ./array.so && cd ..
	cd ejemplos/C/ && gcc -o autenticacion.bin autenticacion.c ./http.so ./array.so && cd ..
	cd ejemplos/C/ && gcc -o validarip.bin validarip.c ./http.so ./array.so && cd ..
	cd ejemplos/C/ && gcc -o listar.bin listar.c ./file.so ./array.so && cd ..
	cd ejemplos/C/ && gcc -o consultas.bin consultas.c ./db.so ./array.so && cd ..
	cd ejemplos/C/ && gcc -o files.bin files.c ./file.so ./array.so && cd ..
	cd ejemplos/C/ && gcc -o content.bin content.c ./file.so ./array.so && cd ..
	cd ejemplos/C/ && gcc -o peticion.bin peticion.c ./curl.so ./array.so && cd ..
	cd ejemplos/C/ && gcc -o accionesFTP.bin accionesFTP.c ./ftp.so ./array.so && cd ..

	# Compilar los ejemplos en assembly
	cd ejemplos/assembly/ && gcc -o strings.bin strings.s ./array.so && cd ..
	cd ejemplos/assembly/ && gcc -o conversiones.bin conversiones.s ./array.so && cd ..
	cd ejemplos/assembly/ && gcc -o comparaciones.bin comparaciones.s ./array.so && cd ..
	cd ejemplos/assembly/ && gcc -o leerJSON.bin leerJSON.s ./json.so ./array.so && cd ..
	cd ejemplos/assembly/ && gcc -o crearJSON.bin crearJSON.s ./json.so && cd ..
	cd ejemplos/assembly/ && gcc -o webservice.bin webservice.s ./http.so ./array.so && cd ..
	cd ejemplos/assembly/ && gcc -o autenticacion.bin autenticacion.s ./http.so ./array.so && cd ..
	cd ejemplos/assembly/ && gcc -o validarip.bin validarip.s ./http.so ./array.so && cd ..
	cd ejemplos/assembly/ && gcc -o listar.bin listar.s ./file.so ./array.so && cd ..
	cd ejemplos/assembly/ && gcc -o consultas.bin consultas.s ./db.so ./array.so && cd ..
	cd ejemplos/assembly/ && gcc -o files.bin files.s ./file.so ./array.so && cd ..
	cd ejemplos/assembly/ && gcc -o content.bin content.s ./file.so ./array.so && cd ..
	cd ejemplos/assembly/ && gcc -o peticion.bin peticion.s ./curl.so ./array.so && cd ..
	cd ejemplos/assembly/ && gcc -o accionesFTP.bin accionesFTP.s ./ftp.so ./array.so && cd ..
	
	# Compilar los ejemplos en Golang
	cd ejemplos/Golang/ && go build -o peticion.bin peticion.go && cd ..
	cd ejemplos/Golang/ && go build -o consultas.bin consultas.go && cd ..
	
compile:
	# Con este comando generas el assemblyd de tu codigo C: gcc -S -fPIC -O2 main.c -o main.s
	-@cp -f * sdk/ 2>/dev/null || true
	rm sdk/Makefile
	cd sdk/ && gcc -o ../bin/$(OUT) $(SRC) ./array.so ./json.so ./http.so ./db.so ./file.so ./curl.so ./ftp.so && cd ..

run:
	cd bin && ./$(OUT)
