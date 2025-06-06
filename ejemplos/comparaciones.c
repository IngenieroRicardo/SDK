#include <stdio.h>
#include "array.h"

// Compilar en Windows: gcc -o comparaciones.exe comparaciones.c ./array.dll 
// Compilar en tipo UNIX: gcc -o comparaciones.bin comparaciones.c ./array.so 

int main() {
    // Comparaciones
    printf("Equals: %d\n", Equals("hola", "hola"));
    printf("Contains: %d\n", Contains("hola mundo", "mun"));
    
    // Reemplazo
    char* replaced = ReplaceAll("comida bar comida", "comida", "bebida");
    printf("Replaced: %s\n", replaced);
    
    // Validación
    printf("IsNumeric: %d\n", IsNumeric("123.45"));
    printf("IsNumeric: %d\n", IsNumeric("abc"));
    
    // Substrings
    char* sub = Substring("Hola mundo", 6, 10);
    printf("Substring: %s\n", sub);
    
    // Liberar memoria
    FreeString(replaced);
    FreeString(sub);

    return 0;
}
