/******************************************************************************

                            Online C Compiler.
                Code, Compile, Run and Debug C program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

#include <stdio.h>
#define MAX_SIZE 100
int main()
{
    int a[MAX_SIZE];
    int n ;
    float average=0;
    printf("nhap so luong phan tu : ");
    scanf("%d",&n);
    for( int i = 0 ; i <n ; i++){
        printf("nhap phan tu thu %d:",i+1);
        scanf("%d",&a[i]);
    }
    printf("cac so chan trong mang :\n");
    for( int i = 0 ; i <n ; i++){
        if(a[i]%2==0){
            printf("%d\n",a[i]);
        }
    }
    printf("\n");
    for( int i = 0 ; i <n ; i++){
        if(a[i]>0){
            average += a[i];
        } else {
            printf(" ko co so duong nao trong mang");
        }
    }
    printf("trung binh cong la : %.2f",average);
    
    return 0;
}