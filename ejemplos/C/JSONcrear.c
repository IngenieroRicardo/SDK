#include <stdio.h>
#include "json.h"

// Compilar en Windows: gcc -o JSONcrear.exe JSONcrear.c ./json.dll
// Compilar en tipo UNIX: gcc -o JSONcrear.bin JSONcrear.c ./json.so

int main() {
    // 1. Crear un objeto JSON vacío
	JsonResult json_vacio = CreateEmptyJSON();
	printf("JSON vacío: %s\n", json_vacio.value);
	FreeJsonResult(json_vacio);

	// 2. Crear un objeto JSON con datos básicos de persona
	JsonResult persona = CreateEmptyJSON();
	JsonResult temp = AddStringToJSON(persona.value, "nombre", "Juan Pérez");
	FreeJsonResult(persona);  // Liberar el anterior
	persona = temp;

	temp = AddNumberToJSON(persona.value, "edad", 30);
	FreeJsonResult(persona);
	persona = temp;

	temp = AddBooleanToJSON(persona.value, "es_estudiante", 0);
	FreeJsonResult(persona);
	persona = temp;

	printf("\nPersona básica:\n%s\n", persona.value);

	// 3. Crear una dirección como JSON y añadirla a la persona
	JsonResult direccion = CreateEmptyJSON();
	temp = AddStringToJSON(direccion.value, "calle", "Calle Principal 123");
	FreeJsonResult(direccion);
	direccion = temp;

	temp = AddStringToJSON(direccion.value, "ciudad", "Ciudad Ejemplo");
	FreeJsonResult(direccion);
	direccion = temp;

	temp = AddStringToJSON(direccion.value, "pais", "España");
	FreeJsonResult(direccion);
	direccion = temp;

	temp = AddJSONToJSON(persona.value, "direccion", direccion.value);
	FreeJsonResult(direccion);
	FreeJsonResult(persona);
	persona = temp;

	// 4. Crear un array de pasatiempos y añadirlo
	JsonResult pasatiempos = CreateEmptyArray();
	temp = AddItemToArray(pasatiempos.value, "\"fútbol\"");
	FreeJsonResult(pasatiempos);
	pasatiempos = temp;

	temp = AddItemToArray(pasatiempos.value, "\"lectura\"");
	FreeJsonResult(pasatiempos);
	pasatiempos = temp;

	temp = AddItemToArray(pasatiempos.value, "\"programación\"");
	FreeJsonResult(pasatiempos);
	pasatiempos = temp;

	temp = AddJSONToJSON(persona.value, "pasatiempos", pasatiempos.value);
	FreeJsonResult(pasatiempos);
	FreeJsonResult(persona);
	persona = temp;

	// 5. Modificar el JSON existente
	temp = AddNumberToJSON(persona.value, "edad", 31);
	FreeJsonResult(persona);
	persona = temp;

	temp = AddStringToJSON(persona.value, "correo", "juan@ejemplo.com");
	FreeJsonResult(persona);
	persona = temp;

	printf("\nPersona actualizada:\n%s\n", persona.value);

	// 6. Eliminar una propiedad
	temp = RemoveKeyFromJSON(persona.value, "es_estudiante");
	FreeJsonResult(persona);
	persona = temp;
	printf("\nPersona sin 'es_estudiante':\n%s\n", persona.value);

	// 7. Crear otro JSON con información laboral
	JsonResult info_laboral = CreateEmptyJSON();
	temp = AddStringToJSON(info_laboral.value, "empresa", "Soluciones Tecnológicas");
	FreeJsonResult(info_laboral);
	info_laboral = temp;

	temp = AddStringToJSON(info_laboral.value, "puesto", "Desarrollador");
	FreeJsonResult(info_laboral);
	info_laboral = temp;

	// Combinar con el JSON de persona
	temp = MergeJSON(persona.value, info_laboral.value);
	FreeJsonResult(persona);
	FreeJsonResult(info_laboral);
	persona = temp;
	printf("\nPersona con información laboral:\n%s\n", persona.value);

	// 8. Verificar si el JSON es válido
	int es_valido = IsValidJSON(persona.value);
	printf("\n¿JSON válido? %s\n", es_valido ? "Sí" : "No");

	// Liberar memoria al final del ciclo
	FreeJsonResult(persona);

	return 0;
}
