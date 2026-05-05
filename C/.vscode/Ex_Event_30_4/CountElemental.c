#include <stdio.h>

int main() {
    char c ;
    int CountUpper =0;
    int CountLower = 0;
    int CountDigit = 0;
    printf("nhap chuoi :");
    while((c=getchar())!='\n'){
        if(c >= 'A' && c <= 'Z'){
            CountUpper++;
        } else if( c >= 'a' && c<='z'){
            CountLower++;
        } else{
            CountDigit++;
            putchar(c);
            
        }
    }
    printf("\n");
    printf("So luong chu in hoa %d:\n",CountUpper);
    printf("So luong chu in thuong :%d\n",CountLower);
    printf("So luong chu chu so : %d\n",CountDigit);
    return 0;
}