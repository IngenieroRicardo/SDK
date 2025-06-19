#include <stdio.h>
#include "db.h"
#include "array.h"

// Compilar en Windows: gcc -o DBconsultas.exe DBconsultas.c ./db.dll ./array.dll 
// Compilar en tipo UNIX: gcc -o DBconsultas.bin DBconsultas.c ./db.so ./array.so

int main() {
    String diver = Concat("sqlite3", NULL);
    String conexion = Concat("./sqlite3.db", NULL);
    String query = Concat("SELECT '{\"status\": \"OK\"}' AS JSON", NULL); //Construcción de JSON desde Query
    //String query = Concat("SELECT datetime('now') AS NOW;", NULL); //Construcción de JSON desde Result

    /*
    String diver = Concat("postgres", NULL);
    String conexion = Concat("user=postgres dbname=template1 password=123456 host=localhost sslmode=disable", NULL);

    String diver = Concat("mysql", NULL);
    String conexion = Concat("root:123456@tcp(127.0.0.1:3306)/test", NULL);

    String diver = Concat("sqlserver", NULL);
    String conexion = Concat("server=localhost;user id=SA;password=Prueba123456;database=master", NULL);
    
    String diver = Concat("oracle", NULL);
    String conexion = Concat("user="system" password="Prueba123456" connectString="localhost:1521/XE", NULL);
    */

    
    // Preparar los argumentos para el INSERT
    /*
    String argumento1 = Concat("Ricardo", NULL);
    String argumento2 = Concat("blob::iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAArSURBVBhXY/iPA0AlGBgwGFAKlwQmAKrAIgcVRZODCsI5cAAVgVDo4P9/AHe4m2U/OJCWAAAAAElFTkSuQmCC", NULL);
    SQLResult resultado = SQLrun(diver, conexion, "INSERT INTO chat.usuario(nickname, picture) VALUES (?, ?);", argumento1, argumento2, NULL);*/
    
    
    SQLResult resultado = SQLrun(diver, conexion, query, NULL);
    
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
