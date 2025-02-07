import request from '@/utils/request'

// 查询岗位列表
export function listOrder() {
  return request({
    url: '/system/orderMm/list',
    method: 'get',
  })
}

// 查询岗位详细
export function getOrder(postId) {
  return request({
    url: '/system/orderMm/' + postId,
    method: 'get'
  })
}

// 新增岗位
export function addOrder(data) {
  return request({
    url: '/system/orderMm',
    method: 'post',
    data: data
  })
}


// 修改岗位
export function updateOrder(data) {
  return request({
    url: '/system/orderMm',
    method: 'put',
    data: data
  })
}

// 删除岗位
export function delOrder(postId) {
  return request({
    url: '/system/orderMm/' + postId,
    method: 'delete'
  })
}
