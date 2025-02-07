<template>
  <div class="app-container">
    <el-row :gutter="20">
      <!--部门数据-->
      <el-col :span="4" :xs="24">
        <div class="head-container">
          <el-input
            v-model="prName"
            placeholder="请输入商品名称"
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
            node-key="prName"
            default-expand-all
            highlight-current
            @node-click="handleNodeClick"
          >
            <template slot-scope="{ node, data }">
              <span class="node-label">
                <span>{{ data.prName }}</span>
                <el-button
                  size="mini"
                  type="text"
                  icon="el-icon-plus"
                  :disabled="orderParams.status == 1"
                  @click="addItems(data.prName)"
                >添加商品</el-button>
              </span>

            </template>

          </el-tree>
        </div>
      </el-col>

      <!--用户数据-->
      <el-col :span="20" :xs="24">
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button
              type="primary"
              plain
              size="mini"
              @click="handleSubmit"
              :disabled="orderParams.status == 1"
            >提交</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="success"
              plain
              size="mini"
              @click="handleTest"
              :disabled="orderParams.status == 1"
              v-hasPermi="['system:user:test']"
            >审核</el-button>
        </el-col>
        </el-row>
        <el-form :model="orderParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
          <el-form-item label="客户" prop="eqName">
            <el-select v-model="orderParams.omCustomer" placeholder="请选择客户" clearable :disabled="orderParams.status == 1">
              <el-option
                v-for="cus in cusList"
                :key="cus.cusId"
                :label="cus.cusName"
                :value="cus.cusName"
              />
            </el-select>
          </el-form-item>
          <el-form-item label="客户类型" v-if="this.orderParams.omCustomer != undefined">
            <span>{{getStatus(getCusStatus(this.orderParams.omCustomer))}}</span>
          </el-form-item>
          <el-form-item label="总价">
            <span>{{ totalMoney }}</span>
          </el-form-item>
          <el-form-item label="利润">
          <span>{{ benefit }}</span>
          </el-form-item>
        </el-form>
        <el-table :data="items" >
          <el-table-column type="selection" width="50" align="center" />
          <el-table-column label="商品序号" align="center"  v-if="columns[0].visible" >
            <template slot-scope="scope">
              {{ scope.$index + 1 }}
            </template>
          </el-table-column>
          <el-table-column label="商品名称" align="center" key="prName" prop="prName" v-if="columns[1].visible" :show-overflow-tooltip="true" >
