const findMaxSpike = (executionTimes) => {
    let increaseCount ;
for(let i = 0; i < executionTimes.length - 1; i+=2){
        increaseCount = executionTimes[i+1] - executionTimes[i];
  }
  return increaseCount;
}
let executionTimes = [50,30,20,10,0];
let increaseCount = findMaxSpike(executionTimes);
        if(increaseCount > 0){
            console.log(`thoi gian tang cao nhat: ${increaseCount}`);
       }else{
            console.log("giam gian hoac khong thay doi");
       }