#include <stdio.h>
#include <unistd.h>
#include "http.h"

// Compilar en Windows: gcc -o HTTPautenticacion.exe HTTPautenticacion.c ./http.dll
// Compilar en tipo UNIX: gcc -o HTTPautenticacion.bin HTTPautenticacion.c ./http.so

Response token_handler(Request req) {
    if (strcmp(GetBearerToken(req), "123") == 0) {
        return CreateResponse(200, "{\"message\":\"Valid token\"}");
    } else {
        return CreateResponse(403, "{\"error\":\"Invalid token\"}");
    }
}

Response login_handler(Request req) {
    if (strcmp(GetUsername(req), "admin") == 0 && strcmp(GetPassword(req), "secret") == 0) {
        return CreateResponse(200, "{\"token\":\"123\"}");
    } else {
        return CreateResponse(401, "{\"error\":\"Invalid credentials\"}");
    }
}

int main() {
    RegisterHandler("/api/login", login_handler);
    RegisterHandler("/api/protected", token_handler);
    StartServer("8080", 0, NULL, NULL);
    
    while(1) {
        sleep(1);
    }
    
    return 0;
}
