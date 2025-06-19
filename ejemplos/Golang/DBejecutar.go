package main

import (
	"fmt"
	db "github.com/IngenieroRicardo/db/go"
)

func main() {
	driver := "sqlite3"
	conexion := "./sqlite3.db"
	//si quiere parsear un campo string del json puedes hacer algo como esto: (JSON[id,BLOB(foto))])
	query := "INSERT INTO MediaType(MediaTypeId, Name) VALUES(JSON[id,tipo])"

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

	json := `{ "id": 6, "tipo": "midi" }` //Tambien acepta arreglos
	//json := `[{ "id": 7, "tipo": "MP4" },{ "id": 8, "tipo": "vinilo" }]`

	resultado := db.SQLrun(driver, conexion, query, json)
	
	if resultado.Is_error == 1 {
		fmt.Printf("Error: %s\n", resultado.Json)
	} else if resultado.Is_empty == 1 {
		fmt.Println("Consulta ejecutada pero no retornó datos")
		fmt.Printf("JSON: %s\n", resultado.Json)
	} else {
		fmt.Printf("Datos obtenidos:\n%s\n", resultado.Json)
	}
}
