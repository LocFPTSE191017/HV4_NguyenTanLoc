#include <stdio.h>

int main()
{
    float distance;
    float money;

    printf("Nhap quang duong can di: ");
    scanf("%f", &distance);

    if(distance < 2){
        printf("So tien can tra la: 15000 VND");
    }
    else if(distance >= 2 && distance < 11){
        money = 13500 * distance;
        printf("So tien can phai tra la: %.2f", money);
    }
    else if(distance >= 11 && distance < 20){
        money = 11000 * distance;
        printf("So tien can phai tra la: %.2f", money);
    }
    else{
        money = 11000 * distance * 0.9;
        printf("So tien can phai tra la: %.2f", money);
    }

    return 0;
}