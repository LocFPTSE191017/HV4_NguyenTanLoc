/******************************************************************************

                            Online C Compiler.
                Code, Compile, Run and Debug C program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

#include <stdio.h>
#include <stdbool.h>
bool isValid(int n){
    return n > 0 && n <= 100;
}
bool isEmpty(int n ){
    return n == 0;
}
//-----------------------------------------------------------------

void enterPoint(int n , float a[]){
        for( int i = 0 ; i<n; i++){
            do{
                printf("nhap diem sinh vien thu %d :",i+1);
                scanf("%f",&a[i]);
                if(a[i] < 0 ){
                    printf("Diem khong hop le!");
                }
            }while(a[i]<0);
    }
}

//-----------------------------------------------------------------

void showPoint(int n , float a[]){
    for(int i = 0 ; i < n ; i++){
        printf("Diem cua sinh vien thu %d:%.2f",i+1,a[i]);
        printf("\n");
    }
}

//-----------------------------------------------------------------

float Average(int n , float a[]){
    float sum = 0 ;
    for(int i = 0 ; i<n ; i++){
        sum += a[i];
    }
    float Average= sum/n;
    printf("Diem trung binh cua ca lop la: %.2f",Average);
    return Average ;
    
}

//-----------------------------------------------------------------

float findHighestPoint(int n , float a[]){
    float max = 0 ;
    for(int i = 0 ; i<n ;i++){
        if(a[i] > max){
            max = a[i];
        }
    }
    
    return max;
}

void numOfHighestP(float max, int n , float a[]){
    int count = 0;
    for(int i = 0; i<n ;i++){
        if(max == a[i]){
            count++;
        }
    }
    printf("So sinh vien dat duoc diem cao nhat la : %d",count);
}

//-----------------------------------------------------------------

void bubbleSort(int n , float a[]){
    for( int i = 0 ; i < n ; i++){
        for ( int k = 0 ; k< n -1 ;k++){
            float temp  = a[k];
            if( a[k] > a[k+1]){
                a[k] = a[k+1];
                a[k+1] = temp;
            }
        }
    }
    printf("[");
    for( int i  = 0 ; i < n ; i++){
        printf("%.2f;",a[i]);
    }
    printf("]");
}

//-----------------------------------------------------------------
int main(void){
    
    int n = 0;
    float a[100];
    int choice;
    
    
    do{
        printf("-------------------------MENU-------------------------");
        printf("\n");
        printf("1.Nhap so luong sinh vien va diem cua moi sinh vien!\n");
        printf("2.Hien thi diem sinh vien");
        printf("\n");
        printf("3.Tinh diem trung binh cua ca lop!\n");
        printf("4.Tim diem cao nhat lop va so luong sinh vien dat duoc muc diem do!\n");
        printf("5.In diem theo thu tu!\n");
        printf("6.exit!");
        printf("\n");
        printf("nhap lua chon cua ban:");
        scanf("%d",&choice);
        printf("------------------------------------------------------\n");
       while(isEmpty(n)&& choice !=1){
           printf("\n");
                printf("Ban can nhap thong tin truoc khi thuc hien cac chuc nang khac!\n");
                printf("Vui long nhap lai lua chon cua ban:");
                scanf("%d",&choice); 
                printf("-------------------------------------------------------------\n");
       }
        
        switch(choice){
            case 1 :
            printf("nhap so luong sinh vien:");
            scanf("%d",&n);
            if(isValid(n)){
                enterPoint(n,a);
                printf("\n");
                break;
            }
            case 2 :
                showPoint(n,a);
                printf("\n");
                break;
            case 3 :
                Average(n,a);
                printf("\n");
                printf("\n");
                break;
            case 4 :
                float max = findHighestPoint(n,a);
                printf("Diem so cao nhat lop la : %.2f",max);
                printf("\n");
                numOfHighestP(max,n,a);
                printf("\n");
                printf("\n");
                break;
            case 5 :
                bubbleSort(n,a);
                printf("\n");
                printf("\n");
                break;
            case 6 :
                printf("Xin hay doi!Chuong trinh dang tat.........");
                break;
            default :
                printf("lua chon khong hop le!\n");
        }
        
    }while(choice!=6);
}