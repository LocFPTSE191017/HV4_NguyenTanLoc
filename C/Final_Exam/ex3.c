#include <stdio.h>
#include <string.h>

int main() {
    char str[256];
    int letterCount = 0;
    int digitCount = 0;

    printf("Nhap chuoi: ");
    fgets(str, sizeof(str), stdin);

    for(int i = 0; str[i] != '\0'; i++) {

        // dem chu cai
        if((str[i] >= 'A' && str[i] <= 'Z') ||
           (str[i] >= 'a' && str[i] <= 'z')) {
            letterCount++;
        }

        // dem chu so
        else if(str[i] >= '0' && str[i] <= '9') {
            digitCount++;
        }
    }

    printf("So luong chu cai: %d\n", letterCount);
    printf("So luong chu so: %d\n", digitCount);

    return 0;
}