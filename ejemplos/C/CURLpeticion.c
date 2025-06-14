#include <stdio.h>
#include "curl.h"
#include "array.h"

// Compilar en Windows: gcc -o CURLpeticion.exe CURLpeticion.c ./curl.dll ./array.dll 
// Compilar en tipo UNIX: gcc -o CURLpeticion.bin CURLpeticion.c ./curl.so ./array.so 

int main() {
    String header = Concat(
                        Header("Accept", "application/json"), "\n",
                        Header("Content-Type", "application/json"), "\n",
                        HeaderAuthBasic("admin", "123456"), "\n",
                        NULL
                    );

    String body = Concat("{\"title\": \"foo\",\"body\": \"bar\",\"userId\": 1}", NULL);

    // Hacer petición Post
    String resp = Post("https://jsonplaceholder.typicode.com/posts", header, body);
    
    if (resp != NULL) {
        printf("Respuesta:\n%s\n", resp);
        FreeString(resp);
    }
    
    // Liberar memoria
    FreeString(header);
    FreeString(body);
    
    return 0;
}
