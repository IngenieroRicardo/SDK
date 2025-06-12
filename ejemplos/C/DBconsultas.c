#include <stdio.h>
#include "db.h"
#include "array.h"

// Compilar en Windows: gcc -o consultas.exe consultas.c ./db.dll ./array.dll 
// Compilar en tipo UNIX: gcc -o consultas.bin consultas.c ./db.so ./array.so

int main() {
    String diver = Concat("sqlite3", NULL);
    String conexion = Concat("./sqlite3.db", NULL);
    String query = Concat("SELECT '{\"status\": \"OK\"}' AS JSON", NULL); //Construcción de JSON desde Query
    //String query = "SELECT datetime('now') AS NOW;"; //Construcción de JSON desde Result

    /*
    String diver = "postgres";
    String conexion = "user=postgres dbname=template1 password=123456 host=localhost sslmode=disable";

    String diver = "mysql";
    String conexion = "root:123456@tcp(127.0.0.1:3306)/test";

    String diver = "sqlserver";
    String conexion = "server=localhost;user id=SA;password=Prueba123456;database=master";
    
    String diver = "oracle";
    String conexion = "user="system" password="Prueba123456" connectString="localhost:1521/XE";
    */

    
    // Preparar los argumentos para el INSERT
    /*
    String argumento1 = Concat("Ricardo", NULL);
    String argumento2 = Concat("blob::iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAArSURBVBhXY/iPA0AlGBgwGFAKlwQmAKrAIgcVRZODCsI5cAAVgVDo4P9/AHe4m2U/OJCWAAAAAElFTkSuQmCC", NULL);
    SQLResult resultado = SQLrun(diver, conexion, "INSERT INTO chat.usuario(nickname, picture) VALUES (?, ?);", argumento1, argumento2, NULL);*/
    
    
    SQLResult resultado = SQLrun(diver, conexion, query, NULL, 0);
    
    if (resultado.is_error) {
        printf("Error: %s\n", resultado.json);
    } else if (resultado.is_empty) {
        printf("Consulta ejecutada pero no retornó datos\n");
        printf("JSON: %s\n", resultado.json);
    } else {
        printf("Datos obtenidos:\n%s\n", resultado.json);
    }
    
    // Liberar memoria
    FreeSQLResult(resultado);
    
    return 0;
}
