package main

import (
	"fmt"
	curl "github.com/IngenieroRicardo/curl/go"
)

func main() {
	var header string

	header = curl.Header("Accept", "application/json") + "\n" +
		curl.Header("Content-Type", "application/json") + "\n" +
		curl.HeaderAuthBasic("admin", "123456") + "\n"
	
	body := "{\"title\": \"foo\",\"body\": \"bar\",\"userId\": 1}"

	// Hacer petición Post
	resp := curl.Post("https://jsonplaceholder.typicode.com/posts", header, body)
    
	if resp != "" {
		fmt.Printf("Response:\n%s\n", resp)
	}
}
