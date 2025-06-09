#include <stdio.h>
#include "json.h"

// Compilar en Windows: gcc -o crearJSON.exe crearJSON.c ./json.dll
// Compilar en tipo UNIX: gcc -o crearJSON.bin crearJSON.c ./json.so

int main() {
    // 1. Crear un objeto JSON vacío
    JsonResult json_vacio = CreateEmptyJSON();
    printf("JSON vacío: %s\n", json_vacio.value);
    FreeJsonResult(json_vacio);

    // 2. Crear un objeto JSON con datos básicos de persona
    JsonResult persona = CreateEmptyJSON();
    persona = AddStringToJSON(persona.value, "nombre", "Juan Pérez");
    persona = AddNumberToJSON(persona.value, "edad", 30);
    persona = AddBooleanToJSON(persona.value, "es_estudiante", 0); // 0 = falso
    
    printf("\nPersona básica:\n%s\n", persona.value);

    // 3. Crear una dirección como JSON y añadirla a la persona
    JsonResult direccion = CreateEmptyJSON();
    direccion = AddStringToJSON(direccion.value, "calle", "Calle Principal 123");
    direccion = AddStringToJSON(direccion.value, "ciudad", "Ciudad Ejemplo");
    direccion = AddStringToJSON(direccion.value, "pais", "España");
    
    persona = AddJSONToJSON(persona.value, "direccion", direccion.value);
    FreeJsonResult(direccion);

    // 4. Crear un array de pasatiempos y añadirlo
    JsonResult pasatiempos = CreateEmptyArray();
    pasatiempos = AddItemToArray(pasatiempos.value, "\"fútbol\"");
    pasatiempos = AddItemToArray(pasatiempos.value, "\"lectura\"");
    pasatiempos = AddItemToArray(pasatiempos.value, "\"programación\"");
    
    persona = AddJSONToJSON(persona.value, "pasatiempos", pasatiempos.value);
    FreeJsonResult(pasatiempos);

    // 5. Modificar el JSON existente
    persona = AddNumberToJSON(persona.value, "edad", 31); // Actualizar edad
    persona = AddStringToJSON(persona.value, "correo", "juan@ejemplo.com");
    
    printf("\nPersona actualizada:\n%s\n", persona.value);

    // 6. Eliminar una propiedad
    persona = RemoveKeyFromJSON(persona.value, "es_estudiante");
    printf("\nPersona sin 'es_estudiante':\n%s\n", persona.value);

    // 7. Crear otro JSON con información laboral
    JsonResult info_laboral = CreateEmptyJSON();
    info_laboral = AddStringToJSON(info_laboral.value, "empresa", "Soluciones Tecnológicas");
    info_laboral = AddStringToJSON(info_laboral.value, "puesto", "Desarrollador");
    
    // Combinar con el JSON de persona
    persona = MergeJSON(persona.value, info_laboral.value);
    printf("\nPersona con información laboral:\n%s\n", persona.value);
    FreeJsonResult(info_laboral);

    // 8. Verificar si el JSON es válido
    int es_valido = IsValidJSON(persona.value);
    printf("\n¿JSON válido? %s\n", es_valido ? "Sí" : "No");

    // Liberar memoria
    FreeJsonResult(persona);

    return 0;
}
