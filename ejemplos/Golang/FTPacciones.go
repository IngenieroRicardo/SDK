package main

import (
    "fmt"
    ftp "github.com/IngenieroRicardo/ftp/go"
)

func main() {
    // 1. Ejemplo de escritura binaria desde base64
    base64Data := "SGVsbG8gV29ybGQh" // "Hello World!" en base64
    binaryPath := "ftp://usuario:password@127.0.0.1:21/ruta/salida.bin"

    if ftp.PutFTPFile(base64Data, binaryPath) == nil {
        fmt.Printf("Archivo binario creado: %s\n", binaryPath)
    } else {
        fmt.Printf("Error al crear archivo binario %s\n", binaryPath);
    }

    // 2. Ejemplo de escritura de texto
    textData := "Este es un texto de ejemplo\nSegunda línea"
    textPath := "ftp://usuario:password@127.0.0.1:21/ruta/salida.txt"

    if ftp.PutFTPText(textData, textPath) == nil {
        fmt.Printf("Archivo de texto creado: %s\n", textPath)
    } else {
        fmt.Printf("Error al crear archivo de texto %s\n", textPath);
    }

    // 3. Ejemplo de lectura binaria (a base64)
    base64Result := ftp.GetFTPFile(binaryPath)
    if base64Result != "" {
        fmt.Printf("Base64 del archivo binario: %s\n", base64Result)
    }

    // 4. Ejemplo de lectura de texto
    textResult := ftp.GetFTPText(textPath)
    if textResult != "" {
        fmt.Printf("Contenido del archivo de texto:\n%s\n", textResult)
        // En Go no necesitamos liberar memoria manualmente
    }
    
}
