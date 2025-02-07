<template>

    <!-- 内容 -->
    <div class="content">
      <!-- 下拉框 -->
      <el-select v-model="selectedOption" placeholder="请选择" class="selected">
        <el-option
          v-for="item in options"
          :key="item.value"
          :label="item.label"
          :value="item.value">
        </el-option>
      </el-select>
      <!-- 图像 -->
      <div ref="lineContainer" class="line" style="width:100%;height:100%;margin-top:2vh;margin-bottom: 0;"></div>
    </div>
</template>

<script>
import * as echarts from 'echarts';
import { fetchItem2Data } from '@/api/bigData/data2.js';

export default {
  name: 'LineChart',
  data() {
    return {
      lineContainer: null,
      options: [
        { value:'YEAR', label:'年' },
        // { value:'HALF_YEAR', label:'半年' },
        // { value:'SEASON', label:'季' },
        { value:'MONTH', label:'月' },
        // { value:'WEEK', label:'周' },
        { value:'DAY', label:'日' }
      ],
      selectedOption: 'MONTH',
      queryParams: {
        selectedOption: 'MONTH'
      },
      lineData: {
        x: [],
        y_red: [0, 5, 4, 0],
        // y_orange: [12, 34, 28, 24],
        // y_yellow: [34, 10, 20, 14]
      }
    };
  },
  mounted() {
    this.lineContainer = this.$refs.lineContainer;
    this.fetch();
  },
  watch: {
    selectedOption() {
      this.fetch();
    }
  },
  methods: {
    async fetch() {
      try {
        const data = await fetchItem2Data(this.selectedOption);
        console.log(data);
        this.lineData.y_red = data.data;
        this.lineData.x = data.name;
        console.log(data.data);
      } catch (error) {
        console.error('Error fetching data:', error);
      }
      this.drawLine();
    },
    drawLine() {
      const myLine = echarts.init(this.lineContainer);
      const option = {
        tooltip: {
          trigger: 'axis',
        },
        legend: {
          padding: 10,
          tooltip: {
            show: true,
          },
          y: 'top',
          x: 'left',
          data: ['销售量'],
          textStyle: {
            color: 'white'
          }
        },
        xAxis: {
          type: 'category',
          boundaryGap: false,
          data: this.lineData.x,
          nameTextStyle: { color: 'white' },
          axisLine: { lineStyle: { color: 'white' } },
          axisLabel: { color: 'white', fontSize: '0.9rem' }
        },
        yAxis: {
          type: 'value',
          axisLabel: { color: 'white', fontSize: '0.8rem' },
          splitLine:{
            lineStyle:{
              color:'rgba(10,63,114,0.7)'
            }
          }
        },
        series: [
          {
            name: '销售量',
            data: this.lineData.y_red,
            type: 'line',
            areaStyle: {
              color: {
                type: 'linear',
                x: 0, y: 0,
                x2: 0, y2: 1,
                colorStops: [
                  {
                    offset: 0, color: 'rgba(246,221,56,1)'
                  },
                  {
                    offset: 1, color: 'rgba(241,135,57,0)'
                  }
                ]

              }
            },
            itemStyle: { normal: { color: "yellow", lineStyle: { color: "yellow" } } }
          },

        ]
      };
      myLine.setOption(option);
    }
  }
};
</script>

<style scoped lang="scss">

  span{
    padding-left: 1vw;
    color:white;
    letter-spacing: 1px;
    font-size: 1.5rem;
    font-family: "华文琥珀";
  }
  .content{
    //background-color: pink;
    width: 100%;
    position: absolute;
    height: 30%;
    padding: 0;
    margin: 0;
    overflow: hidden;
    //position: relative;
    .selected {
      position: absolute;
      right: 2vw;
      top:2vh;
      width: 6vw;
    }
  }
</style>
