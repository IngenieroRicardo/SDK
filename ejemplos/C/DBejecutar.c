#include <stdio.h>
#include "db.h"
#include "array.h"

// Compilar en Windows: gcc -o DBejecutar.exe DBejecutar.c ./db.dll ./array.dll 
// Compilar en tipo UNIX: gcc -o DBejecutar.bin DBejecutar.c ./db.so ./array.so

int main() {
    String diver = Concat("sqlite3", NULL);
    String conexion = Concat("./sqlite3.db", NULL);
    //si quiere parsear un campo string del json puedes hacer algo como esto: (JSON[id,BLOB(foto))])
    String query = Concat("INSERT INTO MediaType(MediaTypeId, Name) VALUES(JSON[id,tipo])", NULL);

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
   
    String json = Concat("{ \"id\": 6, \"tipo\": \"midi\" }", NULL); //Tambien acepta arreglos
    //String json = Concat("[{ \"id\": 7, \"tipo\": \"MP4\" },{ \"id\": 8, \"tipo\": \"vinilo\" }]", NULL);

    SQLResult resultado = SQLrun(diver, conexion, query, json, 0);
    
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
