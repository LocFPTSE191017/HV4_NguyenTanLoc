#include <stdio.h>

int main()
{
    int n;
    int max = 100;
    int a[max];
    for(int i = 0; i < 10; i++){
        printf("nhap phan tu thu %d: ", i+1);
        scanf("%d", &a[i]);
    }

    printf("nhap so luong phan tu muon them: ");
    scanf("%d", &n);

    for(int i = 10; i < 10 + n; i++){
        printf("cap nhat phan tu thu %d: ", i+1);
        scanf("%d", &a[i]);
    }
    for(int i = 0; i < 10 + n; i++){
        printf("%d ", a[i]);
    }
    return 0;
}