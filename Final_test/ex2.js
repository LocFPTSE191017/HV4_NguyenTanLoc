const workHours = [2, 4, 0, 5, 3, 6, 2];
let sum = 0;
let day = [];
for( let i = 0 ; i <workHours.length;i++){
   sum += workHours[i];
   if(workHours[i] >= 5){
      day.push(i+1);
   }
} 
console.log(`TOTAL : ${sum}`);
console.log(`Ngày thứ ${day} làm việc rất năng suất`)
