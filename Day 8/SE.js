const Arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const tb = Arr.filter((num) => {
    return num >= 5;
});
console.log(tb);
const pass = Arr.every((num) => num >= 5);
console.log(pass);