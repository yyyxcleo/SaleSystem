<template>
  <div class="data">
    <div class="topbox">
      <img src="@/assets/board/title.png" class="bigtitlefont"/>
      <img src="@/assets/board/toptitle.png" class="toptitle"/>
      <span class="smallfont">数据汇总看板</span>
      <img src="@/assets/board/smalltitle.png" class="smalltitle"/>
    </div>
    <div class="cover">
      <div class="box">
        <img src="@/assets/board/boxleft.png" class="boxleft"/>
        <img src="@/assets/board/boxright.png" class="boxright"/>
      </div>
      <div class="box2">
        <div class="cardbox">
          <div class="card">
            <img src="@/assets/board/cardbg.png" style="position: absolute;z-index: 1"/>
            <span style="position: absolute;z-index: 2;color: white">总订单数</span>
            <span style="position: absolute;z-index: 2;color: white;margin-top: 5%">100</span>
          </div>
          <div class="card">
            <img src="@/assets/board/cardbg.png" style="position: absolute;z-index: 1"/>
            <span style="position: absolute;z-index: 2;color: white">批发订单数</span>
            <span style="position: absolute;z-index: 2;color: white;margin-top: 5%">50</span>
          </div>
          <div class="card">
            <img src="@/assets/board/cardbg.png" style="position: absolute;z-index: 1"/>
            <span style="position: absolute;z-index: 2;color: white">零售订单数</span>
            <span style="position: absolute;z-index: 2;color: white;margin-top: 5%">20</span>
          </div>
        </div>
        <img src="@/assets/board/videobg.png" class="videobg"/>
        <img src="@/assets/board/supermarket.webp" class="videobg2"/>
        <img src="@/assets/board/dizuo1.png" class="dizuo"/>
        <img src="@/assets/board/dizuobg.png" class="dizuobg"/>
        <img src="@/assets/board/light.png" class="light"/>
        <img src="@/assets/board/bottom.png" class="boxbottom"/>
      </div>
    </div>

    <div class="left">
      <div class="lefttop">
        <div class="title">
          <span class="titlefont">货品总览</span>
          <big-data-title />
        </div>
        <data1/>
      </div>
      <div class="leftmiddle">
        <div class="title">
          <span class="titlefont">销售数据</span>
          <big-data-title />
        </div>
        <data2/>
      </div>
      <div class="leftbottom">
        <div class="title">
          <span class="titlefont">实时订单</span>
          <big-data-title />
        </div>
        <data3/>
      </div>
    </div>
    <div class="right">
      <div class="righttop">
<!--        <big-data-title></big-data-title>-->
        <div class="title">
          <span class="titlefont">货品销售额</span>
          <big-data-title />
        </div>
        <data4/>
      </div>
      <div class="rightmiddle">
        <div class="title">
          <span class="titlefont">货品库存</span>
          <big-data-title />
        </div>
        <data5/>
      </div>
      <div class="rightbottom">
        <div class="title">
          <span class="titlefont">门店销售额</span>
          <big-data-title />
        </div>
        <data6/>
      </div>
    </div>
<!--    <iframe src="@/assets/board/planet.mp4" class="planet"/>-->
    <div>
      <video ref="videoPlayer" muted autoplay  class="planet" @ended="restartVideo">
        <source src="@/assets/board/planet.mp4" type="video/mp4">
      </video>
    </div>
  </div>

</template>

<script>
import BigDataTitle from "@/components/BigDataTitle.vue";
import data2 from "@/components/Board/data2.vue";
import Data1 from "@/components/Board/data1.vue";
import data3 from "@/components/Board/data3.vue";
import Data4 from "@/components/Board/data4.vue";
import data5 from "@/components/Board/data5.vue";
import data6 from "@/components/Board/data6.vue";
export default {
  name: "enterprise",
  components:{
    data2,
    data3,
    Data4,
    Data1,
    data5,
    data6,
    'big-data-title':BigDataTitle
  },
  data(){
    return {
      imageSrc:"@/assets/board/toptitle.png",
    }
  },
  methods:{
    restartVideo(){
      this.$refs.videoPlayer.currentTime = 0;
      this.$refs.videoPlayer.play();
    }
  }
}
</script>

