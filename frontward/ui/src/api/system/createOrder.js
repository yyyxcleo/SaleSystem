import request from "@/utils/request";

export function addOrderDetails(data) {
  return request({
    url: '/system/orderDd/batch',
    method: 'post',
    data: data
  })
}

export function listOrderDetails(query) {
  return request({
    url: '/system/orderDd/list',
    method: 'get',
    params: query
  })
}

export function updateOrderDetails(data) {
  return request({
    url: '/system/orderDd',
    method: 'put',
    data: data
  })
}

export function delOrderDetails(postId) {
  return request({
    url: '/system/orderDd/' + postId,
    method: 'delete'
  })
}
