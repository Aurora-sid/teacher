const data={
  username:'',
//<<<<<<< Updated upstream
  teacherMoney:'',
//=======
  bool:false
//>>>>>>> Stashed changes
}
export function setUserName(username){
  data.username = username
}
export function getUserName(){
  return data.username;
}
//<<<<<<< Updated upstream
export function setTeacherMoney(money){
  data.teacherMoney = money;
}
export function getTeacherMoney(){
  return data.teacherMoney;
}
// =======
// >>>>>>> Stashed changes
