#include <stdio.h>
#include <math.h>
int isPrime(int n) {
    if( n<2){
        return 0;
    }
    for(int i = 2; i <= sqrt(n); i++){
        if(n % i == 0){
            return 0;
}
}
return 1;
}
void displayIsPrime(int n){
    for(int i=0;i<n;i++){
        if(isPrime(i)){
            printf("%d ", i);
        }
    }
}
int sumOfprime(int n){
	int sum =0;
	for( int i = 0 ; i <n ;i++){
		if(isPrime(i)){
			sum += i;
		}
	}
	return sum;
}
int main(){
    int n;
    printf("Enter the number of elements: ");
    int choice;
    scanf("%d", &n);
    do{
    printf("Menu:\n");
    printf("1. Display all prime numbers less than n\n");
    printf("2. Calculate the sum of all prime numbers less than n\n");
    printf("3. Exit\n");
    printf("Choose an option:\n");
    scanf("%d", &choice);
    switch (choice) {
        case 1:
            printf("Prime numbers less than %d: ", n);
            displayIsPrime(n);
            printf("\n");
            break;
        case 2:            
            printf("Sum of prime numbers less than %d: %d\n", n, sumOfprime(n));
            break;
        case 3:
            printf("Exiting the program.\n");
            break;
        default:
            printf("Invalid choice. Please try again.\n");
}
}while(choice!=3);
}
