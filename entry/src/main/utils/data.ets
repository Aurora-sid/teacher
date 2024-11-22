const data={
  username:''
}
export function setUserName(username){
  data.username = username
}
export function getUserName(){
  return data.username;
}