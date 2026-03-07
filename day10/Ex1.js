const prompt = require("prompt-sync")();
const employees = [];
let id = 0;
let choice;
do{
    console.log("1.nhap thong tin");
    console.log("2.in ra list")
    console.log("3.exit");
    choice = prompt("nhap lua chon : ");
    switch( choice){
    case "1" : 
let name = prompt("nhap ten cua ban :"); 
let email = prompt("Nhap email cua ban :");
let phoneNumber = prompt("nhap sdt cua ban :"); 
let gender = prompt("Nhap gioi tinh cua ban :");
let position = prompt("nhap chuc vu cua ban :"); 
let salary = prompt("Nhap luong cua ban :");
id++;
employees.push({
    name,email,phoneNumber,gender,position,salary,id
})
    break;
    case "2" :
employees.forEach(emp =>{
    console.log(emp)});
    break;
    case "3" : 
    console.log("thoat....");
    break;
    default:
    console.log("lua chon ko hop le")
}

}
 while( choice!== "3");