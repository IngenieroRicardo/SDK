#include <stdio.h>
#include "array.h"

// Compilar en Windows: gcc -o ARRAYstrings.exe ARRAYstrings.c ./array.dll 
// Compilar en tipo UNIX: gcc -o ARRAYstrings.bin ARRAYstrings.c ./array.so

int main() {
    // Crear y llenar array
    StringArray arr = NewStringArray(3);
    arr[0] = Concat("Primero", NULL);
    arr[1] = Concat("Segundo", NULL);
    arr[2] = Concat("Tercero", NULL);
    
    // Procesar array
    printf("Array size: %d\n", GetStringArraySize(arr));
    String joined = ConcatAll(arr);
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
