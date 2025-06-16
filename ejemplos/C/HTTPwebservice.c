#include <stdio.h>
#include <unistd.h>
#include "http.h"
#include "array.h"

// Compilar en Windows: gcc -o HTTPwebservice.exe HTTPwebservice.c ./http.dll ./array.dll 
// Compilar en tipo UNIX: gcc -o HTTPwebservice.bin HTTPwebservice.c ./http.so ./array.so 

Response basic_handler(Request req) {
    String username = GetUsername(req);
    String password = GetPassword(req);
    String token = GetBearerToken(req);
    String path = GetPath(req);
    String method = GetMethod(req);
    String ip = GetClientIP(req);
    String user_agent = GetHeaderValue(req, "User-Agent");
    String body = GetBody(req);

    printf("------------ HEADER ------------\n");
    printf("User: %s\n", username);
    printf("Password: %s\n", password);
    printf("Token: %s\n", token);
    printf("Path: %s\n", path);
    printf("Método: %s\n", method);
    printf("IP Cliente: %s\n", ip);
    printf("User Agent: %s\n", user_agent);
    printf("------------ BODY -------------\n");
    printf("%s\n", body);

    String respuesta = "{\"mensaje\": \"Hola desde C!\"}";

    //las que se obtienen con GetHeaderValue se deben liberar
    FreeString(user_agent);

    return CreateResponse(200, respuesta);
}

int main() {
    // Registrar el handler en la ruta /hola
    RegisterHandler("/hola", basic_handler);
    RegisterHandler("/", basic_handler);

    // Iniciar el servidor en el puerto 5000 sin TLS y sin filtro de IP
    StartServer("8080", 0, NULL, NULL);
    // Iniciar servidor HTTPS con certificados
    //StartServer("443", 0, "./server.crt", "./server.key");

    // Mantener el programa en ejecución
    printf("Servidor escuchando en http://localhost:5000\n");
    while (1) {
        sleep(1);
    }

    return 0;
}