const prompt = require("prompt-sync")();
const employees = [];
let id = 0;
let choice;
do{
    console.log("1.nhap thong tin");
    console.log("2.in ra list");
    console.log("3.tim kiem ten");
    console.log("4.sua thong tin");
    console.log("5.exit");
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
    case "3":
       let search = prompt("nhap ten can tim :");
       let result= employees.filter((emp) =>
            emp.name === search
        )
        result.forEach((emp) => 
        console.log(emp));
    break;
    case "4" :
        let searchName = prompt("nhap ten can sua:");
         let emp = employees.find((emp) => emp.name === searchName);
        if(emp){
             emp.name= prompt("nhap ten moi :");
            emp.email=prompt("nhap email moi : ");
            emp.gender =prompt("nhap gender moi :");
            emp.phoneNumber = prompt("nhap sdt moi");
            emp.position = prompt("nhap chuc vu moi:");
            emp.salary = prompt("nhap luong moi:");
            emp.id = prompt("nhap id moi :");
        } else {
            console.log(" khong tim thay");
        }
    break;
    case "5" : 
    console.log("thoat....");
    break;
    default:
    console.log("lua chon ko hop le")
}

}
 while( choice!== "5");