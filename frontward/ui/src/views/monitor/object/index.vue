<template>
  <div class="app-container">
    <el-row :gutter="20">
      <!--部门数据-->
      <el-col :span="4" :xs="24">
        <div class="head-container">
          <el-input
            v-model="deptName"
            placeholder="请输入分区名称"
            clearable
            size="small"
            prefix-icon="el-icon-search"
            style="margin-bottom: 20px"
          />
        </div>
        <div class="head-container">
          <el-tree
            :data="deptOptions"
            :props="defaultProps"
            :expand-on-click-node="false"
            :filter-node-method="filterNode"
            ref="tree"
            node-key="id"
            default-expand-all
            highlight-current
            @node-click="handleNodeClick"
          />
        </div>
      </el-col>
      <!--用户数据-->
      <el-col :span="20" :xs="24">
        <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
<!--          <el-col :span="6" :xs="24">-->
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
<!--          </el-col>-->
          <el-form-item label="货品名称" prop="prName">
            <el-input
              v-model="queryParams.prName"
              placeholder="请输入货品名称"
              clearable
              style="width: 240px"
              @keyup.enter.native="handleQuery"
            />
          </el-form-item>
          <el-col :span="6" :xs="24">
            <el-form-item label="商品分区" prop="dept.deptName">
              <treeselect v-model="queryParams.deptId" :options="deptOptions" :show-count="true" placeholder="请选择所属分区" @keyup.enter.native="handleQuery"/>
            </el-form-item>
          </el-col>
          <el-form-item label="状态" prop="status">
            <el-select
              v-model="queryParams.status"
              placeholder="货品状态"
              clearable
              style="width: 240px"
            >
              <el-option
                v-for="dict in dict.type.sys_normal_disable"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value"
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
              v-hasPermi="['monitor:object:list']"
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
              v-hasPermi="['monitor:object:list']"
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
              v-hasPermi="['monitor:object:list']"
            >删除</el-button>
          </el-col>

          <right-toolbar :showSearch.sync="showSearch" @queryTable="getList" :columns="columns"></right-toolbar>
        </el-row>

        <el-table v-loading="loading" :data="prList" @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="50" align="center" />
          <el-table-column label="货品编号" align="center" key="prId" prop="prId"  />
          <el-table-column label="货品名称" align="center" key="prName" prop="prName"/>
          <el-table-column label="所属分区" align="center" key="deptId" prop="deptId">
            <template slot-scope="scope">
              <!-- 在列的 slot 中使用计算属性获取 eqType 对应的 eqtName -->
              {{ getDeptName(scope.row.deptId) }}
            </template>
          </el-table-column>
          <el-table-column label="成本价" align="center" prop="costPrice" />
          <el-table-column label="批发价" align="center" key="oriPrice" prop="oriPrice" />
          <el-table-column label="零售价" align="center" key="prPrice" prop="prPrice" />
          <el-table-column label="货品库存" align="center" key="prNum" prop="prNum" />
          <el-table-column label="状态" align="center" key="status">
            <template slot-scope="scope">
              <el-tag type="warning" v-if="scope.row.prNum === 0">缺货</el-tag>
              <el-tag type="primary" v-else>正常</el-tag>
            </template>
          </el-table-column>
          <el-table-column
            label="操作"
            align="center"
            width="160"
            class-name="small-padding fixed-width"
          >
            <template slot-scope="scope">
              <el-button
                size="mini"
                type="text"
                icon="el-icon-edit"
                @click="handlechange(scope.row)"
                v-hasPermi="['monitor:object:list']"
              >调货</el-button>
              <el-button
                size="mini"
                type="text"
                icon="el-icon-edit"
                @click="handleUpdate(scope.row)"
                v-hasPermi="['monitor:object:list']"
              >修改</el-button>
              <el-button
                size="mini"
                type="text"
                icon="el-icon-delete"
                @click="handleDelete(scope.row)"
                v-hasPermi="['monitor:object:list']"
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
      </el-col>
    </el-row>

    <!-- 添加或修改用户配置对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-row>
          <el-col :span="12">
            <el-form-item v-if="form.prId == undefined" label="货品名称" prop="prName">
              <el-input v-model="form.prName" placeholder="请输入货品名称" maxlength="30" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="货品成本价">
              <el-input  placeholder="请输入货品成本价" maxlength="30" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="货品批发价" prop="oriPrice">
              <el-input v-model="form.oriPrice" placeholder="请输入货品批发价" maxlength="30" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="货品零售价" prop="prPrice">
              <el-input v-model="form.prPrice" placeholder="请输入货品零售价" maxlength="30" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="所属分区" prop="deptId">
              <treeselect v-model="form.deptId" :options="deptOptions" :show-count="true" placeholder="请选择归属部门" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="货品库存" prop="prNum">
              <el-input v-model="form.prNum" placeholder="请输入货品库存" maxlength="11" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
        </el-row>
