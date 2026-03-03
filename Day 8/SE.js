const scores = [6, 7, 8, 4, 9, 5, 7, 6, 8, 10];

const hasFail = scores.some(score => score < 5);
if(hasFail){
    console.log("Có bạn dưới TB");
} else{
    console.log("Không có bạn nào dưới TB");
}
const allPass = scores.every(score => score >= 5);
if(allPass){
    console.log("Cả lớp qua môn");
} else{
    console.log("Có bạn chưa qua môn");
}   
