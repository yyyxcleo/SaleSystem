<template>
  <div class="table-demo-wrapper">
    <ul class="table-header">
      <li>
        <span>订单编号</span>
        <span>客户</span>
        <span>金额</span>
        <span>时间</span>
      </li>
    </ul>
    <vueSeamlessScroll :data="source" class="seamless-warp" >
      <ul
        class="list"
        :style="'height:'+source.length*38+'px;'"
        @mousemove="stopScroll"
        @mouseout="doScroll"
      >
        <li
          :class="{devicelistitem: true, even: (index + 1) % 2 !== 0}"
          v-for="(item,index) in source"
          :key="index"
        >
          <span :title="item.name">{{item.name}}</span>
          <span :title="item.sex">{{item.sex}}</span>
          <span :title="item.age">{{item.age}}</span>
          <span :title="item.address">{{item.address}}</span>
        </li>
      </ul>
    </vueSeamlessScroll>
  </div>
</template>

<script>
    import vueSeamlessScroll from "vue-seamless-scroll";
    export default {
    components: {
    vueSeamlessScroll,
  },
    data() {
    return {
    allowScroll: true,
    source: [],
  };
  },
    computed: {
    optionSingleHeightTime() {
    return {
    singleHeight: 38,
    waitTime: 3000,
    limitMoveNum: this.source ? this.source.length : 5,
  };
  },
  },
    mounted() {
    this.initData();
  },
    methods: {
      getRandomDate(startYear, endYear) {
        var hours = Math.floor(Math.random() * 24); // 0到23的小时数
        var minutes = Math.floor(Math.random() * 60); // 0到59的分钟数
        var seconds = Math.floor(Math.random() * 60); // 0到59的秒数

        // 对小时、分钟和秒进行补零处理
        hours = ("0" + hours).slice(-2);
        minutes = ("0" + minutes).slice(-2);
        seconds = ("0" + seconds).slice(-2);

        return hours + ":" + minutes + ":" + seconds;
      },
    initData() {
    this.source = [];
    for (let i = 0; i < 10; i++) {
      if(i % 4 == 1){
        this.source.push({
          name: `${i + 1}`,
          sex: "zzyf",
          age: Math.floor(Math.random() * 100) % (i*10),
          address: this.getRandomDate(),
        });
      }
      if(i % 4 == 2){
        this.source.push({
          name: `${i + 1}`,
          sex: "yxxc",
          age: Math.floor(Math.random() * 100) % (i*10),
          address: this.getRandomDate(),
        });
      }if(i % 4 == 3){
        this.source.push({
          name: `${i + 1}`,
          sex: "lzzy",
          age:Math.floor(Math.random() * 100) % (i*10),
          address: this.getRandomDate(),
        });
      }if(i % 4 == 4){
        this.source.push({
          name: `${i + 1}`,
          sex: "mzqq",
          age: Math.floor(Math.random() * 100) % (i*10),
          address: this.getRandomDate(),
        });
      }
  }
  },
    stopScroll() {
    this.allowScroll = false;
  },
    doScroll() {
    this.allowScroll = true;
  },
  },
  };
</script>

<style scoped>
*{ margin:0; padding:0; }
.table-demo-wrapper {
  margin: 0;
  left: 0;
  width: 100%;
  height: 200px;
  overflow: hidden;
  padding: 0;
  /*background-color: pink;*/
}

.table-demo-wrapper .table-header {
  margin-top: 5px;
  width: 100%;
  margin-left: 0;
}

.table-demo-wrapper .table-header li {
  height: 38px;
  display: flex;
  /*justify-content: flex-start;*/
  align-items: center;
}

.table-demo-wrapper .table-header li span {
  line-height: 40px;
  flex: 1;
  font-size: 14px;
  font-family: FZZhengHeiS-M-GB;
  font-weight: 400;
  color: #fff;
  /*text-align: left;*/
}

.table-demo-wrapper .table-header li span:nth-child(1) {
  flex: 2;
}

.table-demo-wrapper .table-header li span:nth-child(4) {
  flex: 2;
  text-align: center;
}

.table-demo-wrapper .seamless-warp {
  overflow: hidden;
}

.table-demo-wrapper .seamless-warp .list {
  overflow: hidden;
  left: 0;
}

.table-demo-wrapper .seamless-warp .list .devicelistitem {
  display: flex;
  justify-content: flex-start;
  align-items: center;
  height: 38px;
}

.table-demo-wrapper .seamless-warp .list .devicelistitem span {
  flex: 1;
  font-size: 14px;
  font-family: PingFang SC;
  font-weight: 400;
  color: #d7def5;
  text-align: left;
}

.table-demo-wrapper .seamless-warp .list .devicelistitem span:nth-child(1) {
  flex: 2;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.table-demo-wrapper .seamless-warp .list .devicelistitem span:nth-child(4) {
  flex: 2;
  text-align: center;
}

.table-demo-wrapper .seamless-warp .list .even {
  background: linear-gradient(180deg, rgba(85, 109, 255, 0.3), rgba(45, 67, 139, 0.3), rgba(85, 109, 255, 0.3));
}

</style>
