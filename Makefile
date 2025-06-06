
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
	mkdir bin
	cp array/array.so bin/array.so
	cp json/json.so bin/json.so
	cp http/http.so bin/http.so
	cp db/db.so bin/db.so
	mkdir sdk
	cp array/array.h sdk/array.h
	cp array/array.so sdk/array.so
	cp json/json.h sdk/json.h
	cp json/json.so sdk/json.so
	cp http/http.h sdk/http.h
	cp http/http.so sdk/http.so
	cp db/db.h sdk/db.h
	cp db/db.so sdk/db.so
	cp array/array.h ejemplos/array.h
	cp array/array.so ejemplos/array.so
	cp json/json.h ejemplos/json.h
	cp json/json.so ejemplos/json.so
	cp http/http.h ejemplos/http.h
	cp http/http.so ejemplos/http.so
	cp db/db.h ejemplos/db.h
	cp db/db.so ejemplos/db.so
	cd ejemplos/ && gcc -o main.bin main.c ./array.so ./json.so ./http.so ./db.so && cd ..
	
compile:
	-@cp -f * sdk/ 2>/dev/null || true
	rm sdk/Makefile
	cd sdk/ && gcc -o ../bin/$(OUT) $(SRC) ./array.so ./json.so ./http.so ./db.so && cd ..

run:
	cd bin && ./$(OUT)
