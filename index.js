let month=2;
let year = 2024;
if(([1,3,5,7,8,10,12].includes(month))){
    console.log("thang co 31 ngayf");
} else if(month===2 ){
    if((year % 4 === 0 && year % 100 !== 0)||year % 400 === 0){
        console.log("thang co 29 ngay");
        } else{
        console.log("thang co 28 ngay");
        }
} else if(month<= 0 || month >=13){
    console.log("thang khong ton tai");
} else{
    console.log("thang co 30 ngay");
}