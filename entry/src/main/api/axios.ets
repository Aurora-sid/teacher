import axios from '@ohos/axios';

// 创建 axios 实例
const instance = axios.create({
  baseURL: 'http://47.92.137.107:8080/', // 设置基础 URL
  timeout: 10000, // 超时时间，单位为毫秒
  headers: {
    'Content-Type': 'application/json',
  },
});

// 请求拦截器
instance.interceptors.request.use(
  (config) => {
    console.info('请求拦截器:', JSON.stringify(config));

    // 如果有 Token，可以在此处添加
    const token = 'your_token_here';
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => {
    console.error('请求拦截器错误:', error);
    return Promise.reject(error);
  }
);

// 响应拦截器
instance.interceptors.response.use(
  (response) => {
    console.info('响应拦截器:', JSON.stringify(response.data));
    return response.data;
  },
  (error) => {
    console.error('响应拦截器错误:', error);

    if (error.response) {
      console.error('错误状态码:', error.response.status);
      console.error('服务器返回:', error.response.data);
      return Promise.reject(error.response.data.message || '服务器错误');
    } else if (error.request) {
      console.error('无响应:', error.request);
      return Promise.reject('网络连接失败，请检查网络');
    } else {
      console.error('请求错误:', error.message);
      return Promise.reject(error.message);
    }
  }
);

// GET 请求封装
export const getRequest = async (url, params = {}) => {
  try {
    const response = await instance.get(url, { params });
    return response;
  } catch (error) {
    console.error('GET 请求出错:', error);
    throw error;
  }
};

// POST 请求封装
export const postRequest = async (url, data, headers = {}) => {
  try {
    const response = await instance.post(url, data, { headers });
    return response;
  } catch (error) {
    console.error('POST 请求出错:', error);
    throw error;
  }
};
