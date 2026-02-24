const numOfPuschar = 5;
let total = 0 ;
for( let i = 0 ; i < 5 ; i ++){
    let price  = Math.round(Math.random()*5000000);
    total += price;
}
console.log(`tong la :${total}`);
