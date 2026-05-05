#include<stdio.h>
int main(void){
    int h ;
    printf("nhap chieu cao tam giac: ");
    scanf("%d",&h);
    for(int i = 1 ; i<=h; i++){
        for( int j =1 ; j<=h-i ;j++){
            printf(" ");
        }
        for(int k = 1 ; k <=(2*i-1);k++){
            if( k ==1 || k ==h || k ==(2*i-1)){
                 printf("*");
            }else{
                printf(" ");
            }
        }
        printf("\n");
    }
    return 0;
}