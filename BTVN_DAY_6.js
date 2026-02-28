const findDayofWeek = (day,month,year)=>{
    const d = new Date(day,month-1,year);
    const dayNumber = d.getDate();
    const dayofweek = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
    return dayofweek[d.getDay()];
}
console.log(findDayofWeek(1,1,2000));