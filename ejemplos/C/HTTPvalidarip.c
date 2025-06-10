#include <stdio.h>
#include <unistd.h>
#include "http.h"
#include "array.h"

// Compilar en Windows: gcc -o validarip.exe validarip.c ./http.dll ./array.dll 
// Compilar en tipo UNIX: gcc -o validarip.bin validarip.c ./http.so ./array.so 

Response ip_check_handler(Request req) {
    String client_ip = GetClientIP(req);
    String response_body = NewString(100);
    
    sprintf(response_body, "{\"message\":\"%s success\"}", client_ip);
    
    Response res = CreateResponse(200, response_body);
    free(response_body); // Liberar la memoria asignada
    return res;
}

int main() {
    // Cargar listas de IPs
    //LoadWhitelist("192.168.1.100,192.168.1.101");
    LoadBlacklist("10.0.0.5,10.0.0.6");
    
    // Agregar IPs dinámicamente
    //AddToWhitelist("127.0.0.1");
    AddToBlacklist("127.0.0.1");
    
    RegisterHandler("/", ip_check_handler);
    
    // Iniciar servidor con filtro de IP habilitado
    StartServer("8080", 1, NULL, NULL);
    
    while(1) {
        sleep(1);
    }
    
    return 0;
}
