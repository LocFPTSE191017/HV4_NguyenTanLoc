const employess = [{
    id: "1",
    name: "Thịnh",
    age: 30,
    department: "Engineering",
  
} ,
{    id: "2",
    name: "Hùng",
    age: 25,
    department: "Marketing",
    phonenumber: "987-654-3210",    
},
{    id: "3",
    name: "Lan",
    age: 28,
    department: "Sales",
    email: " Lan@gmail.com",
}
]
const phoneChecked = employess.filter(employee=>!employee.phonenumber).map(employee=>employee.name);
const emailchecked = employess.filter(employee=>!employee.email).map(employee=>employee.name);
const allChecked =employess.filter(employee=>!employee.phonenumber && !employee.email).map(employee=>employee.name);
console.log(`Những nhân viên không có số điện thoại là: ${phoneChecked.join(", ") }`);
console.log(`Những nhân viên không có email là: ${emailchecked.join(", ") }`);
console.log(`Những nhân viên không có số điện thoại và email là: ${allChecked.join(", ") }`);