const friends = ["Kiet","Hieu","Vinh"];
friends.push("Khanh");
console.log(`Number of friends: ${friends.length}`);
console.log(`First friend: ${friends[0]}`);
friends.shift("Tuan");
friends.pop("Sang");
friends.splice(2,1,"Phuc");
for(let i = 0; i < friends.length; i++){
    console.log(friends[i]);
}