<style scoped>
.topbox{
  display: flex;
  justify-content: center;
}
.data{
  height: 100%;
  /*background-color: #232630;*/
  background-color: #01112B;
}
.toptitle{
  position: absolute;
  width: 100%;
  height: 50px;
  z-index: 3;
}
.bigtitlefont{
  position: absolute;
  z-index: 4;
  width: 20%;
  top: 0;
  margin-top: 0.5%;
}
.smalltitle{
  position: absolute;
  z-index: 3;
  width: 100%;
  height: 100px;
}
.smallfont{
  position: absolute;
  z-index: 4;
  font-family: 'Source Han Sans', sans-serif;
  color: #A9F6FF;
  top: 70px;
  font-size: 20px;
}
.planet{
  position: absolute;
  bottom: 0;
  left: 0;
  z-index: 1;
  width: 100%;
  /*height: 100%;*/
}
.cover{
  position: absolute;
  z-index: 2;
  width: 100%;
  height: 100%;
  background-color: rgba(35,38,48,0.5);
}
.box{
  display: flex;
  height: 100%;
  width: 100%;
  align-items: center;
}
.box2{
  display: flex;
  height: auto;
  width: 100%;
  justify-content: center;
}
.boxleft{
  position: absolute;
  height: 80%;
  left: 1%;
}
.boxright{
  position: absolute;
  height: 80%;
  right: 1%;
}
.boxbottom{
  position: absolute;
  width: 100%;
  bottom: 0;
}
.light{
  position: absolute;
  bottom: 35px;
  width: 200px;
  z-index: 6;
}
.cardbox{
  position: absolute;
  display: flex;
  justify-content: space-between;
  width: 39%;
  top: 20%;
}
.card{
  width: 30%;
  margin-left: 3%;
  align-items: center;
  display: flex;
  justify-content: center;
}
.videobg{
  position: absolute;
  z-index: 4;
  bottom: 23%;
  width: 25%;
}
.videobg2{
  position: absolute;
  z-index: 5;
  bottom: 24%;
  width: 23%;
  height: 25%;
}
.dizuo{
  position: absolute;
  width: 100%;
  bottom: 0;
  z-index: 3;
}
.dizuobg{
  position: absolute;
  bottom: 0;
  width: 100%;
  z-index:2;
}
.left{
  height: 75%;
  width: 25%;
  position: absolute;
  left: 3.5%;
  top: 15%;
  /*background-color: pink;*/
  z-index: 3;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
.lefttop{
  height: 33%;
  /*background-color: skyblue;*/
  position: relative;
  /*align-items: center;*/
}
.leftmiddle{
  height: 33%;
  /*background-color: skyblue;*/
}
.leftbottom{
  height: 33%;
  /*background-color: skyblue;*/
}
.title{
  width: 100%;
  height: 15%;
  /*display: flex;*/
  /*align-items: center;*/
  /*background-color: navajowhite;*/
}
.titlefont{
  color: #FFFFFF;
  z-index: 6;
  position: absolute;
  margin-left: 2%;
  margin-top: 1%;
  font-family: 'Microsoft YaHei', sans-serif;
  font-weight: bold;
  font-size: 18px;
}
.right{
  height: 75%;
  width: 25%;
  position: absolute;
  right: 3.5%;
  top: 15%;
  /*background-color: pink;*/
  z-index: 3;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
.righttop{
  height: 33%;
  /*background-color: skyblue;*/
  position: relative;
  /*align-items: center;*/
}
.rightmiddle{
  height: 33%;
  /*background-color: skyblue;*/
}
.rightbottom{
  height: 33%;
  /*background-color: skyblue;*/
}
</style>
