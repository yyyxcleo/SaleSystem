<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="订单号" prop="eqtName">
        <el-input
          v-model="queryParams.omId"
          placeholder="请输入订单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleCreate(-1)"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
        >删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getOrderList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="postList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="序号" align="center" >
        <template slot-scope="scope">
          <!-- 在这里可以自定义动作序号列的内容 -->
          {{ scope.$index + 1 }}
        </template>
      </el-table-column>
      <el-table-column label="订单号" align="center" prop="omId" />
      <el-table-column label="客户" align="center" prop="omCustomer" />
      <el-table-column label="总价" align="center" prop="omTotalPrice" />
      <el-table-column label="状态" align="center" prop="status">
        <template slot-scope="scope">
<!--          <dict-tag :options="dict.type.pr_status" :value="scope.row.status"/>-->
          <el-tag type="primary" v-if="scope.row.status == 1">已审核</el-tag>
          <el-tag type="warning" v-if="scope.row.status == 0">未审核</el-tag>
<!--          {{scope.row.status}}-->
        </template>

      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleCreate(scope.row.omId)"
          >详情</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getOrderList"
    />

    <!-- 添加或修改动作对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="planform" :model="planform" label-width="80px">
        <el-form-item label="订单号" prop="ohId">
          <el-input v-model="planform.ohId" clearable disabled />
        </el-form-item>
        <el-form-item label="产品编号" prop="prId">
          <el-input v-model="planform.prId" clearable disabled />
        </el-form-item>
        <!-- <el-form-item label="产品名称" prop="prName">
          <el-input v-model="planform.prName" clearable disabled />
        </el-form-item> -->
        <el-form-item label="产品数量" prop="ptNum">
          <el-input v-model="planform.ptNum" clearable disabled />
        </el-form-item>
        <el-form-item label="工艺模型" prop="model">
          <el-select v-model="planform.ptDesp" placeholder="请选择" clearable style="width:100%">
            <el-option v-for="item in modelOptions" :key="item.modelId" :label="item.modelName" :value="item.modelId" />
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="makeplan">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listOrder, delOrder, getOrder} from "@/api/system/bookmenu";
// import dict from "@/utils/dict";
// import {addProductionTask} from "@/api/workflow/productionTask";
import {parseTime} from "../../../utils/ruoyi";
import {delOrderDetails, listOrderDetails} from "@/api/system/createOrder";
// import {listModel} from "@/api/workflow/model";
import {getProduct} from "@/api/monitor/object";
import { updateOrder } from "../../../api/system/bookmenu";
import axios from "axios";

export default {
  name: "Order",
  dicts: ['pr_status'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      id:-1,
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 岗位表格数据
      postList: [],
      modelOptions: [],
      // 弹出层标题
      title: "下达生产计划",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        omId: undefined,
        omCustomer: "undefined",
        pageNum: 1,
        pageSize: 10
      },
      itemQueryParams: {
        pageNum: 1,
        pageSize: 10,
        omId: undefined,
      },
      // 表单参数
      planform: {},
      // 表单校验

    };
  },
  created() {
    this.getOrderList();
  },
  methods: {
    parseTime,
    // dict,
    /** 查询岗位列表 */
    getOrderList() {
      this.loading = true;
      // console.log(this.queryParams)
      // axios({
      //   url: 'http://10.245.0.218:8080/system/orderMm/list',
      //   method: 'post',
      //   data: {
      //     omId: "undefined",
      //     omCustomer: "undefined",
      //     pageNum: 1,
      //     pageSize: 10
      //   }
      // }).then(response => {
      //   console.log(response.data);
      // }).catch(error => {
      //   console.log(error.message);
      // })
      listOrder().then(response => {
        console.log(response)
        this.postList = response.rows;
        console.log(response)
        this.total = response.total;
        this.loading = false;
      });
      console.log(1)
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        arId: undefined,
        arName: undefined,
        arDesp: undefined
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.getOrderList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.arId)
      this.single = selection.length!=1
      this.multiple = !selection.length
    },
    handleCreate(id){
      this.$router.push({
        path:'/bookmenu/orderDetails',
        query:{
          id:id
        }
      })
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加工作台";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const opIds = row.arId || this.ids
      console.log(opIds)
      getOrderList(opIds).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改工作台信息";
      });
    },
    /** 提交按钮 */
    // submitForm: function() {
    //   this.$refs["form"].validate(valid => {
    //     if (valid) {
    //       if (this.form.arId != undefined) {
    //         updateOrder(this.form).then(response => {
    //           this.$modal.msgSuccess("修改成功");
    //           this.open = false;
    //           this.getOrderList();
    //         });
    //       } else {
    //         addOrder(this.form).then(response => {
    //           this.$modal.msgSuccess("新增成功");
    //           this.open = false;
    //           console.log(this.form)
    //           this.getOrderList();
    //         });
    //       }
    //     }
    //   });
    //   console.log(1)
    // },
    /** 删除按钮操作 */
    handleDelete(row) {
      const arIds = row.omId || this.ids;
      console.log(arIds)
      this.$modal.confirm('是否确认删除编号为"' + arIds + '"的数据项？').then(() => {
        this.itemQueryParams.omId = arIds
        console.log(this.itemQueryParams)
        listOrderDetails(this.itemQueryParams).then(response => {
          const list = response.rows;
          list.forEach(function (element) {
            delOrderDetails(element.odId).then(response => {

            })
          })
        })
        delOrder(arIds);
      }).then(() => {
        this.getOrderList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});

    },
    handlePlan(row) {
      console.log("下达")
      this.planform.ohId = row.omId
      this.planform.ptLatestEndtime = row.omDeliveryDate
      this.planform.omStatus = row.omStatus
      this.itemQueryParams.omId = row.omId

      listOrderDetails(this.itemQueryParams).then(response => {
        const list = response.rows[0];
        this.planform.prId = list.prId
        this.planform.odId = list.odId

        this.planform.ptNum = list.prNum
        // console.log(list)
        const queryParams = {
          pageNum: 1,
          pageSize: 100,
          modelKey: null,
          modelName: null,
          category: null
        }
        getProduct(this.planform.prId).then(response => {
          this.planform.prName = response.data.prName
        })
        listModel(queryParams).then(response => {
          this.modelOptions = response.rows;
          this.open = true
        })

      })
    },
    makeplan: function() {
      console.log(this.planform)
      this.$refs["planform"].validate(valid => {
        if (valid) {
          addProductionTask(this.planform).then(response => {
            // console.log(response)
            this.open = false
            this.$modal.msgSuccess("下达生产计划成功");
            getOrder(this.planform.ohId).then(resp => {
              const order = resp.data
              console.log(111)
              console.log(resp.data)
              order.omStatus = "1"
              updateOrder(order).then(res=>{

              })
            })
          })
        }
      });
    }
  }
};
</script>
