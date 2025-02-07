import request from '@/utils/request'

// 查询岗位列表
export function listCustomer(query) {
  return request({
    url: '/system/customer/list',
    method: 'get',
    params: query
  })
}

// 查询岗位详细
export function getCustomer(cusId) {
  return request({
    url: '/system/customer/' + cusId,
    method: 'get'
  })
}

// 新增岗位
export function addCustomer(data) {
  return request({
    url: '/system/customer',
    method: 'post',
    data: data
  })
}

// 修改岗位
export function updateCustomer(data) {
  return request({
    url: '/system/customer',
    method: 'put',
    data: data
  })
}

// 删除岗位
export function delCustomer(postId) {
  return request({
    url: '/system/customer/' + postId,
    method: 'delete'
  })
}
