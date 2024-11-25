const data={
  username:'',
  teacherMoney:''
}
export function setUserName(username){
  data.username = username
}
export function getUserName(){
  return data.username;
}
export function setTeacherMoney(money){
  data.teacherMoney = money;
}
export function getTeacherMoney(){
  return data.teacherMoney;
}