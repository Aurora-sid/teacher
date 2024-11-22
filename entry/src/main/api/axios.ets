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
  "subject": "string",
  "suggestion": "string",
  "theme": "string",
  "username": "string"
}) => {
  return http.post('suggestion/giveSuggestion', item)
}
