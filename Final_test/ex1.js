// Bài 1
const checkBorrowRequest = (deviceName,quantity,availableStock) => {
if( quantity >availableStock ){
    console.log("yêu cầu bị từ chối.")
} else if(quantity <=0 ){
    console.log("Yêu cầu không hợp lệ.")
} else {
    console.log(`Đã duyệt mượn ${quantity} ${deviceName}`);
}
}
