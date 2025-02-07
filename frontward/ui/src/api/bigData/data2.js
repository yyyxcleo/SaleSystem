import request from '@/utils/request'
export function fetchItem2Data(type){
  return new Promise((resolve) => {
      setTimeout(() => {
          const randomData = Array.from({ length: 4 }, () => Math.floor(Math.random() * 35));
          const barData1 = {
              data:randomData,
              name:['5.9','5.12','5.15','5.18']
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
