#include <stdio.h>
#include <stdlib.h>
#include "file.h"
#include "array.h"

// Compilar en Windows: gcc -o FILESlistar.exe FILESlistar.c ./file.dll ./array.dll 
// Compilar en tipo UNIX: gcc -o FILESlistar.bin FILESlistar.c ./file.so ./array.so 

int main() {
    String dirPath = Concat("./", NULL); // Directorio actual

    // Obtener lista de archivos
    StringArray files = ListFiles(dirPath);

    if (files != NULL) {
        printf("Archivos en el directorio '%s':\n", dirPath);

        // Iterar hasta encontrar el terminador NULL
        for (int i = 0; files[i] != NULL; i++) {
            printf("- %s\n", files[i]);
        }

        // Liberar memoria
        FreeListFiles(files);
    } else {
        printf("Error al leer el directorio o directorio vacío\n");
    }

    return 0;
}
