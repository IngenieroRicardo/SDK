package main

import (
    "fmt"
    "time"
    http "github.com/IngenieroRicardo/http/go"
)

func token_handler(req http.HttpRequest) http.HttpResponse {
    token := req.GetBearerToken()

    token_status := http.ValidateToken(token)
    if (token_status == 1) {
        return http.CreateResponse(200, "{\"message\":\"Valid token\"}")
    } else {
        return http.CreateResponse(403, "{\"error\":\"Invalid token\"}")
    }
}

func login_handler(req http.HttpRequest) http.HttpResponse {
    username := req.GetUsername()
    password := req.GetPassword()

    // Verificación de credenciales (simplificada)
    if username == "admin" && password == "secret" {
        // Generar nuevo token
        token := http.GenerateToken()
        
        // Crear el JSON de respuesta manualmente
        response_body := fmt.Sprintf("{\"token\":\"%s\"}", token)
        
        res := http.CreateResponse(200, response_body)
        
        return res
    }
        
    return http.CreateResponse(200, `{"error":"Invalid credentials"}`)
}

func main() {
    // Configurar duración del token (1 hora)
    http.SetDefaultTokenExpiry(3600)
    
    http.RegisterHandler("/api/login", login_handler)
    http.RegisterHandler("/api/protected", token_handler)
    
    http.StartServer("8080", 0, "", "")
    
    for {
        time.Sleep(1 * time.Second)
    }
}
