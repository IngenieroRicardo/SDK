#include <stdio.h>
#include "array.h"

// Compilar en Windows: gcc -o conversiones.exe conversiones.c ./array.dll 
// Compilar en tipo UNIX: gcc -o conversiones.bin conversiones.c ./array.so

int main() {
    // Concatenación
    String hello = Concat("Hola", " ", "mundo", "!", NULL);
    printf("Concat: %s\n", hello);
    
    // Conversiones
    int num = Atoi("42");
    double pi = Atof("3.14159");
    String num_str = Itoa(123);
    String pi_str = Ftoa(3.14159, 2);
    
    printf("Atoi: %d\n", num);
    printf("Atof: %f\n", pi);
    printf("Itoa: %s\n", num_str);
    printf("Ftoa: %s\n", pi_str);
    
    // Operaciones
    String upper = ToUpperCase("hola");
    String lower = ToLowerCase("MUNDO");
    String trimmed = Trim("  spaces  ");
    
    printf("Upper: %s\n", upper);
    printf("Lower: %s\n", lower);
    printf("Trim: '%s'\n", trimmed);
    
    // Liberar memoria
    FreeString(hello);
    FreeString(num_str);
    FreeString(pi_str);
    FreeString(upper);
    FreeString(lower);
    FreeString(trimmed);

    return 0;
}
