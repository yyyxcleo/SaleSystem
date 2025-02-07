<template>
  <div id="item1">
    <!-- 表头 -->
<!--    <div class="vector16"></div>-->
    <div class="content">
      <img  class="circle-box" src="@/assets/board/circle_box.png" alt="">
      <!-- 故障(起) -->
      <div class="matter">
        <div style="position: absolute;z-index: 2;top: 50%;left: 20%">{{ failures }}/{{ failureSum }}</div>
        <div style="position: absolute;z-index: 2;top: 70%;left: 25%">出库</div>
        <img src="@/assets/board/matter.png" class="matterpng"/>
      </div>
      <!-- 报警(起) -->
      <div class="police">
        <div style="position: absolute;z-index: 2;top: 50%;left: 20%">{{ warnings }}/{{ warningSum }}</div>
        <div style="position: absolute;z-index: 2;top: 70%;left: 25%">入库</div>
        <img src="@/assets/board/police.png" class="policepng"/>
      </div>
      <!-- 累计警告数 -->
      <div class="summary">
        <div style="position: absolute;z-index: 2;top: 45%;left: 25%">{{ todayNum }}/{{ totalNum }}</div>
        <div style="position: absolute;z-index: 2;top: 60%">今日/累计销售量</div>
        <img src="@/assets/board/sum.png" class="sum"/>
      </div>
      <!-- 火警 -->
      <div class="fire">
        <div style="position: absolute;z-index: 2;top: 45%;left: 25%">{{ fires }}/{{ fireSum }}</div>
        <div style="position: absolute;z-index: 2;top: 65%;left: 25%">预警</div>
        <img src="@/assets/board/fire.png" class="firepng"/>
      </div>

    </div>

  </div>
</template>

<script>

export default {
  data() {
    return {
      failures: 10,
      failureSum: 100,
      warnings: 5,
      warningSum: 50,
      fires: 2,
      fireSum: 20,
      todayNum: 15,
      totalNum: 150
    };
  },
  mounted() {
    // 在mounted钩子中进行数据获取等操作
    // WebSocket应用的逻辑也可以在这里处理
  }
}


</script>

<style scoped lang="scss">
#item1 {
  //.vector16{
  //  margin-top: -1.5vh;
  //  background-image: url("@/assets/board/vector16.png");
  //  background-size: cover;
  //  height: 2vh;
  //}
  span{
    padding-left: 1vw;
    color:white;
    letter-spacing: 1px;
    font-size: 1.5rem;
    font-family: "华文琥珀";
  }
  .content{
    //background-image: linear-gradient(black,rgb(17,51,76));
    height: 24vh;
    position: relative;
    color: white;
    font-size: 0.9rem;
    .matter{
      position: absolute;
      top:2.3vh;
      left: 6.7vw;
      height: 3.5vw;
      width: 3.5vw;
      //background-image: url("@/assets/board/matter.png");
      background-size:100% 100%;
      padding-top: 1.5vh;
      div{
        text-align: center;
      }

    }
    .matterpng{
      //position: absolute;
      width: 100%;
      //left: 100%;
    }
    .circle-box {
      position: relative;
      top: 2vh;
      left: 8vw;
      left: 8vw;
      height:16vh;
    }
    .police{

      position: absolute;
      left: 15vw;
      top: 2vh;
      height: 3.5vw;
      width: 3.5vw;
      //background-image: url("@/assets/board/police.png");
      background-size:100% 100%;
      padding-top: 1.5vh;
      div{
        text-align: center;
      }
    }
    .policepng{
      width: 100%;
    }
    .summary{

      position: absolute;
      top: 4.2vh;
      left: 10vw;
      width: 5vw;
      height: 5vw;
      //background-image: url("@/assets/board/sum.png");
      background-size:100% 100%;
      padding-top: 2vh;
      div{
        text-align: center;
      }
    }
    .sum{
      width: 100%;
    }
    .fire{

      position: absolute;
      top: 12.5vh;
      left: 13.5vw;
      height: 3.5vw;
      width: 3.5vw;
      padding-top: 1.5vh;
      //background-image: url("@/assets/board/fire.png");
      background-size:100% 100%;
      div{
        text-align: center;
      }
    }
    .firepng{
      width: 100%;
    }
    .circle{
      height: 20vh;
      width: 20vh;
      border-color: white;
      position: absolute;
      top: 0px;
      left: 0;
    }
  }
}
</style>
