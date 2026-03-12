const candidates = [
  { name: "An", skills: ["C++", "Python"], role: "AI" },
  { name: "Bình", skills: ["HTML", "CSS", "JavaScript"], role: "Frontend" },
  { name: "Châu", skills: ["NodeJS", "MongoDB"], role: "Backend" },
  { name: "Dũng", skills: ["Python", "TensorFlow"], role: "AI" },
  { name: "Trung", skills: ["HTML", "CSS", "ReactJS"], role: "Frontend" },
  { name: "Thọ", skills: ["NodeJS", "Express", "Docker"], role: "Backend" },
  { name: "Hi", skills: ["Figma", "UI/UX"], role: "Design" },
  { name: "Linh", skills: ["Python", "Pandas", "Scikit-Learn"], role: "Data Science" }
];
const buildWebTeam = (data) =>{
    let filterRole = data.filter((can) => can.role === "Frontend" || can.role === "Backend")
    .forEach((can) => 
            console.log(`Chào ${can.name} mời bạn vào team Web!`)
    );
}
buildWebTeam(candidates);