#include <stdio.h>
#include <math.h>
int sum(int n){
    int sum = 0;
    sum = (n * (n + 1)) / 2;
    return sum;
}
int EvenCount(int n){
    int count = 0;
    for( int i = 1; i < n ;i++){
        if(i % 2 == 0){
            count++;
        }
    }
    return count;
}
int CountNumberdi3(int n ){
    int count = 0;
    for( int i = 1; i < n ;i++){
        if(i % 3 == 0){
            count++;
        }
    }
    return count;
}
int main() {
    int n;
    int choice;
    while(1){
    printf("Enter the number of elements: ");
    scanf("%d", &n); 
    }
    do{
    printf("Menu:\n");
    printf("1. Calculate the sum of the first n natural numbers\n");
    printf("2. Count the number of even numbers less than n\n");
    printf("3. Count the number of numbers less than n that are divisible by 3\n");
    printf("4. Exit\n");
    printf("Choose an option:\n");
    scanf("%d", &choice);
    switch (choice) {
        case 1:
            printf("Sum of first %d natural numbers: %d\n", n, sum(n));
            break;
        case 2:
            printf("Count of even numbers less than %d: %d\n", n, EvenCount(n));
            break;
        case 3:
            printf("Count of numbers less than %d that are divisible by 3: %d\n", n, CountNumberdi3(n));
            break;
        case 4:
            printf("Exiting the program.\n");
            break;

        default:
            printf("Invalid choice. Please try again.\n");
    }
    } while(choice != 4);

}