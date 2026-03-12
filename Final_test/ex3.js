const projects = [
  { id: 1, name: "smart home", status: "completed" },
  { id: 2, name: "auto water pump", status: "in-progress" },
  { id: 3, name: "weather station", status: "planned" },
  { id: 4, name: "leetcode clone platform", status: "in-progress" },
  { id: 5, name: "excode landing page", status: "completed" },
  { id: 6, name: "custom mechanical keyboard", status: "planned" },
  { id: 7, name: "ai face recognition", status: "in-progress" },
  { id: 8, name: "smart traffic light", status: "completed" }
];
const upperCase = projects.map((pr) => ({
    ...pr , name : pr.name.toUpperCase()
}))
upperCase.forEach((pr)=> console.log(pr));
const filterProject = projects.filter((pr) => pr.status === "in-progress")
console.log("các dự án đang thực hiện :"  ,filterProject);
