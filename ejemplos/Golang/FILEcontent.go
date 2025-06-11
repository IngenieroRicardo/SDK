package main

import (
	"fmt"
	file "github.com/IngenieroRicardo/file/go"
)

func main() {
	// Ejemplo con GetContentTypeFromBase64
	imageBase64 := "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z/C/HgAGgwJ/lK3Q6wAAAABJRU5ErkJggg==" // PNG 1x1
	contentType := file.GetContentTypeFile(imageBase64)
	
	fmt.Printf("Content-Type: %s\n", contentType)

	// Ejemplo con JSON
	jsonBase64 := "ewogICJuYW1lIjogIkpvaG4gRG9lIiwKICAiYWdlIjogMzAKfQ==" // {"name": "John Doe", "age": 30}
	contentType = file.GetContentTypeFile(jsonBase64)

	fmt.Printf("Content-Type: %s\n", contentType)
}