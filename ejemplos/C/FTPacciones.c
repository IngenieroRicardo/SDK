#include <stdio.h>
#include <stdlib.h>
#include "ftp.h"
#include "array.h"

// Compilar en Windows: gcc -o FTPacciones.exe FTPacciones.c ./ftp.dll ./array.dll 
// Compilar en tipo UNIX: gcc -o FTPacciones.bin FTPacciones.c ./ftp.so ./array.so 

int main() {
    // 1. Ejemplo de escritura binaria desde base64
    String base64Data = Concat("SGVsbG8gV29ybGQh", NULL); // "Hello World!" en base64
    String binaryPath = Concat("ftp://user:password@127.0.0.1:21/ruta/salida.bin", NULL);
    //String binaryPath = Concat("sftp://user:password@127.0.0.1:22/ruta/salida.bin", NULL);

    if (PutFTPFile(base64Data, binaryPath) == 0) {
        printf("Archivo binario creado: %s\n", binaryPath);
    } else {
    	printf("Error al crear archivo binario %s\n", binaryPath);
    }

    // 2. Ejemplo de escritura de texto
    String textData = Concat("Este es un texto de ejemplo\nSegunda línea", NULL);
    String textPath = Concat("ftp://user:password@127.0.0.1:21/ruta/salida.txt", NULL);
    //String textPath = Concat("sftp://user:password@127.0.0.1:22/ruta/salida.txt", NULL);

    if (PutFTPText(textData, textPath) == 0) {
        printf("Archivo de texto creado: %s\n", textPath);
    } else {
    	printf("Error al crear archivo de texto %s\n", textPath);
    }

    // 3. Ejemplo de lectura binaria (a base64)
    String base64Result = GetFTPFile(binaryPath);
    if (base64Result != NULL) {
        printf("Base64 del archivo binario: %s\n", base64Result);
        FreeString(base64Result);
    }

    // 4. Ejemplo de lectura de texto
    String textResult = GetFTPText(textPath);
    if (textResult != NULL) {
        printf("Contenido del archivo de texto:\n%s\n", textResult);
        FreeString(textResult);
    }

    // Limpiar memoria
    FreeString(base64Data);
    FreeString(binaryPath);
    FreeString(textData);
    FreeString(textPath);

    return 0;
}
