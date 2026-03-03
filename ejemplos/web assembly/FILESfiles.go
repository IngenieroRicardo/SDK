package main

import (
	"fmt"
	file "github.com/IngenieroRicardo/file/go"
)

func main() {
	// EN WASM NO PUEDES ALTERAR O ESCRIBIR ARCHIVOS
	// 1. Ejemplo de escritura binaria desde base64
	//base64Data := "SGVsbG8gV29ybGQh" // "Hello World!" en base64
	binaryPath := "/home/js/image.jpeg"

	/*if file.WBFile(base64Data, binaryPath) == nil {
		fmt.Printf("Archivo binario creado: %s\n", binaryPath)
	}*/

	// 2. Ejemplo de escritura de texto
	//textData := "Este es un texto de ejemplo\nSegunda línea"
	textPath := "/home/py/file.txt"

	/*if file.WTFile(textData, textPath) == nil {
		fmt.Printf("Archivo de texto creado: %s\n", textPath)
	}*/

	// 3. Ejemplo de lectura binaria (a base64)
	base64Result := file.RBFile(binaryPath)
	if base64Result != "" {
		fmt.Printf("Base64 del archivo binario: %s\n", base64Result)
	}

	// 4. Ejemplo de lectura de texto
	textResult := file.RTFile(textPath)
	if textResult != "" {
		fmt.Printf("Contenido del archivo de texto:\n%s\n", textResult)
	}

	//EN EL MISMO DOMINIO QUE EJECUTES WASM DEBES TENER ALOJADO LOS ARCHIVOS
}