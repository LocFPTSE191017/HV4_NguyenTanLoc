const numOfPurchase = 5;
let total = 0 ;
for( let i = 0 ; i < numOfPurchase ; i ++){
    let discount = Math.round(Math.random()*1);
    if(discount === 1){
       let discountPercent = Math.round(Math.random()*50);
       total += (discountPercent/100)*Math.round(Math.random()*5000000);
    } else {
        let price  = Math.round(Math.random()*5000000);
    total += price;
    }
}
console.log(`tong la :${total}`);
