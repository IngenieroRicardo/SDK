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
	query := "SELECT '{\"status\": \"OK\"}' AS JSON" // Construcción de JSON desde Query
	//query := "SELECT datetime('now') AS NOW" // Construcción de JSON desde Result

	/*
	query := "SELECT * FROM usuario"
	db.SQLrunonLoad(conexion, "CREATE TABLE usuario(id INTEGER PRIMARY KEY AUTOINCREMENT, nickname VARCHAR(30) NOT NULL UNIQUE, picture BLOB);")
	argumento1 := "Ricardo"
	argumento2 := "blob::iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAArSURBVBhXY/iPA0AlGBgwGFAKlwQmAKrAIgcVRZODCsI5cAAVgVDo4P9/AHe4m2U/OJCWAAAAAElFTkSuQmCC"
	db.SQLrunonLoad(conexion, "INSERT INTO usuario(nickname, picture) VALUES (?, ?);", argumento1, argumento2)
	*/

	resultado := db.SQLrunonLoad(conexion, query)
	if resultado.Is_error == 1 {
		fmt.Printf("Error: %s\n", resultado.Json)
	} else if resultado.Is_empty == 1 {
		fmt.Println("Consulta ejecutada pero no retorno datos")
		fmt.Printf("JSON: %s\n", resultado.Json)
	} else {
		fmt.Printf("Datos obtenidos:\n%s\n", resultado.Json)
	}

	db.CloseSQL(conexion) //se borra la base de datos de memoria
	
}
