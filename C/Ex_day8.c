/******************************************************************************

                            Online C Compiler.
                Code, Compile, Run and Debug C program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/

#include <stdio.h>
#include <stdbool.h>
bool isValid(int n) {
	return n > 0 && n <= 100;
}
bool isEmpty(int n ) {
	return n == 0;
}
//-----------------------------------------------------------------

void enterPoint(int n, float a[]) {
	for( int i = 0 ; i<n; i++) {
		do {
			printf("nhap diem sinh vien thu %d :",i+1);
			scanf("%f",&a[i]);
			if(a[i] < 0 || a[i] > 10 ) {
				printf("Diem khong hop le!\nVui long nhap diem he so 10!\n");
			}
		} while(a[i]<0 || a[i]>10);
	}
}

//-----------------------------------------------------------------

void showPoint(int n, float a[]) {
	for(int i = 0 ; i < n ; i++) {
		printf("Diem cua sinh vien thu %d:%.2f",i+1,a[i]);
		printf("\n");
	}
}

//-----------------------------------------------------------------

float Average(int n, float a[]) {
	float sum = 0 ;
	for(int i = 0 ; i<n ; i++) {
		sum += a[i];
	}
	float Average= sum/n;
	printf("Diem trung binh cua ca lop la: %.2f",Average);
	return Average ;

}

//-----------------------------------------------------------------

float findHighestPoint(int n, float a[]) {
	float max = 0 ;
	for(int i = 0 ; i<n ; i++) {
		if(a[i] > max) {
			max = a[i];
		}
	}

	return max;
}

void numOfHighestP(float max, int n, float a[]) {
	int count = 0;
	for(int i = 0; i<n ; i++) {
		if(max == a[i]) {
			count++;
		}
	}
	printf("So sinh vien dat duoc diem cao nhat la : %d",count);
}

//-----------------------------------------------------------------

void bubbleSortDecrease(int n, float a[]) {
	for( int i = 0 ; i < n ; i++) {
		for ( int k = 0 ; k< n -1 ; k++) {
			float temp  = a[k];
			if( a[k] < a[k+1]) {
				a[k] = a[k+1];
				a[k+1] = temp;
			}
		}
	}
}

void bubbleSortIncrease(int n , float a[]){
    for( int i = 0 ; i < n ; i++) {
		for ( int k = 0 ; k< n -1 ; k++) {
			float temp  = a[k];
			if( a[k] > a[k+1]) {
				a[k] = a[k+1];
				a[k+1] = temp;
			}
		}
	}
}

//-----------------------------------------------------------------

void disPlay(int n , float a[]){
    printf("[");
	for( int i  = 0 ; i < n ; i++) {
		printf("%.2f;",a[i]);
	}
	printf("]");
}

//-----------------------------------------------------------------


void sortArrayKeepPlace(int n , float a[]){
    float b[100];
    float c[100];
    float d[100];
    int nb = 0 , nc = 0 , nd = 0 ;
    for( int i = 0 ; i < n ; i++){
        if(a[i] < 5  ) {
                b[nb++] = a[i];
            
        } else if( a[i] >= 5 && a[i] <= 8) {
            
                c[nc++] = a[i];
            
        } else {
            
                d[nd++] = a[i];
            
        }
    }

    for( int i = 0 ; i < nb ; i++){
        printf("%.1f,",b[i]);
    }
    for( int i = 0 ; i < nc ; i++){
        printf("%.1f,",c[i]);
    }
    for( int i = 0 ; i < nd ; i++){
        printf("%.1f,",d[i]);
    }
    }



//-----------------------------------------------------------------
int main(void) {

	int n = 0;
	float a[100];
	int choice;


	do {
		printf("-------------------------MENU-------------------------");
		printf("\n");
		printf("1.Nhap so luong sinh vien va diem cua moi sinh vien!\n");
		printf("2.Hien thi diem sinh vien");
		printf("\n");
		printf("3.Tinh diem trung binh cua ca lop!\n");
		printf("4.Tim diem cao nhat lop va so luong sinh vien dat duoc muc diem do!\n");
		printf("5.In diem theo thu tu!\n");
		printf("6.In diem cao thu 2 va 3!\n");
		printf("7.In sap xep diem theo rankStudent\n");
		printf("8.exit!");
		printf("\n");
		printf("nhap lua chon cua ban:");
		scanf("%d",&choice);
		printf("------------------------------------------------------\n");
		while(isEmpty(n)&& choice !=1) {
			if( choice == 8) {
				printf("Xin hay doi!Chuong trinh dang tat.........");
				break;
			} else {
			printf("\n");
			printf("Ban can nhap thong tin truoc khi thuc hien cac chuc nang khac!\n");
			printf("Vui long nhap lai lua chon cua ban:");
			scanf("%d",&choice);
			printf("-------------------------------------------------------------\n");
		}
	}
			

		switch(choice) {
		case 1 :
			printf("nhap so luong sinh vien:");
			scanf("%d",&n);
			if(isValid(n)) {
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
		int subChoice;
		do{
		    printf("1.In theo thu tu tang dan!\n");
		    printf("2.In theo thu tu giam dan!\n");
		    printf("3.Out!\n");
		    printf("nhap lua chon cua ban :");
		    scanf("%d",&subChoice);
		    switch(subChoice){
		    case 1 :
		           bubbleSortIncrease(n,a);
			       disPlay(n,a);
			       printf("\n");
		 	       printf("\n");
			       break;
			case 2 :
			       bubbleSortDecrease(n,a);
			       disPlay(n,a);
			       printf("\n");
		 	       printf("\n");
			       break;
			case 3 :
			       break;
			 default :
			       printf("lua chon cua ban khong hop le!");
		}
		  }while(subChoice!=3);
		  break;
		case 6 :
		    bubbleSortDecrease(n,a);
		        printf("sinh vien co diem cao thu 2 la : %.2f", a[1]);
		        printf("\n");
		        printf("sinh vien co diem cao thu 3 la : %.2f", a[2]);
		        printf("\n");
			    printf("\n");
			    break;
	    case 7 :
	            sortArrayKeepPlace(n,a);
	            printf("\n");
			    printf("\n");
	            break;
		case 8 :
			printf("Xin hay doi!Chuong trinh dang tat.........");
			break;
		default :
			printf("lua chon khong hop le!\n");
		}

	} while(choice!=8);
}