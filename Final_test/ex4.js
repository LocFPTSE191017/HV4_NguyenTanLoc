const examResults = [
  { skill: "Git/GitHub", score: 8.0 },
  { skill: "HTML/CSS", score: 9.0 },
  { skill: "JavaScript", score: 7.5 },
  { skill: "ReactJS", score: 8.5 },
  { skill: "NodeJS", score: 7.0 },
  { skill: "Docker", score: 6.5 },
  { skill: "Python", score: 8.0 },
  { skill: "Machine Learning", score: 7.5 },
];
let totalPoint = examResults.reduce((Total,current) =>Total + current.score,0);

console.log(`điểm trung bình của 3 kĩ năng là :${totalPoint.toFixed(1)} điểm.`);