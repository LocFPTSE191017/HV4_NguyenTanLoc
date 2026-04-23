#include <stdio.h>

int main(void) {
    int n ;
    printf("Enter ur number:\n");
    scanf("%d",&n);
    if ( n == 0) {
        printf("Not Even and Odd\n");
    } else {
        n % 2 == 0 ? printf("Odd number\n") : printf("Even number\n");
    }



    return 0;
}
