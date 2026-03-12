const employees = [
  {
    id: 1,
    name: "Nguyễn Văn A",
    email: "nva@company.com",
    phoneNumber: "0901234567",
    gender: "Male",
    position: "Developer",
    salary: 2000,
  },
  {
    id: 2,
    name: "Trần Thị B",
    email: null,
    phoneNumber: "0912345678",
    gender: "Female",
    position: "Tester",
    salary: 1200,
  },
  {
    id: 3,
    name: "Lê Văn C",
    email: "lvc@company.com",
    phoneNumber: null,
    gender: "Male",
    position: "Developer",
    salary: 1800,
  },
  {
    id: 4,
    name: "Phạm Thị D",
    email: null,
    phoneNumber: null,
    gender: "Female",
    position: "HR",
    salary: 1000,
  },
  {
    id: 5,
    name: "Hoàng Văn E",
    email: "hve@company.com",
    phoneNumber: "0934567890",
    gender: "Male",
    position: "Manager",
    salary: 3500,
  },
];
let result = employees.filter((emp) => emp.email || emp.phoneNumber )
console.log("cac nhan vien hop le la : " , result);
let update = result.map( (emp) => {
return emp.email ? emp : {...emp, email : `${emp.id}_${emp.position.toLowerCase()}@companygmail.com`};
}) ;
console.log(update);

let sum = employees.reduce((total,emp) => {
    return ( (total+emp)/employees.length)
},0 );
employees.filter((emp) => emp.salary > sum 
).forEach((emp) => console.log(`cac NV co muc luong lon hon TB : ${emp}`));
employees.filter((emp) => emp.salary < sum 
).forEach((emp) => console.log(`cac NV co muc luong nho hon TB : ${emp}`));


