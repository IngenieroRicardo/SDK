package main

import (
    "fmt"
    "time"
    http "github.com/IngenieroRicardo/http/go"
)

func ip_check_handler(req http.HttpRequest) http.HttpResponse {
    client_ip := req.GetClientIP()
    response_body := fmt.Sprintf("{\"message\":\"%s success\"}", client_ip)

    res := http.CreateResponse(200, response_body)
    
    return res
}

func main() {
    // Cargar listas de IPs
    //http.LoadWhitelist("192.168.1.100,192.168.1.101")
    http.LoadBlacklist("10.0.0.5,10.0.0.6")
    
    // Agregar IPs dinámicamente
    //http.AddToWhitelist("127.0.0.1")
    http.AddToBlacklist("127.0.0.1")
    
    http.RegisterHandler("/", ip_check_handler)
    
    // Iniciar servidor con filtro de IP habilitado
    http.StartServer("8080", 1, "", "")
        
    for {
        time.Sleep(1 * time.Second)
    }
}
