
#include <stdio.h>
#define MAX_SIZE 100
void findExtremes(int arr[], int *max, int *min){
    for( int i = 0 ; i < 6 ; i++){
        if( arr[i] >= *max){
            *max = arr[i];
        }
        if( arr[i]<= *min){
            *min = arr[i];
        }
    }
}

int main()
{
    int arr[MAX_SIZE] = {4,-2,8,1,9,5};
    int max = 0 ;
    int min = arr[0];
    findExtremes(arr,&max,&min);
    printf("%d,%d",max,min);
    

    return 0;
}