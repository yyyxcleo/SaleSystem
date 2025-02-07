import request from '@/utils/request'
export function fetchItem5Data(type){
  return new Promise((resolve) => {
    setTimeout(() => {
      const randomData = Array.from({ length: 4 }, () => Math.floor(Math.random() * 35));
      const barData1 = {
        data:randomData,
        name:['瓜子','NFC橙汁','洗发水','运动鞋']
      }
      resolve(barData1);
    },0);
  });
  // return request({
  //   url: '/gtBaseData/fireDeviceMessageMysql/currentErrorData',
  //   method: 'get',
  //   params:{
  //     type:type,
  //   },
  // })
}
