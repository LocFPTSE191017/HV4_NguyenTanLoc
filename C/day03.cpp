#include <stdio.h>
#include <math.h>
int main(void){
	float mathScore,PhysicScore,chemistryScore,midSemisterScore;
	int choice;
	printf("nhap diem toan :");
	scanf("%f",&mathScore);
	printf("nhap diem hoa :");
	scanf("%f",&PhysicScore);
	printf("nhap diem ly :");
	scanf("%f",&chemistryScore);
	printf("nhap diem giua ki :");
	scanf("%f",&midSemisterScore);
		float finalScore =( midSemisterScore*0.3+((mathScore+PhysicScore+chemistryScore)/3))+2;
	do{
printf("\n---Menu---\n");
printf("0. Exit\n1. Nhap diem\n2. Thong tin tinh diem\n");
		scanf("%d",&choice);
		switch( choice){
			case 0 :
				break;
			case 1 :
				printf("diem cua kia cua ban la: %f",finalScore);
				break;
			case 2 :
				printf("*30% midSemisterScore\n*70% average\n*+2 sai de");
				break;
			default :
				printf("lua chon khong he le!");
		}
		}while(choice != 2);
		return 0;
}