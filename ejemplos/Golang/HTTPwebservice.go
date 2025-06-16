package main

import (
    "fmt"
    "time"
    http "github.com/IngenieroRicardo/http/go"
)

func basic_handler(req http.HttpRequest) http.HttpResponse {
    username := req.GetUsername();
    password := req.GetPassword();
    token := req.GetBearerToken();
    path := req.GetPath()
    method := req.GetMethod()
    ip := req.GetClientIP()
    user_agent := req.GetHeaderValue("User-Agent")
    body := req.GetBody()

    fmt.Println("------------ HEADER ------------");
    fmt.Printf("User: %s\n", username);
    fmt.Printf("Password: %s\n", password);
    fmt.Printf("Token: %s\n", token);
    fmt.Printf("Path: %s\n", path);
    fmt.Printf("Método: %s\n", method);
    fmt.Printf("IP Cliente: %s\n", ip);
    fmt.Printf("User Agent: %s\n", user_agent);
    fmt.Println("------------ BODY -------------");
    fmt.Printf("%s\n", body);
    
    // Crear una respuesta simple
    return http.CreateResponse(200, `{"message":"Hola Mundo Go handler!"}`)
}

func main() {
    // Registrar un manejador para la ruta "/hola"
    http.RegisterHandler("/hola", basic_handler)
    http.RegisterHandler("/", basic_handler)
    
    // Iniciar el servidor en el puerto 8080 sin filtro de IP
    http.StartServer("8080", 0, "", "")
    // Iniciar servidor HTTPS con certificados
    //http.StartServer("443", 0, "./server.crt", "./server.key")

    // Mantener el programa en ejecución
    for {
        time.Sleep(1 * time.Second)
    }
}
