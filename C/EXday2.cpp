#include <stdio.h>
int main(){
	float toan,ly,van,sinh,money,vnd;
	    printf(" nhap diem toan cua ban:\n");
	scanf("%f",&toan);
		printf(" nhap diem ly cua ban:\n");
	scanf("%f",&ly);
		printf(" nhap diem van cua ban:\n");
	scanf("%f",&van);
		printf(" nhap diem sinh cua ban:\n");
	scanf("%f",&sinh);
		printf(" nhap Ngan Sach cua ban:\n");
	scanf("%f",&money);
		printf(" nhap so tien ban muon doi sang tien do:\n");
	scanf("%f",&vnd);
	float dtb = (toan+ly+sinh+van)/5;
	float usd = vnd / 260000;
	int choice;
	do{
		printf("-------menu-------\n");
		printf("1.tinh diem trung binh\n");
		printf("2.doi tien usd\n");
		printf("3.Exit\n");
		printf("nhap lua chon cua bn\n");
		scanf("%d",&choice);
		switch(choice){
			case 1 :
				printf("diem trung binh la:%.2f\n",dtb);
				break;
			case 2 :
				printf("so tien sau khi chuyen: %.2fusd\n",usd);
				break;
			case 3 :
				break;
			default:
				printf("gia tri khong hop le!");
		}
	} while(choice != 3);
	return 0;
}