const tinh = ["Dồng", "Cao Bằng", "Hà Giang", "Lào Cai", "Sơn La", "Yên Bái"];
tinh.forEach((tinh) => {
    console.log(tinh);
});
tinh.filter((tinh) => tinh.startsWith("C")).forEach((tinh) => {
    console.log(tinh);
});