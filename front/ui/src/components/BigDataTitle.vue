<template>
  <div class="titlebox">

<!--    <div class="border">-->

<!--    </div>-->
    <img src="@/assets/board/titlebg.png" class="border"/>
    <img src="@/assets/board/guangshan.png" class="right"/>
    <img src="@/assets/board/moveitem.png" class="moveitem"/>
  </div>
</template>

<script>
export default {
  name: "BigDataTitle"
}
</script>

<style scoped>
.titlebox{
  background: linear-gradient(to right,rgba(54, 121, 164, 1),rgba(0,0,0,0));
  display: flex;
  align-items: center;
  position: relative;
  height: 100%;
  /*background-color: skyblue;*/
}
.border{
  position: absolute;
  width: 100%;
  height: 100%;
  z-index: 4;
}
.right{
  position: absolute;
  width: auto;
  height: 70%;
  z-index: 5;
  right: 0;
}
.moveitem{
  width: auto;
  height: 70%;
  opacity: 1; /* 初始不透明度为1 */
  transition: opacity 2s ease-in-out; /* 使用透明度2秒钟的缓慢进出转换 */
  position: relative;
  animation: moveBox 3s infinite alternate;
}
.moveitem:hover {
  opacity: 0.5; /* 将不透明度渐变到0.5 */
}
@keyframes moveBox {
  from {left: 310px;opacity: 1} /* 起始位置 */
  to {left: 400px;opacity: 0.3}
}
</style>
