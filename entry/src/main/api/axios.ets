// api.ts
import http from '../utils/request';

interface LoginResponse {
  success?: boolean;
  message?: string;
  token?: string;
  code?:number;
}

// 新增
export const testApi = () => {
  return http.get("test/userList")
}

// 注册接口
export const register = (item:{username:"string",password:"string"}) => {
 return http.post('user/register', item)
}
// 调用demo
// let a =   await register({username:"zx2",password:"123"})
// console.log(JSON.stringify(a))

// 登录接口
export const getPassword = (username:string) => {
  return http.get('user/login',{username:username})
}
//调用demo
// let result =   await getPassword(this.user)
// console.log(result.data.password)


// 建议接口
export const getSuggest = (item:{
  subject: string,
  suggestion: string,
  theme: string,
  username: string
}) => {
  return http.post('suggestion/giveSuggestion', item)
}

// 获取老师列表
export const getTeacherList=()=>{
        return http.get('teacher/getTeacherList')
}

// 预约老师
export const setTeacherState=(name:string,startTime:string,endTime:string,state:string)=>{
  return http.post('teacher/setTeacherState',{name:name,starttime:startTime,endtime:endTime,state})
}

// 设置用户老师
export const setUserTeacher=(username:string,userTeacher:string)=>{
  return http.post('user/setUserTeacher',{username,userteacher:userTeacher})
}

// 根据用户名查询预约的老师老师
export const getUserTeacher=(username:string)=>{
  return http.get('user/getUserTeacher',{username})
}

// 根据用户名查取不同用户提的建议
export const getSuggestion=(username:string)=>{
  return http.get('suggestion/getSuggestion',{username})
}

