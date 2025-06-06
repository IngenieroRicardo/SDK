#include <stdio.h>
#include "array.h"

// Compilar en Windows: gcc -o strings.exe strings.c ./array.dll 
// Compilar en tipo UNIX: gcc -o strings.bin strings.c ./array.so

int main() {
    // Crear y llenar array
    StringArray arr = NewStringArray(3);
    arr[0] = strdup("Primero");
    arr[1] = strdup("Segundo");
    arr[2] = strdup("Tercero");
    
    // Procesar array
    printf("Array size: %d\n", GetStringArraySize(arr));
    char* joined = ConcatAll(arr);
    printf("Joined: %s\n", joined);
    
    // Split de strings
    StringArray parts = Split("uno,dos,tres", ",");
    for (int i = 0; parts[i] != NULL; i++) {
        printf("Part %d: %s\n", i, parts[i]);
    }
    
    // Liberar memoria
    FreeString(joined);
    FreeStringArray(arr);
    FreeStringArray(parts);

    return 0;
}
