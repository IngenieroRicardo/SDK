package main

import (
    "time"
    http "github.com/IngenieroRicardo/http/go"
)

func token_handler(req http.HttpRequest) http.HttpResponse {
    if (req.GetBearerToken() == "123") {
        return http.CreateResponse(200, `{"message":"Valid token"}`)
    } else {
        return http.CreateResponse(403, `{"error":"Invalid token"}`)
    }
}

func login_handler(req http.HttpRequest) http.HttpResponse {
    if  req.GetUsername() == "admin" && req.GetPassword() == "secret" {
        return http.CreateResponse(200, `{"error":"123"}`)
    } else {
    	return http.CreateResponse(401, `{"error":"Invalid credentials"}`)
    }
}

func main() {
    http.RegisterHandler("/api/login", login_handler)
    http.RegisterHandler("/api/protected", token_handler)
    http.StartServer("8080", 0, "", "")
    
    for {
        time.Sleep(1 * time.Second)
    }
}
