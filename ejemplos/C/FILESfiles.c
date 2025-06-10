#include <stdio.h>
#include <stdlib.h>
#include "file.h"
#include "array.h"

// Compilar en Windows: gcc -o files.exe files.c ./file.dll ./array.dll 
// Compilar en tipo UNIX: gcc -o files.bin files.c ./file.so ./array.so 

int main() {
    // 1. Ejemplo de escritura binaria desde base64
    String base64Data = Concat("SGVsbG8gV29ybGQh", NULL); // "Hello World!" en base64
    String binaryPath = Concat("./salida.bin", NULL);

    if (WBFile(base64Data, binaryPath) == 0) {
        printf("Archivo binario creado: %s\n", binaryPath);
    }

    // 2. Ejemplo de escritura de texto
    String textData = Concat("Este es un texto de ejemplo\nSegunda línea", NULL);
    String textPath = Concat("./salida.txt", NULL);

    if (WTFile(textData, textPath) == 0) {
        printf("Archivo de texto creado: %s\n", textPath);
    }

    // 3. Ejemplo de lectura binaria (a base64)
    String base64Result = RBFile(binaryPath);
    if (base64Result != NULL) {
        printf("Base64 del archivo binario: %s\n", base64Result);
        FreeString(base64Result);
    }

    // 4. Ejemplo de lectura de texto
    String textResult = RTFile(textPath);
    if (textResult != NULL) {
        printf("Contenido del archivo de texto:\n%s\n", textResult);
        FreeString(textResult);
    }

    return 0;
}