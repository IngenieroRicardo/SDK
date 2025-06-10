#include <stdio.h>
#include <stdlib.h>
#include "file.h"
#include "array.h"

// Compilar en Windows: gcc -o content.exe content.c ./file.dll ./array.dll 
// Compilar en tipo UNIX: gcc -o content.bin content.c ./file.so ./array.so 

int main() {
    // Ejemplo con GetContentTypeFromBase64
    String imageBase64 = Concat("iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z/C/HgAGgwJ/lK3Q6wAAAABJRU5ErkJggg==", NULL); // PNG 1x1
    String contentType = GetContentTypeFile(imageBase64);
    
    printf("Content-Type: %s\n", contentType);
    FreeString(contentType);
    
    // Ejemplo con JSON
    String jsonBase64 = Concat("ewogICJuYW1lIjogIkpvaG4gRG9lIiwKICAiYWdlIjogMzAKfQ==", NULL); // {"name": "John Doe", "age": 30}
    contentType = GetContentTypeFile(jsonBase64);
    
    printf("Content-Type: %s\n", contentType);
    FreeString(contentType);
    
    return 0;
}