#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include "http.h"
#include "array.h"

// Compilar en Windows: gcc -o APIRest.exe APIRest.c ./http.dll ./array.dll 
// Compilar en tipo UNIX: gcc -o APIRest.bin APIRest.c ./http.so ./array.so 

Response token_handler(Request req) {
    String token = GetBearerToken(req);
    
    int token_status = ValidateToken(token);
    if (token_status == 1) {
        return CreateResponse(200, "{\"message\":\"Valid token\"}");
    } else {
        return CreateResponse(403, "{\"error\":\"Invalid token\"}");
    }
    
}

Response login_handler(Request req) {
    String username = GetUsername(req);
    String password = GetPassword(req);
    
    // Verificación de credenciales (simplificada)
    if (Equals(username, "admin") && Equals(password, "secret")) {
        // Generar nuevo token
        String token = GenerateToken();
        
        // Crear el JSON de respuesta manualmente
        String response_body = NewString(GetStringSize(token) + 20); // Espacio suficiente
        sprintf(response_body, "{\"token\":\"%s\"}", token);
        
        Response res = CreateResponse(200, response_body);
        
        // Liberar memoria
        free(response_body);
        free(token);
        return res;
    }
    
    return CreateResponse(401, "{\"error\":\"Invalid credentials\"}");
}

int main() {
    // Configurar duración del token (1 hora)
    SetDefaultTokenExpiry(3600);
    
    RegisterHandler("/api/login", login_handler);
    RegisterHandler("/api/protected", token_handler);
    
    StartServer("8080", 0, NULL, NULL);
    
    while(1) {
        sleep(1);
    }
    
    return 0;
}
