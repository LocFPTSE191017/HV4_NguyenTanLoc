#include <stdio.h>
int sum( int a[],int n ){
	int sum = 0;
	for( int i = 0; i < n; i++){
		sum += a[i];
	}
	return sum;
	}
float average( int a[],int n ){
	int total = sum(a,n);
	return (float)total/n;
}	
int main(){
	int n;
	
	printf("nhap so phan tu: ");
	scanf("%d",&n);
	int a[n];
	for( int i = 0 ; i < n ; i ++){
		printf("nhap phan tu thu %d :",i+1);
		scanf("%d",&a[i]);
	}
	

	int choice ;
	do{
	printf("------Menu------\n");
	printf("1.sum\n");
	printf("2.aver\n");
	printf("3.Exit\n");
	printf(" nhap lua chon cua ban :");
	scanf("%d",&choice);
	switch(choice){
		case 1 : 
		printf("%d\n",sum(a,n));
		break;
		case 2 :
			printf("%.2f\n",average(a,n));
			break;
		case 3 :
			break;
		default:
			printf(" lua chon khong hop le\n");
	}
	}while(choice != 3);
	return 0;
}