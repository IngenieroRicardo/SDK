package main

import (
	"fmt"
	"time"
	db "github.com/IngenieroRicardo/db/go"
)

var (
	conexion, _ = db.LoadSQL("sqlite3", ":memory:", 670, 100, 10*time.Minute, 10*time.Minute)
)

func main() {
	//si quiere parsear un campo string del json puedes hacer algo como esto: (JSON[id,nombre])
	query := "INSERT INTO usuario(nickname, picture) VALUES(JSON[nombre,BLOB(foto)])"

	json := `{ "nombre": "Jorge", "foto": "iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAArSURBVBhXY/iPA0AlGBgwGFAKlwQmAKrAIgcVRZODCsI5cAAVgVDo4P9/AHe4m2U/OJCWAAAAAElFTkSuQmCC" }` //Tambien acepta arreglos
	//json := `[{ "nombre": "yo", "foto": "" },{ "nombre": "ella", "foto": "" }]`

	resultado := db.SQLrunonLoad(conexion, query, json)
	
	if resultado.Is_error == 1 {
		fmt.Printf("Error: %s\n", resultado.Json)
	} else if resultado.Is_empty == 1 {
		fmt.Println("Consulta ejecutada pero no retornó datos")
		fmt.Printf("JSON: %s\n", resultado.Json)
	} else {
		fmt.Printf("Datos obtenidos:\n%s\n", resultado.Json)
	}

	db.CloseSQL(conexion) //se borra la base de datos de memoria
}

func init(){
	db.SQLrunonLoad(conexion, "CREATE TABLE usuario(id INTEGER PRIMARY KEY AUTOINCREMENT, nickname VARCHAR(30) NOT NULL UNIQUE, picture BLOB);")
}