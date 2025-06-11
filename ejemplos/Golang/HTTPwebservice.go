package main

import (
    "fmt"
    "time"
    http "github.com/IngenieroRicardo/http/go"
)

func basic_handler(req http.HttpRequest) http.HttpResponse {
    method := req.GetMethod()
    path := req.GetPath()
    userAgent := req.GetHeaderValue("User-Agent")
    body := req.GetBody()

    fmt.Printf("\nreceived: %s %s %s\n %s\n", method, path, userAgent, body)
    
    // Crear una respuesta simple
    return http.CreateResponse(200, `{"message":"Hola Mundo Go handler!"}`)
}

func main() {
    // Registrar un manejador para la ruta "/hola"
    http.RegisterHandler("/hola", basic_handler)
    http.RegisterHandler("/", basic_handler)
    
    // Iniciar el servidor en el puerto 8080 sin filtro de IP
    http.StartServer("8123", 0, "", "")
    // Iniciar servidor HTTPS con certificados
    //http.StartServer("443", 0, "./server.crt", "./server.key")

    // Mantener el programa en ejecución
    for {
        time.Sleep(1 * time.Second)
    }
}
