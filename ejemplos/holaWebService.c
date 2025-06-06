#include <stdio.h>
#include <unistd.h>
#include "http.h"
#include "array.h"

// Compilar en Windows: gcc -o holaWebService.exe holaWebService.c ./http.dll ./array.dll 
// Compilar en tipo UNIX: gcc -o holaWebService.bin holaWebService.c ./http.so ./array.so 

Response basic_handler(Request req) {
    String method = GetMethod(req);
    String path = GetPath(req);
    String user_agent = GetHeaderValue(req, "User-Agent");
    String body = GetBody(req);

    printf("\nreceived: %s %s %s\n %s\n", method, path, user_agent, body);
    
    // Crear una respuesta simple
    return CreateResponse(200, "{\"message\":\"Hola Mundo C handler!\"}");
}

int main() {
    // Registrar un manejador para la ruta "/hola"
    RegisterHandler("/hola", basic_handler);
    RegisterHandler("/", basic_handler);
    
    // Iniciar el servidor en el puerto 8080 sin filtro de IP
    StartServer("8080", 0, NULL, NULL);
    // Iniciar servidor HTTPS con certificados
    //StartServer("443", 0, "./server.crt", "./server.key");
    
    // Mantener el programa en ejecución
    while(1) {
        sleep(1);
    }
    
    return 0;
}
