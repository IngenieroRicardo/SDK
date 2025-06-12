#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "env.h"
#include "array.h"

// Compilar en Windows: gcc -o ENVentorno.exe ENVentorno.c ./array.dll ./env.dll
// Compilar en tipo UNIX: gcc -o ENVentorno.bin ENVentorno.c ./array.so ./env.so

int main() {
    // Cargar el archivo .env
    int loadResult = LoadEnvFile();
    if (loadResult != 0) {
        printf("Error: No se pudo cargar el archivo .env\n");
        return 1;
    }
    
    // Obtener una variable de entorno específica
    String varName = Concat("basededatos", NULL); // Nombre de la variable a leer
    String value = GetEnvVar(varName);
    
    if (value != NULL && GetStringSize(value) > 0) {
        printf("El valor de '%s' es: %s\n", varName, value);
    } else {
        printf("La variable '%s' no está definida\n", varName);
    }
    
    // Liberar memoria asignada por GetEnvVar
    FreeString(value);
    
    return 0;
}
