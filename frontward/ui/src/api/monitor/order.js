import request from '@/utils/request'

// 查询岗位列表
export function listSupplier(query) {
  return request({
    url: '/system/order/list',
    method: 'get',
    params: query,
    baseURL: process.env.VUE_APP_BASE_API_1
  })
}

// 查询岗位详细
export function getPost(postId) {
  return request({
    url: '/system/order/' + postId,
    method: 'get',
    baseURL: process.env.VUE_APP_BASE_API_1
  })
}

// 新增岗位
export function addPost(data) {
  return request({
    url: '/system/order',
    method: 'post',
    data: data,
    baseURL: process.env.VUE_APP_BASE_API_1
  })
}

// 修改岗位
export function updatePost(data) {
  return request({
    url: '/system/order',
    method: 'put',
    data: data,
    baseURL: process.env.VUE_APP_BASE_API_1
  })
}

// 删除岗位
export function delPost(postId) {
  return request({
    url: '/system/order/' + postId,
    method: 'delete',
    baseURL: process.env.VUE_APP_BASE_API_1
  })
}
