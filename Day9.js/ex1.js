const employess = [{
    id: "1",
    name: "Thịnh",
    age: 30,
    department: "Engineering",
    phonenumber: "123-456-7890",    
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
const updatedEmployess = employess.filter(employee=>!employee.phonenumber).map(employee=>employee.name);
console.log(`Những nhân viên không có số điện thoại là: ${updatedEmployess}`);