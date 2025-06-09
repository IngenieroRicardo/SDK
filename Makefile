
SRC = main.c
OUT = main.bin

sdk:
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

	mkdir bin
	cp array/array.so bin/array.so
	cp json/json.so bin/json.so
	cp http/http.so bin/http.so
	cp db/db.so bin/db.so
	cp file/file.so bin/file.so

	cp curl/curl.so bin/curl.so

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

	cp array/array.h ejemplos/array.h
	cp array/array.so ejemplos/array.so
	cp json/json.h ejemplos/json.h
	cp json/json.so ejemplos/json.so
	cp http/http.h ejemplos/http.h
	cp http/http.so ejemplos/http.so
	cp db/db.h ejemplos/db.h
	cp db/db.so ejemplos/db.so
	cp file/file.h ejemplos/file.h
	cp file/file.so ejemplos/file.so

	cp curl/curl.h ejemplos/curl.h
	cp curl/curl.so ejemplos/curl.so

	cd ejemplos/ && gcc -o strings.bin strings.c ./array.so && cd ..
	cd ejemplos/ && gcc -o conversiones.bin conversiones.c ./array.so && cd ..
	cd ejemplos/ && gcc -o comparaciones.bin comparaciones.c ./array.so && cd ..
	cd ejemplos/ && gcc -o leerJSON.bin leerJSON.c ./json.so ./array.so && cd ..
	cd ejemplos/ && gcc -o crearJSON.bin crearJSON.c ./json.so && cd ..
	cd ejemplos/ && gcc -o webservice.bin webservice.c ./http.so ./array.so && cd ..
	cd ejemplos/ && gcc -o autenticacion.bin autenticacion.c ./http.so ./array.so && cd ..
	cd ejemplos/ && gcc -o validarip.bin validarip.c ./http.so ./array.so && cd ..
	cd ejemplos/ && gcc -o listar.bin listar.c ./file.so ./array.so && cd ..
	cd ejemplos/ && gcc -o files.bin files.c ./file.so ./array.so && cd ..
	cd ejemplos/ && gcc -o content.bin content.c ./file.so ./array.so && cd ..

	cd ejemplos/ && gcc -o peticion.bin peticion.c ./curl.so ./array.so && cd ..
	
compile:
	-@cp -f * sdk/ 2>/dev/null || true
	rm sdk/Makefile
	cd sdk/ && gcc -o ../bin/$(OUT) $(SRC) ./array.so ./json.so ./http.so ./db.so ./file.so ./curl.so && cd ..

run:
	cd bin && ./$(OUT)
