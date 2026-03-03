const mathScores = [1,2,3,4,5,6,7,8,9,10];
const updatedMathScores = mathScores.map(score => score < 10 ? score + 1 : score);
console.log(updatedMathScores);