package main

import (
	"fmt"
	json "github.com/IngenieroRicardo/json/go"
)

func main() {
	jsonStr := `{"nombre":"Juan", "edad":30, "direccion": {"pais":"Villa Lactea","departamento":"Tierra"}, "documentos": ["B00000001","00000000-1"], "foto":"iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAArSURBVBhXY/iPA0AlGBgwGFAKlwQmAKrAIgcVRZODCsI5cAAVgVDo4P9/AHe4m2U/OJCWAAAAAElFTkSuQmCC"}`

	// Analizar JSON
	resultado := json.ParseJSON(jsonStr)

	if resultado.Is_Valid {
		fmt.Printf("JSON válido: %s\n", resultado.Value)
	} else {
		fmt.Printf("Error: %v\n", resultado.Error)
		return
	}

	// Obtener valores
	nombre := json.GetJSONValue(jsonStr, "nombre")
	pais := json.GetJSONValueByPath(jsonStr, "direccion.pais")
	documento1 := json.GetJSONValueByPath(jsonStr, "documentos.0")

	// Mostrar valores sin comillas (la librería ya maneja esto)
	fmt.Printf("Nombre: %s\n", nombre.Value)
	fmt.Printf("País: %s\n", pais.Value)
	fmt.Printf("Primer Documento: %s\n", documento1.Value)

}