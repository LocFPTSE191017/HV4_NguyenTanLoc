#include <stdio.h>
int main() {
    int n ;
    printf("Nhap N:\n");
    scanf("%d",&n);
    printf("Bang cuu chuong %d:\n",n);
    for (int i = 1; i <= 10; i++) {
        int result = n * i;
        printf("%d x %d = %d  \n",n,i,result);
    }
}
