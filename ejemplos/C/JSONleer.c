#include <stdio.h>
#include "json.h"
#include "array.h"

// Compilar en Windows: gcc -o JSONleer.exe JSONleer.c ./json.dll ./array.dll
// Compilar en tipo UNIX: gcc -o JSONleer.bin JSONleer.c ./json.so ./array.so

int main() {
    String json = "{\"nombre\":\"Juan\", \"edad\":30, \"direccion\": {\"pais\":\"Villa Lactea\",\"departamento\":\"Tierra\"}, \"documentos\": [\"B00000001\",\"00000000-1\"], \"foto\":\"iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAIAAABLbSncAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAArSURBVBhXY/iPA0AlGBgwGFAKlwQmAKrAIgcVRZODCsI5cAAVgVDo4P9/AHe4m2U/OJCWAAAAAElFTkSuQmCC\" }";
    
    // Analizar JSON
    JsonResult resultado = ParseJSON(json);
    
    if (resultado.is_valid) {
        printf("JSON válido: %s\n", resultado.value);
    } else {
        printf("Error: %s\n", resultado.error);
        FreeJsonResult(resultado);
        return 1;
    }
    
    // Obtener valores
    JsonResult nombre = GetJSONValue(json, "nombre");
    JsonResult pais = GetJSONValueByPath(json, "direccion.pais");
    JsonResult documento1 = GetJSONValueByPath(json, "documentos.0");
    
    // Mostrar valores sin comillas
    printf("Nombre: %s\n", nombre.value);
    printf("País: %s\n", pais.value);
    printf("Primer Documento: %s\n", documento1.value);
    
    // Liberar memoria
    FreeJsonResult(resultado);
    FreeJsonResult(nombre);
    FreeJsonResult(pais);
    FreeJsonResult(documento1);
    
    return 0;
}
