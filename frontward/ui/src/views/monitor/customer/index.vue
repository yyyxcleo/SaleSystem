<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="客户姓名" prop="cusName">
        <el-input
          v-model="queryParams.cusName"
          placeholder="请输入客户姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="客户类型" prop="cusType">
        <el-select v-model="queryParams.status" placeholder="客户类型" clearable>
          <el-option
            v-for="cu in cus"
            :key="cu.value"
            :label="cu.label"
            :value="cu.value"
          />
        </el-select>
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
          @click="handleAdd"
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
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="cusList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="客户编号" align="center" prop="cusId" />
      <el-table-column label="客户姓名" align="center" prop="cusName" />
      <el-table-column label="客户电话" align="center" prop="cusPhone" />
      <el-table-column label="客户类型" align="center" prop="status" >
        <template slot-scope="scope">
          <span>{{ getStatus(scope.row.status) }}</span>
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
            @click="handleUpdate(scope.row)"
            v-hasPermi="['monitor:customer:list']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['monitor:customer:list']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改岗位对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="客户姓名" prop="cusName">
          <el-input v-model="form.cusName" placeholder="请输入客户姓名" />
        </el-form-item>
        <el-form-item label="客户电话" prop="cusPhone">
          <el-input v-model="form.cusPhone" placeholder="请输入客户电话" />
        </el-form-item>
        <!--        <el-form-item label="商家地址" prop="postSort">-->
        <!--          <el-input v-model="form.postSort" placeholder="请输入商家地址" />-->
        <!--        </el-form-item>-->
        <el-form-item label="客户类型" prop="status">
          <el-select
            v-model="form.status"
            placeholder="请选择"
            clearable
            style="width: 240px"
          >
            <el-option
              v-for="cu in cus"
              :key="cu.value"
              :label="cu.label"
              :value="cu.value"
            />
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import {listCustomer, getCustomer, delCustomer, addCustomer, updateCustomer} from "@/api/monitor/customer";
import { listUser, getUser, delUser, addUser, updateUser, resetUserPwd, changeUserStatus, deptTreeSelect } from "@/api/monitor/object";
import post from "@/views/system/post/index.vue";

export default {
  name: "Post",
  dicts: ['sys_normal_disable'],
  data() {
    return {
      selectedUserNames: [],
      selectedItems: [],
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      cus:[
        {value:0,label:"零售客户"},
        {value:1,label:"批发客户"}
      ],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 岗位表格数据
      cusList: [],
      userList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      openn: false,
      opn:false,
      opp:false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        cusName: undefined,
        status: undefined
      },
      dateRange: [],
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        cusName: [
          { required: true, message: "客户姓名不能为空", trigger: "blur" }
        ],
        status: [
          { required: true, message: "客户类型不能为空", trigger: "blur" }
        ]
      }
    };
  },
  computed: {
    post() {
      return post
    },
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询岗位列表 */
    getList() {
      this.loading = true;
      listCustomer(this.queryParams).then(response => {
        console.log(response)
        this.cusList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    getStatus(st) {
      if(st == 0){
        return "零售客户"
      }else {
        return "批发客户"
      }
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        cusId: undefined,
        cusName: undefined,
        cusPhone: undefined,
        status: undefined
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.postId)
      this.single = selection.length!=1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加客户";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const cusId = row.cusId || this.ids
      getCustomer(cusId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改客户";
      });
    },
    /** 提交按钮 */
    submitForm: function() {
      this.$refs["form"].validate(valid => {
        // if (valid) {
        if (this.form.cusId != undefined) {
          console.log(111111)
          updateCustomer(this.form).then(response => {
            console.log(111111)
            this.$modal.msgSuccess("修改成功");
            this.open = false;
            this.getList();
          });
        } else {
          addCustomer(this.form).then(response => {
            console.log(this.form)
            this.$modal.msgSuccess("新增成功");
            this.open = false;
            this.getList();
          });
        }
        // }
      });
    },
    submit(){
      this.opp = false;
      this.$modal.msgSuccess("提交成功");
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const cusIds = row.cusId || this.ids;
      this.$modal.confirm('是否确认删除该客户？').then(function() {
        return delCustomer(cusIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
  }
};
</script>
