package main

import (
	"fmt"
	db "github.com/IngenieroRicardo/db/go"
)

func main() {
	driver := "sqlite3"
	conexion := "./sqlite3.db"
	query := "SELECT '{\"status\": \"OK\"}' AS JSON" // Construcción de JSON desde Query
	// query := "SELECT datetime('now') AS NOW" // Construcción de JSON desde Result

	/*
	driver := "postgres"
	conexion := "user=postgres dbname=template1 password=123456 host=localhost sslmode=disable"

	driver := "mysql"
	conexion := "root:123456@tcp(127.0.0.1:3306)/test"

	driver := "sqlserver"
	conexion := "server=localhost;user id=SA;password=Prueba123456;database=master"
	
	driver := "oracle"
	conexion := `user="system" password="Prueba123456" connectString="localhost:1521/XE"`
	*/


	// Preparar los argumentos para el INSERT
	/*
	argumento1 := "Ricardo"
	argumento2 := "blob::iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAArSURBVBhXY/iPA0AlGBgwGFAKlwQmAKrAIgcVRZODCsI5cAAVgVDo4P9/AHe4m2U/OJCWAAAAAElFTkSuQmCC"
	resultado := db.SQLrun(driver, conexion, "INSERT INTO chat.usuario(nickname, picture) VALUES (?, ?);", argumento1, argumento2)*/
	

	resultado := db.SQLrun(driver, conexion, query) // No se pasan argumentos adicionales
	
	if resultado.Is_error == 1 {
		fmt.Printf("Error: %s\n", resultado.Json)
	} else if resultado.Is_empty == 1 {
		fmt.Println("Consulta ejecutada pero no retornó datos")
		fmt.Printf("JSON: %s\n", resultado.Json)
	} else {
		fmt.Printf("Datos obtenidos:\n%s\n", resultado.Json)
	}


	// db.LoadSQL(driver="mysql", conexion="root:123456@tcp(127.0.0.1:3306)/test", maxOpenConns=670, maxIdleConns=100, connMaxLifetime=10*time.Minute, connMaxIdleTime=10*time.Minute)
	/*conn, err := db.LoadSQL("mysql", "root:123456@tcp(127.0.0.1:3306)/test", 0, 0, 0, 0)
	if err == nil {
		result1 := db.SQLrunonLoad(conn, "SELECT NOW()")
		result2 := db.SQLrunonLoad(conn, "SELECT nickname, picture FROM chat.usuario WHERE id=?", "int::2808")

		fmt.Printf("JSON: %s\n", result1.Json)
		fmt.Printf("JSON: %s\n", result2.Json)

		//time.Sleep(50 * time.Second)

		db.CloseSQL(conn)
	}*/







	
}
