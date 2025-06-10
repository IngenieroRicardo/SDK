package main

import (
	"fmt"
	json "github.com/IngenieroRicardo/json/go"
)

func main() {
	// 1. Crear un objeto JSON vacío
	jsonVacio := json.CreateEmptyJSON()
	fmt.Printf("JSON vacío: %s\n", jsonVacio.Value)

	// 2. Crear un objeto JSON con datos básicos de persona
	persona := json.CreateEmptyJSON()
	persona = json.AddStringToJSON(persona.Value, "nombre", "Juan Pérez")
	persona = json.AddNumberToJSON(persona.Value, "edad", 30)
	persona = json.AddBooleanToJSON(persona.Value, "es_estudiante", false)

	fmt.Printf("\nPersona básica:\n%s\n", persona.Value)

	// 3. Crear una dirección como JSON y añadirla a la persona
	direccion := json.CreateEmptyJSON()
	direccion = json.AddStringToJSON(direccion.Value, "calle", "Calle Principal 123")
	direccion = json.AddStringToJSON(direccion.Value, "ciudad", "Ciudad Ejemplo")
	direccion = json.AddStringToJSON(direccion.Value, "pais", "España")

	persona = json.AddJSONToJSON(persona.Value, "direccion", direccion.Value)

	// 4. Crear un array de pasatiempos y añadirlo
	pasatiempos := json.CreateEmptyArray()
	pasatiempos = json.AddItemToArray(pasatiempos.Value, `"fútbol"`)
	pasatiempos = json.AddItemToArray(pasatiempos.Value, `"lectura"`)
	pasatiempos = json.AddItemToArray(pasatiempos.Value, `"programación"`)

	persona = json.AddJSONToJSON(persona.Value, "pasatiempos", pasatiempos.Value)

	// 5. Modificar el JSON existente
	persona = json.AddNumberToJSON(persona.Value, "edad", 31) // Actualizar edad
	persona = json.AddStringToJSON(persona.Value, "correo", "juan@ejemplo.com")

	fmt.Printf("\nPersona actualizada:\n%s\n", persona.Value)

	// 6. Eliminar una propiedad
	persona = json.RemoveKeyFromJSON(persona.Value, "es_estudiante")
	fmt.Printf("\nPersona sin 'es_estudiante':\n%s\n", persona.Value)

	// 7. Crear otro JSON con información laboral
	infoLaboral := json.CreateEmptyJSON()
	infoLaboral = json.AddStringToJSON(infoLaboral.Value, "empresa", "Soluciones Tecnológicas")
	infoLaboral = json.AddStringToJSON(infoLaboral.Value, "puesto", "Desarrollador")

	// Combinar con el JSON de persona
	persona = json.MergeJSON(persona.Value, infoLaboral.Value)
	fmt.Printf("\nPersona con información laboral:\n%s\n", persona.Value)

	// 8. Verificar si el JSON es válido
	esValido := json.IsValidJSON(persona.Value)
	fmt.Printf("\n¿JSON válido? %s\n", map[bool]string{true: "Sí", false: "No"}[esValido])
}