<!--        <el-row>-->
<!--          <el-col :span="24">-->
<!--            <el-form-item label="备注">-->
<!--              <el-input v-model="form.remark" type="textarea" placeholder="请输入内容"></el-input>-->
<!--            </el-form-item>-->
<!--          </el-col>-->
<!--        </el-row>-->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
    <el-dialog :title="title" :visible.sync="op" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="调拨仓库" >
              <el-select v-model="house"
                         placeholder="请选择仓库"
                         clearable
                         style="width: 240px">
                <el-option
                  v-for="wh in wareHouse"
                  :key="wh.value"
                  :label="wh.label"
                  :value="wh.value"
                />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="调拨数量" prop="prNum">
              <el-input v-model="num" placeholder="请输入数量" maxlength="11" />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listUser, getUser, delUser, addUser, updateUser, resetUserPwd, changeUserStatus, deptTreeSelect } from "@/api/monitor/object";
import { getToken } from "@/utils/auth";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "User",
  dicts: ['sys_normal_disable', 'sys_user_sex'],
  components: { Treeselect },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      warehouse: "总店",
      wareHouses: [
        {value: "总店", label:"总店"},
        {value: "分店1", label: "分店1"},
        {value: "分店2", label: "分店2"}
      ],
      wareHouse: [
        {value: "总店", label:"总店"},
        {value: "分店1", label: "分店1"}
      ],
      house: '',
      num: 0,
      op: false,
      flag:false,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 用户表格数据
      prList: null,
      // 弹出层标题
      title: "",
      // 部门树选项
      deptOptions: undefined,
      // 是否显示弹出层
      open: false,
      // 部门名称
      deptName: undefined,
      // 默认密码
      initPassword: undefined,
      // 日期范围
      dateRange: [],
      // 岗位选项
      postOptions: [],
      // 角色选项
      roleOptions: [],
      // 表单参数
      form: {},
      defaultProps: {
        children: "children",
        label: "label"
      },
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        prName: undefined,
        status: undefined,
        deptId: undefined
      },
      // 表单校验
      rules: {
        prName: [
          { required: true, message: "货品名称不能为空", trigger: "blur" },
        ],
        prPrice: [
          { required: true, message: "货品售价不能为空", trigger: "blur" }
        ],
        oriPrice: [
          { required: true, message: "货品批发价不能为空", trigger: "blur" },
        ],
        prNum: [
          { required: true, message: "货品库存不能为空", trigger: "blur" },
        ]
      }
    };
  },
  watch: {
    // 根据名称筛选部门树
    deptName(val) {
      this.$refs.tree.filter(val);
    }
  },
  created() {
    this.getList();
    this.getDeptTree();
    this.getConfigKey("sys.user.initPassword").then(response => {
      this.initPassword = response.msg;
    });
  },
  methods: {
    /** 查询用户列表 */
    getList() {
      this.loading = true;
      listUser(this.queryParams).then(response => {
          console.log(this.queryParams)
          this.prList = response.rows;
          console.log(this.prList)
          let prListWithCost = this.prList.map(item => ({
            ...item,
            costPrice: item.oriPrice * 0.9, // 假设成本价是批发价的90%，您可以根据实际情况调整
          }));

          this.prList = prListWithCost;
          this.total = response.total;
          this.loading = false;
        }
      );
    },
    /** 查询部门下拉树结构 */
    getDeptTree() {
      deptTreeSelect().then(response => {
        this.deptOptions = response.data;
        console.log(this.deptOptions)
      });
    },
    // getDeptName(id) {
    //   // this.geteqtyps()
    //   const dept = this.deptOptions.find(item => item.deptId === id);
    //   // console.log(eqtype.eqtName);
    //   return dept ? dept.label : '';
    // },
    getDeptName(id) {
      function findNodeById(tree, targetId) {
        for (let node of tree) {
          if (node.id === targetId) {
            return node.label;
          }
          if (node.children && node.children.length > 0) {
            // console.log(node.label)
            const foundInChildren = findNodeById(node.children, targetId);
            if (foundInChildren) {
              return foundInChildren;
            }
          }
        }
        return null;
      }
      return findNodeById(this.deptOptions, id) || '';
    },
    // 筛选节点
    filterNode(value, data) {
      if (!value) return true;
      return data.label.indexOf(value) !== -1;
    },
    // 节点单击事件
    handleNodeClick(data) {
      this.queryParams.deptId = data.id;
      this.handleQuery();
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        prId: undefined,
        deptId: undefined,
        prName: undefined,
        prPrice: undefined,
        oriPrice: undefined,
        status: "0",
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      // this.queryParams.pageNum = 1;
      console.log(111)
      // this.getList();
      if(this.warehouse == "分店1"){
        this.loading = true
        if(!this.flag){
          this.prList = [
            {
              "prId": "111",
              "prName": "瓜子",
              "deptId": 105,
              "costPrice": 6.3,
              "oriPrice": 7,
              "prPrice": 10,
              "prNum": 20,
              "status": "正常"
            },
            {
              "prId": "112",
              "prName": "NFC橙汁",
              "deptId": 103,
              "costPrice": 4.5,
              "oriPrice": 5,
              "prPrice": 7,
              "prNum": 20,
              "status": "正常"
            },
            {
              "prId": "113",
              "prName": "洗发水",
              "deptId": 109,
              "costPrice": 36,
              "oriPrice": 40,
              "prPrice": 50,
              "prNum":20,
              "status": "正常"
            },
            {
              "prId": "114",
              "prName": "运动鞋",
              "deptId": 203,
              "costPrice": 360,
              "oriPrice": 400,
              "prPrice": 520,
              "prNum": 0,
              "status": "缺货"
            },
            {
              "prId": "115",
              "prName": "德芙纵享丝滑",
              "deptId": 105,
              "costPrice": 16.2,
              "oriPrice": 18,
              "prPrice": 22,
              "prNum": 0,
              "status": "缺货"
            }
          ]
          this.loading = false
        } else {
          this.prList = [
            {
              "prId": "111",
              "prName": "瓜子",
              "deptId": 105,
              "costPrice": 6.3,
              "oriPrice": 7,
              "prPrice": 10,
              "prNum": 20,
              "status": "正常"
            },
            {
              "prId": "112",
              "prName": "NFC橙汁",
              "deptId": 103,
              "costPrice": 4.5,
              "oriPrice": 5,
              "prPrice": 7,
              "prNum": 20,
              "status": "正常"
            },
            {
              "prId": "113",
              "prName": "洗发水",
              "deptId": 109,
              "costPrice": 36,
              "oriPrice": 40,
              "prPrice": 50,
              "prNum":20,
              "status": "正常"
            },
            {
              "prId": "114",
              "prName": "运动鞋",
              "deptId": 203,
              "costPrice": 360,
              "oriPrice": 400,
              "prPrice": 520,
              "prNum": 5,
              "status": "正常"
            },
            {
              "prId": "115",
              "prName": "德芙纵享丝滑",
              "deptId": 105,
              "costPrice": 16.2,
              "oriPrice": 18,
              "prPrice": 22,
              "prNum": 0,
              "status": "缺货"
            }
          ]
          this.loading = false
        }
      } else {
        this.loading = true
        this.prList = [
          {
            "prId": "111",
            "prName": "瓜子",
            "deptId": 105,
            "costPrice": 6.3,
            "oriPrice": 7,
            "prPrice": 10,
            "prNum": 10,
            "status": "正常"
          },
          {
            "prId": "112",
            "prName": "NFC橙汁",
            "deptId": 103,
            "costPrice": 4.5,
            "oriPrice": 5,
            "prPrice": 7,
            "prNum": 20,
            "status": "正常"
          },
          {
            "prId": "113",
            "prName": "洗发水",
            "deptId": 109,
            "costPrice": 36,
            "oriPrice": 40,
            "prPrice": 50,
            "prNum": 10,
            "status": "正常"
          },
          {
            "prId": "114",
            "prName": "运动鞋",
            "deptId": 203,
            "costPrice": 360,
            "oriPrice": 400,
            "prPrice": 520,
            "prNum": 10,
            "status": "正常"
          },
          {
            "prId": "115",
            "prName": "德芙纵享丝滑",
            "deptId": 105,
            "costPrice": 16.2,
            "oriPrice": 18,
            "prPrice": 22,
            "prNum": 0,
            "status": "缺货"
          }
        ]
        this.loading = false

      }
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.dateRange = [];
      this.resetForm("queryForm");
      this.queryParams.deptId = undefined;
      this.$refs.tree.setCurrentKey(null);
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.prId);
      this.single = selection.length != 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加货品";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      // this.reset();
      // const prId = row.prId || this.ids;
      // console.log(prId)
      // getUser(prId).then(response => {
      //   this.form = response.data;
      //   this.open = true;
      //   this.title = "修改货品";
      // });
      this.open = true
    },
    handlechange() {
      this.op = true;
    },
    /** 提交按钮 */
    submitForm: function() {
      // this.$refs["form"].validate(valid => {
      //   if (valid) {
      //     if (this.form.prId != undefined) {
      //       updateUser(this.form).then(response => {
      //         this.$modal.msgSuccess("修改成功");
      //         this.open = false;
      //         this.getList();
      //       });
      //     } else {
      //       addUser(this.form).then(response => {
      //         this.$modal.msgSuccess("新增成功");
      //         this.open = false;
      //         this.getList();
      //       });
      //     }
      //   }
      // });
      this.op = false
      this.loading = true
      this.prList = [
        {
          "prId": "111",
          "prName": "瓜子",
          "deptId": "零食区",
          "costPrice": 6.3,
          "oriPrice": 7,
          "prPrice": 10,
          "prNum": 10,
          "status": "正常"
        },
        {
          "prId": "112",
          "prName": "NFC橙汁",
          "deptId": "饮品区",
          "costPrice": 4.5,
          "oriPrice": 5,
          "prPrice": 7,
          "prNum": 20,
          "status": "正常"
        },
        {
          "prId": "113",
          "prName": "洗发水",
          "deptId": "洗护用品区",
          "costPrice": 36,
          "oriPrice": 40,
          "prPrice": 50,
          "prNum": 10,
          "status": "正常"
        },
        {
          "prId": "114",
          "prName": "运动鞋",
          "deptId": "鞋帽区",
          "costPrice": 360,
          "oriPrice": 400,
          "prPrice": 520,
          "prNum": 5,
          "status": "正常"
        },
        {
          "prId": "115",
          "prName": "德芙纵享丝滑",
          "deptId": "零食区",
          "costPrice": 16.2,
          "oriPrice": 18,
          "prPrice": 22,
          "prNum": 0,
          "status": "缺货"
        }
      ]
      this.flag = true
      this.$modal.msgSuccess("调拨成功");
      this.loading = false
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const prIds = row.prId || this.ids;
      this.$modal.confirm('是否确认删除该货品').then(function() {
        return delUser(prIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
  }
};
</script>
