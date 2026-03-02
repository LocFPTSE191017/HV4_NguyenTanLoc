
const countValidCases = (memoryUsage, limit) => {
    let count = 0 ;
    for( let i = 0 ; i < memoryUsage.length; i++){
        if( memoryUsage[i] <= limit){
            count++;
        }
    }
    return count;
}
let limit = 40;
let memoryUsage = [32,45,28,50,64,20];
countValidCases(memoryUsage, limit);
console.log(`Number of valid cases: ${countValidCases(memoryUsage, limit)}`);
console.log(`Number of case used over limit: ${memoryUsage.length-countValidCases(memoryUsage, limit)}`);