<!--            <template slot-scope="scope">-->
<!--              &lt;!&ndash; 在列的 slot 中使用计算属性获取 eqType 对应的 eqtName &ndash;&gt;-->
<!--              {{ getPrName(scope.row.prId) }}-->
<!--&lt;!&ndash;              {{scope.row.prId}}&ndash;&gt;-->
<!--            </template>-->
          </el-table-column>
          <!--          <el-table-column label="用户昵称" align="center" key="nickName" prop="nickName" v-if="columns[2].visible" :show-overflow-tooltip="true" />-->
          <el-table-column label="商品单价" align="center" key="odUnitPrice" prop="odUnitPrice" v-if="columns[3].visible" :show-overflow-tooltip="true" >
            <!--            <template slot-scope="scope">-->
            <!--              &lt;!&ndash; 在列的 slot 中使用计算属性获取 eqType 对应的 eqtName &ndash;&gt;-->
            <!--              {{ getEqtName(scope.row.eqType) }}-->
            <!--            </template>-->
            <template slot-scope="scope">
              {{getPrPrice(scope.row.prName)}}
            </template>
          </el-table-column>
          <el-table-column label="商品数量" align="center" key="prNum" prop="prNum" v-if="columns[4].visible"  >
            <!--            <template slot-scope="scope">-->
            <!--              &lt;!&ndash; 在列的 slot 中使用计算属性获取 eqType 对应的 eqtName &ndash;&gt;-->
            <!--              {{ getArName(scope.row.arId) }}-->
            <!--            </template>-->
            <template slot-scope="scope">
              <el-input-number v-model="scope.row.prNum" size="mini" @change="sortChange(scope.row)" :disabled="orderParams.status == 1"></el-input-number>
            </template>
          </el-table-column>
          <!--          <el-table-column label="状态" align="center" key="status" v-if="columns[5].visible">-->
          <!--            &lt;!&ndash;            <template slot-scope="scope">&ndash;&gt;-->
          <!--            &lt;!&ndash;              <el-switch&ndash;&gt;-->
          <!--            &lt;!&ndash;                v-model="scope.row.status"&ndash;&gt;-->
          <!--            &lt;!&ndash;                active-value="0"&ndash;&gt;-->
          <!--            &lt;!&ndash;                inactive-value="1"&ndash;&gt;-->
          <!--            &lt;!&ndash;                @change="handleStatusChange(scope.row)"&ndash;&gt;-->
          <!--            &lt;!&ndash;              ></el-switch>&ndash;&gt;-->
          <!--            &lt;!&ndash;            </template>&ndash;&gt;-->
          <!--            <template slot-scope="scope">-->
          <!--              <dict-tag :options="dict.type.sys_normal_disable" :value="scope.row.eqStatus"/>-->
          <!--            </template>-->
          <!--          </el-table-column>-->
          <!--          <el-table-column label="创建时间" align="center" prop="createTime" v-if="columns[6].visible" width="160">-->
          <!--            <template slot-scope="scope">-->
          <!--              <span>{{ parseTime(scope.row.createTime) }}</span>-->
          <!--            </template>-->
          <!--          </el-table-column>-->
          <el-table-column
            label="操作"
            align="center"

            class-name="small-padding fixed-width"
          >
            <template slot-scope="scope">
              <!-- <el-button
                size="mini"
                type="text"
                icon="el-icon-edit"
                @click="handleUpdate(scope.row)"
                v-hasPermi="['system:user:edit']"
              >修改</el-button> -->
              <el-button
                size="mini"
                type="text"
                icon="el-icon-delete"
                @click="del(scope.row.prName)"
                :disabled="orderParams.status == 1"
                v-hasPermi="['system:user:remove']"
              >删除</el-button>

            </template>
          </el-table-column>
        </el-table>

        <!--        <pagination-->
        <!--          v-show="total>0"-->
        <!--          :total="total"-->
        <!--          :page.sync="queryParams.pageNum"-->
        <!--          :limit.sync="queryParams.pageSize"-->
        <!--          @pagination="getList"-->
        <!--        />-->
      </el-col>
    </el-row>

    <!-- 添加或修改用户配置对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" label-width="80px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="设备名称" prop="eqName">
              <el-input v-model="form.eqName" placeholder="请输入设备名称" maxlength="30" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="设备类型" prop="eqType">
              <el-select v-model="form.eqType" :show-count="true" placeholder="请选择设备类型">
                <el-option v-for="option in deptOptions" :key="option.eqType" :label="option.eqtName" :value="option.eqType"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="设备负载" prop="eqLoad">
              <el-input v-model="form.eqLoad" placeholder="请输入设备最大负载量" maxlength="11" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="设备限速" prop="eqSpeed">
              <el-input v-model="form.eqSpeed" placeholder="请输入设备限速" maxlength="50" />
            </el-form-item>
          </el-col>
        </el-row>
        <!--        <el-row>-->
        <!--          <el-col :span="12">-->
        <!--            <el-form-item v-if="form.userId == undefined" label="用户名称" prop="userName">-->
        <!--              <el-input v-model="form.userName" placeholder="请输入用户名称" maxlength="30" />-->
        <!--            </el-form-item>-->
        <!--          </el-col>-->
        <!--          <el-col :span="12">-->
        <!--            <el-form-item v-if="form.userId == undefined" label="用户密码" prop="password">-->
        <!--              <el-input v-model="form.password" placeholder="请输入用户密码" type="password" maxlength="20" show-password/>-->
        <!--            </el-form-item>-->
        <!--          </el-col>-->
        <!--        </el-row>-->
        <el-row>
          <el-col :span="12">
            <el-form-item label="运行区域">
              <el-select v-model="form.arId" placeholder="请选择区域">
                <el-option
                  v-for="area in areaOptions"
                  :key="area.arId"
                  :label="area.arName"
                  :value="area.arId"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="状态">
              <el-radio-group v-model="form.eqStatus">
                <el-radio
                  v-for="dict in dict.type.sys_normal_disable"
                  :key="dict.value"
                  :label="dict.value"
                >{{dict.label}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <!--        <el-row>-->
        <!--          <el-col :span="12">-->
        <!--            <el-form-item label="岗位">-->
        <!--              <el-select v-model="form.postIds" multiple placeholder="请选择岗位">-->
        <!--                <el-option-->
        <!--                  v-for="item in postOptions"-->
        <!--                  :key="item.postId"-->
        <!--                  :label="item.postName"-->
        <!--                  :value="item.postId"-->
        <!--                  :disabled="item.status == 1"-->
        <!--                ></el-option>-->
        <!--              </el-select>-->
        <!--            </el-form-item>-->
        <!--          </el-col>-->
        <!--          <el-col :span="12">-->
        <!--            <el-form-item label="角色">-->
        <!--              <el-select v-model="form.roleIds" multiple placeholder="请选择角色">-->
        <!--                <el-option-->
        <!--                  v-for="item in roleOptions"-->
        <!--                  :key="item.roleId"-->
        <!--                  :label="item.roleName"-->
        <!--                  :value="item.roleId"-->
        <!--                  :disabled="item.status == 1"-->
        <!--                ></el-option>-->
        <!--              </el-select>-->
        <!--            </el-form-item>-->
        <!--          </el-col>-->
        <!--        </el-row>-->
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

    <!-- 用户导入对话框 -->
    <!--    <el-dialog :title="upload.title" :visible.sync="upload.open" width="400px" append-to-body>-->
    <!--      <el-upload-->
    <!--        ref="upload"-->
    <!--        :limit="1"-->
    <!--        accept=".xlsx, .xls"-->
    <!--        :headers="upload.headers"-->
    <!--        :action="upload.url + '?updateSupport=' + upload.updateSupport"-->
    <!--        :disabled="upload.isUploading"-->
    <!--        :on-progress="handleFileUploadProgress"-->
    <!--        :on-success="handleFileSuccess"-->
    <!--        :auto-upload="false"-->
    <!--        drag-->
    <!--      >-->
    <!--        <i class="el-icon-upload"></i>-->
    <!--        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>-->
    <!--        <div class="el-upload__tip text-center" slot="tip">-->
    <!--          <div class="el-upload__tip" slot="tip">-->
    <!--            <el-checkbox v-model="upload.updateSupport" /> 是否更新已经存在的用户数据-->
    <!--          </div>-->
    <!--          <span>仅允许导入xls、xlsx格式文件。</span>-->
    <!--          <el-link type="primary" :underline="false" style="font-size:12px;vertical-align: baseline;" @click="importTemplate">下载模板</el-link>-->
    <!--        </div>-->
    <!--      </el-upload>-->
    <!--      <div slot="footer" class="dialog-footer">-->
    <!--        <el-button type="primary" @click="submitFileForm">确 定</el-button>-->
    <!--        <el-button @click="upload.open = false">取 消</el-button>-->
    <!--      </div>-->
    <!--    </el-dialog>-->
  </div>
</template>

<script>
// import { listEquipment, getEquipment, delEquipment, addEquipment, updateEquipment,  } from "@/api/system/eqdetails";
import {listUser, updateUser} from "@/api/monitor/object";
import {addOrderDetails, delOrderDetails, listOrderDetails, updateOrderDetails} from "@/api/system/createOrder";
// import { listArea } from "@/api/system/area";
import { addOrder,getOrder,updateOrder } from "@/api/system/bookmenu";
import { getToken } from "@/utils/auth";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
import {listCustomer} from "@/api/monitor/customer";

export default {
  name: "Equipment",
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
      // 非多个禁用
      multiple: true,
      timeOutFlag:null,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 用户表格数据
      eqList: null,
      itemdata:undefined,
      omId: undefined,
      // 弹出层标题
      title: "",
      // 部门树选项
      deptOptions: undefined,
      // 是否显示弹出层
      open: false,
      // 部门名称
      eqType: undefined,
      prName: undefined,
      // 默认密码
      initPassword: undefined,
      // 日期范围
      dateRange: [],
      // 岗位选项
      postOptions: [],
      //区域选项
      areaOptions: [],
      // 角色选项
      roleOptions: [],
      items:[
        // {
        //   prId:'1760209994586365953',
        //   prNum:1,
        //   odUnitPrice: 10,
        //   odPrSize: "11111",
        //   omId:undefined,
        //   odId:undefined
        // }
      ],
      cusList: [],
      // 表单参数
      form: {},
      defaultProps: {
        // children: "children",
        eqtName: "eqtName"
      },
      // 用户导入参数
      upload: {
        // 是否显示弹出层（用户导入）
        open: false,
        // 弹出层标题（用户导入）
        title: "",
        // 是否禁用上传
        isUploading: false,
        // 是否更新已经存在的用户数据
        updateSupport: 0,
        // 设置上传的请求头部
        headers: { Authorization: "Bearer " + getToken() },
        // 上传的地址
        url: process.env.VUE_APP_BASE_API + "/system/user/importData"
      },
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        omId: undefined,
      },
      orderParams: {
        omId:undefined,
        omCustomer: undefined,
        omTotalPrice: undefined,
        status: "0"
      },
      orderParams2: {
        omId:undefined,
        omCustomer: undefined,
        omTotalPrice: undefined,
        status: "0"
      },
      form2: {
        prId: 111,
        deptId: 105,
        prName: "瓜子",
        prPrice: 7,
        oriPrice: 10,
        prNum: 17,
        status: "0",
      },
      // 列信息
      columns: [
        { key: 0, label: `用户编号`, visible: true },
        { key: 1, label: `用户名称`, visible: true },
        { key: 2, label: `用户昵称`, visible: true },
        { key: 3, label: `部门`, visible: true },
        { key: 4, label: `手机号码`, visible: true },
        { key: 5, label: `状态`, visible: true },
        { key: 6, label: `创建时间`, visible: true }
      ],
      // 表单校验
      rules: {
        userName: [
          { required: true, message: "用户名称不能为空", trigger: "blur" },
          { min: 2, max: 20, message: '用户名称长度必须介于 2 和 20 之间', trigger: 'blur' }
        ],
        nickName: [
          { required: true, message: "用户昵称不能为空", trigger: "blur" }
        ],
        password: [
          { required: true, message: "用户密码不能为空", trigger: "blur" },
          { min: 5, max: 20, message: '用户密码长度必须介于 5 和 20 之间', trigger: 'blur' }
        ],
        email: [
          {
            type: "email",
            message: "请输入正确的邮箱地址",
            trigger: ["blur", "change"]
          }
        ],
        phonenumber: [
          {
            pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
            message: "请输入正确的手机号码",
            trigger: "blur"
          }
        ]
      }
    };
  },
  computed:{
    totalMoney() {
      let money = 0
      this.items.forEach(function (element) {
        element.odUnitPrice = this.getPrPrice(element.prName)
        money += element.prNum * element.odUnitPrice
      }, this);
      console.log(money)
      return money
    },
    benefit() {
      return this.totalMoney * 0.1
    }
  },
  watch: {
    // 根据名称筛选部门树
    prName(val) {
      this.$refs.tree.filter(val);
    }
  },
  created() {
    this.getList();
    this.getItemTree();
    // this.getAreaList();
    this.getConfigKey("sys.user.initPassword").then(response => {
      this.initPassword = response.msg;
    });
    console.log(this.$route.query.id)
    if (this.$route.query.id != -1 && typeof(this.$route.query.id) != "undefined") {
      // this.queryParams.omId = this.$route.query.id;
      // console.log(this.$route.query.id)
      // this.getDetails();
      this.items = [
        {
          prId: 1,
          prName: "瓜子",
          odUnitPrice: 7, // 假设这是原始价格，实际应由getPrPrice动态处理
          prNum: 3
        },
      ]
      this.orderParams.omCustomer = "zzyf"
    }
  },
  methods: {
    /** 查询用户列表 */
    getList() {
      this.loading = true;
      listCustomer().then(response => {
          this.cusList = response.rows;
          console.log(this.cusList);
          this.total = response.total;
          this.loading = false;
        }
      );
    },
    getStatus(st) {
      if(st == 0){
        return "零售客户"
      }else {
        return "批发客户"
      }
    },
    getCusStatus(name) {
      // console.log(id===2)
      const cu = this.cusList.find(item => item.cusName === name);
      // console.log(cl.classId)
      return cu ? cu.status : '';
    },
    getDetails(){
      console.log(this.queryParams.omId)
      getOrder(this.queryParams.omId).then(response => {
        console.log(111)
        this.orderParams.omId = response.data.omId;
        this.orderParams.omCustomer = response.data.omCustomer;
        // console.log("111",this.orderParams.omCustomer)
        this.orderParams.createTime = response.data.createTime;
        this.orderParams.status = response.data.status;
        this.orderParams.omTotalPrice = response.data.omTotalPrice;
      })
      listOrderDetails(this.queryParams).then(response => {
        console.log(this.queryParams)
        console.log(11+response)
        // console.log(11)
        this.items = response.rows;
        console.log(this.items)
        if(this.orderParams.status == "0"){
          this.items.forEach(item => {
            delOrderDetails(item.odId).then()
          })
        }

      })
    },
    // getPrName(prId) {
    //   // this.geteqtyps()
    //   console.log(11)
    //   console.log(this.deptOptions)
    //   const pr = this.deptOptions.find(item => item.prId === prId);
    //   // console.log(eqtype.eqtName);
    //   return pr ? pr.prName : '';
    // },
    getPrName(itemId) {
      let foundItem;
      this.deptOptions.forEach(item => {
        if (item.prId.toString() === itemId.toString()) {
          foundItem = item;
          return; // 找到后立即停止循环
        }
      });
      return foundItem?.prName || 'N/A'; // 或者返回其他默认值/提示信息
    },
    getPrPrice(name) {
      let foundItem;
      this.deptOptions.forEach(item => {
        if (item.prName == name) {
          foundItem = item;
          return; // 找到后立即停止循环
        }
      });
      if(this.getCusStatus(this.orderParams.omCustomer) === "0"){
        console.log("类型： ",this.getCusStatus(this.orderParams.omCustomer))
        return foundItem?.prPrice || 'N/A';
      } else {
        console.log("类型： ",this.getCusStatus(this.orderParams.omCustomer))
        return foundItem?.oriPrice || 'N/A';
      }
      // 或者返回其他默认值/提示信息
    },
    addItems(name){
      if(this.orderParams.omCustomer === undefined) {
        this.$modal.msgWarning("请选择客户");
        return;
      }
      let data = this.items.filter(g => g.prName == name)
      if (data.length > 0) {
        data[0].prNum++
      } else {
        let itemdata = {
          prName:name,
          prNum: 1,
          odUnitPrice: undefined,
          odPrSize: "11111",
          omId:undefined,
          odId:undefined
        }
        this.items.push(itemdata);
        console.log(this.items)
        console.log(itemdata)
      }
      // console.log(this.items)
    },
    del(name) {
      this.items = this.items.filter(g => g.prName != name)
    },
    handleTest(){
      // updateUser(this.form2).then(response => {
      //
      // })
      this.orderParams.status = "1";
      this.orderParams2.omCustomer = this.orderParams.omCustomer;
      this.orderParams2.omTotalPrice = this.orderParams.omTotalPrice;
      this.orderParams2.omId = this.queryParams.omId;
      this.orderParams2.status = this.orderParams.status
      this.$modal.msgSuccess("审核成功");
      // updateOrder(this.orderParams2).then()
    },
    handleSubmit(){
      this.orderParams.omTotalPrice = this.totalMoney;
      console.log(this.orderParams)
      // const trimmedDateTime = this.orderParams.omDeliveryDate.replace('T', ' ').replace('Z', '');
      // const dateObj = new Date(trimmedDateTime);
      // const formattedDateTime = dateObj.toISOString().slice(0, 19).replace('T', ' ');
      // this.orderParams.omDeliveryDate = formattedDateTime
      if(this.queryParams.omId != undefined){
        this.orderParams2.omCustomer = this.orderParams.omCustomer;
        this.orderParams2.omTotalPrice = this.orderParams.omTotalPrice;
        this.orderParams2.omId = this.queryParams.omId;
        this.orderParams2.status = this.orderParams.status
        updateOrder(this.orderParams2).then(response => {
          console.log("update",this.orderParams2)
          this.items.forEach(g => g.omId = this.queryParams.omId);
          console.log(JSON.stringify(this.items))
          this.items.forEach(function (element) {
            // if(element.odId != undefined){
            //   updateOrderDetails(element).then(response => {
            //
            //   })
            // }else{
            addOrderDetails(element).then(response => {
              console.log("add scs")
              // this.getDetails()
            })
            // }
          });
          // const list = this.items.filter(g => g.odId == undefined)
          // updateOrderDetails(JSON.stringify(list)).then(response => {
          //   this.$modal.msgSuccess("修改成功");
          //   this.getDetails()
          // })
          this.$modal.msgSuccess("修改成功");
        })
      }else{
        console.log("else")

        addOrder(this.orderParams).then(response => {
          // this.$modal.msgSuccess("新增成功");
          console.log(response)
          // listUser().then(res => {
          //   this.omId = res.data[res.data.length - 1].omId
          //   this.queryParams.omId = this.omId
          // })
          this.items.forEach(g => g.omId = this.omId);
          // const list = this.items.filter(g => g.odId == undefined)
          console.log(this.items)
          // addOrderDetails(JSON.stringify(list)).then(response => {
          //   this.$modal.msgSuccess("新增成功");
          //   // this.getDetails()
          // })
          this.items.forEach(function (element) {
            if(element.odId == undefined){
              // addOrderDetails(element).then(response => {
              //   this.$modal.msgSuccess("新增成功");
              //   this.getDetails()
              // })
            }
          });
          this.$modal.msgSuccess("新增成功");
        });



      }

    },
    sortChange(currentValue, oldValue,row) {
      // const equipmentId = row.prId || this.ids;
      // console.log(oldValue)
      // console.log(row)
      if (this.timeoutFlag !== null) {
        this.timeoutFlag = null;
        this.$nextTick(() => {
          // 这里可以处理逻辑，如将数值回滚到旧值
          this.currentValue = oldValue;
        });
        return;
      }
      this.timeoutFlag = 'x';
      setTimeout(() => {
        this.timeoutFlag = null;
      }, 200);
    },
    getEqtName(eqType) {
      // this.geteqtyps()
      const eqtype = this.deptOptions.find(item => item.eqType === eqType);
      // console.log(eqtype.eqtName);
      return eqtype ? eqtype.eqtName : '';
    },
    getArName(arId) {
      // this.geteqtyps()
      const aritem = this.areaOptions.find(item => item.arId === arId);
      // console.log(eqtype.eqtName);
      return aritem ? aritem.arName : '';
    },
    // getAreaList() {
    //   listArea().then(response => {
    //     this.areaOptions = response.rows;
    //   })
    // },
    /** 查询部门下拉树结构 */
    getItemTree() {
      listUser().then(response => {
        this.deptOptions = response.rows;
        console.log(this.deptOptions)
      });
    },
    // 筛选节点
    // filterNode(value, data) {
    //   if (!value) return true;
    //   return data.label.indexOf(value) !== -1;
    // },
    filterNode(value, data) {
      if (!value) return true;
      // console.log(data.eqtName.toLowerCase().indexOf(value.toLowerCase()) !== -1)
      // 使用 data.eqtName 进行搜索
      return data.prName.indexOf(value) !== -1;
    },

    // 节点单击事件
    handleNodeClick(data) {
      // console.log(data);
      const foundElement = this.deptOptions.find(element => element.eqtName === data.eqtName);
      console.log(foundElement.eqType)
      this.queryParams.eqType = foundElement.eqType;
      this.handleQuery();
    },
    // // 用户状态修改
    // handleStatusChange(row) {
    //   let text = row.status === "0" ? "启用" : "停用";
    //   this.$modal.confirm('确认要"' + text + '""' + row.userName + '"用户吗？').then(function() {
    //     return changeUserStatus(row.userId, row.status);
    //   }).then(() => {
    //     this.$modal.msgSuccess(text + "成功");
    //   }).catch(function() {
    //     row.status = row.status === "0" ? "1" : "0";
    //   });
    // },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        eqId: undefined,
        eqType: undefined,
        eqName: undefined,
        // nickName: undefined,
        // password: undefined,
        eqLoad: undefined,
        eqSpeed: undefined,
        arId: undefined,
        eqStatus: "0",
        // remark: undefined,
        // postIds: [],
        // roleIds: []
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
      this.dateRange = [];
      this.resetForm("queryForm");
      this.queryParams.eqType = undefined;
      this.$refs.tree.setCurrentKey(null);
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.eqId);
      this.single = selection.length != 1;
      this.multiple = !selection.length;
    },
    // 更多操作触发
    handleCommand(command, row) {
      switch (command) {
        case "handleResetPwd":
          this.handleResetPwd(row);
          break;
        case "handleAuthRole":
          this.handleAuthRole(row);
          break;
        default:
          break;
      }
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      // getUser().then(response => {
      // this.postOptions = response.data.posts;
      // this.roleOptions = response.data.roles;
      this.open = true;
      this.title = "添加设备";
      // this.form.password = this.initPassword;
      // });
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const equipmentId = row.eqId || this.ids;
      getEquipment(equipmentId).then(response => {
        this.form = response.data;
        // this.postOptions = response.data.posts;
        // this.roleOptions = response.data.roles;
        // this.$set(this.form, "postIds", response.data.postIds);
        // this.$set(this.form, "roleIds", response.data.roleIds);
        this.open = true;
        this.title = "修改设备";
        // this.form.password = "";
      });
    },
    // /** 重置密码按钮操作 */
    // handleResetPwd(row) {
    //   this.$prompt('请输入"' + row.userName + '"的新密码', "提示", {
    //     confirmButtonText: "确定",
    //     cancelButtonText: "取消",
    //     closeOnClickModal: false,
    //     inputPattern: /^.{5,20}$/,
    //     inputErrorMessage: "用户密码长度必须介于 5 和 20 之间"
    //   }).then(({ value }) => {
    //     resetUserPwd(row.userId, value).then(response => {
    //       this.$modal.msgSuccess("修改成功，新密码是：" + value);
    //     });
    //   }).catch(() => {});
    // },
    // /** 分配角色操作 */
    // handleAuthRole: function(row) {
    //   const userId = row.userId;
    //   this.$router.push("/system/user-auth/role/" + userId);
    // },
    /** 提交按钮 */
    submitForm: function() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.eqId != undefined) {
            updateEquipment(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addEquipment(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const userIds = row || this.ids;
      // console.log(userIds)
      this.$modal.confirm('是否确认删除用户编号为"' + userIds.odId + '"的数据项？').then(() => {
        if(userIds.odId != undefined){
          console.log(11)
          delOrderDetails(userIds.odId).then(response => {
            console.log(response);
            this.getDetails()
          })
        }else{
          this.del(userIds.prId);
        }
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
      // this.del(userIds)
      console.log(this.items)
    },
    // /** 导出按钮操作 */
    // handleExport() {
    //   this.download('system/user/export', {
    //     ...this.queryParams
    //   }, `user_${new Date().getTime()}.xlsx`)
    // },
    // /** 导入按钮操作 */
    // handleImport() {
    //   this.upload.title = "用户导入";
    //   this.upload.open = true;
    // },
    // /** 下载模板操作 */
    // importTemplate() {
    //   this.download('system/user/importTemplate', {
    //   }, `user_template_${new Date().getTime()}.xlsx`)
    // },
    // // 文件上传中处理
    // handleFileUploadProgress(event, file, fileList) {
    //   this.upload.isUploading = true;
    // },
    // // 文件上传成功处理
    // handleFileSuccess(response, file, fileList) {
    //   this.upload.open = false;
    //   this.upload.isUploading = false;
    //   this.$refs.upload.clearFiles();
    //   this.$alert("<div style='overflow: auto;overflow-x: hidden;max-height: 70vh;padding: 10px 20px 0;'>" + response.msg + "</div>", "导入结果", { dangerouslyUseHTMLString: true });
    //   this.getList();
    // },
    // // 提交上传文件
    // submitFileForm() {
    //   this.$refs.upload.submit();
    // }
  }
};
</script>
