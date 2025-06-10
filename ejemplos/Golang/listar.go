package main

import (
	"fmt"
	file "github.com/IngenieroRicardo/file/go"
)

func main() {
	dirPath := "." // Directorio actual

	// Obtener lista de archivos
	files := file.ListFiles(dirPath)

	if files != nil {
		fmt.Printf("Archivos en el directorio '%s':\n", dirPath)

		// Iterar sobre los archivos
		for _, file := range files {
			fmt.Printf("- %s\n", file)
		}
	} else {
		fmt.Println("Error al leer el directorio o directorio vacío")
	}
}