<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="货品名称" prop="postCode">
        <el-input
          v-model="queryParams.prName"
          placeholder="请输入货品名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="仓库">
        <el-select v-model="warehouse"
                   placeholder="请选择仓库"
                   clearable
                   style="width: 240px">
          <el-option
            v-for="wh in wareHouses"
            :key="wh.value"
            :label="wh.label"
            :value="wh.value"
          />
        </el-select>
      </el-form-item>
    </el-form>
    <el-table v-loading="loading" :data="objectList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="货品编号" align="center" prop="prId" />
      <el-table-column label="货品名称" align="center" prop="prName" />
      <el-table-column label="货品库存" align="center" prop="prNum" />
      <el-table-column label="选择供货商" prop="status">
        <template slot-scope="scope">
          <el-select
            v-model="scope.row.status"
            placeholder="可选供货商"
            clearable
            style="width: 240px"
          >
            <el-option
              v-for="sup in supList"
              :key="sup.postId"
              :label="sup.postCode"
              :value="sup.postId"
            />
          </el-select>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleView(scope.row)"
          >发送订单</el-button>
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
<!--    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>-->
<!--      <el-form ref="form" :model="form" :rules="rules" label-width="80px">-->
<!--        <el-form-item label="商家名称" prop="postCode">-->
<!--          <el-input v-model="form.postCode" placeholder="请输入商家名称" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="商家地址" prop="postName">-->
<!--          <el-input v-model="form.postName" placeholder="请输入商家地址" />-->
<!--        </el-form-item>-->
<!--&lt;!&ndash;        <el-form-item label="商家地址" prop="postSort">&ndash;&gt;-->
<!--&lt;!&ndash;          <el-input v-model="form.postSort" placeholder="请输入商家地址" />&ndash;&gt;-->
<!--&lt;!&ndash;        </el-form-item>&ndash;&gt;-->
<!--        <el-form-item label="岗位状态" prop="status">-->
<!--          <el-radio-group v-model="form.status">-->
<!--            <el-radio-->
<!--              v-for="dict in dict.type.sys_normal_disable"-->
<!--              :key="dict.value"-->
<!--              :label="dict.value"-->
<!--            >{{dict.label}}</el-radio>-->
<!--          </el-radio-group>-->
<!--        </el-form-item>-->
<!--        <el-form-item label="备注" prop="remark">-->
<!--          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />-->
<!--        </el-form-item>-->
<!--      </el-form>-->
<!--      <div slot="footer" class="dialog-footer">-->
<!--        <el-button type="primary" @click="submitForm">确 定</el-button>-->
<!--        <el-button @click="cancel">取 消</el-button>-->
<!--      </div>-->
<!--    </el-dialog>-->
<!--    <el-dialog :title="title" :visible.sync="openn" width="500px" append-to-body>-->
<!--      <el-form ref="form" :model="form"  label-width="80px">-->
<!--        <el-form-item label="商家名称" prop="postCode">-->
<!--          <span>{{form.postCode}}</span>-->
<!--        </el-form-item>-->
<!--        <el-form-item label="商家地址" prop="postName">-->
<!--          <span>{{ form.postName }}</span>-->
<!--        </el-form-item>-->
<!--        &lt;!&ndash;        <el-form-item label="商家地址" prop="postSort">&ndash;&gt;-->
<!--        &lt;!&ndash;          <el-input v-model="form.postSort" placeholder="请输入商家地址" />&ndash;&gt;-->
<!--        &lt;!&ndash;        </el-form-item>&ndash;&gt;-->
<!--        <el-form-item label="岗位状态" prop="status">-->
<!--          <span>{{form.statusText}}</span>-->
<!--        </el-form-item>-->
<!--        <el-form-item label="备注" prop="remark">-->
<!--          <span>{{ form.remark }}</span>-->
<!--        </el-form-item>-->
<!--      </el-form>-->
<!--&lt;!&ndash;      <div slot="footer" class="dialog-footer">&ndash;&gt;-->
<!--&lt;!&ndash;        <el-button type="primary" @click="submitForm">确 定</el-button>&ndash;&gt;-->
<!--&lt;!&ndash;        <el-button @click="cancel">取 消</el-button>&ndash;&gt;-->
<!--&lt;!&ndash;      </div>&ndash;&gt;-->
<!--    </el-dialog>-->
  </div>
</template>

<script>
import { listSupplier, getPost, delPost, addPost, updatePost } from "@/api/supplier";
import {listUser} from "@/api/monitor/object";

export default {
  name: "Post",
  dicts: ['sys_normal_disable'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      warehouse: "总店",
      wareHouses: [
        {value: "总店", label:"总店"},
        {value: "分店1", label: "分店1"},
        {value: "分店2", label: "分店2"}
      ],
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 岗位表格数据
      objectList: [],
      supList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        prNum: 0,
        prName: undefined,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        postName: [
          { required: true, message: "商家地址不能为空", trigger: "blur" }
        ],
        postCode: [
          { required: true, message: "商家名称不能为空", trigger: "blur" }
        ],
        // postSort: [
        //   { required: true, message: "岗位顺序不能为空", trigger: "blur" }
        // ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询岗位列表 */
    getList() {
      this.loading = true;
      listSupplier().then(response => {
        this.supList = response.rows;
      });
      listUser(this.queryParams).then(response => {
        console.log(this.queryParams)
        this.objectList = response.rows;
        this.objectList = this.objectList.filter(item => item.prNum === 0);
        this.loading = false;
      })
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        postId: undefined,
        postCode: undefined,
        postName: undefined,
        postSort: 0,
        status: "0",
        remark: undefined
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
      this.title = "添加供货商";
    },
    handleView(row) {
      // this.reset();
      // this.form = {
      //   postCode: row.postCode,
      //   postName: row.postName,
      //   status: row.status,
      //   remark: row.remark
      // };
      // this.form.statusText = this.dict.type.sys_normal_disable.find(item => item.value === row.status)?.label || '';
      // this.openn = true;
      // this.title = "查看信息"
      this.$modal.msgSuccess("采购成功");
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const postId = row.postId || this.ids
      getPost(postId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改供货商";
      });
    },
    /** 提交按钮 */
    submitForm: function() {
      this.$refs["form"].validate(valid => {
        // if (valid) {
          if (this.form.postId != undefined) {
            updatePost(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPost(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        // }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const postIds = row.postId || this.ids;
      this.$modal.confirm('是否确认删除岗位编号为"' + postIds + '"的数据项？').then(function() {
        return delPost(postIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/post/export', {
        ...this.queryParams
      }, `post_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
