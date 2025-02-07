/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80037
 Source Host           : localhost:3306
 Source Schema         : learn

 Target Server Type    : MySQL
 Target Server Version : 80037
 File Encoding         : 65001

 Date: 23/05/2024 20:46:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_cargo
-- ----------------------------
DROP TABLE IF EXISTS `sys_cargo`;
CREATE TABLE `sys_cargo`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 204 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_cargo
-- ----------------------------
INSERT INTO `sys_cargo` VALUES (100, 0, '0', '佳佳悦批发', 0, 'yxc', '15888888888', '11@qq.com', '0', '0', 'admin', '2023-10-31 22:03:57', 'admin', '2023-11-01 22:22:28');
INSERT INTO `sys_cargo` VALUES (101, 100, '0,100', '食品区', 1, 'yxc', '15888888888', '11@qq.com', '0', '0', 'admin', '2023-10-31 22:03:57', 'admin', '2023-11-09 23:37:27');
INSERT INTO `sys_cargo` VALUES (102, 100, '0,100', '日常用品', 2, 'lzy', '15888888888', '22@qq.com', '0', '0', 'admin', '2023-10-31 22:03:57', 'admin', '2023-11-08 22:25:13');
INSERT INTO `sys_cargo` VALUES (103, 101, '0,100,101', '饮品', 1, 'yxc', '15888888888', '11@qq.com', '0', '0', 'admin', '2023-10-31 22:03:57', 'admin', '2023-11-08 22:43:17');
INSERT INTO `sys_cargo` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-10-31 22:03:57', '', NULL);
INSERT INTO `sys_cargo` VALUES (105, 101, '0,100,101', '零食', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-31 22:03:57', 'admin', '2023-11-09 23:37:11');
INSERT INTO `sys_cargo` VALUES (106, 101, '0,100,101', '食材', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-31 22:03:57', 'admin', '2023-11-09 23:37:37');
INSERT INTO `sys_cargo` VALUES (107, 101, '0,100,101', '销售部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-10-31 22:03:57', 'admin', '2023-11-01 22:28:22');
INSERT INTO `sys_cargo` VALUES (108, 102, '0,100,102', '厨具', 1, '', '', '', '0', '0', 'admin', '2023-10-31 22:03:57', 'admin', '2023-11-09 23:38:13');
INSERT INTO `sys_cargo` VALUES (109, 102, '0,100,102', '洗护用品', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-31 22:03:57', 'admin', '2023-11-09 23:38:24');
INSERT INTO `sys_cargo` VALUES (200, 101, '0,100,101', '水果', 5, NULL, NULL, NULL, '0', '0', 'admin', '2023-11-01 22:28:00', 'admin', '2023-11-09 23:37:46');
INSERT INTO `sys_cargo` VALUES (201, 100, '0,100', '服装区', 3, 'zyf', '15666666666', NULL, '0', '0', 'admin', '2023-11-09 23:38:53', '', NULL);
INSERT INTO `sys_cargo` VALUES (202, 201, '0,100,201', '童装', 1, NULL, NULL, NULL, '0', '0', 'admin', '2023-11-09 23:39:09', '', NULL);
INSERT INTO `sys_cargo` VALUES (203, 201, '0,100,201', '鞋帽', 2, NULL, NULL, NULL, '0', '0', 'admin', '2023-11-09 23:39:35', 'admin', '2023-11-09 23:39:45');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-10-31 22:03:57', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-10-31 22:03:57', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-10-31 22:03:57', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-10-31 22:03:57', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2023-10-31 22:03:57', 'admin', '2023-11-08 22:52:33', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-10-31 22:03:57', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_customer
-- ----------------------------
DROP TABLE IF EXISTS `sys_customer`;
CREATE TABLE `sys_customer`  (
  `cus_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `cus_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '岗位编码',
  `cus_phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '岗位名称',
  `post_sort` int NULL DEFAULT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`cus_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1010 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_customer
-- ----------------------------
INSERT INTO `sys_customer` VALUES (1, 'zzyf', '19812345678', 970, '1', '09vfAqwtAM', '2016-07-27 11:24:06', 'admin', '2024-05-12 22:00:44', 'UDNWc93gIk');
INSERT INTO `sys_customer` VALUES (2, 'yxxc', '15012345678', 694, '0', 'MasMSDj77e', '2002-07-07 19:47:12', 'admin', '2024-05-11 17:00:33', 'rjHRdR8LHj');
INSERT INTO `sys_customer` VALUES (1003, 'lzzy', '13821345678', 0, '0', 'admin', '2023-11-08 15:58:15', 'admin', '2024-05-11 17:00:57', 'qq');
INSERT INTO `sys_customer` VALUES (1007, 'mzqq', '17612345678', NULL, '1', 'admin', '2024-05-11 16:58:41', 'admin', '2024-05-11 17:01:14', NULL);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '佳佳悦批发', 0, 'yxc', '15888888888', '11@qq.com', '0', '0', 'admin', '2023-10-31 22:03:57', 'admin', '2023-11-01 22:22:28');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '总店', 1, 'yxc', '15888888888', '11@qq.com', '0', '0', 'admin', '2023-10-31 22:03:57', 'admin', '2023-11-01 22:27:18');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '分店1', 2, 'lzy', '15888888888', '22@qq.com', '0', '0', 'admin', '2023-10-31 22:03:57', 'admin', '2023-11-01 22:28:52');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '管理部门', 1, 'yxc', '15888888888', '11@qq.com', '0', '0', 'admin', '2023-10-31 22:03:57', 'admin', '2023-11-01 22:26:41');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-10-31 22:03:57', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '采购部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-31 22:03:57', 'admin', '2023-11-01 22:28:09');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-31 22:03:57', 'admin', '2023-11-01 22:28:17');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '销售部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-31 22:03:57', 'admin', '2023-11-01 22:28:22');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '销售部门', 1, '', '', '', '0', '0', 'admin', '2023-10-31 22:03:57', 'admin', '2023-11-01 22:29:38');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-31 22:03:57', '', NULL);
INSERT INTO `sys_dept` VALUES (200, 101, '0,100,101', '仓管部门', 5, NULL, NULL, NULL, '0', '0', 'admin', '2023-11-01 22:28:00', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_good
-- ----------------------------
DROP TABLE IF EXISTS `sys_good`;
CREATE TABLE `sys_good`  (
  `pr_id` int NOT NULL AUTO_INCREMENT COMMENT '货品ID',
  `dept_id` int NULL DEFAULT NULL COMMENT '部门ID',
  `pr_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '货品名称',
  `pr_price` double NULL DEFAULT NULL COMMENT '货品价格',
  `ori_price` double NULL DEFAULT NULL COMMENT '原始价格',
  `pr_num` int NULL DEFAULT NULL COMMENT '货品库存',
  `status` int NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`pr_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_good
-- ----------------------------
INSERT INTO `sys_good` VALUES (111, 105, '瓜子', 10, 7, 20, 0);
INSERT INTO `sys_good` VALUES (112, 103, 'NFC橙汁', 7, 5, 20, 0);
INSERT INTO `sys_good` VALUES (113, 109, '洗发水', 50, 40, 0, NULL);
INSERT INTO `sys_good` VALUES (114, 203, '运动鞋', 520, 400, 10, 0);
INSERT INTO `sys_good` VALUES (115, 105, '德芙纵享丝滑', 22, 18, 0, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-10-31 22:03:57', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 339 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-10-31 22:15:38');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-11-01 12:33:29');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2023-11-01 21:56:38');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-11-01 21:56:43');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-11-01 22:05:29');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2023-11-01 22:46:31');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2023-11-01 22:51:01');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-11-01 22:51:07');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-11-02 20:49:37');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-11-02 23:46:41');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-11-05 19:18:25');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-11-05 22:23:20');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-11-06 00:09:51');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-07 22:10:03');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 08:59:09');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 10:16:21');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 13:04:26');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 15:57:43');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 20:20:37');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 22:48:18');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-11-08 22:48:36');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 22:48:40');
INSERT INTO `sys_logininfor` VALUES (122, 'dianzhang', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2023-11-08 22:52:40');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 22:54:30');
INSERT INTO `sys_logininfor` VALUES (124, 'dianzhang', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 22:54:42');
INSERT INTO `sys_logininfor` VALUES (125, 'dianzhang', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 22:55:21');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 22:55:25');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 22:58:18');
INSERT INTO `sys_logininfor` VALUES (128, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2023-11-08 22:58:39');
INSERT INTO `sys_logininfor` VALUES (129, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 22:58:48');
INSERT INTO `sys_logininfor` VALUES (130, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 22:58:58');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 22:59:01');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 22:59:34');
INSERT INTO `sys_logininfor` VALUES (133, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 22:59:40');
INSERT INTO `sys_logininfor` VALUES (134, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 22:59:51');
INSERT INTO `sys_logininfor` VALUES (135, 'cangguan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2023-11-08 23:00:16');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:00:22');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:01:47');
INSERT INTO `sys_logininfor` VALUES (138, 'cangguan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-11-08 23:01:52');
INSERT INTO `sys_logininfor` VALUES (139, 'cangguan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:01:56');
INSERT INTO `sys_logininfor` VALUES (140, 'cangguan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:02:16');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:02:20');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:03:26');
INSERT INTO `sys_logininfor` VALUES (143, 'cangguan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:03:31');
INSERT INTO `sys_logininfor` VALUES (144, 'cangguan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:04:01');
INSERT INTO `sys_logininfor` VALUES (145, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:04:07');
INSERT INTO `sys_logininfor` VALUES (146, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:07:33');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:07:37');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:17:22');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:17:25');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:18:08');
INSERT INTO `sys_logininfor` VALUES (151, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:18:15');
INSERT INTO `sys_logininfor` VALUES (152, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:18:56');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:19:00');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:22:09');
INSERT INTO `sys_logininfor` VALUES (155, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:22:15');
INSERT INTO `sys_logininfor` VALUES (156, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:27:48');
INSERT INTO `sys_logininfor` VALUES (157, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-11-08 23:27:55');
INSERT INTO `sys_logininfor` VALUES (158, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:27:59');
INSERT INTO `sys_logininfor` VALUES (159, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:31:49');
INSERT INTO `sys_logininfor` VALUES (160, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:31:56');
INSERT INTO `sys_logininfor` VALUES (161, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:32:27');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-11-08 23:32:32');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:32:38');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:34:05');
INSERT INTO `sys_logininfor` VALUES (165, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-11-08 23:34:11');
INSERT INTO `sys_logininfor` VALUES (166, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:34:15');
INSERT INTO `sys_logininfor` VALUES (167, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:34:58');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:35:03');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:40:36');
INSERT INTO `sys_logininfor` VALUES (170, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:40:46');
INSERT INTO `sys_logininfor` VALUES (171, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:41:39');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:41:43');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:45:10');
INSERT INTO `sys_logininfor` VALUES (174, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:45:16');
INSERT INTO `sys_logininfor` VALUES (175, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:46:05');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:46:08');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:46:48');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:46:53');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:47:20');
INSERT INTO `sys_logininfor` VALUES (180, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:47:29');
INSERT INTO `sys_logininfor` VALUES (181, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:47:47');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:47:51');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:48:10');
INSERT INTO `sys_logininfor` VALUES (184, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:48:16');
INSERT INTO `sys_logininfor` VALUES (185, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:49:40');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:49:44');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:50:05');
INSERT INTO `sys_logininfor` VALUES (188, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:50:12');
INSERT INTO `sys_logininfor` VALUES (189, 'dianyuan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:56:24');
INSERT INTO `sys_logininfor` VALUES (190, 'dianzhang', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:56:31');
INSERT INTO `sys_logininfor` VALUES (191, 'dianzhang', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:57:06');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:57:11');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:58:04');
INSERT INTO `sys_logininfor` VALUES (194, 'dy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2023-11-08 23:58:26');
INSERT INTO `sys_logininfor` VALUES (195, 'dy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:58:37');
INSERT INTO `sys_logininfor` VALUES (196, 'dy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:58:44');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:58:46');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:59:11');
INSERT INTO `sys_logininfor` VALUES (199, 'dy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:59:16');
INSERT INTO `sys_logininfor` VALUES (200, 'dy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-08 23:59:38');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-08 23:59:53');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-09 00:00:42');
INSERT INTO `sys_logininfor` VALUES (203, 'dy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-09 00:00:48');
INSERT INTO `sys_logininfor` VALUES (204, 'dy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-09 00:01:05');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-09 00:01:09');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-09 00:01:42');
INSERT INTO `sys_logininfor` VALUES (207, 'dy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-09 00:01:48');
INSERT INTO `sys_logininfor` VALUES (208, 'dy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-09 00:02:07');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-09 00:02:15');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-09 00:05:25');
INSERT INTO `sys_logininfor` VALUES (211, 'dianzhang', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-09 00:05:33');
INSERT INTO `sys_logininfor` VALUES (212, 'dianzhang', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-09 00:05:59');
INSERT INTO `sys_logininfor` VALUES (213, 'dy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-09 00:06:04');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-09 22:58:45');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-09 23:33:16');
INSERT INTO `sys_logininfor` VALUES (216, 'dy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 23:33:28');
INSERT INTO `sys_logininfor` VALUES (217, 'dy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-11-09 23:33:35');
INSERT INTO `sys_logininfor` VALUES (218, 'dy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-09 23:33:39');
INSERT INTO `sys_logininfor` VALUES (219, 'dy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-09 23:36:39');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-09 23:36:44');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-10 09:40:09');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-10 09:49:53');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-10 22:20:43');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-10 22:34:58');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-10 22:41:02');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-11 17:59:21');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-11 18:06:22');
INSERT INTO `sys_logininfor` VALUES (228, 'dianzhang', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-11 18:06:36');
INSERT INTO `sys_logininfor` VALUES (229, 'dianzhang', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-11 18:07:27');
INSERT INTO `sys_logininfor` VALUES (230, 'dy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-11 18:07:32');
INSERT INTO `sys_logininfor` VALUES (231, 'dy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-11 18:08:20');
INSERT INTO `sys_logininfor` VALUES (232, 'dianzhang', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-11 18:08:26');
INSERT INTO `sys_logininfor` VALUES (233, 'dianzhang', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-11 18:09:01');
INSERT INTO `sys_logininfor` VALUES (234, 'caigou', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2023-11-11 18:09:18');
INSERT INTO `sys_logininfor` VALUES (235, 'caigou', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-11-11 18:09:25');
INSERT INTO `sys_logininfor` VALUES (236, 'caigou', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-11 18:09:28');
INSERT INTO `sys_logininfor` VALUES (237, 'caigou', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-11 18:09:34');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-11 18:09:36');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-11 18:10:03');
INSERT INTO `sys_logininfor` VALUES (240, 'caigou', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-11 18:10:08');
INSERT INTO `sys_logininfor` VALUES (241, 'caigou', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-11 18:11:04');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-11 18:11:08');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-11 18:13:33');
INSERT INTO `sys_logininfor` VALUES (244, 'caigou', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-11-11 18:13:38');
INSERT INTO `sys_logininfor` VALUES (245, 'caigou', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-11-11 18:13:42');
INSERT INTO `sys_logininfor` VALUES (246, 'caigou', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-11 18:13:46');
INSERT INTO `sys_logininfor` VALUES (247, 'caigou', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-11 18:14:53');
INSERT INTO `sys_logininfor` VALUES (248, 'cangguan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-11 18:15:07');
INSERT INTO `sys_logininfor` VALUES (249, 'cangguan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-11 18:15:31');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-11 18:15:34');
INSERT INTO `sys_logininfor` VALUES (251, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-11 18:15:50');
INSERT INTO `sys_logininfor` VALUES (252, 'cangguan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-11 18:15:56');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-11 20:52:11');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2023-11-11 21:18:37');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-11 21:31:47');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-11 23:11:24');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-11 23:20:48');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-11 23:22:48');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-11-11 23:30:51');
INSERT INTO `sys_logininfor` VALUES (260, 'dy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-11 23:30:56');
INSERT INTO `sys_logininfor` VALUES (261, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-12 17:52:29');
INSERT INTO `sys_logininfor` VALUES (262, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-11-16 11:38:56');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-04-10 19:30:45');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-04-23 22:27:19');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-04-26 08:43:45');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-02 21:53:14');
INSERT INTO `sys_logininfor` VALUES (267, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-05-02 23:05:29');
INSERT INTO `sys_logininfor` VALUES (268, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-02 23:05:32');
INSERT INTO `sys_logininfor` VALUES (269, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-05-02 23:21:20');
INSERT INTO `sys_logininfor` VALUES (270, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-02 23:21:23');
INSERT INTO `sys_logininfor` VALUES (271, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-03 14:18:58');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-03 15:23:55');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-03 16:19:27');
INSERT INTO `sys_logininfor` VALUES (274, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-03 19:25:07');
INSERT INTO `sys_logininfor` VALUES (275, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-10 17:06:29');
INSERT INTO `sys_logininfor` VALUES (276, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-10 21:19:48');
INSERT INTO `sys_logininfor` VALUES (277, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-10 22:57:55');
INSERT INTO `sys_logininfor` VALUES (278, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-11 15:43:03');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2024-05-11 18:41:30');
INSERT INTO `sys_logininfor` VALUES (280, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-11 18:41:33');
INSERT INTO `sys_logininfor` VALUES (281, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-11 21:47:44');
INSERT INTO `sys_logininfor` VALUES (282, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-11 22:31:49');
INSERT INTO `sys_logininfor` VALUES (283, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-11 22:51:16');
INSERT INTO `sys_logininfor` VALUES (284, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2024-05-12 19:35:03');
INSERT INTO `sys_logininfor` VALUES (285, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-12 19:35:07');
INSERT INTO `sys_logininfor` VALUES (286, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-12 20:12:36');
INSERT INTO `sys_logininfor` VALUES (287, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2024-05-12 20:59:21');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-12 20:59:24');
INSERT INTO `sys_logininfor` VALUES (289, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-05-12 21:56:27');
INSERT INTO `sys_logininfor` VALUES (290, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-12 21:56:58');
INSERT INTO `sys_logininfor` VALUES (291, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-12 23:02:25');
INSERT INTO `sys_logininfor` VALUES (292, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-05-12 23:07:36');
INSERT INTO `sys_logininfor` VALUES (293, 'caigou', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-12 23:07:46');
INSERT INTO `sys_logininfor` VALUES (294, 'caigou', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-05-12 23:08:13');
INSERT INTO `sys_logininfor` VALUES (295, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-12 23:08:17');
INSERT INTO `sys_logininfor` VALUES (296, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-05-12 23:08:51');
INSERT INTO `sys_logininfor` VALUES (297, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-12 23:08:54');
INSERT INTO `sys_logininfor` VALUES (298, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-05-12 23:09:00');
INSERT INTO `sys_logininfor` VALUES (299, 'caigou', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-12 23:09:06');
INSERT INTO `sys_logininfor` VALUES (300, 'caigou', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-05-12 23:09:22');
INSERT INTO `sys_logininfor` VALUES (301, 'dy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-12 23:09:29');
INSERT INTO `sys_logininfor` VALUES (302, 'dy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-05-12 23:11:41');
INSERT INTO `sys_logininfor` VALUES (303, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-12 23:11:46');
INSERT INTO `sys_logininfor` VALUES (304, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-05-12 23:12:17');
INSERT INTO `sys_logininfor` VALUES (305, 'dy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-12 23:12:25');
INSERT INTO `sys_logininfor` VALUES (306, 'dy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-05-12 23:16:49');
INSERT INTO `sys_logininfor` VALUES (307, 'cangguan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-12 23:16:59');
INSERT INTO `sys_logininfor` VALUES (308, 'cangguan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-05-12 23:17:11');
INSERT INTO `sys_logininfor` VALUES (309, 'dianzhang', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-12 23:17:21');
INSERT INTO `sys_logininfor` VALUES (310, 'dianzhang', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-05-12 23:27:53');
INSERT INTO `sys_logininfor` VALUES (311, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-12 23:27:57');
INSERT INTO `sys_logininfor` VALUES (312, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2024-05-15 16:08:33');
INSERT INTO `sys_logininfor` VALUES (313, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-15 16:08:36');
INSERT INTO `sys_logininfor` VALUES (314, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-15 17:37:06');
INSERT INTO `sys_logininfor` VALUES (315, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-21 16:55:32');
INSERT INTO `sys_logininfor` VALUES (316, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-21 17:43:26');
INSERT INTO `sys_logininfor` VALUES (317, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-21 21:02:28');
INSERT INTO `sys_logininfor` VALUES (318, 'zyf', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-05-21 22:35:34');
INSERT INTO `sys_logininfor` VALUES (319, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-22 16:35:19');
INSERT INTO `sys_logininfor` VALUES (320, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-05-22 17:16:43');
INSERT INTO `sys_logininfor` VALUES (321, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-22 17:17:56');
INSERT INTO `sys_logininfor` VALUES (322, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-05-22 17:28:30');
INSERT INTO `sys_logininfor` VALUES (323, 'dy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-22 17:28:41');
INSERT INTO `sys_logininfor` VALUES (324, 'dy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-05-22 17:29:02');
INSERT INTO `sys_logininfor` VALUES (325, 'caigou', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-22 17:29:07');
INSERT INTO `sys_logininfor` VALUES (326, 'caigou', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-05-22 17:29:25');
INSERT INTO `sys_logininfor` VALUES (327, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-22 17:29:46');
INSERT INTO `sys_logininfor` VALUES (328, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-05-22 17:37:37');
INSERT INTO `sys_logininfor` VALUES (329, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-22 19:04:42');
INSERT INTO `sys_logininfor` VALUES (330, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-05-22 19:37:26');
INSERT INTO `sys_logininfor` VALUES (331, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-22 20:07:31');
INSERT INTO `sys_logininfor` VALUES (332, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-05-22 20:20:17');
INSERT INTO `sys_logininfor` VALUES (333, 'dianzhang', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-22 20:20:24');
INSERT INTO `sys_logininfor` VALUES (334, 'dianzhang', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-05-22 20:21:31');
INSERT INTO `sys_logininfor` VALUES (335, 'dy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-22 20:21:39');
INSERT INTO `sys_logininfor` VALUES (336, 'dy', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-05-22 20:22:13');
INSERT INTO `sys_logininfor` VALUES (337, 'cangguan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2024-05-22 20:22:19');
INSERT INTO `sys_logininfor` VALUES (338, 'cangguan', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2024-05-22 20:22:46');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2011 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-10-31 22:03:57', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '销售管理', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'shopping', 'admin', '2023-10-31 22:03:57', 'admin', '2023-11-05 20:42:32', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '1', '0', '', 'tool', 'admin', '2023-10-31 22:03:57', 'admin', '2024-05-11 18:46:49', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-10-31 22:03:57', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-10-31 22:03:57', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 5, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-10-31 22:03:57', 'admin', '2024-05-12 22:00:16', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-10-31 22:03:57', 'admin', '2024-05-12 22:00:04', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '1', '0', 'system:post:list', 'post', 'admin', '2023-10-31 22:03:57', 'admin', '2024-05-12 22:00:09', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '1', '0', 'system:dict:list', 'dict', 'admin', '2023-10-31 22:03:57', 'admin', '2024-05-11 22:34:09', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '1', '0', 'system:config:list', 'edit', 'admin', '2023-10-31 22:03:57', 'admin', '2024-05-11 22:34:15', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-10-31 22:03:57', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '1', '0', '', 'log', 'admin', '2023-10-31 22:03:57', 'admin', '2024-05-11 22:34:20', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '1', '0', 'monitor:online:list', 'online', 'admin', '2023-10-31 22:03:57', 'admin', '2024-05-11 22:32:21', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-10-31 22:03:57', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-10-31 22:03:57', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-10-31 22:03:57', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-10-31 22:03:57', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-10-31 22:03:57', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '供货商管理', 2008, 6, 'supplier', 'supplier/index', NULL, 1, 0, 'C', '0', '0', 'system:supplier:list', 'form', 'admin', '2023-11-01 12:41:04', 'admin', '2024-05-12 21:00:38', '');
INSERT INTO `sys_menu` VALUES (2001, '客户管理', 2, 1, 'addorder', 'monitor/customer/index', NULL, 1, 0, 'C', '0', '0', 'monitor:customer:list', 'row', 'admin', '2023-11-05 20:47:04', 'admin', '2023-11-08 23:18:00', '');
INSERT INTO `sys_menu` VALUES (2002, '货品管理', 2, 2, 'object', 'monitor/object/index', NULL, 1, 0, 'C', '0', '0', 'monitor:object:list', 'theme', 'admin', '2023-11-05 21:04:41', 'admin', '2023-11-08 23:20:05', '');
INSERT INTO `sys_menu` VALUES (2003, '订单管理', 2, 2, 'bookmenu', 'system/bookmenu/index', NULL, 1, 0, 'C', '0', '0', '', 'list', 'admin', '2023-11-05 21:41:52', 'admin', '2024-05-02 21:55:33', '');
INSERT INTO `sys_menu` VALUES (2004, '供货商页面', 0, 6, 'seller', 'seller/index', NULL, 1, 0, 'C', '1', '0', '', 'post', 'admin', '2023-11-05 21:53:19', 'admin', '2024-05-11 18:47:19', '');
INSERT INTO `sys_menu` VALUES (2005, '商品分区管理', 2, 3, 'categary', 'monitor/categary/index', NULL, 1, 0, 'C', '0', '0', 'monitor:categary:list', 'example', 'admin', '2023-11-05 22:56:06', 'admin', '2023-11-08 23:42:21', '');
INSERT INTO `sys_menu` VALUES (2007, '数据大屏', 0, 4, 'dataVenterprise', NULL, NULL, 1, 0, 'C', '0', '0', NULL, 'redis-list', 'admin', '2024-05-11 22:48:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '采购管理', 0, 3, 'purchaseObject', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'search', 'admin', '2024-05-12 21:00:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '货品采购', 2008, 2, 'purchase', 'monitor/purchase/index', NULL, 1, 0, 'C', '0', '0', '', 'button', 'admin', '2024-05-12 21:01:15', 'admin', '2024-05-12 21:01:45', '');
INSERT INTO `sys_menu` VALUES (2010, '仓库管理', 2008, 1, 'warehouse', 'system/wareHouses/index', NULL, 1, 0, 'C', '0', '0', '', 'table', 'admin', '2024-05-21 17:46:26', 'admin', '2024-05-21 17:47:08', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '新品上市啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-10-31 22:03:57', 'admin', '2023-11-09 23:57:50', '管理员');
INSERT INTO `sys_notice` VALUES (2, '国庆放假通知', '1', 0x3C703EE694BEE581873130303030303030E5A4A93C2F703E, '0', 'admin', '2023-10-31 22:03:57', 'admin', '2024-05-22 17:00:30', '管理员');
INSERT INTO `sys_notice` VALUES (3, '六一儿童节放假通知', '1', 0x3C703E3C62723E3C2F703E, '0', 'admin', '2024-05-22 17:00:49', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 662 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-10-31 22:03:57\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"库存管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 12:34:17', 40);
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"供货商管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 12:41:04', 13);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-11-01 12:41:04\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"供货商管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 12:41:36', 12);
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-10-31 22:03:57\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 12:43:19', 15);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-11-01 12:41:04\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"供货商管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 12:43:32', 11);
INSERT INTO `sys_oper_log` VALUES (105, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-10-31 22:03:57\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"店员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 22:06:33', 65);
INSERT INTO `sys_oper_log` VALUES (106, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":true,\"createTime\":\"2023-10-31 22:03:57\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"remark\":\"超级管理员\",\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"经理\",\"roleSort\":1,\"status\":\"0\"}', NULL, 1, '不允许操作超级管理员角色', '2023-11-01 22:07:13', 1);
INSERT INTO `sys_oper_log` VALUES (107, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-10-31 22:03:57\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"店员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 22:09:03', 29);
INSERT INTO `sys_oper_log` VALUES (108, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"email\":\"11@qq.com\",\"leader\":\"yxc\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 22:19:17', 17);
INSERT INTO `sys_oper_log` VALUES (109, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"佳佳悦批发\",\"email\":\"11@qq.com\",\"leader\":\"yxc\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 22:22:28', 24);
INSERT INTO `sys_oper_log` VALUES (110, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"深圳总公司\",\"email\":\"11@qq.com\",\"leader\":\"yxc\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"佳佳悦批发\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 22:22:52', 36);
INSERT INTO `sys_oper_log` VALUES (111, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"深圳总公司\",\"email\":\"11@qq.com\",\"leader\":\"yxc\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"佳佳悦批发\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 22:23:37', 27);
INSERT INTO `sys_oper_log` VALUES (112, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-11-01 22:25:02', 9);
INSERT INTO `sys_oper_log` VALUES (113, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/1,2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"当前用户不能删除\",\"code\":500}', 0, NULL, '2023-11-01 22:25:52', 0);
INSERT INTO `sys_oper_log` VALUES (114, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 22:26:03', 26);
INSERT INTO `sys_oper_log` VALUES (115, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 22:26:15', 28);
INSERT INTO `sys_oper_log` VALUES (116, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"管理部门\",\"email\":\"11@qq.com\",\"leader\":\"yxc\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"深圳总公司\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 22:26:41', 18);
INSERT INTO `sys_oper_log` VALUES (117, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"采购部门\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"parentName\":\"深圳总公司\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 22:27:00', 31);
INSERT INTO `sys_oper_log` VALUES (118, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"总店\",\"email\":\"11@qq.com\",\"leader\":\"yxc\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"佳佳悦批发\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 22:27:18', 60);
INSERT INTO `sys_oper_log` VALUES (119, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":107,\"deptName\":\"销售部门\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":5,\"params\":{},\"parentId\":101,\"parentName\":\"总店\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 22:27:36', 16);
INSERT INTO `sys_oper_log` VALUES (120, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"仓管部门\",\"orderNum\":5,\"params\":{},\"parentId\":101,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 22:28:00', 15);
INSERT INTO `sys_oper_log` VALUES (121, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"采购部门\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"parentName\":\"总店\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 22:28:09', 22);
INSERT INTO `sys_oper_log` VALUES (122, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":106,\"deptName\":\"财务部门\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"parentName\":\"总店\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 22:28:17', 24);
INSERT INTO `sys_oper_log` VALUES (123, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":107,\"deptName\":\"销售部门\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":4,\"params\":{},\"parentId\":101,\"parentName\":\"总店\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 22:28:22', 13);
INSERT INTO `sys_oper_log` VALUES (124, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"分店1\",\"email\":\"22@qq.com\",\"leader\":\"lzy\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"parentName\":\"佳佳悦批发\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 22:28:52', 25);
INSERT INTO `sys_oper_log` VALUES (125, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":108,\"deptName\":\"销售部门\",\"email\":\"\",\"leader\":\"\",\"orderNum\":1,\"params\":{},\"parentId\":102,\"parentName\":\"分店1\",\"phone\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 22:29:38', 19);
INSERT INTO `sys_oper_log` VALUES (126, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-10-31 22:03:57\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{\"@type\":\"java.util.HashMap\"},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"ry@163.com\",\"loginDate\":\"2023-11-01 21:56:43\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"经理\",\"params\":{\"@type\":\"java.util.HashMap\"},\"phonenumber\":\"15888888888\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{\"@type\":\"java.util.HashMap\"},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 22:30:24', 27);
INSERT INTO `sys_oper_log` VALUES (127, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-10-31 22:03:57\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{\"@type\":\"java.util.HashMap\"},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"ry@163.com\",\"loginDate\":\"2023-11-01 21:56:43\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"周经理\",\"params\":{\"@type\":\"java.util.HashMap\"},\"phonenumber\":\"15888888888\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{\"@type\":\"java.util.HashMap\"},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 22:30:38', 21);
INSERT INTO `sys_oper_log` VALUES (128, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":100,\"roleKey\":\"purchase\",\"roleName\":\"采购人员\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 22:42:59', 18);
INSERT INTO `sys_oper_log` VALUES (129, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-11-01 22:42:59\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":100,\"roleKey\":\"purchase\",\"roleName\":\"采购人员\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 22:51:14', 15);
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_config\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 23:01:26', 64);
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_config\"}', NULL, 0, NULL, '2023-11-01 23:01:30', 264);
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-01 23:03:25', 20);
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"supplier/index\",\"createTime\":\"2023-11-01 12:41:04\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"供货商管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"supplier\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 21:28:35', 18);
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"supplier/index\",\"createTime\":\"2023-11-01 12:41:04\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"供货商管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"supplier\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-02 21:32:32', 19);
INSERT INTO `sys_oper_log` VALUES (135, '岗位管理', 1, 'com.ruoyi.web.controller.system.SupplierController.add()', 'POST', 1, 'admin', NULL, '/system/supplier', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postCode\":\"11\",\"postId\":1001,\"postName\":\"1111\",\"postSort\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 19:21:54', 25);
INSERT INTO `sys_oper_log` VALUES (136, '岗位管理', 3, 'com.ruoyi.web.controller.system.SupplierController.remove()', 'DELETE', 1, 'admin', NULL, '/system/supplier/1', '127.0.0.1', '内网IP', '{}', NULL, 1, 'Leung Siu Wai已分配,不能删除', '2023-11-05 19:53:04', 30);
INSERT INTO `sys_oper_log` VALUES (137, '岗位管理', 2, 'com.ruoyi.web.controller.system.SupplierController.edit()', 'PUT', 1, 'admin', NULL, '/system/supplier', '127.0.0.1', '内网IP', '{\"createBy\":\"IpMn9hqLOZ\",\"createTime\":\"2020-12-28 14:07:07\",\"flag\":false,\"params\":{},\"postCode\":\"cixqOVPG9F\",\"postId\":1,\"postName\":\"Leung Siu Wa\",\"postSort\":783,\"remark\":\"ekg6lQ09sA\",\"status\":\"i\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 19:55:21', 55);
INSERT INTO `sys_oper_log` VALUES (138, '岗位管理', 2, 'com.ruoyi.web.controller.system.SupplierController.edit()', 'PUT', 1, 'admin', NULL, '/system/supplier', '127.0.0.1', '内网IP', '{\"createBy\":\"IpMn9hqLOZ\",\"createTime\":\"2020-12-28 14:07:07\",\"flag\":false,\"params\":{},\"postCode\":\"威海市环翠区\",\"postId\":1,\"postName\":\"家家悦\",\"postSort\":783,\"remark\":\"ekg6lQ09sA\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 19:58:52', 24);
INSERT INTO `sys_oper_log` VALUES (139, '岗位管理', 2, 'com.ruoyi.web.controller.system.SupplierController.edit()', 'PUT', 1, 'admin', NULL, '/system/supplier', '127.0.0.1', '内网IP', '{\"createBy\":\"IpMn9hqLOZ\",\"createTime\":\"2020-12-28 14:07:07\",\"flag\":false,\"params\":{},\"postCode\":\"家家悦\",\"postId\":1,\"postName\":\"家家悦\",\"postSort\":783,\"remark\":\"ekg6lQ09sA\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 20:04:18', 14);
INSERT INTO `sys_oper_log` VALUES (140, '岗位管理', 2, 'com.ruoyi.web.controller.system.SupplierController.edit()', 'PUT', 1, 'admin', NULL, '/system/supplier', '127.0.0.1', '内网IP', '{\"createBy\":\"IpMn9hqLOZ\",\"createTime\":\"2020-12-28 14:07:07\",\"flag\":false,\"params\":{},\"postCode\":\"家家悦\",\"postId\":1,\"postName\":\"威海环翠区\",\"postSort\":783,\"remark\":\"ekg6lQ09sA\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 20:06:24', 11);
INSERT INTO `sys_oper_log` VALUES (141, '岗位管理', 5, 'com.ruoyi.web.controller.system.SysPostController.export()', 'POST', 1, 'admin', NULL, '/system/post/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-05 20:14:26', 942);
INSERT INTO `sys_oper_log` VALUES (142, '岗位管理', 2, 'com.ruoyi.web.controller.system.SupplierController.edit()', 'PUT', 1, 'admin', NULL, '/system/supplier', '127.0.0.1', '内网IP', '{\"createBy\":\"IpMn9hqLOZ\",\"createTime\":\"2020-12-28 14:07:07\",\"flag\":false,\"params\":{},\"postCode\":\"家家悦\",\"postId\":1,\"postName\":\"威海环翠区\",\"postSort\":783,\"remark\":\"ekg6lQ09sA\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 20:15:23', 13);
INSERT INTO `sys_oper_log` VALUES (143, '岗位管理', 1, 'com.ruoyi.web.controller.system.SupplierController.add()', 'POST', 1, 'admin', NULL, '/system/supplier', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postCode\":\"肯德基\",\"postId\":1002,\"postName\":\"北京海淀\",\"postSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 20:17:59', 11);
INSERT INTO `sys_oper_log` VALUES (144, '岗位管理', 2, 'com.ruoyi.web.controller.system.SupplierController.edit()', 'PUT', 1, 'admin', NULL, '/system/supplier', '127.0.0.1', '内网IP', '{\"createBy\":\"IpMn9hqLOZ\",\"createTime\":\"2020-12-28 14:07:07\",\"flag\":false,\"params\":{},\"postCode\":\"家家悦\",\"postId\":1,\"postName\":\"威海环翠区\",\"postSort\":783,\"remark\":\"ekg6lQ09sA\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 20:40:33', 14);
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-10-31 22:03:57\",\"icon\":\"shopping\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"销售管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 20:42:32', 42);
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"/tool/order.vue\",\"createBy\":\"admin\",\"icon\":\"row\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"添加订单\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2,\"path\":\"addorder\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 20:47:04', 19);
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"/monitor/addorder.vue\",\"createTime\":\"2023-11-05 20:47:04\",\"icon\":\"row\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"添加订单\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2,\"path\":\"addorder\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 20:49:19', 19);
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"/monitor/addorder.vue\",\"createTime\":\"2023-11-05 20:47:04\",\"icon\":\"row\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"添加订单\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2,\"path\":\"addorder\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 20:49:28', 18);
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"/monitor/addorder/index.vue\",\"createTime\":\"2023-11-05 20:47:04\",\"icon\":\"row\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"添加订单\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2,\"path\":\"addorder\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 20:50:21', 23);
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/addorder/index.vue\",\"createTime\":\"2023-11-05 20:47:04\",\"icon\":\"row\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"添加订单\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2,\"path\":\"addorder\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 20:55:52', 22);
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/addorder/index\",\"createTime\":\"2023-11-05 20:47:04\",\"icon\":\"row\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"添加订单\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2,\"path\":\"addorder\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 20:56:04', 13);
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/111', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-11-05 20:58:11', 7);
INSERT INTO `sys_oper_log` VALUES (153, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/112', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-11-05 20:58:52', 3);
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/111', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-11-05 21:00:47', 6);
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/112', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 21:01:11', 20);
INSERT INTO `sys_oper_log` VALUES (156, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/111', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 21:01:51', 12);
INSERT INTO `sys_oper_log` VALUES (157, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/113', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 21:01:54', 17);
INSERT INTO `sys_oper_log` VALUES (158, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/114', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 21:01:57', 17);
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/object/index\",\"createBy\":\"admin\",\"icon\":\"theme\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"货品管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2,\"path\":\"object\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 21:04:41', 25);
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/addorder/index\",\"createTime\":\"2023-11-05 20:47:04\",\"icon\":\"row\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"客户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2,\"path\":\"addorder\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 21:24:16', 17);
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/customer/index\",\"createTime\":\"2023-11-05 20:47:04\",\"icon\":\"row\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"客户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2,\"path\":\"addorder\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 21:24:30', 16);
INSERT INTO `sys_oper_log` VALUES (162, '岗位管理', 2, 'com.ruoyi.web.controller.system.SupplierController.edit()', 'PUT', 1, 'admin', NULL, '/system/supplier', '127.0.0.1', '内网IP', '{\"createBy\":\"IpMn9hqLOZ\",\"createTime\":\"2020-12-28 14:07:07\",\"flag\":false,\"params\":{},\"postCode\":\"家家悦\",\"postId\":1,\"postName\":\"威海环翠区\",\"postSort\":783,\"remark\":\"ekg6lQ09sA\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 21:39:08', 19);
INSERT INTO `sys_oper_log` VALUES (163, '岗位管理', 2, 'com.ruoyi.web.controller.system.SupplierController.edit()', 'PUT', 1, 'admin', NULL, '/system/supplier', '127.0.0.1', '内网IP', '{\"createBy\":\"IpMn9hqLOZ\",\"createTime\":\"2020-12-28 14:07:07\",\"flag\":false,\"params\":{},\"postCode\":\"家家悦\",\"postId\":1,\"postName\":\"威海环翠区\",\"postSort\":783,\"remark\":\"ekg6lQ09sA\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 21:39:16', 18);
INSERT INTO `sys_oper_log` VALUES (164, '岗位管理', 2, 'com.ruoyi.web.controller.system.SupplierController.edit()', 'PUT', 1, 'admin', NULL, '/system/supplier', '127.0.0.1', '内网IP', '{\"createBy\":\"IpMn9hqLOZ\",\"createTime\":\"2020-12-28 14:07:07\",\"flag\":false,\"params\":{},\"postCode\":\"家家悦\",\"postId\":1,\"postName\":\"威海环翠区\",\"postSort\":783,\"remark\":\"ekg6lQ09sA\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 21:39:22', 26);
INSERT INTO `sys_oper_log` VALUES (165, '岗位管理', 2, 'com.ruoyi.web.controller.system.SupplierController.edit()', 'PUT', 1, 'admin', NULL, '/system/supplier', '127.0.0.1', '内网IP', '{\"createBy\":\"IpMn9hqLOZ\",\"createTime\":\"2020-12-28 14:07:07\",\"flag\":false,\"params\":{},\"postCode\":\"家家悦\",\"postId\":1,\"postName\":\"威海环翠区\",\"postSort\":783,\"remark\":\"ekg6lQ09sA\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 21:39:44', 6);
INSERT INTO `sys_oper_log` VALUES (166, '岗位管理', 2, 'com.ruoyi.web.controller.system.SupplierController.edit()', 'PUT', 1, 'admin', NULL, '/system/supplier', '127.0.0.1', '内网IP', '{\"createBy\":\"IpMn9hqLOZ\",\"createTime\":\"2020-12-28 14:07:07\",\"flag\":false,\"params\":{},\"postCode\":\"家家悦\",\"postId\":1,\"postName\":\"威海环翠区\",\"postSort\":783,\"remark\":\"ekg6lQ09sA\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 21:39:52', 17);
INSERT INTO `sys_oper_log` VALUES (167, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/order/index\",\"createBy\":\"admin\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"订单管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2,\"path\":\"order\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 21:41:52', 19);
INSERT INTO `sys_oper_log` VALUES (168, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/110', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2023-11-05 21:48:53', 12);
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/110', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2023-11-05 21:49:23', 3);
INSERT INTO `sys_oper_log` VALUES (170, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/110', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 21:51:11', 25);
INSERT INTO `sys_oper_log` VALUES (171, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"seller/index\",\"createBy\":\"admin\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"供货商页面\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"seller\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 21:53:19', 83);
INSERT INTO `sys_oper_log` VALUES (172, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/categary/index\",\"createBy\":\"admin\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"商品分区管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2,\"path\":\"categary\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-05 22:56:06', 101);
INSERT INTO `sys_oper_log` VALUES (173, '部门管理', 2, 'com.ruoyi.web.controller.system.SysCargoController.edit()', 'PUT', 1, 'admin', NULL, '/system/cargo', '127.0.0.1', '内网IP', '{\"ancestors\":\"4324\",\"children\":[],\"deptId\":23424,\"deptName\":\"5\",\"email\":\"1111111111@qq.com\",\"leader\":\"4324\",\"orderNum\":0,\"params\":{},\"parentId\":324324,\"phone\":\"15066726777\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 00:17:30', 50);
INSERT INTO `sys_oper_log` VALUES (174, '部门管理', 1, 'com.ruoyi.web.controller.system.SysCargoController.add()', 'POST', 1, 'admin', NULL, '/system/cargo', '127.0.0.1', '内网IP', '{\"ancestors\":\"4324,23424\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"lll\",\"email\":\"1111111111@qq.com\",\"leader\":\"111\",\"orderNum\":1,\"params\":{},\"parentId\":23424,\"phone\":\"15423689878\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 00:18:02', 20);
INSERT INTO `sys_oper_log` VALUES (175, '部门管理', 3, 'com.ruoyi.web.controller.system.SysCargoController.remove()', 'DELETE', 1, 'admin', NULL, '/system/cargo/23424', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2023-11-06 00:19:28', 6);
INSERT INTO `sys_oper_log` VALUES (176, '部门管理', 3, 'com.ruoyi.web.controller.system.SysCargoController.remove()', 'DELETE', 1, 'admin', NULL, '/system/cargo/23425', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 00:19:32', 27);
INSERT INTO `sys_oper_log` VALUES (177, '部门管理', 3, 'com.ruoyi.web.controller.system.SysCargoController.remove()', 'DELETE', 1, 'admin', NULL, '/system/cargo/23424', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-06 00:19:35', 28);
INSERT INTO `sys_oper_log` VALUES (178, '部门管理', 2, 'com.ruoyi.web.controller.system.SysCargoController.edit()', 'PUT', 1, 'admin', NULL, '/system/cargo', '127.0.0.1', '内网IP', '{\"ancestors\":\"324\",\"children\":[],\"deptId\":23,\"deptName\":\"家家悦总部\",\"orderNum\":1,\"params\":{},\"parentId\":324,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 22:10:47', 29);
INSERT INTO `sys_oper_log` VALUES (179, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"111\",\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":100,\"userName\":\"mingguang\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 22:26:35', 241);
INSERT INTO `sys_oper_log` VALUES (180, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-11-07 22:26:35\",\"delFlag\":\"0\",\"deptId\":105,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"111\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"店员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"mingguang\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 22:27:14', 33);
INSERT INTO `sys_oper_log` VALUES (181, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-11-07 22:26:35\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"采购部门\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"111\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"店员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"mingguang\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 22:27:40', 24);
INSERT INTO `sys_oper_log` VALUES (182, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/try\",\"createBy\":\"admin\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"try一try\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":1,\"path\":\"try\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 22:32:59', 22);
INSERT INTO `sys_oper_log` VALUES (183, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-11-07 22:26:35\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"采购部门\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"111\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"purchase\",\"roleName\":\"采购人员\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"mingguang\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-07 23:56:12', 30);
INSERT INTO `sys_oper_log` VALUES (184, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-11-07 22:26:35\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"采购部门\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"111\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"purchase\",\"roleName\":\"采购人员\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"mingguang\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 10:48:41', 47);
INSERT INTO `sys_oper_log` VALUES (185, '岗位管理', 1, 'com.ruoyi.web.controller.system.CustomerController.add()', 'POST', 1, 'admin', NULL, '/system/customer', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postCode\":\"qq\",\"postId\":1003,\"postName\":\"qq\",\"postSort\":0,\"remark\":\"qq\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 15:58:15', 27);
INSERT INTO `sys_oper_log` VALUES (186, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptId\":103,\"email\":\"\",\"nickName\":\"122\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userName\":\"admin\"}', '{\"msg\":\"新增用户\'admin\'失败，登录账号已存在\",\"code\":500}', 0, NULL, '2023-11-08 16:38:18', 32);
INSERT INTO `sys_oper_log` VALUES (187, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"email\":\"\",\"nickName\":\"122\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":101,\"userName\":\"admin12313\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 16:38:23', 235);
INSERT INTO `sys_oper_log` VALUES (188, '部门管理', 1, 'com.ruoyi.web.controller.system.SysCargoController.add()', 'POST', 1, 'admin', NULL, '/system/cargo', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"111\",\"email\":\"\",\"leader\":\"1111\",\"orderNum\":1,\"params\":{},\"phone\":\"\",\"status\":\"0\"}', NULL, 1, 'Cannot invoke \"com.ruoyi.common.core.domain.entity.SysCargo.getStatus()\" because \"info\" is null', '2023-11-08 20:39:17', 65);
INSERT INTO `sys_oper_log` VALUES (189, '部门管理', 3, 'com.ruoyi.web.controller.system.SysCargoController.remove()', 'DELETE', 1, 'admin', NULL, '/system/cargo/107', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 20:46:00', 38);
INSERT INTO `sys_oper_log` VALUES (190, '岗位管理', 2, 'com.ruoyi.web.controller.system.CustomerController.edit()', 'PUT', 1, 'admin', NULL, '/system/customer', '127.0.0.1', '内网IP', '{\"createBy\":\"09vfAqwtAM\",\"createTime\":\"2016-07-27 11:24:06\",\"flag\":false,\"params\":{},\"postCode\":\"李华\",\"postId\":1,\"postName\":\"15666666666\",\"postSort\":970,\"remark\":\"UDNWc93gIk\",\"status\":\"k\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 21:32:45', 21);
INSERT INTO `sys_oper_log` VALUES (191, '用户管理', 2, 'com.ruoyi.web.controller.system.SysGoodController.edit()', 'PUT', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-11-07 22:26:35\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"采购部门\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"222\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"purchase\",\"roleName\":\"采购人员\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"mingguang\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 21:52:39', 75);
INSERT INTO `sys_oper_log` VALUES (192, '用户管理', 2, 'com.ruoyi.web.controller.system.SysGoodController.edit()', 'PUT', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-11-07 22:26:35\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"采购部门\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"222\",\"params\":{},\"phonenumber\":\"150\",\"postIds\":[],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"purchase\",\"roleName\":\"采购人员\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"mingguang\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 21:57:00', 19);
INSERT INTO `sys_oper_log` VALUES (193, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userName\":\"111\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\LEO\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysGoodMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysGoodMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_good(                  user_name,                                     password,       status,       create_by,            create_time    )values(                  ?,                                     ?,       ?,       ?,            sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\n; Field \'nick_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value', '2023-11-08 21:57:28', 223);
INSERT INTO `sys_oper_log` VALUES (194, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"111\",\"params\":{},\"phonenumber\":\"111\",\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userName\":\"111\"}', NULL, 1, 'rawPassword cannot be null', '2023-11-08 22:01:12', 4);
INSERT INTO `sys_oper_log` VALUES (195, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"111\",\"params\":{},\"phonenumber\":\"111\",\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userName\":\"111\"}', NULL, 1, 'rawPassword cannot be null', '2023-11-08 22:01:56', 7);
INSERT INTO `sys_oper_log` VALUES (196, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"111\",\"params\":{},\"phonenumber\":\"111\",\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":102,\"userName\":\"111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 22:04:01', 132);
INSERT INTO `sys_oper_log` VALUES (197, '用户管理', 3, 'com.ruoyi.web.controller.system.SysGoodController.remove()', 'DELETE', 1, 'admin', NULL, '/system/good/102', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 22:04:09', 13);
INSERT INTO `sys_oper_log` VALUES (198, '岗位管理', 2, 'com.ruoyi.web.controller.system.OrderController.edit()', 'PUT', 1, 'admin', NULL, '/system/order', '127.0.0.1', '内网IP', '{\"createBy\":\"IpMn9hqLOZ\",\"createTime\":\"2020-12-28 14:07:07\",\"flag\":false,\"params\":{},\"postCode\":\"zyf\",\"postId\":1,\"postName\":\"121\",\"postSort\":783,\"remark\":\"ekg6lQ09sA\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 22:10:36', 16);
INSERT INTO `sys_oper_log` VALUES (199, '岗位管理', 2, 'com.ruoyi.web.controller.system.OrderController.edit()', 'PUT', 1, 'admin', NULL, '/system/order', '127.0.0.1', '内网IP', '{\"createBy\":\"wGVEOlXuSx\",\"createTime\":\"2023-09-24 10:58:44\",\"flag\":false,\"params\":{},\"postCode\":\"bpo8Log6QQ\",\"postId\":2,\"postName\":\"Chan On Kay\",\"postSort\":823,\"remark\":\"J431uN4k7j\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 22:18:56', 13);
INSERT INTO `sys_oper_log` VALUES (200, '部门管理', 2, 'com.ruoyi.web.controller.system.SysCargoController.edit()', 'PUT', 1, 'admin', NULL, '/system/cargo', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"零食分区\",\"email\":\"11@qq.com\",\"leader\":\"yxc\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"佳佳悦批发\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 22:24:37', 18);
INSERT INTO `sys_oper_log` VALUES (201, '部门管理', 2, 'com.ruoyi.web.controller.system.SysCargoController.edit()', 'PUT', 1, 'admin', NULL, '/system/cargo', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"日常用品\",\"email\":\"22@qq.com\",\"leader\":\"lzy\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"parentName\":\"佳佳悦批发\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 22:25:13', 16);
INSERT INTO `sys_oper_log` VALUES (202, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"111\",\"params\":{},\"phonenumber\":\"111\",\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":103,\"userName\":\"111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 22:29:12', 94);
INSERT INTO `sys_oper_log` VALUES (203, '用户管理', 3, 'com.ruoyi.web.controller.system.SysGoodController.remove()', 'DELETE', 1, 'admin', NULL, '/system/good/100', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 22:40:59', 11);
INSERT INTO `sys_oper_log` VALUES (204, '用户管理', 3, 'com.ruoyi.web.controller.system.SysGoodController.remove()', 'DELETE', 1, 'admin', NULL, '/system/good/101', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 22:41:05', 15);
INSERT INTO `sys_oper_log` VALUES (205, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"5\",\"params\":{},\"phonenumber\":\"100\",\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":104,\"userName\":\"元气森林\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 22:43:03', 128);
INSERT INTO `sys_oper_log` VALUES (206, '部门管理', 2, 'com.ruoyi.web.controller.system.SysCargoController.edit()', 'PUT', 1, 'admin', NULL, '/system/cargo', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"饮品\",\"email\":\"11@qq.com\",\"leader\":\"yxc\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"零食分区\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 22:43:17', 15);
INSERT INTO `sys_oper_log` VALUES (207, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,2001,2002,2003,2005,1049,1050,1051,1052,1053,1054],\"params\":{},\"roleId\":101,\"roleKey\":\"shopdirector\",\"roleName\":\"店长\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 22:48:09', 43);
INSERT INTO `sys_oper_log` VALUES (208, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2023-10-31 22:03:57\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 22:52:33', 16);
INSERT INTO `sys_oper_log` VALUES (209, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"101\",\"userId\":\"102\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 22:53:28', 14);
INSERT INTO `sys_oper_log` VALUES (210, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-11-08 22:48:09\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,2001,2002,2003,2005,1049,1050,1051,1052,1053,1054],\"params\":{},\"roleId\":101,\"roleKey\":\"shopdirector\",\"roleName\":\"店长\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 22:54:00', 19);
INSERT INTO `sys_oper_log` VALUES (211, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-10-31 22:03:57\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,107,2,1035,108,500,1039,1040,1041,501,1042,1043,1044,1045,2001,2002,2003,2005,1049,1050,1051,1052,1053,1054],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"店员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 22:56:21', 34);
INSERT INTO `sys_oper_log` VALUES (212, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,107,2,1035,108,500,1039,1040,1041,501,1042,1043,1044,1045,2002,2005,2000],\"params\":{},\"roleId\":102,\"roleKey\":\"storagekeeper\",\"roleName\":\"仓库管理员\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 22:58:10', 23);
INSERT INTO `sys_oper_log` VALUES (213, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"2\",\"userId\":\"103\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 22:59:26', 14);
INSERT INTO `sys_oper_log` VALUES (214, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"102\",\"userId\":\"104\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 23:00:48', 5);
INSERT INTO `sys_oper_log` VALUES (215, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/100', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 23:01:03', 18);
INSERT INTO `sys_oper_log` VALUES (216, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2023-11-08 22:52:40\",\"delFlag\":\"0\",\"deptId\":101,\"email\":\"\",\"loginDate\":\"2023-11-08 22:54:43\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"dianzhang\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[101],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":101,\"roleKey\":\"shopdirector\",\"roleName\":\"店长\",\"roleSort\":0,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":102,\"userName\":\"dianzhang\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 23:01:20', 22);
INSERT INTO `sys_oper_log` VALUES (217, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2023-11-08 22:58:39\",\"delFlag\":\"0\",\"deptId\":107,\"email\":\"\",\"loginDate\":\"2023-11-08 22:59:41\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"dianyuan\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"店员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":103,\"userName\":\"dianyuan\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 23:01:32', 15);
INSERT INTO `sys_oper_log` VALUES (218, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2023-11-08 23:00:16\",\"delFlag\":\"0\",\"deptId\":200,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"cangguan\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[102],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":102,\"roleKey\":\"storagekeeper\",\"roleName\":\"仓库管理员\",\"roleSort\":0,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":104,\"userName\":\"cangguan\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 23:01:41', 18);
INSERT INTO `sys_oper_log` VALUES (219, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"102\",\"userId\":\"104\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 23:02:33', 18);
INSERT INTO `sys_oper_log` VALUES (220, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-11-01 22:42:59\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,107,2,1035,108,500,1039,1040,1041,501,1042,1043,1044,1045,2002,2005,2000,2004,1049,1050,1051,1052,1053,1054],\"params\":{},\"roleId\":100,\"roleKey\":\"purchase\",\"roleName\":\"采购人员\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 23:03:20', 22);
INSERT INTO `sys_oper_log` VALUES (221, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-11-01 22:42:59\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":100,\"roleKey\":\"purchase\",\"roleName\":\"采购人员\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 23:08:21', 17);
INSERT INTO `sys_oper_log` VALUES (222, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/customer/index\",\"createTime\":\"2023-11-05 20:47:04\",\"icon\":\"row\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"客户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2,\"path\":\"addorder\",\"perms\":\"monitor:customer:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 23:18:00', 12);
INSERT INTO `sys_oper_log` VALUES (223, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-10-31 22:03:57\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,107,2,1035,108,500,1039,1040,1041,501,1042,1043,1044,1045,2001,2002,2003,2005,1049,1050,1051,1052,1053,1054],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"店员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 23:19:28', 25);
INSERT INTO `sys_oper_log` VALUES (224, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/object/index\",\"createTime\":\"2023-11-05 21:04:41\",\"icon\":\"theme\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"货品管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2,\"path\":\"object\",\"perms\":\"monitor:object:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 23:20:05', 14);
INSERT INTO `sys_oper_log` VALUES (225, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/categary/index\",\"createTime\":\"2023-11-05 22:56:06\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"商品分区管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2,\"path\":\"categary\",\"perms\":\"monitor:categary:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 23:42:21', 39);
INSERT INTO `sys_oper_log` VALUES (226, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-10-31 22:03:57\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,107,1035,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,2001,2002,2003,2005,1049,1050,1051,1052,1053,1054],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"店员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 23:47:12', 104);
INSERT INTO `sys_oper_log` VALUES (227, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-10-31 22:03:57\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,2006,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,2001,2002,2003,2005,1049,1050,1051,1052,1053,1054],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"店员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 23:48:04', 42);
INSERT INTO `sys_oper_log` VALUES (228, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-10-31 22:03:57\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,2006,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,2001,2002,2003,2005,3,115,116,1055,1056,1057,1058,1059,1060,117,4,2000,2004,1049,1050,1051,1052,1053,1054],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"店员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 23:50:00', 31);
INSERT INTO `sys_oper_log` VALUES (229, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-10-31 22:03:57\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,107,2,1035,108,500,1039,1040,1041,501,1042,1043,1044,1045,2001,2002,2003,2005,1049,1050,1051,1052,1053,1054],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"店员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 23:57:58', 25);
INSERT INTO `sys_oper_log` VALUES (230, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2023-11-08 23:58:26\",\"delFlag\":\"0\",\"email\":\"\",\"loginDate\":\"2023-11-08 23:58:38\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"dy\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[2],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":105,\"userName\":\"dy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-08 23:59:02', 21);
INSERT INTO `sys_oper_log` VALUES (231, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,2006,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,2001,2002,2003,2005,3,115,116,1055,1056,1057,1058,1059,1060,117,4,2000,2004,1049,1050,1051,1052,1053,1054],\"params\":{},\"roleId\":103,\"roleKey\":\"sell\",\"roleName\":\"销售\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 00:00:18', 34);
INSERT INTO `sys_oper_log` VALUES (232, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2023-11-08 23:58:26\",\"delFlag\":\"0\",\"email\":\"\",\"loginDate\":\"2023-11-08 23:59:17\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"dy\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[103],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"店员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":105,\"userName\":\"dy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 00:00:36', 20);
INSERT INTO `sys_oper_log` VALUES (233, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-11-09 00:00:17\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,107,2,1035,108,500,1039,1040,1041,501,1042,1043,1044,1045,2001,2002,2003,2005,1049,1050,1051,1052,1053,1054],\"params\":{},\"roleId\":103,\"roleKey\":\"sell\",\"roleName\":\"销售\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 00:01:37', 37);
INSERT INTO `sys_oper_log` VALUES (234, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/order/index\",\"createTime\":\"2023-11-05 21:41:52\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"订单管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2,\"path\":\"order\",\"perms\":\"monitor:order:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 00:02:43', 21);
INSERT INTO `sys_oper_log` VALUES (235, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2006', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 22:59:37', 13);
INSERT INTO `sys_oper_log` VALUES (236, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 22:59:49', 9);
INSERT INTO `sys_oper_log` VALUES (237, '部门管理', 2, 'com.ruoyi.web.controller.system.SysCargoController.edit()', 'PUT', 1, 'admin', NULL, '/system/cargo', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"零食\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"parentName\":\"零食分区\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:37:11', 18);
INSERT INTO `sys_oper_log` VALUES (238, '部门管理', 2, 'com.ruoyi.web.controller.system.SysCargoController.edit()', 'PUT', 1, 'admin', NULL, '/system/cargo', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"食品区\",\"email\":\"11@qq.com\",\"leader\":\"yxc\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"佳佳悦批发\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:37:27', 14);
INSERT INTO `sys_oper_log` VALUES (239, '部门管理', 2, 'com.ruoyi.web.controller.system.SysCargoController.edit()', 'PUT', 1, 'admin', NULL, '/system/cargo', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":106,\"deptName\":\"食材\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"parentName\":\"食品区\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:37:37', 19);
INSERT INTO `sys_oper_log` VALUES (240, '部门管理', 2, 'com.ruoyi.web.controller.system.SysCargoController.edit()', 'PUT', 1, 'admin', NULL, '/system/cargo', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":200,\"deptName\":\"水果\",\"orderNum\":5,\"params\":{},\"parentId\":101,\"parentName\":\"食品区\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:37:46', 16);
INSERT INTO `sys_oper_log` VALUES (241, '部门管理', 2, 'com.ruoyi.web.controller.system.SysCargoController.edit()', 'PUT', 1, 'admin', NULL, '/system/cargo', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":108,\"deptName\":\"厨具\",\"email\":\"\",\"leader\":\"\",\"orderNum\":1,\"params\":{},\"parentId\":102,\"parentName\":\"日常用品\",\"phone\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:38:13', 19);
INSERT INTO `sys_oper_log` VALUES (242, '部门管理', 2, 'com.ruoyi.web.controller.system.SysCargoController.edit()', 'PUT', 1, 'admin', NULL, '/system/cargo', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":109,\"deptName\":\"洗护用品\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":102,\"parentName\":\"日常用品\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:38:24', 18);
INSERT INTO `sys_oper_log` VALUES (243, '部门管理', 1, 'com.ruoyi.web.controller.system.SysCargoController.add()', 'POST', 1, 'admin', NULL, '/system/cargo', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"服装区\",\"leader\":\"zyf\",\"orderNum\":3,\"params\":{},\"parentId\":100,\"phone\":\"15666666666\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:38:53', 10);
INSERT INTO `sys_oper_log` VALUES (244, '部门管理', 1, 'com.ruoyi.web.controller.system.SysCargoController.add()', 'POST', 1, 'admin', NULL, '/system/cargo', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,201\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"童装\",\"orderNum\":1,\"params\":{},\"parentId\":201,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:39:09', 14);
INSERT INTO `sys_oper_log` VALUES (245, '部门管理', 1, 'com.ruoyi.web.controller.system.SysCargoController.add()', 'POST', 1, 'admin', NULL, '/system/cargo', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,201,202\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"鞋帽\",\"orderNum\":2,\"params\":{},\"parentId\":202,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:39:35', 6);
INSERT INTO `sys_oper_log` VALUES (246, '部门管理', 2, 'com.ruoyi.web.controller.system.SysCargoController.edit()', 'PUT', 1, 'admin', NULL, '/system/cargo', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,201\",\"children\":[],\"deptId\":203,\"deptName\":\"鞋帽\",\"orderNum\":2,\"params\":{},\"parentId\":201,\"parentName\":\"童装\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:39:45', 20);
INSERT INTO `sys_oper_log` VALUES (247, '用户管理', 3, 'com.ruoyi.web.controller.system.SysGoodController.remove()', 'DELETE', 1, 'admin', NULL, '/system/good/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:39:56', 21);
INSERT INTO `sys_oper_log` VALUES (248, '用户管理', 3, 'com.ruoyi.web.controller.system.SysGoodController.remove()', 'DELETE', 1, 'admin', NULL, '/system/good/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"当前用户不能删除\",\"code\":500}', 0, NULL, '2023-11-09 23:40:07', 0);
INSERT INTO `sys_oper_log` VALUES (249, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptId\":105,\"nickName\":\"5\",\"params\":{},\"phonenumber\":\"100\",\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userName\":\"乐事薯片\"}', '{\"msg\":\"新增用户\'乐事薯片\'失败，手机号码已存在\",\"code\":500}', 0, NULL, '2023-11-09 23:43:19', 16);
INSERT INTO `sys_oper_log` VALUES (250, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptId\":105,\"nickName\":\"5\",\"params\":{},\"phonenumber\":\"100\",\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userName\":\"乐事薯片\"}', '{\"msg\":\"新增用户\'乐事薯片\'失败，手机号码已存在\",\"code\":500}', 0, NULL, '2023-11-09 23:43:22', 6);
INSERT INTO `sys_oper_log` VALUES (251, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptId\":105,\"nickName\":\"5\",\"params\":{},\"phonenumber\":\"100\",\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userName\":\"乐事薯片\"}', '{\"msg\":\"新增用户\'乐事薯片\'失败，手机号码已存在\",\"code\":500}', 0, NULL, '2023-11-09 23:44:26', 5);
INSERT INTO `sys_oper_log` VALUES (252, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptId\":105,\"nickName\":\"5\",\"params\":{},\"phonenumber\":\"100\",\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userName\":\"乐事薯片\"}', '{\"msg\":\"新增用户\'乐事薯片\'失败，手机号码已存在\",\"code\":500}', 0, NULL, '2023-11-09 23:44:28', 5);
INSERT INTO `sys_oper_log` VALUES (253, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userName\":\"乐事薯片\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\LEO\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysGoodMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysGoodMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_good(                  user_name,                                     password,       status,       create_by,            create_time    )values(                  ?,                                     ?,       ?,       ?,            sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\n; Field \'nick_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value', '2023-11-09 23:44:37', 291);
INSERT INTO `sys_oper_log` VALUES (254, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"params\":{},\"phonenumber\":\"130\",\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userName\":\"乐事薯片\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\LEO\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysGoodMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysGoodMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_good(                  user_name,                         phonenumber,             password,       status,       create_by,            create_time    )values(                  ?,                         ?,             ?,       ?,       ?,            sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\n; Field \'nick_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value', '2023-11-09 23:45:24', 208);
INSERT INTO `sys_oper_log` VALUES (255, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userName\":\"乐事\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\LEO\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysGoodMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysGoodMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_good(                  user_name,                                     password,       status,       create_by,            create_time    )values(                  ?,                                     ?,       ?,       ?,            sysdate()    )\r\n### Cause: java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value\n; Field \'nick_name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'nick_name\' doesn\'t have a default value', '2023-11-09 23:46:23', 194);
INSERT INTO `sys_oper_log` VALUES (256, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":105,\"nickName\":\"6\",\"params\":{},\"phonenumber\":\"150\",\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":105,\"userName\":\"乐事薯片\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:46:40', 97);
INSERT INTO `sys_oper_log` VALUES (257, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":105,\"nickName\":\"15\",\"params\":{},\"phonenumber\":\"200\",\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":106,\"userName\":\"德芙巧克力\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:47:04', 93);
INSERT INTO `sys_oper_log` VALUES (258, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":106,\"nickName\":\"2\",\"params\":{},\"phonenumber\":\"160\",\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":107,\"userName\":\"青菜\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:47:31', 89);
INSERT INTO `sys_oper_log` VALUES (259, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":200,\"nickName\":\"70\",\"params\":{},\"phonenumber\":\"50\",\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":108,\"userName\":\"榴莲\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:47:51', 87);
INSERT INTO `sys_oper_log` VALUES (260, '岗位管理', 2, 'com.ruoyi.web.controller.system.OrderController.edit()', 'PUT', 1, 'admin', NULL, '/system/order', '127.0.0.1', '内网IP', '{\"createBy\":\"wGVEOlXuSx\",\"createTime\":\"2023-09-24 10:58:44\",\"flag\":false,\"params\":{},\"postCode\":\"bpo8Log6QQ\",\"postId\":2,\"postName\":\"132\",\"postSort\":823,\"remark\":\"J431uN4k7j\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:48:18', 18);
INSERT INTO `sys_oper_log` VALUES (261, '岗位管理', 2, 'com.ruoyi.web.controller.system.OrderController.edit()', 'PUT', 1, 'admin', NULL, '/system/order', '127.0.0.1', '内网IP', '{\"createBy\":\"wGVEOlXuSx\",\"createTime\":\"2023-09-24 10:58:44\",\"flag\":false,\"params\":{},\"postCode\":\"mzq\",\"postId\":2,\"postName\":\"132\",\"postSort\":823,\"remark\":\"J431uN4k7j\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:48:29', 15);
INSERT INTO `sys_oper_log` VALUES (262, '岗位管理', 2, 'com.ruoyi.web.controller.system.OrderController.edit()', 'PUT', 1, 'admin', NULL, '/system/order', '127.0.0.1', '内网IP', '{\"createBy\":\"Px4PGfWpEL\",\"createTime\":\"2007-03-06 20:43:09\",\"flag\":false,\"params\":{},\"postCode\":\"lzy\",\"postId\":3,\"postName\":\"150\",\"postSort\":704,\"remark\":\"Z8rB8IxzRu\",\"status\":\"R\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:48:40', 17);
INSERT INTO `sys_oper_log` VALUES (263, '岗位管理', 3, 'com.ruoyi.web.controller.system.OrderController.remove()', 'DELETE', 1, 'admin', NULL, '/system/order/4,5,6,7,8,9,10', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:49:00', 54);
INSERT INTO `sys_oper_log` VALUES (264, '岗位管理', 3, 'com.ruoyi.web.controller.system.OrderController.remove()', 'DELETE', 1, 'admin', NULL, '/system/order/11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:49:17', 127);
INSERT INTO `sys_oper_log` VALUES (265, '岗位管理', 2, 'com.ruoyi.web.controller.system.OrderController.edit()', 'PUT', 1, 'admin', NULL, '/system/order', '127.0.0.1', '内网IP', '{\"createBy\":\"Px4PGfWpEL\",\"createTime\":\"2007-03-06 20:43:09\",\"flag\":false,\"params\":{},\"postCode\":\"lzy\",\"postId\":3,\"postName\":\"150\",\"postSort\":704,\"remark\":\"Z8rB8IxzRu\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:49:33', 14);
INSERT INTO `sys_oper_log` VALUES (266, '岗位管理', 3, 'com.ruoyi.web.controller.system.SupplierController.remove()', 'DELETE', 1, 'admin', NULL, '/system/supplier/1001', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:56:42', 5);
INSERT INTO `sys_oper_log` VALUES (267, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2023-11-08 23:58:26\",\"delFlag\":\"0\",\"deptId\":107,\"email\":\"\",\"loginDate\":\"2023-11-09 23:33:40\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"dy\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[103],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":103,\"roleKey\":\"sell\",\"roleName\":\"销售\",\"roleSort\":0,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":105,\"userName\":\"dy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:57:12', 19);
INSERT INTO `sys_oper_log` VALUES (268, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-31 22:03:57\",\"noticeContent\":\"新版本内容\",\"noticeId\":1,\"noticeTitle\":\"新品上市啦\",\"noticeType\":\"2\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:57:50', 14);
INSERT INTO `sys_oper_log` VALUES (269, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-31 22:03:57\",\"noticeContent\":\"<p>放假10000000天</p>\",\"noticeId\":2,\"noticeTitle\":\"国庆放假通知\",\"noticeType\":\"1\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:58:19', 19);
INSERT INTO `sys_oper_log` VALUES (270, '岗位管理', 2, 'com.ruoyi.web.controller.system.CustomerController.edit()', 'PUT', 1, 'admin', NULL, '/system/customer', '127.0.0.1', '内网IP', '{\"createBy\":\"MasMSDj77e\",\"createTime\":\"2002-07-07 19:47:12\",\"flag\":false,\"params\":{},\"postCode\":\"lzy\",\"postId\":2,\"postName\":\"15777777777\",\"postSort\":694,\"remark\":\"rjHRdR8LHj\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:58:54', 14);
INSERT INTO `sys_oper_log` VALUES (271, '岗位管理', 3, 'com.ruoyi.web.controller.system.CustomerController.remove()', 'DELETE', 1, 'admin', NULL, '/system/customer/3,4,5,6,7,8,9,10', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:59:05', 54);
INSERT INTO `sys_oper_log` VALUES (272, '岗位管理', 2, 'com.ruoyi.web.controller.system.CustomerController.edit()', 'PUT', 1, 'admin', NULL, '/system/customer', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-11-08 15:58:15\",\"flag\":false,\"params\":{},\"postCode\":\"mzq\",\"postId\":1003,\"postName\":\"15333333333\",\"postSort\":0,\"remark\":\"qq\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-09 23:59:22', 18);
INSERT INTO `sys_oper_log` VALUES (273, '岗位管理', 5, 'com.ruoyi.web.controller.system.SysPostController.export()', 'POST', 1, 'admin', NULL, '/system/post/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-10 09:48:45', 524);
INSERT INTO `sys_oper_log` VALUES (274, '岗位管理', 5, 'com.ruoyi.web.controller.system.SysPostController.export()', 'POST', 1, 'admin', NULL, '/system/post/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-10 09:49:56', 37);
INSERT INTO `sys_oper_log` VALUES (275, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2023/11/10/blob_20231110223339A001.png\",\"code\":200}', 0, NULL, '2023-11-10 22:33:40', 130);
INSERT INTO `sys_oper_log` VALUES (276, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-10-31 22:03:57\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"管理部门\",\"leader\":\"yxc\",\"orderNum\":1,\"params\":{\"@type\":\"java.util.HashMap\"},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"wiser@163.com\",\"loginDate\":\"2023-11-10 09:49:53\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"周经理\",\"params\":{\"@type\":\"java.util.HashMap\"},\"phonenumber\":\"15888888888\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{\"@type\":\"java.util.HashMap\"},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 22:34:03', 15);
INSERT INTO `sys_oper_log` VALUES (277, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-10-31 22:03:57\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"管理部门\",\"leader\":\"yxc\",\"orderNum\":1,\"params\":{\"@type\":\"java.util.HashMap\"},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"wiser@163.com\",\"loginDate\":\"2023-11-10 09:49:53\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"周经理\",\"params\":{\"@type\":\"java.util.HashMap\"},\"phonenumber\":\"15888888888\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{\"@type\":\"java.util.HashMap\"},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 22:34:10', 22);
INSERT INTO `sys_oper_log` VALUES (278, '岗位管理', 2, 'com.ruoyi.web.controller.system.OrderController.edit()', 'PUT', 1, 'admin', NULL, '/system/order', '127.0.0.1', '内网IP', '{\"createBy\":\"IpMn9hqLOZ\",\"createTime\":\"2020-12-28 14:07:07\",\"flag\":false,\"params\":{},\"postCode\":\"zyf\",\"postId\":1,\"postName\":\"121\",\"postSort\":783,\"remark\":\"无\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 22:54:16', 40);
INSERT INTO `sys_oper_log` VALUES (279, '岗位管理', 2, 'com.ruoyi.web.controller.system.OrderController.edit()', 'PUT', 1, 'admin', NULL, '/system/order', '127.0.0.1', '内网IP', '{\"createBy\":\"IpMn9hqLOZ\",\"createTime\":\"2020-12-28 14:07:07\",\"flag\":false,\"params\":{},\"postCode\":\"zyf\",\"postId\":1,\"postName\":\"121\",\"postSort\":783,\"remark\":\"零食大礼包\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 22:55:17', 37);
INSERT INTO `sys_oper_log` VALUES (280, '岗位管理', 2, 'com.ruoyi.web.controller.system.OrderController.edit()', 'PUT', 1, 'admin', NULL, '/system/order', '127.0.0.1', '内网IP', '{\"createBy\":\"wGVEOlXuSx\",\"createTime\":\"2023-09-24 10:58:44\",\"flag\":false,\"params\":{},\"postCode\":\"mzq\",\"postId\":2,\"postName\":\"132\",\"postSort\":823,\"remark\":\"电动牙刷\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 22:55:45', 22);
INSERT INTO `sys_oper_log` VALUES (281, '岗位管理', 2, 'com.ruoyi.web.controller.system.OrderController.edit()', 'PUT', 1, 'admin', NULL, '/system/order', '127.0.0.1', '内网IP', '{\"createBy\":\"Px4PGfWpEL\",\"createTime\":\"2007-03-06 20:43:09\",\"flag\":false,\"params\":{},\"postCode\":\"lzy\",\"postId\":3,\"postName\":\"150\",\"postSort\":704,\"remark\":\"鼠标垫\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-10 22:56:02', 24);
INSERT INTO `sys_oper_log` VALUES (282, '岗位管理', 5, 'com.ruoyi.web.controller.system.SysPostController.export()', 'POST', 1, 'admin', NULL, '/system/post/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-10 23:02:36', 1637);
INSERT INTO `sys_oper_log` VALUES (283, '岗位管理', 5, 'com.ruoyi.web.controller.system.CustomerController.export()', 'POST', 1, 'admin', NULL, '/system/customer/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-10 23:03:46', 40);
INSERT INTO `sys_oper_log` VALUES (284, '岗位管理', 5, 'com.ruoyi.web.controller.system.CustomerController.export()', 'POST', 1, 'admin', NULL, '/system/customer/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-10 23:04:52', 25);
INSERT INTO `sys_oper_log` VALUES (285, '岗位管理', 5, 'com.ruoyi.web.controller.system.CustomerController.export()', 'POST', 1, 'admin', NULL, '/system/customer/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-10 23:05:12', 38);
INSERT INTO `sys_oper_log` VALUES (286, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-10 23:10:37', 57);
INSERT INTO `sys_oper_log` VALUES (287, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-10 23:10:58', 48);
INSERT INTO `sys_oper_log` VALUES (288, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-11-01 22:42:59\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,107,2,1035,108,500,1039,1040,1041,501,1042,1043,1044,1045,2002,2005,2000,2004,1049,1050,1051,1052,1053,1054],\"params\":{},\"roleId\":100,\"roleKey\":\"purchase\",\"roleName\":\"采购人员\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 18:00:22', 68);
INSERT INTO `sys_oper_log` VALUES (289, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2023-11-11 18:09:18\",\"delFlag\":\"0\",\"deptId\":105,\"email\":\"\",\"loginDate\":\"2023-11-11 18:09:29\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"caigou\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[100],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":106,\"userName\":\"caigou\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 18:09:56', 20);
INSERT INTO `sys_oper_log` VALUES (290, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"supplier/index\",\"createTime\":\"2023-11-01 12:41:04\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"供货商管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"supplier\",\"perms\":\"system:supplier:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 18:11:47', 21);
INSERT INTO `sys_oper_log` VALUES (291, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-11-08 22:58:10\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,107,2,1035,108,500,1039,1040,1041,501,1042,1043,1044,1045,2002,2005],\"params\":{},\"roleId\":102,\"roleKey\":\"storagekeeper\",\"roleName\":\"仓库管理员\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 18:15:44', 67);
INSERT INTO `sys_oper_log` VALUES (292, '岗位管理', 2, 'com.ruoyi.web.controller.system.CustomerController.edit()', 'PUT', 1, 'admin', NULL, '/system/customer', '127.0.0.1', '内网IP', '{\"createBy\":\"09vfAqwtAM\",\"createTime\":\"2016-07-27 11:24:06\",\"flag\":false,\"params\":{},\"postCode\":\"李华\",\"postId\":1,\"postName\":\"15666666666\",\"postSort\":970,\"remark\":\"UDNWc93gIk\",\"status\":\"k\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 23:14:57', 37);
INSERT INTO `sys_oper_log` VALUES (293, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-11-08 22:48:09\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,2001,2002,2003,2005,1049,1050,1051,1052,1053,1054],\"params\":{},\"roleId\":101,\"roleKey\":\"shopdirector\",\"roleName\":\"店长\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 23:25:34', 80);
INSERT INTO `sys_oper_log` VALUES (294, '岗位管理', 2, 'com.ruoyi.web.controller.system.CustomerController.edit()', 'PUT', 1, 'admin', NULL, '/system/customer', '127.0.0.1', '内网IP', '{\"createBy\":\"09vfAqwtAM\",\"createTime\":\"2016-07-27 11:24:06\",\"flag\":false,\"params\":{},\"postCode\":\"李华\",\"postId\":1,\"postName\":\"15666666666\",\"postSort\":970,\"remark\":\"UDNWc93gIk\",\"status\":\"k\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 23:26:40', 21);
INSERT INTO `sys_oper_log` VALUES (295, '岗位管理', 2, 'com.ruoyi.web.controller.system.OrderController.edit()', 'PUT', 1, 'admin', NULL, '/system/order', '127.0.0.1', '内网IP', '{\"createBy\":\"IpMn9hqLOZ\",\"createTime\":\"2020-12-28 14:07:07\",\"flag\":false,\"params\":{},\"postCode\":\"zyf\",\"postId\":1,\"postName\":\"121\",\"postSort\":783,\"remark\":\"零食大礼包\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-11 23:28:22', 38);
INSERT INTO `sys_oper_log` VALUES (296, '岗位管理', 3, 'com.ruoyi.web.controller.system.OrderController.remove()', 'DELETE', 1, 'admin', NULL, '/system/order/1', '127.0.0.1', '内网IP', '{}', NULL, 1, '121已分配,不能删除', '2023-11-11 23:28:27', 9);
INSERT INTO `sys_oper_log` VALUES (297, '岗位管理', 3, 'com.ruoyi.web.controller.system.OrderController.remove()', 'DELETE', 1, 'admin', NULL, '/system/order/1', '127.0.0.1', '内网IP', '{}', NULL, 1, '121已分配,不能删除', '2023-11-11 23:28:37', 8);
INSERT INTO `sys_oper_log` VALUES (298, '岗位管理', 3, 'com.ruoyi.web.controller.system.SupplierController.remove()', 'DELETE', 1, 'admin', NULL, '/system/supplier/1', '127.0.0.1', '内网IP', '{}', NULL, 1, '威海环翠区已分配,不能删除', '2023-11-11 23:29:12', 5);
INSERT INTO `sys_oper_log` VALUES (299, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/bookmenu/index\",\"createTime\":\"2023-11-05 21:41:52\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"订单管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2,\"path\":\"bookmenu\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-02 21:55:33', 15);
INSERT INTO `sys_oper_log` VALUES (300, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"deptId\":105,\"oriPrice\":7.0,\"params\":{},\"prName\":\"瓜子\",\"prNum\":20,\"prPrice\":10.0,\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         105, \n         \'瓜子\', \n         10.0, \n         7\' at line 9\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysGoodMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysGoodMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_good(                    dept_id,           pr_name,           pr_price,           ori_price,           pr_num,                    )values(                    ?,           ?,           ?,           ?,           ?,                    )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         105, \n         \'瓜子\', \n         10.0, \n         7\' at line 9\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         105, \n         \'瓜子\', \n         10.0, \n         7\' at line 9', '2024-05-03 19:39:32', 106);
INSERT INTO `sys_oper_log` VALUES (301, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"deptId\":105,\"oriPrice\":7.0,\"params\":{},\"prName\":\"瓜子\",\"prNum\":20,\"prPrice\":10.0,\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n--          \n         105, \n         \'瓜子\', \n         10.0, \n       \' at line 9\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysGoodMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysGoodMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_good( --                    dept_id,           pr_name,           pr_price,           ori_price,           pr_num,                    )values( --                    ?,           ?,           ?,           ?,           ?,                    )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n--          \n         105, \n         \'瓜子\', \n         10.0, \n       \' at line 9\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n--          \n         105, \n         \'瓜子\', \n         10.0, \n       \' at line 9', '2024-05-03 19:48:36', 113);
INSERT INTO `sys_oper_log` VALUES (302, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"deptId\":105,\"oriPrice\":7.0,\"params\":{},\"prName\":\"瓜子\",\"prNum\":20,\"prPrice\":10.0,\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         105, \n         \'瓜子\', \n         10.0, \n         7\' at line 10\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysGoodMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysGoodMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_good(         --                    dept_id,           pr_name,           pr_price,           ori_price,           pr_num,                    )values(                    ?,           ?,           ?,           ?,           ?,                    )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         105, \n         \'瓜子\', \n         10.0, \n         7\' at line 10\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         105, \n         \'瓜子\', \n         10.0, \n         7\' at line 10', '2024-05-03 19:49:54', 117);
INSERT INTO `sys_oper_log` VALUES (303, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"deptId\":105,\"oriPrice\":7.0,\"params\":{},\"prName\":\"瓜子\",\"prNum\":20,\"prPrice\":10.0,\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         105, \n         \'瓜子\', \n         10.0, \n         7\' at line 10\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysGoodMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysGoodMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_good(         --                    dept_id,           pr_name,           pr_price,           ori_price,           pr_num,                    )values(                    ?,           ?,           ?,           ?,           ?,                    )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         105, \n         \'瓜子\', \n         10.0, \n         7\' at line 10\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         105, \n         \'瓜子\', \n         10.0, \n         7\' at line 10', '2024-05-03 19:50:06', 5);
INSERT INTO `sys_oper_log` VALUES (304, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"deptId\":105,\"oriPrice\":7.0,\"params\":{},\"prName\":\"瓜子\",\"prNum\":20,\"prPrice\":10.0,\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         105, \n         \'瓜子\', \n         10.0, \n         7\' at line 9\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysGoodMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysGoodMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_good(                    dept_id,           pr_name,           pr_price,           ori_price,           pr_num,                    )values(                    ?,           ?,           ?,           ?,           ?,                    )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         105, \n         \'瓜子\', \n         10.0, \n         7\' at line 9\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         105, \n         \'瓜子\', \n         10.0, \n         7\' at line 9', '2024-05-03 19:51:42', 113);
INSERT INTO `sys_oper_log` VALUES (305, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"deptId\":105,\"oriPrice\":7.0,\"params\":{},\"prName\":\"瓜子\",\"prNum\":20,\"prPrice\":10.0,\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         105, \n         \'瓜子\', \n         10.0, \n         7\' at line 9\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysGoodMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysGoodMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_good(                    dept_id,           pr_name,           pr_price,           ori_price,           pr_num,                    )values(                    ?,           ?,           ?,           ?,           ?,                    )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         105, \n         \'瓜子\', \n         10.0, \n         7\' at line 9\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         105, \n         \'瓜子\', \n         10.0, \n         7\' at line 9', '2024-05-03 19:52:59', 8);
INSERT INTO `sys_oper_log` VALUES (306, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"deptId\":105,\"oriPrice\":7.0,\"params\":{},\"prName\":\"瓜子\",\"prNum\":20,\"prPrice\":10.0,\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         105, \n         \'瓜子\', \n         10.0, \n         7\' at line 9\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysGoodMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysGoodMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_good(                    dept_id,           pr_name,           pr_price,           ori_price,           pr_num,                    )values(                    ?,           ?,           ?,           ?,           ?,                    )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         105, \n         \'瓜子\', \n         10.0, \n         7\' at line 9\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         105, \n         \'瓜子\', \n         10.0, \n         7\' at line 9', '2024-05-03 19:54:35', 10);
INSERT INTO `sys_oper_log` VALUES (307, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"deptId\":105,\"oriPrice\":7.0,\"params\":{},\"prName\":\"瓜子\",\"prNum\":20,\"prPrice\":10.0,\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \') values (\n         \n         105, \n         \'瓜子\', \n         10.0, \n        \' at line 9\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysGoodMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysGoodMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_good(                    dept_id,           pr_name,           pr_price,           ori_price,           pr_num,           status,          ) values (                    ?,           ?,           ?,           ?,           ?,           ?,          )                   ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \') values (\n         \n         105, \n         \'瓜子\', \n         10.0, \n        \' at line 9\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \') values (\n         \n         105, \n         \'瓜子\', \n         10.0, \n        \' at line 9', '2024-05-03 19:57:24', 113);
INSERT INTO `sys_oper_log` VALUES (308, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"deptId\":105,\"oriPrice\":7.0,\"params\":{},\"prName\":\"瓜子\",\"prNum\":20,\"prPrice\":10.0,\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \') values (\n         \n         105, \n         \'瓜子\', \n         10.0, \n        \' at line 9\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysGoodMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysGoodMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_good(                    dept_id,           pr_name,           pr_price,           ori_price,           pr_num,           status,          ) values (                    ?,           ?,           ?,           ?,           ?,           ?,          )                   ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \') values (\n         \n         105, \n         \'瓜子\', \n         10.0, \n        \' at line 9\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \') values (\n         \n         105, \n         \'瓜子\', \n         10.0, \n        \' at line 9', '2024-05-03 19:57:34', 3);
INSERT INTO `sys_oper_log` VALUES (309, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"deptId\":105,\"oriPrice\":7.0,\"params\":{},\"prName\":\"瓜子\",\"prNum\":20,\"prPrice\":10.0,\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\n        \n         ( 105,\n            \'瓜子\',\n            10.0,\n            7\' at line 17\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysGoodMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysGoodMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_good(                    dept_id,           pr_name,           pr_price,           ori_price,           pr_num,           status          ) values (                    ?,           ?,           ?,           ?,           ?,           ?,          )                   ( ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\n        \n         ( 105,\n            \'瓜子\',\n            10.0,\n            7\' at line 17\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')\n        \n         ( 105,\n            \'瓜子\',\n            10.0,\n            7\' at line 17', '2024-05-03 19:59:35', 110);
INSERT INTO `sys_oper_log` VALUES (310, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"deptId\":105,\"oriPrice\":7.0,\"params\":{},\"prName\":\"瓜子\",\"prNum\":20,\"prPrice\":10.0,\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'ri_price\' in \'field list\'\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysGoodMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysGoodMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_good (pr_id, dept_id, pr_name, pr_price, ri_price, pr_num, status)         values (?,                 ?,                 ?,                 ?,                 ?,                 ?,                 ?)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'ri_price\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'ri_price\' in \'field list\'', '2024-05-03 20:03:54', 14);
INSERT INTO `sys_oper_log` VALUES (311, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"deptId\":105,\"oriPrice\":7.0,\"params\":{},\"prName\":\"瓜子\",\"prNum\":20,\"prPrice\":10.0,\"status\":0}', NULL, 1, 'nested exception is org.apache.ibatis.executor.ExecutorException: Error getting generated key or setting result to parameter object. Cause: org.apache.ibatis.executor.ExecutorException: No setter found for the keyProperty \'userId\' in \'com.ruoyi.common.core.domain.entity.SysGood\'.', '2024-05-03 20:04:07', 87);
INSERT INTO `sys_oper_log` VALUES (312, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"deptId\":105,\"oriPrice\":7.0,\"params\":{},\"prName\":\"瓜子\",\"prNum\":20,\"prPrice\":10.0,\"status\":0}', NULL, 1, 'nested exception is org.apache.ibatis.executor.ExecutorException: Error getting generated key or setting result to parameter object. Cause: org.apache.ibatis.executor.ExecutorException: No setter found for the keyProperty \'userId\' in \'com.ruoyi.common.core.domain.entity.SysGood\'.', '2024-05-03 20:04:36', 4);
INSERT INTO `sys_oper_log` VALUES (313, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"deptId\":105,\"oriPrice\":7.0,\"params\":{},\"prId\":111,\"prName\":\"瓜子\",\"prNum\":20,\"prPrice\":10.0,\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 20:06:10', 80);
INSERT INTO `sys_oper_log` VALUES (314, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"deptId\":103,\"oriPrice\":5.0,\"params\":{},\"prId\":112,\"prName\":\"NFC橙汁\",\"prNum\":20,\"prPrice\":7.0,\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 20:36:23', 76);
INSERT INTO `sys_oper_log` VALUES (315, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"deptId\":109,\"oriPrice\":40.0,\"params\":{},\"prId\":113,\"prName\":\"洗发水\",\"prNum\":0,\"prPrice\":50.0,\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 20:37:14', 4);
INSERT INTO `sys_oper_log` VALUES (316, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"deptId\":203,\"oriPrice\":400.0,\"params\":{},\"prId\":114,\"prName\":\"运动鞋\",\"prNum\":10,\"prPrice\":520.0,\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 20:38:05', 4);
INSERT INTO `sys_oper_log` VALUES (317, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zyff\",\"omTotalPrice\":null,\"params\":{}}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'om_customer\' in \'class com.ruoyi.system.domain.SysOrderMm\'', '2024-05-03 21:23:52', 64);
INSERT INTO `sys_oper_log` VALUES (318, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zyff\",\"omTotalPrice\":null,\"params\":{}}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'om_customer\' in \'class com.ruoyi.system.domain.SysOrderMm\'', '2024-05-03 21:27:42', 5);
INSERT INTO `sys_oper_log` VALUES (319, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zyff\",\"omId\":5,\"omTotalPrice\":41.0,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 21:47:10', 69);
INSERT INTO `sys_oper_log` VALUES (320, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zyff\",\"omId\":6,\"omTotalPrice\":41.0,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 21:48:40', 4);
INSERT INTO `sys_oper_log` VALUES (321, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"yxxc\",\"omId\":7,\"omTotalPrice\":67.0,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 22:13:34', 67);
INSERT INTO `sys_oper_log` VALUES (322, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"yxxc\",\"omId\":7,\"omTotalPrice\":null,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 22:24:34', 9);
INSERT INTO `sys_oper_log` VALUES (323, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderDdController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderDd', '127.0.0.1', '内网IP', '{\"odId\":1,\"omId\":7,\"params\":{},\"prName\":\"Siu Kwok Ming\",\"prNum\":386,\"prUnitPrice\":291.56,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 22:24:34', 7);
INSERT INTO `sys_oper_log` VALUES (324, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderDdController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderDd', '127.0.0.1', '内网IP', '{\"odId\":4,\"omId\":7,\"params\":{},\"prName\":\"Pan Zitao\",\"prNum\":116,\"prUnitPrice\":824.5,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 22:24:34', 3);
INSERT INTO `sys_oper_log` VALUES (325, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderDdController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderDd', '127.0.0.1', '内网IP', '{\"odId\":3,\"omId\":7,\"params\":{},\"prName\":\"Judy Turner\",\"prNum\":157,\"prUnitPrice\":775.0,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 22:24:34', 3);
INSERT INTO `sys_oper_log` VALUES (326, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderDdController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderDd', '127.0.0.1', '内网IP', '{\"odId\":2,\"omId\":7,\"params\":{},\"prName\":\"Chic Wai San\",\"prNum\":122,\"prUnitPrice\":814.12,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 22:24:34', 5);
INSERT INTO `sys_oper_log` VALUES (327, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omId\":7,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         \'瓜子\', \n         1, \n         \n         7, \n     \' at line 7\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysOrderDdMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysOrderDdMapper.insertOrderDd-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_order_dd(                    pr_name,           pr_num,                     om_id,          )values(                    ?,           ?,                     ?,          )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         \'瓜子\', \n         1, \n         \n         7, \n     \' at line 7\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         \'瓜子\', \n         1, \n         \n         7, \n     \' at line 7', '2024-05-03 22:24:34', 31);
INSERT INTO `sys_oper_log` VALUES (328, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 22:26:48', 4);
INSERT INTO `sys_oper_log` VALUES (329, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 22:26:50', 2);
INSERT INTO `sys_oper_log` VALUES (330, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 22:27:09', 3);
INSERT INTO `sys_oper_log` VALUES (331, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 22:27:10', 3);
INSERT INTO `sys_oper_log` VALUES (332, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"yxxc\",\"omId\":7,\"omTotalPrice\":67.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 22:27:45', 3);
INSERT INTO `sys_oper_log` VALUES (333, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omId\":7,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         \'瓜子\', \n         1, \n         \n         7, \n     \' at line 7\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysOrderDdMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysOrderDdMapper.insertOrderDd-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_order_dd(                    pr_name,           pr_num,                     om_id,          )values(                    ?,           ?,                     ?,          )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         \'瓜子\', \n         1, \n         \n         7, \n     \' at line 7\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         \'瓜子\', \n         1, \n         \n         7, \n     \' at line 7', '2024-05-03 22:27:46', 2);
INSERT INTO `sys_oper_log` VALUES (334, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omId\":7,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":1,\"prUnitPrice\":null}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         \'NFC橙汁\', \n         1, \n         \n         7, \n  \' at line 7\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysOrderDdMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysOrderDdMapper.insertOrderDd-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_order_dd(                    pr_name,           pr_num,                     om_id,          )values(                    ?,           ?,                     ?,          )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         \'NFC橙汁\', \n         1, \n         \n         7, \n  \' at line 7\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         \'NFC橙汁\', \n         1, \n         \n         7, \n  \' at line 7', '2024-05-03 22:27:46', 2);
INSERT INTO `sys_oper_log` VALUES (335, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omId\":7,\"params\":{},\"prName\":\"洗发水\",\"prNum\":1,\"prUnitPrice\":null}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         \'洗发水\', \n         1, \n         \n         7, \n  \' at line 7\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysOrderDdMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysOrderDdMapper.insertOrderDd-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_order_dd(                    pr_name,           pr_num,                     om_id,          )values(                    ?,           ?,                     ?,          )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         \'洗发水\', \n         1, \n         \n         7, \n  \' at line 7\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \n         \'洗发水\', \n         1, \n         \n         7, \n  \' at line 7', '2024-05-03 22:27:46', 2);
INSERT INTO `sys_oper_log` VALUES (336, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"yxxc\",\"omId\":7,\"omTotalPrice\":67.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 22:35:24', 13);
INSERT INTO `sys_oper_log` VALUES (337, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omId\":7,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'瓜子\', \n         1, \n         \n         7, \n        )\' at line 6\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysOrderDdMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysOrderDdMapper.insertOrderDd-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_order_dd (          pr_name,           pr_num,                     om_id,          )values(          ?,           ?,                     ?,          )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'瓜子\', \n         1, \n         \n         7, \n        )\' at line 6\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'瓜子\', \n         1, \n         \n         7, \n        )\' at line 6', '2024-05-03 22:35:24', 28);
INSERT INTO `sys_oper_log` VALUES (338, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omId\":7,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":1,\"prUnitPrice\":null}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'NFC橙汁\', \n         1, \n         \n         7, \n        )\' at line 6\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysOrderDdMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysOrderDdMapper.insertOrderDd-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_order_dd (          pr_name,           pr_num,                     om_id,          )values(          ?,           ?,                     ?,          )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'NFC橙汁\', \n         1, \n         \n         7, \n        )\' at line 6\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'NFC橙汁\', \n         1, \n         \n         7, \n        )\' at line 6', '2024-05-03 22:35:24', 2);
INSERT INTO `sys_oper_log` VALUES (339, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omId\":7,\"params\":{},\"prName\":\"洗发水\",\"prNum\":1,\"prUnitPrice\":null}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'洗发水\', \n         1, \n         \n         7, \n        )\' at line 6\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysOrderDdMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysOrderDdMapper.insertOrderDd-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_order_dd (          pr_name,           pr_num,                     om_id,          )values(          ?,           ?,                     ?,          )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'洗发水\', \n         1, \n         \n         7, \n        )\' at line 6\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'洗发水\', \n         1, \n         \n         7, \n        )\' at line 6', '2024-05-03 22:35:24', 3);
INSERT INTO `sys_oper_log` VALUES (340, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"yxxc\",\"omId\":7,\"omTotalPrice\":67.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 22:41:39', 8);
INSERT INTO `sys_oper_log` VALUES (341, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":5,\"omId\":7,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 22:41:39', 7);
INSERT INTO `sys_oper_log` VALUES (342, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":6,\"omId\":7,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 22:41:40', 4);
INSERT INTO `sys_oper_log` VALUES (343, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":7,\"omId\":7,\"params\":{},\"prName\":\"洗发水\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 22:41:40', 3);
INSERT INTO `sys_oper_log` VALUES (344, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 22:43:27', 6);
INSERT INTO `sys_oper_log` VALUES (345, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 22:43:27', 4);
INSERT INTO `sys_oper_log` VALUES (346, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 22:43:27', 4);
INSERT INTO `sys_oper_log` VALUES (347, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/7', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 22:43:27', 3);
INSERT INTO `sys_oper_log` VALUES (348, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-05-03 22:43:30', 2);
INSERT INTO `sys_oper_log` VALUES (349, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"zzyf\",\"omId\":6,\"omTotalPrice\":41.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 23:00:01', 3);
INSERT INTO `sys_oper_log` VALUES (350, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":8,\"omId\":6,\"params\":{},\"prName\":\"瓜子\",\"prNum\":2,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 23:00:01', 5);
INSERT INTO `sys_oper_log` VALUES (351, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":9,\"omId\":6,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":3,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-03 23:00:01', 3);
INSERT INTO `sys_oper_log` VALUES (352, '岗位管理', 1, 'com.ruoyi.web.controller.system.CustomerController.add()', 'POST', 1, 'admin', NULL, '/system/customer', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2016-07-27 11:24:06\",\"flag\":false,\"params\":{},\"postCode\":\"李华\",\"postId\":1,\"postName\":\"15666666666\",\"postSort\":970,\"remark\":\"UDNWc93gIk\",\"status\":\"k\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'sys_customer.PRIMARY\'\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\CustomerMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CustomerMapper.insertPost-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_customer(          cus_id,           cus_name,           cus_phone,           post_sort,           status,           remark,           create_by,          create_time         )values(          ?,           ?,           ?,           ?,           ?,           ?,           ?,          sysdate()         )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'sys_customer.PRIMARY\'\n; Duplicate entry \'1\' for key \'sys_customer.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'sys_customer.PRIMARY\'', '2024-05-11 16:02:24', 38);
INSERT INTO `sys_oper_log` VALUES (353, '岗位管理', 1, 'com.ruoyi.web.controller.system.CustomerController.add()', 'POST', 1, 'admin', NULL, '/system/customer', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2016-07-27 11:24:06\",\"flag\":false,\"params\":{},\"postCode\":\"李华\",\"postId\":1,\"postName\":\"15666666666\",\"postSort\":970,\"remark\":\"UDNWc93gIk\",\"status\":\"k\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'sys_customer.PRIMARY\'\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\CustomerMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CustomerMapper.insertPost-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_customer(          cus_id,           cus_name,           cus_phone,           post_sort,           status,           remark,           create_by,          create_time         )values(          ?,           ?,           ?,           ?,           ?,           ?,           ?,          sysdate()         )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'sys_customer.PRIMARY\'\n; Duplicate entry \'1\' for key \'sys_customer.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'sys_customer.PRIMARY\'', '2024-05-11 16:07:42', 7);
INSERT INTO `sys_oper_log` VALUES (354, '岗位管理', 1, 'com.ruoyi.web.controller.system.CustomerController.add()', 'POST', 1, 'admin', NULL, '/system/customer', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"status\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'us_phone\' in \'field list\'\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\CustomerMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.CustomerMapper.insertPost-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_customer(cus_id,                                  cus_name,                                  us_phone,                                  post_sort,                                  status,                                  remark,                                  create_by,                                  create_time)         values (?,                 ?,                 ?,                 ?,                 ?,                 ?,                 ?,                 sysdate())\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'us_phone\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'us_phone\' in \'field list\'', '2024-05-11 16:34:03', 88);
INSERT INTO `sys_oper_log` VALUES (355, '岗位管理', 1, 'com.ruoyi.web.controller.system.CustomerController.add()', 'POST', 1, 'admin', NULL, '/system/customer', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postId\":1004,\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 16:35:57', 69);
INSERT INTO `sys_oper_log` VALUES (356, '岗位管理', 1, 'com.ruoyi.web.controller.system.CustomerController.add()', 'POST', 1, 'admin', NULL, '/system/customer', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postId\":1005,\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 16:43:34', 4);
INSERT INTO `sys_oper_log` VALUES (357, '岗位管理', 1, 'com.ruoyi.web.controller.system.CustomerController.add()', 'POST', 1, 'admin', NULL, '/system/customer', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"flag\":false,\"params\":{},\"postId\":1006,\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 16:44:32', 4);
INSERT INTO `sys_oper_log` VALUES (358, '岗位管理', 3, 'com.ruoyi.web.controller.system.CustomerController.remove()', 'DELETE', 1, 'admin', NULL, '/system/customer/1004', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 16:58:52', 11);
INSERT INTO `sys_oper_log` VALUES (359, '岗位管理', 3, 'com.ruoyi.web.controller.system.CustomerController.remove()', 'DELETE', 1, 'admin', NULL, '/system/customer/1005', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 16:58:56', 6);
INSERT INTO `sys_oper_log` VALUES (360, '岗位管理', 3, 'com.ruoyi.web.controller.system.CustomerController.remove()', 'DELETE', 1, 'admin', NULL, '/system/customer/1006', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 16:58:58', 6);
INSERT INTO `sys_oper_log` VALUES (361, '岗位管理', 2, 'com.ruoyi.web.controller.system.CustomerController.edit()', 'PUT', 1, 'admin', NULL, '/system/customer', '127.0.0.1', '内网IP', '{\"createBy\":\"09vfAqwtAM\",\"createTime\":\"2016-07-27 11:24:06\",\"cusId\":1,\"cusName\":\"yxxc\",\"cusPhone\":\"15666666666\",\"flag\":false,\"params\":{},\"postSort\":970,\"remark\":\"UDNWc93gIk\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 16:59:10', 9);
INSERT INTO `sys_oper_log` VALUES (362, '岗位管理', 2, 'com.ruoyi.web.controller.system.CustomerController.edit()', 'PUT', 1, 'admin', NULL, '/system/customer', '127.0.0.1', '内网IP', '{\"createBy\":\"09vfAqwtAM\",\"createTime\":\"2016-07-27 11:24:06\",\"cusId\":1,\"cusName\":\"zzyf\",\"cusPhone\":\"15666666666\",\"flag\":false,\"params\":{},\"postSort\":970,\"remark\":\"UDNWc93gIk\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 16:59:30', 6);
INSERT INTO `sys_oper_log` VALUES (363, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-10-31 22:03:57\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 18:46:49', 13);
INSERT INTO `sys_oper_log` VALUES (364, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"seller/index\",\"createTime\":\"2023-11-05 21:53:19\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"供货商页面\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"seller\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 18:47:19', 6);
INSERT INTO `sys_oper_log` VALUES (365, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"1\",\"omId\":6,\"omTotalPrice\":29.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:14:09', 10);
INSERT INTO `sys_oper_log` VALUES (366, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderDdController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderDd', '127.0.0.1', '内网IP', '{\"odId\":8,\"omId\":6,\"params\":{},\"prName\":\"瓜子\",\"prNum\":2,\"prUnitPrice\":null,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:14:09', 4);
INSERT INTO `sys_oper_log` VALUES (367, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderDdController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderDd', '127.0.0.1', '内网IP', '{\"odId\":9,\"omId\":6,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":3,\"prUnitPrice\":null,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:14:09', 2);
INSERT INTO `sys_oper_log` VALUES (368, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"zzyf\",\"omId\":6,\"omTotalPrice\":29.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:16:02', 2);
INSERT INTO `sys_oper_log` VALUES (369, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderDdController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderDd', '127.0.0.1', '内网IP', '{\"odId\":8,\"omId\":6,\"params\":{},\"prName\":\"瓜子\",\"prNum\":2,\"prUnitPrice\":null,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:16:02', 2);
INSERT INTO `sys_oper_log` VALUES (370, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderDdController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderDd', '127.0.0.1', '内网IP', '{\"odId\":9,\"omId\":6,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":3,\"prUnitPrice\":null,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:16:02', 2);
INSERT INTO `sys_oper_log` VALUES (371, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"zzyf\",\"omId\":6,\"omTotalPrice\":29.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:23:30', 4);
INSERT INTO `sys_oper_log` VALUES (372, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderDdController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderDd', '127.0.0.1', '内网IP', '{\"odId\":8,\"omId\":6,\"params\":{},\"prName\":\"瓜子\",\"prNum\":2,\"prUnitPrice\":null,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:23:30', 3);
INSERT INTO `sys_oper_log` VALUES (373, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderDdController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderDd', '127.0.0.1', '内网IP', '{\"odId\":9,\"omId\":6,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":3,\"prUnitPrice\":null,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:23:30', 1);
INSERT INTO `sys_oper_log` VALUES (374, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"lzzy\",\"omId\":8,\"omTotalPrice\":50.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:24:32', 5);
INSERT INTO `sys_oper_log` VALUES (375, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"params\":{},\"prName\":\"洗发水\",\"prNum\":1,\"prUnitPrice\":null}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'洗发水\', \n         1, \n\n         \n        )\' at line 6\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysOrderDdMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysOrderDdMapper.insertOrderDd-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_order_dd (          pr_name,           pr_num,  --                             )values(          ?,           ?,                     )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'洗发水\', \n         1, \n\n         \n        )\' at line 6\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'洗发水\', \n         1, \n\n         \n        )\' at line 6', '2024-05-11 19:24:33', 34);
INSERT INTO `sys_oper_log` VALUES (376, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"lzzy\",\"omId\":9,\"omTotalPrice\":10.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:24:56', 3);
INSERT INTO `sys_oper_log` VALUES (377, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'瓜子\', \n         1, \n\n         \n        )\' at line 6\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysOrderDdMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysOrderDdMapper.insertOrderDd-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_order_dd (          pr_name,           pr_num,  --                             )values(          ?,           ?,                     )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'瓜子\', \n         1, \n\n         \n        )\' at line 6\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'瓜子\', \n         1, \n\n         \n        )\' at line 6', '2024-05-11 19:24:56', 3);
INSERT INTO `sys_oper_log` VALUES (378, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"lzzy\",\"omId\":10,\"omTotalPrice\":10.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:25:23', 3);
INSERT INTO `sys_oper_log` VALUES (379, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'瓜子\', \n         1, \n\n         \n        )\' at line 6\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysOrderDdMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysOrderDdMapper.insertOrderDd-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_order_dd (          pr_name,           pr_num,  --                             )values(          ?,           ?,                     )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'瓜子\', \n         1, \n\n         \n        )\' at line 6\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'瓜子\', \n         1, \n\n         \n        )\' at line 6', '2024-05-11 19:25:23', 3);
INSERT INTO `sys_oper_log` VALUES (380, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"lzzy\",\"omId\":11,\"omTotalPrice\":50.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:25:30', 5);
INSERT INTO `sys_oper_log` VALUES (381, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"params\":{},\"prName\":\"洗发水\",\"prNum\":1,\"prUnitPrice\":null}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'洗发水\', \n         1, \n\n         \n        )\' at line 6\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysOrderDdMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysOrderDdMapper.insertOrderDd-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_order_dd (          pr_name,           pr_num,  --                             )values(          ?,           ?,                     )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'洗发水\', \n         1, \n\n         \n        )\' at line 6\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'洗发水\', \n         1, \n\n         \n        )\' at line 6', '2024-05-11 19:25:30', 2);
INSERT INTO `sys_oper_log` VALUES (382, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"lzzy\",\"omId\":12,\"omTotalPrice\":50.0,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:28:03', 3);
INSERT INTO `sys_oper_log` VALUES (383, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"params\":{},\"prName\":\"洗发水\",\"prNum\":1,\"prUnitPrice\":null}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'洗发水\', \n         1, \n\n         \n        )\' at line 6\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysOrderDdMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysOrderDdMapper.insertOrderDd-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_order_dd (          pr_name,           pr_num,  --                             )values(          ?,           ?,                     )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'洗发水\', \n         1, \n\n         \n        )\' at line 6\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'洗发水\', \n         1, \n\n         \n        )\' at line 6', '2024-05-11 19:28:03', 2);
INSERT INTO `sys_oper_log` VALUES (384, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/9', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:28:57', 9);
INSERT INTO `sys_oper_log` VALUES (385, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/9', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:28:57', 2);
INSERT INTO `sys_oper_log` VALUES (386, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/8', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:28:57', 3);
INSERT INTO `sys_oper_log` VALUES (387, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/9', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-05-11 19:28:59', 2);
INSERT INTO `sys_oper_log` VALUES (388, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/10', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:29:06', 3);
INSERT INTO `sys_oper_log` VALUES (389, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/11', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:29:10', 4);
INSERT INTO `sys_oper_log` VALUES (390, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/12', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:29:13', 3);
INSERT INTO `sys_oper_log` VALUES (391, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"mzqq\",\"omId\":13,\"omTotalPrice\":400.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:30:53', 70);
INSERT INTO `sys_oper_log` VALUES (392, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"params\":{},\"prName\":\"运动鞋\",\"prNum\":1,\"prUnitPrice\":null}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'运动鞋\', \n         1, \n         \n        )\' at line 6\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysOrderDdMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysOrderDdMapper.insertOrderDd-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_order_dd (          pr_name,           pr_num,                              )values(          ?,           ?,                    )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'运动鞋\', \n         1, \n         \n        )\' at line 6\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'运动鞋\', \n         1, \n         \n        )\' at line 6', '2024-05-11 19:30:54', 35);
INSERT INTO `sys_oper_log` VALUES (393, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"zzyf\",\"omId\":6,\"omTotalPrice\":29.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:32:09', 4);
INSERT INTO `sys_oper_log` VALUES (394, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":10,\"omId\":6,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":3,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:32:09', 4);
INSERT INTO `sys_oper_log` VALUES (395, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":11,\"omId\":6,\"params\":{},\"prName\":\"瓜子\",\"prNum\":2,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:32:09', 5);
INSERT INTO `sys_oper_log` VALUES (396, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"lzzy\",\"omId\":8,\"omTotalPrice\":50.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:34:57', 3);
INSERT INTO `sys_oper_log` VALUES (397, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":12,\"omId\":8,\"params\":{},\"prName\":\"洗发水\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:34:57', 3);
INSERT INTO `sys_oper_log` VALUES (398, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"lzzy\",\"omId\":8,\"omTotalPrice\":50.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:36:36', 4);
INSERT INTO `sys_oper_log` VALUES (399, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderDdController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderDd', '127.0.0.1', '内网IP', '{\"odId\":12,\"omId\":8,\"params\":{},\"prName\":\"洗发水\",\"prNum\":1,\"prUnitPrice\":null,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:36:36', 2);
INSERT INTO `sys_oper_log` VALUES (400, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/11', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:43:26', 7);
INSERT INTO `sys_oper_log` VALUES (401, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/12', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:43:26', 8);
INSERT INTO `sys_oper_log` VALUES (402, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/10', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:43:26', 8);
INSERT INTO `sys_oper_log` VALUES (403, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"yxxc\",\"omId\":7,\"omTotalPrice\":31.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:43:49', 3);
INSERT INTO `sys_oper_log` VALUES (404, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":13,\"omId\":7,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:43:49', 2);
INSERT INTO `sys_oper_log` VALUES (405, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":14,\"omId\":7,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":3,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:43:49', 2);
INSERT INTO `sys_oper_log` VALUES (406, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/13', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:43:55', 3);
INSERT INTO `sys_oper_log` VALUES (407, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/14', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:43:55', 4);
INSERT INTO `sys_oper_log` VALUES (408, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"yxxc\",\"omId\":7,\"omTotalPrice\":31.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:43:57', 2);
INSERT INTO `sys_oper_log` VALUES (409, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderDdController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderDd', '127.0.0.1', '内网IP', '{\"odId\":14,\"omId\":7,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":3,\"prUnitPrice\":null,\"updateBy\":\"admin\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-05-11 19:43:57', 2);
INSERT INTO `sys_oper_log` VALUES (410, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderDdController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderDd', '127.0.0.1', '内网IP', '{\"odId\":13,\"omId\":7,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null,\"updateBy\":\"admin\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-05-11 19:43:57', 2);
INSERT INTO `sys_oper_log` VALUES (411, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zzyf\",\"omId\":14,\"omTotalPrice\":47.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:44:31', 4);
INSERT INTO `sys_oper_log` VALUES (412, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"params\":{},\"prName\":\"洗发水\",\"prNum\":1,\"prUnitPrice\":null}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'洗发水\', \n         1, \n         \n        )\' at line 6\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysOrderDdMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysOrderDdMapper.insertOrderDd-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_order_dd (          pr_name,           pr_num,                              )values(          ?,           ?,                    )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'洗发水\', \n         1, \n         \n        )\' at line 6\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'洗发水\', \n         1, \n         \n        )\' at line 6', '2024-05-11 19:44:32', 3);
INSERT INTO `sys_oper_log` VALUES (413, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'瓜子\', \n         1, \n         \n        )\' at line 6\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysOrderDdMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysOrderDdMapper.insertOrderDd-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_order_dd (          pr_name,           pr_num,                              )values(          ?,           ?,                    )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'瓜子\', \n         1, \n         \n        )\' at line 6\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'瓜子\', \n         1, \n         \n        )\' at line 6', '2024-05-11 19:44:32', 2);
INSERT INTO `sys_oper_log` VALUES (414, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/14', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:45:29', 3);
INSERT INTO `sys_oper_log` VALUES (415, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zzyf\",\"omId\":15,\"omTotalPrice\":21.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:45:39', 3);
INSERT INTO `sys_oper_log` VALUES (416, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"params\":{},\"prName\":\"瓜子\",\"prNum\":3,\"prUnitPrice\":null}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'瓜子\', \n         3, \n         \n        )\' at line 6\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysOrderDdMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysOrderDdMapper.insertOrderDd-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_order_dd (          pr_name,           pr_num,                              )values(          ?,           ?,                    )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'瓜子\', \n         3, \n         \n        )\' at line 6\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'瓜子\', \n         3, \n         \n        )\' at line 6', '2024-05-11 19:45:39', 2);
INSERT INTO `sys_oper_log` VALUES (417, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"yxxc\",\"omId\":7,\"omTotalPrice\":10.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:46:04', 3);
INSERT INTO `sys_oper_log` VALUES (418, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":15,\"omId\":7,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:46:04', 3);
INSERT INTO `sys_oper_log` VALUES (419, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/15', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:46:09', 3);
INSERT INTO `sys_oper_log` VALUES (420, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"yxxc\",\"omId\":7,\"omTotalPrice\":10.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:46:14', 3);
INSERT INTO `sys_oper_log` VALUES (421, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":16,\"omId\":7,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:46:15', 3);
INSERT INTO `sys_oper_log` VALUES (422, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/16', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:46:20', 3);
INSERT INTO `sys_oper_log` VALUES (423, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"zzyf\",\"omId\":6,\"omTotalPrice\":7.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:46:21', 3);
INSERT INTO `sys_oper_log` VALUES (424, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":17,\"omId\":6,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:46:22', 2);
INSERT INTO `sys_oper_log` VALUES (425, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/17', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:46:26', 2);
INSERT INTO `sys_oper_log` VALUES (426, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"zzyf\",\"omId\":6,\"omTotalPrice\":7.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:47:17', 3);
INSERT INTO `sys_oper_log` VALUES (427, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":18,\"omId\":6,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:47:18', 2);
INSERT INTO `sys_oper_log` VALUES (428, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/18', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:47:39', 4);
INSERT INTO `sys_oper_log` VALUES (429, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"zzyf\",\"omId\":6,\"omTotalPrice\":7.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:47:42', 4);
INSERT INTO `sys_oper_log` VALUES (430, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":19,\"omId\":6,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:47:42', 2);
INSERT INTO `sys_oper_log` VALUES (431, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/19', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:47:48', 4);
INSERT INTO `sys_oper_log` VALUES (432, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"zzyf\",\"omId\":6,\"omTotalPrice\":7.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:48:59', 3);
INSERT INTO `sys_oper_log` VALUES (433, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":20,\"omId\":6,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:48:59', 4);
INSERT INTO `sys_oper_log` VALUES (434, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/20', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:49:06', 3);
INSERT INTO `sys_oper_log` VALUES (435, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"zzyf\",\"omId\":6,\"omTotalPrice\":12.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:50:41', 4);
INSERT INTO `sys_oper_log` VALUES (436, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":21,\"omId\":6,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:50:41', 4);
INSERT INTO `sys_oper_log` VALUES (437, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":22,\"omId\":6,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:50:41', 3);
INSERT INTO `sys_oper_log` VALUES (438, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/22', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:51:24', 4);
INSERT INTO `sys_oper_log` VALUES (439, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/21', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:51:24', 2);
INSERT INTO `sys_oper_log` VALUES (440, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"zzyf\",\"omId\":6,\"omTotalPrice\":12.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:51:31', 4);
INSERT INTO `sys_oper_log` VALUES (441, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":23,\"omId\":6,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:51:32', 2);
INSERT INTO `sys_oper_log` VALUES (442, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":24,\"omId\":6,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:51:32', 2);
INSERT INTO `sys_oper_log` VALUES (443, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/24', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:51:40', 3);
INSERT INTO `sys_oper_log` VALUES (444, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/23', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:51:40', 3);
INSERT INTO `sys_oper_log` VALUES (445, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"yxxc\",\"omId\":7,\"omTotalPrice\":21.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:51:49', 2);
INSERT INTO `sys_oper_log` VALUES (446, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":25,\"omId\":7,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":3,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:51:49', 3);
INSERT INTO `sys_oper_log` VALUES (447, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/25', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:51:59', 3);
INSERT INTO `sys_oper_log` VALUES (448, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"yxxc\",\"omId\":7,\"omTotalPrice\":21.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:52:05', 3);
INSERT INTO `sys_oper_log` VALUES (449, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":26,\"omId\":7,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":3,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:52:05', 3);
INSERT INTO `sys_oper_log` VALUES (450, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/26', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:52:11', 4);
INSERT INTO `sys_oper_log` VALUES (451, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"zzyf\",\"omId\":15,\"omTotalPrice\":15.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:52:13', 3);
INSERT INTO `sys_oper_log` VALUES (452, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":27,\"omId\":15,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":3,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:52:14', 2);
INSERT INTO `sys_oper_log` VALUES (453, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/27', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:52:22', 3);
INSERT INTO `sys_oper_log` VALUES (454, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/15', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:52:34', 3);
INSERT INTO `sys_oper_log` VALUES (455, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"zzyf\",\"omId\":6,\"omTotalPrice\":0.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:57:15', 5);
INSERT INTO `sys_oper_log` VALUES (456, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"zzyf\",\"omId\":6,\"omTotalPrice\":12.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:57:20', 3);
INSERT INTO `sys_oper_log` VALUES (457, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":28,\"omId\":6,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:57:20', 2);
INSERT INTO `sys_oper_log` VALUES (458, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":29,\"omId\":6,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:57:20', 4);
INSERT INTO `sys_oper_log` VALUES (459, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/28', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:57:28', 2);
INSERT INTO `sys_oper_log` VALUES (460, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/29', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:57:28', 3);
INSERT INTO `sys_oper_log` VALUES (461, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"zzyf\",\"omId\":6,\"omTotalPrice\":12.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:57:50', 3);
INSERT INTO `sys_oper_log` VALUES (462, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":31,\"omId\":6,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:57:50', 2);
INSERT INTO `sys_oper_log` VALUES (463, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":30,\"omId\":6,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:57:50', 3);
INSERT INTO `sys_oper_log` VALUES (464, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/31', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:57:58', 4);
INSERT INTO `sys_oper_log` VALUES (465, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/30', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:57:58', 4);
INSERT INTO `sys_oper_log` VALUES (466, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"zzyf\",\"omId\":6,\"omTotalPrice\":12.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:58:00', 3);
INSERT INTO `sys_oper_log` VALUES (467, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":32,\"omId\":6,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:58:00', 3);
INSERT INTO `sys_oper_log` VALUES (468, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":33,\"omId\":6,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:58:00', 3);
INSERT INTO `sys_oper_log` VALUES (469, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/33', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:59:47', 4);
INSERT INTO `sys_oper_log` VALUES (470, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/32', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:59:47', 3);
INSERT INTO `sys_oper_log` VALUES (471, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"zzyf\",\"omId\":6,\"omTotalPrice\":12.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:59:49', 3);
INSERT INTO `sys_oper_log` VALUES (472, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":34,\"omId\":6,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:59:49', 2);
INSERT INTO `sys_oper_log` VALUES (473, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":35,\"omId\":6,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 19:59:49', 2);
INSERT INTO `sys_oper_log` VALUES (474, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/34', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:00:51', 3);
INSERT INTO `sys_oper_log` VALUES (475, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/35', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:00:51', 4);
INSERT INTO `sys_oper_log` VALUES (476, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"zzyf\",\"omId\":6,\"omTotalPrice\":12.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:00:51', 2);
INSERT INTO `sys_oper_log` VALUES (477, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":37,\"omId\":6,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:00:52', 2);
INSERT INTO `sys_oper_log` VALUES (478, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":36,\"omId\":6,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:00:52', 2);
INSERT INTO `sys_oper_log` VALUES (479, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"zzyf\",\"omId\":6,\"omTotalPrice\":12.0,\"params\":{},\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:01:01', 4);
INSERT INTO `sys_oper_log` VALUES (480, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":39,\"omId\":6,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:01:01', 3);
INSERT INTO `sys_oper_log` VALUES (481, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":38,\"omId\":6,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:01:01', 2);
INSERT INTO `sys_oper_log` VALUES (482, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/36', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:01:55', 3);
INSERT INTO `sys_oper_log` VALUES (483, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/37', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:01:55', 5);
INSERT INTO `sys_oper_log` VALUES (484, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/38', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:01:55', 4);
INSERT INTO `sys_oper_log` VALUES (485, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/39', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:01:55', 2);
INSERT INTO `sys_oper_log` VALUES (486, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"zzyf\",\"omId\":6,\"omTotalPrice\":12.0,\"params\":{},\"status\":0,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:02:06', 3);
INSERT INTO `sys_oper_log` VALUES (487, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":41,\"omId\":6,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:02:06', 2);
INSERT INTO `sys_oper_log` VALUES (488, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":40,\"omId\":6,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:02:06', 2);
INSERT INTO `sys_oper_log` VALUES (489, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/40', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:02:11', 2);
INSERT INTO `sys_oper_log` VALUES (490, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/41', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:02:11', 2);
INSERT INTO `sys_oper_log` VALUES (491, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"zzyf\",\"omId\":6,\"omTotalPrice\":12.0,\"params\":{},\"status\":0,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:02:17', 3);
INSERT INTO `sys_oper_log` VALUES (492, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":43,\"omId\":6,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:02:17', 2);
INSERT INTO `sys_oper_log` VALUES (493, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":42,\"omId\":6,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:02:17', 3);
INSERT INTO `sys_oper_log` VALUES (494, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/43', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:03:01', 3);
INSERT INTO `sys_oper_log` VALUES (495, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/42', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:03:01', 3);
INSERT INTO `sys_oper_log` VALUES (496, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"zzyf\",\"omId\":6,\"omTotalPrice\":12.0,\"params\":{},\"status\":0,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:03:04', 2);
INSERT INTO `sys_oper_log` VALUES (497, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":44,\"omId\":6,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:03:05', 2);
INSERT INTO `sys_oper_log` VALUES (498, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":45,\"omId\":6,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:03:05', 2);
INSERT INTO `sys_oper_log` VALUES (499, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/44', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:05:09', 3);
INSERT INTO `sys_oper_log` VALUES (500, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/45', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:05:09', 1);
INSERT INTO `sys_oper_log` VALUES (501, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"zzyf\",\"omId\":6,\"omTotalPrice\":17.0,\"params\":{},\"status\":0,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:05:13', 3);
INSERT INTO `sys_oper_log` VALUES (502, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":46,\"omId\":6,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":2,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:05:13', 3);
INSERT INTO `sys_oper_log` VALUES (503, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":47,\"omId\":6,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:05:13', 2);
INSERT INTO `sys_oper_log` VALUES (504, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/46', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:09:38', 3);
INSERT INTO `sys_oper_log` VALUES (505, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/47', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:09:38', 3);
INSERT INTO `sys_oper_log` VALUES (506, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"zzyf\",\"omId\":6,\"omTotalPrice\":17.0,\"params\":{},\"status\":0,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:09:39', 3);
INSERT INTO `sys_oper_log` VALUES (507, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":48,\"omId\":6,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":2,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:09:39', 3);
INSERT INTO `sys_oper_log` VALUES (508, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":49,\"omId\":6,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:09:39', 2);
INSERT INTO `sys_oper_log` VALUES (509, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/48', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:10:10', 4);
INSERT INTO `sys_oper_log` VALUES (510, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/49', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:10:10', 3);
INSERT INTO `sys_oper_log` VALUES (511, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"zzyf\",\"omId\":6,\"omTotalPrice\":17.0,\"params\":{},\"status\":1,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:10:11', 4);
INSERT INTO `sys_oper_log` VALUES (512, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":51,\"omId\":6,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:10:11', 2);
INSERT INTO `sys_oper_log` VALUES (513, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":50,\"omId\":6,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":2,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:10:11', 2);
INSERT INTO `sys_oper_log` VALUES (514, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/50', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:17:59', 4);
INSERT INTO `sys_oper_log` VALUES (515, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/51', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:17:59', 4);
INSERT INTO `sys_oper_log` VALUES (516, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"zzyf\",\"omId\":6,\"omTotalPrice\":17.0,\"params\":{},\"status\":0,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:18:01', 3);
INSERT INTO `sys_oper_log` VALUES (517, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":52,\"omId\":6,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:18:01', 2);
INSERT INTO `sys_oper_log` VALUES (518, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":53,\"omId\":6,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":2,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:18:01', 2);
INSERT INTO `sys_oper_log` VALUES (519, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/52', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:19:18', 2);
INSERT INTO `sys_oper_log` VALUES (520, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/53', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:19:18', 2);
INSERT INTO `sys_oper_log` VALUES (521, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"zzyf\",\"omId\":6,\"omTotalPrice\":12.0,\"params\":{},\"status\":0,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:19:28', 4);
INSERT INTO `sys_oper_log` VALUES (522, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":54,\"omId\":6,\"params\":{},\"prName\":\"瓜子\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:19:28', 3);
INSERT INTO `sys_oper_log` VALUES (523, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":55,\"omId\":6,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":1,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 20:19:29', 3);
INSERT INTO `sys_oper_log` VALUES (524, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/55', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 21:51:13', 4);
INSERT INTO `sys_oper_log` VALUES (525, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/54', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 21:51:13', 4);
INSERT INTO `sys_oper_log` VALUES (526, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"yxxc\",\"omId\":7,\"omTotalPrice\":41.0,\"params\":{},\"status\":0,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 21:53:21', 3);
INSERT INTO `sys_oper_log` VALUES (527, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":56,\"omId\":7,\"params\":{},\"prName\":\"瓜子\",\"prNum\":2,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 21:53:22', 3);
INSERT INTO `sys_oper_log` VALUES (528, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":57,\"omId\":7,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":3,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 21:53:22', 3);
INSERT INTO `sys_oper_log` VALUES (529, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/56', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 21:53:34', 3);
INSERT INTO `sys_oper_log` VALUES (530, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/57', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 21:53:34', 4);
INSERT INTO `sys_oper_log` VALUES (531, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"yxxc\",\"omId\":7,\"omTotalPrice\":41.0,\"params\":{},\"status\":0,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 21:54:01', 2);
INSERT INTO `sys_oper_log` VALUES (532, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":58,\"omId\":7,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":3,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 21:54:02', 4);
INSERT INTO `sys_oper_log` VALUES (533, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":59,\"omId\":7,\"params\":{},\"prName\":\"瓜子\",\"prNum\":2,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 21:54:02', 4);
INSERT INTO `sys_oper_log` VALUES (534, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/58', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 21:54:11', 2);
INSERT INTO `sys_oper_log` VALUES (535, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/59', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 21:54:11', 2);
INSERT INTO `sys_oper_log` VALUES (536, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"yxxc\",\"omId\":7,\"omTotalPrice\":41.0,\"params\":{},\"status\":0,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 21:54:13', 3);
INSERT INTO `sys_oper_log` VALUES (537, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":60,\"omId\":7,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":3,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 21:54:14', 2);
INSERT INTO `sys_oper_log` VALUES (538, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":61,\"omId\":7,\"params\":{},\"prName\":\"瓜子\",\"prNum\":2,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 21:54:14', 2);
INSERT INTO `sys_oper_log` VALUES (539, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/61', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 21:55:37', 3);
INSERT INTO `sys_oper_log` VALUES (540, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/60', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 21:55:37', 4);
INSERT INTO `sys_oper_log` VALUES (541, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"yxxc\",\"omId\":7,\"omTotalPrice\":41.0,\"params\":{},\"status\":0,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 21:55:41', 3);
INSERT INTO `sys_oper_log` VALUES (542, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":62,\"omId\":7,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":3,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 21:55:41', 3);
INSERT INTO `sys_oper_log` VALUES (543, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":63,\"omId\":7,\"params\":{},\"prName\":\"瓜子\",\"prNum\":2,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 21:55:41', 3);
INSERT INTO `sys_oper_log` VALUES (544, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/62', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 21:57:56', 3);
INSERT INTO `sys_oper_log` VALUES (545, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/63', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 21:57:56', 3);
INSERT INTO `sys_oper_log` VALUES (546, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"yxxc\",\"omId\":7,\"omTotalPrice\":41.0,\"params\":{},\"status\":0,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 21:57:59', 4);
INSERT INTO `sys_oper_log` VALUES (547, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":64,\"omId\":7,\"params\":{},\"prName\":\"NFC橙汁\",\"prNum\":3,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 21:57:59', 2);
INSERT INTO `sys_oper_log` VALUES (548, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":65,\"omId\":7,\"params\":{},\"prName\":\"瓜子\",\"prNum\":2,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 21:58:00', 2);
INSERT INTO `sys_oper_log` VALUES (549, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"yxxc\",\"omId\":7,\"omTotalPrice\":41.0,\"params\":{},\"status\":1,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 21:58:01', 3);
INSERT INTO `sys_oper_log` VALUES (550, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/online/index\",\"createTime\":\"2023-10-31 22:03:57\",\"icon\":\"online\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":109,\"menuName\":\"在线用户\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2,\"path\":\"online\",\"perms\":\"monitor:online:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 22:32:21', 15);
INSERT INTO `sys_oper_log` VALUES (551, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dict/index\",\"createTime\":\"2023-10-31 22:03:57\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":105,\"menuName\":\"字典管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":1,\"path\":\"dict\",\"perms\":\"system:dict:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 22:34:09', 6);
INSERT INTO `sys_oper_log` VALUES (552, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/config/index\",\"createTime\":\"2023-10-31 22:03:57\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":106,\"menuName\":\"参数设置\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":1,\"path\":\"config\",\"perms\":\"system:config:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 22:34:15', 6);
INSERT INTO `sys_oper_log` VALUES (553, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-10-31 22:03:57\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":108,\"menuName\":\"日志管理\",\"menuType\":\"M\",\"orderNum\":9,\"params\":{},\"parentId\":1,\"path\":\"log\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 22:34:20', 7);
INSERT INTO `sys_oper_log` VALUES (554, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"redis-list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"数据大屏\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"dataVenterprise\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 22:48:59', 7);
INSERT INTO `sys_oper_log` VALUES (555, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"search\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"采购管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"purchaseObject\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 21:00:20', 15);
INSERT INTO `sys_oper_log` VALUES (556, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"supplier/index\",\"createTime\":\"2023-11-01 12:41:04\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"供货商管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2008,\"path\":\"supplier\",\"perms\":\"system:supplier:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 21:00:38', 6);
INSERT INTO `sys_oper_log` VALUES (557, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"货品采购\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":2008,\"path\":\"purchase\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 21:01:15', 5);
INSERT INTO `sys_oper_log` VALUES (558, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/purchase/index\",\"createTime\":\"2024-05-12 21:01:15\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"货品采购\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2008,\"path\":\"purchase\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 21:01:45', 4);
INSERT INTO `sys_oper_log` VALUES (559, '用户管理', 1, 'com.ruoyi.web.controller.system.SysGoodController.add()', 'POST', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"deptId\":105,\"oriPrice\":18.0,\"params\":{},\"prId\":115,\"prName\":\"德芙纵享丝滑\",\"prNum\":0,\"prPrice\":22.0,\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 21:16:42', 78);
INSERT INTO `sys_oper_log` VALUES (560, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-11-01 22:42:59\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,107,2,1035,108,500,1039,1040,1041,501,1042,1043,1044,1045,2002,2005,2008,2009,2000,2004,1049,1050,1051,1052,1053,1054],\"params\":{},\"roleId\":100,\"roleKey\":\"purchase\",\"roleName\":\"采购人员\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 21:55:16', 20);
INSERT INTO `sys_oper_log` VALUES (561, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-11-08 22:48:09\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,2001,2002,2003,2005,2008,2009,2000,2007,1049,1050,1051,1052,1053,1054],\"params\":{},\"roleId\":101,\"roleKey\":\"shopdirector\",\"roleName\":\"店长\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 21:55:27', 14);
INSERT INTO `sys_oper_log` VALUES (562, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-11-09 00:00:17\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,107,2,1035,108,500,1039,1040,1041,501,1042,1043,1044,1045,2001,2002,2003,2005,1049,1050,1051,1052,1053,1054],\"params\":{},\"roleId\":103,\"roleKey\":\"sell\",\"roleName\":\"销售\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 21:55:42', 10);
INSERT INTO `sys_oper_log` VALUES (563, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-10-31 22:03:57\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,107,2,1035,108,500,1039,1040,1041,501,1042,1043,1044,1045,2001,2002,2003,2005,1049,1050,1051,1052,1053,1054],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"店员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 21:55:47', 12);
INSERT INTO `sys_oper_log` VALUES (564, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/05/12/blob_20240512215606A001.png\",\"code\":200}', 0, NULL, '2024-05-12 21:56:06', 64);
INSERT INTO `sys_oper_log` VALUES (565, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":true,\"avatar\":\"/profile/avatar/2023/11/10/blob_20231110223339A001.png\",\"createBy\":\"admin\",\"createTime\":\"2023-10-31 22:03:57\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"管理部门\",\"leader\":\"yxc\",\"orderNum\":1,\"params\":{\"@type\":\"java.util.HashMap\"},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"wiser@163.com\",\"loginDate\":\"2024-05-12 20:12:37\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"周经理\",\"params\":{\"@type\":\"java.util.HashMap\"},\"phonenumber\":\"15888888888\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{\"@type\":\"java.util.HashMap\"},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 21:56:11', 11);
INSERT INTO `sys_oper_log` VALUES (566, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2023-11-08 22:52:40\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"总店\",\"leader\":\"yxc\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":101,\"email\":\"\",\"loginDate\":\"2023-11-11 18:08:26\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"dianzhang\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[101],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":101,\"roleKey\":\"shopdirector\",\"roleName\":\"店长\",\"roleSort\":0,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":102,\"userName\":\"dianzhang\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 21:58:56', 10);
INSERT INTO `sys_oper_log` VALUES (567, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-11-08 22:48:09\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,2001,2002,2003,2005,2008,2009,2000,2007,1049,1050,1051,1052,1053,1054],\"params\":{},\"roleId\":101,\"roleKey\":\"shopdirector\",\"roleName\":\"店长\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 21:59:19', 12);
INSERT INTO `sys_oper_log` VALUES (568, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2023-10-31 22:03:57\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"部门管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 21:59:40', 11);
INSERT INTO `sys_oper_log` VALUES (569, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2023-10-31 22:03:57\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"部门管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 22:00:04', 6);
INSERT INTO `sys_oper_log` VALUES (570, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2023-10-31 22:03:57\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":104,\"menuName\":\"岗位管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"post\",\"perms\":\"system:post:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 22:00:09', 4);
INSERT INTO `sys_oper_log` VALUES (571, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/menu/index\",\"createTime\":\"2023-10-31 22:03:57\",\"icon\":\"tree-table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":102,\"menuName\":\"菜单管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"menu\",\"perms\":\"system:menu:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 22:00:16', 5);
INSERT INTO `sys_oper_log` VALUES (572, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2023-11-08 22:52:40\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"总店\",\"leader\":\"yxc\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":101,\"email\":\"\",\"loginDate\":\"2024-05-12 23:17:22\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"dianzhang\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[101],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":101,\"roleKey\":\"shopdirector\",\"roleName\":\"店长\",\"roleSort\":0,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":102,\"userName\":\"dianzhang\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:31:16', 35);
INSERT INTO `sys_oper_log` VALUES (573, '岗位管理', 3, 'com.ruoyi.web.controller.system.CustomerController.remove()', 'DELETE', 1, 'admin', NULL, '/system/customer/1008', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:32:33', 16);
INSERT INTO `sys_oper_log` VALUES (574, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zzyf\",\"omTotalPrice\":21.0,\"params\":{},\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'om_total_price, \n        create_time\n        )values(\n         \n         \'zzyf\',\' at line 5\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysOrderMmMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysOrderMmMapper.insertOrderMm-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_order_mm (                    om_customer,           g          om_total_price,          create_time         )values(                    ?,                     ?,          sysdate()         )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'om_total_price, \n        create_time\n        )values(\n         \n         \'zzyf\',\' at line 5\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'om_total_price, \n        create_time\n        )values(\n         \n         \'zzyf\',\' at line 5', '2024-05-12 23:35:06', 11);
INSERT INTO `sys_oper_log` VALUES (575, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zzyf\",\"omTotalPrice\":21.0,\"params\":{},\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'om_total_price, \n        create_time\n        )values(\n         \n         \'zzyf\',\' at line 5\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysOrderMmMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysOrderMmMapper.insertOrderMm-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_order_mm (                    om_customer,           g          om_total_price,          create_time         )values(                    ?,                     ?,          sysdate()         )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'om_total_price, \n        create_time\n        )values(\n         \n         \'zzyf\',\' at line 5\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'om_total_price, \n        create_time\n        )values(\n         \n         \'zzyf\',\' at line 5', '2024-05-12 23:35:12', 4);
INSERT INTO `sys_oper_log` VALUES (576, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zzyf\",\"omTotalPrice\":21.0,\"params\":{},\"status\":0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'om_total_price, \n        create_time\n        )values(\n         \n         \'zzyf\',\' at line 5\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysOrderMmMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysOrderMmMapper.insertOrderMm-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_order_mm (                    om_customer,           g          om_total_price,          create_time         )values(                    ?,                     ?,          sysdate()         )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'om_total_price, \n        create_time\n        )values(\n         \n         \'zzyf\',\' at line 5\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'om_total_price, \n        create_time\n        )values(\n         \n         \'zzyf\',\' at line 5', '2024-05-12 23:35:58', 5);
INSERT INTO `sys_oper_log` VALUES (577, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zzyf\",\"omId\":16,\"omTotalPrice\":21.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:36:37', 174);
INSERT INTO `sys_oper_log` VALUES (578, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"params\":{},\"prName\":\"瓜子\",\"prNum\":3,\"prUnitPrice\":null}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'瓜子\', \n         3, \n         \n        )\' at line 6\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysOrderDdMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysOrderDdMapper.insertOrderDd-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_order_dd (          pr_name,           pr_num,                              )values(          ?,           ?,                    )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'瓜子\', \n         3, \n         \n        )\' at line 6\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'瓜子\', \n         3, \n         \n        )\' at line 6', '2024-05-12 23:36:38', 69);
INSERT INTO `sys_oper_log` VALUES (579, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zzyf\",\"omId\":17,\"omTotalPrice\":21.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:38:47', 159);
INSERT INTO `sys_oper_log` VALUES (580, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"params\":{},\"prName\":\"瓜子\",\"prNum\":3,\"prUnitPrice\":null}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'瓜子\', \n         3, \n         \n         \n        )\' at line 6\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysOrderDdMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysOrderDdMapper.insertOrderDd-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_order_dd (          pr_name,           pr_num,                              )values(          ?,           ?,                              )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'瓜子\', \n         3, \n         \n         \n        )\' at line 6\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'瓜子\', \n         3, \n         \n         \n        )\' at line 6', '2024-05-12 23:38:47', 58);
INSERT INTO `sys_oper_log` VALUES (581, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zzyf\",\"omId\":18,\"omTotalPrice\":21.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:39:55', 174);
INSERT INTO `sys_oper_log` VALUES (582, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"params\":{},\"prName\":\"瓜子\",\"prNum\":3,\"prUnitPrice\":null}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'瓜子\', \n         3, \n         \n         \n        )\' at line 6\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysOrderDdMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysOrderDdMapper.insertOrderDd-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_order_dd (          pr_name,           pr_num,                              )values(          ?,           ?,                              )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'瓜子\', \n         3, \n         \n         \n        )\' at line 6\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'瓜子\', \n         3, \n         \n         \n        )\' at line 6', '2024-05-12 23:39:56', 71);
INSERT INTO `sys_oper_log` VALUES (583, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zzyf\",\"omId\":19,\"omTotalPrice\":21.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:42:25', 152);
INSERT INTO `sys_oper_log` VALUES (584, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"params\":{},\"prName\":\"瓜子\",\"prNum\":3,\"prUnitPrice\":null}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'瓜子\', \n         3, \n         \n        )\' at line 5\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysOrderDdMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysOrderDdMapper.insertOrderDd-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_order_dd (          pr_name,           pr_num,                    )values(          ?,           ?,                    )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'瓜子\', \n         3, \n         \n        )\' at line 5\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \')values(\n         \'瓜子\', \n         3, \n         \n        )\' at line 5', '2024-05-12 23:42:26', 56);
INSERT INTO `sys_oper_log` VALUES (585, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/16', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:43:40', 22);
INSERT INTO `sys_oper_log` VALUES (586, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/65', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:43:41', 14);
INSERT INTO `sys_oper_log` VALUES (587, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/64', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:43:41', 14);
INSERT INTO `sys_oper_log` VALUES (588, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/16', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-05-12 23:43:44', 3);
INSERT INTO `sys_oper_log` VALUES (589, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zzyf\",\"omId\":20,\"omTotalPrice\":21.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:43:56', 19);
INSERT INTO `sys_oper_log` VALUES (590, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":66,\"params\":{},\"prName\":\"瓜子\",\"prNum\":3,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:43:56', 13);
INSERT INTO `sys_oper_log` VALUES (591, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zzyf\",\"omId\":21,\"omTotalPrice\":21.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:43:59', 6);
INSERT INTO `sys_oper_log` VALUES (592, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":67,\"params\":{},\"prName\":\"瓜子\",\"prNum\":3,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:44:00', 14);
INSERT INTO `sys_oper_log` VALUES (593, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zzyf\",\"omId\":22,\"omTotalPrice\":21.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:44:00', 13);
INSERT INTO `sys_oper_log` VALUES (594, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":68,\"params\":{},\"prName\":\"瓜子\",\"prNum\":3,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:44:01', 11);
INSERT INTO `sys_oper_log` VALUES (595, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zzyf\",\"omId\":23,\"omTotalPrice\":21.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:44:01', 32);
INSERT INTO `sys_oper_log` VALUES (596, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":69,\"params\":{},\"prName\":\"瓜子\",\"prNum\":3,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:44:02', 8);
INSERT INTO `sys_oper_log` VALUES (597, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zzyf\",\"omId\":24,\"omTotalPrice\":21.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:44:03', 13);
INSERT INTO `sys_oper_log` VALUES (598, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":70,\"params\":{},\"prName\":\"瓜子\",\"prNum\":3,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:44:03', 13);
INSERT INTO `sys_oper_log` VALUES (599, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zzyf\",\"omId\":25,\"omTotalPrice\":21.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:44:04', 11);
INSERT INTO `sys_oper_log` VALUES (600, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":71,\"params\":{},\"prName\":\"瓜子\",\"prNum\":3,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:44:05', 10);
INSERT INTO `sys_oper_log` VALUES (601, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zzyf\",\"omId\":26,\"omTotalPrice\":21.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:44:05', 12);
INSERT INTO `sys_oper_log` VALUES (602, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":72,\"params\":{},\"prName\":\"瓜子\",\"prNum\":3,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:44:06', 15);
INSERT INTO `sys_oper_log` VALUES (603, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zzyf\",\"omId\":27,\"omTotalPrice\":21.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:44:06', 5);
INSERT INTO `sys_oper_log` VALUES (604, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":73,\"params\":{},\"prName\":\"瓜子\",\"prNum\":3,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:44:06', 6);
INSERT INTO `sys_oper_log` VALUES (605, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zzyf\",\"omId\":28,\"omTotalPrice\":21.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:44:06', 7);
INSERT INTO `sys_oper_log` VALUES (606, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":74,\"params\":{},\"prName\":\"瓜子\",\"prNum\":3,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:44:06', 5);
INSERT INTO `sys_oper_log` VALUES (607, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zzyf\",\"omId\":29,\"omTotalPrice\":21.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:44:07', 11);
INSERT INTO `sys_oper_log` VALUES (608, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":75,\"params\":{},\"prName\":\"瓜子\",\"prNum\":3,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:44:07', 11);
INSERT INTO `sys_oper_log` VALUES (609, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zzyf\",\"omId\":30,\"omTotalPrice\":21.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:44:13', 11);
INSERT INTO `sys_oper_log` VALUES (610, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderDdController.add()', 'POST', 1, 'admin', NULL, '/system/orderDd/batch', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"odId\":76,\"params\":{},\"prName\":\"瓜子\",\"prNum\":3,\"prUnitPrice\":null}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:44:14', 12);
INSERT INTO `sys_oper_log` VALUES (611, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omId\":31,\"omTotalPrice\":0.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:53:39', 5);
INSERT INTO `sys_oper_log` VALUES (612, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omId\":32,\"omTotalPrice\":0.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:53:40', 11);
INSERT INTO `sys_oper_log` VALUES (613, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zzyf\",\"omId\":33,\"omTotalPrice\":0.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:54:04', 5);
INSERT INTO `sys_oper_log` VALUES (614, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zzyf\",\"omId\":34,\"omTotalPrice\":0.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:54:05', 11);
INSERT INTO `sys_oper_log` VALUES (615, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omId\":35,\"omTotalPrice\":0.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:54:57', 11);
INSERT INTO `sys_oper_log` VALUES (616, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omId\":36,\"omTotalPrice\":0.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:54:58', 11);
INSERT INTO `sys_oper_log` VALUES (617, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omId\":37,\"omTotalPrice\":0.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:55:10', 10);
INSERT INTO `sys_oper_log` VALUES (618, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/17', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:56:19', 15);
INSERT INTO `sys_oper_log` VALUES (619, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/67', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:56:19', 8);
INSERT INTO `sys_oper_log` VALUES (620, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/66', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:56:19', 8);
INSERT INTO `sys_oper_log` VALUES (621, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/68', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:56:19', 10);
INSERT INTO `sys_oper_log` VALUES (622, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/69', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:56:19', 9);
INSERT INTO `sys_oper_log` VALUES (623, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/70', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:56:19', 11);
INSERT INTO `sys_oper_log` VALUES (624, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/71', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:56:19', 11);
INSERT INTO `sys_oper_log` VALUES (625, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/74', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:56:19', 6);
INSERT INTO `sys_oper_log` VALUES (626, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/72', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:56:19', 7);
INSERT INTO `sys_oper_log` VALUES (627, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/75', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:56:19', 6);
INSERT INTO `sys_oper_log` VALUES (628, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/73', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:56:19', 6);
INSERT INTO `sys_oper_log` VALUES (629, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/17', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-05-12 23:56:22', 3);
INSERT INTO `sys_oper_log` VALUES (630, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderDdController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderDd/76', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:56:22', 10);
INSERT INTO `sys_oper_log` VALUES (631, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/18', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:56:26', 12);
INSERT INTO `sys_oper_log` VALUES (632, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/19', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:56:29', 10);
INSERT INTO `sys_oper_log` VALUES (633, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/20', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:56:32', 12);
INSERT INTO `sys_oper_log` VALUES (634, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/21', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:56:38', 10);
INSERT INTO `sys_oper_log` VALUES (635, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/,,,,,', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-05-12 23:56:49', 3);
INSERT INTO `sys_oper_log` VALUES (636, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/22', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:57:09', 11);
INSERT INTO `sys_oper_log` VALUES (637, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/23', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:57:13', 5);
INSERT INTO `sys_oper_log` VALUES (638, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/23', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-05-12 23:57:16', 3);
INSERT INTO `sys_oper_log` VALUES (639, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/24', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:57:19', 4);
INSERT INTO `sys_oper_log` VALUES (640, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"仓库管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"path\":\"system/wareHouse/index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-21 17:46:26', 24);
INSERT INTO `sys_oper_log` VALUES (641, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/wareHouses/index\",\"createTime\":\"2024-05-21 17:46:26\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2010,\"menuName\":\"仓库管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"path\":\"warehouse\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-21 17:47:08', 12);
INSERT INTO `sys_oper_log` VALUES (642, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zzyf\",\"omId\":38,\"omTotalPrice\":21.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-21 21:44:26', 11);
INSERT INTO `sys_oper_log` VALUES (643, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/25', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-21 21:44:45', 5);
INSERT INTO `sys_oper_log` VALUES (644, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/,,,,,', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-05-21 21:44:54', 1);
INSERT INTO `sys_oper_log` VALUES (645, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zzyf\",\"omId\":39,\"omTotalPrice\":21.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-22 16:35:47', 22);
INSERT INTO `sys_oper_log` VALUES (646, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"lzzy\",\"omId\":8,\"omTotalPrice\":0.0,\"params\":{},\"status\":0,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-22 16:36:39', 11);
INSERT INTO `sys_oper_log` VALUES (647, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zzyf\",\"omId\":40,\"omTotalPrice\":21.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-22 16:52:25', 3);
INSERT INTO `sys_oper_log` VALUES (648, '总订单管理', 2, 'com.ruoyi.web.controller.system.SysOrderMmController.edit()', 'PUT', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"omCustomer\":\"zzyf\",\"omTotalPrice\":21.0,\"params\":{},\"status\":1,\"updateBy\":\"admin\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-05-22 16:52:27', 3);
INSERT INTO `sys_oper_log` VALUES (649, '用户管理', 2, 'com.ruoyi.web.controller.system.SysGoodController.edit()', 'PUT', 1, 'admin', NULL, '/system/good', '127.0.0.1', '内网IP', '{\"deptId\":105,\"oriPrice\":10.0,\"params\":{},\"prId\":111,\"prName\":\"瓜子\",\"prNum\":17,\"prPrice\":7.0,\"status\":0,\"updateBy\":\"admin\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Table \'learn.sys_good_role\' doesn\'t exist\r\n### The error may exist in file [C:\\Users\\21029\\Desktop\\WholesaleAndRetailSystem\\ruoyi-system\\target\\classes\\mapper\\system\\SysGoodRoleMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysGoodRoleMapper.deleteUserRoleByUserId-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from sys_good_role where user_id=?\r\n### Cause: java.sql.SQLSyntaxErrorException: Table \'learn.sys_good_role\' doesn\'t exist\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Table \'learn.sys_good_role\' doesn\'t exist', '2024-05-22 16:52:27', 42);
INSERT INTO `sys_oper_log` VALUES (650, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/40', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-22 16:55:05', 5);
INSERT INTO `sys_oper_log` VALUES (651, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-31 22:03:57\",\"noticeContent\":\"<p>放假10000000天</p>\",\"noticeId\":2,\"noticeTitle\":\"六一儿童节放假通知\",\"noticeType\":\"1\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-11-09 23:58:19\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-22 17:00:18', 7);
INSERT INTO `sys_oper_log` VALUES (652, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-31 22:03:57\",\"noticeContent\":\"<p>放假10000000天</p>\",\"noticeId\":2,\"noticeTitle\":\"国庆放假通知\",\"noticeType\":\"1\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-22 17:00:18\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-22 17:00:30', 3);
INSERT INTO `sys_oper_log` VALUES (653, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"noticeContent\":\"<p><br></p>\",\"noticeTitle\":\"六一儿童节放假通知\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-22 17:00:49', 3);
INSERT INTO `sys_oper_log` VALUES (654, '岗位管理', 3, 'com.ruoyi.web.controller.system.CustomerController.remove()', 'DELETE', 1, 'admin', NULL, '/system/customer/1009', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-22 17:08:42', 5);
INSERT INTO `sys_oper_log` VALUES (655, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zzyf\",\"omId\":41,\"omTotalPrice\":21.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-22 17:12:52', 3);
INSERT INTO `sys_oper_log` VALUES (656, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/41', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-22 17:12:59', 3);
INSERT INTO `sys_oper_log` VALUES (657, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2023-11-08 22:58:39\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":107,\"deptName\":\"销售部门\",\"leader\":\"若依\",\"orderNum\":4,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":107,\"email\":\"\",\"loginDate\":\"2023-11-08 23:50:12\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"dianyuan\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"店员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":103,\"userName\":\"dianyuan\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-22 17:19:03', 8);
INSERT INTO `sys_oper_log` VALUES (658, '总订单管理', 1, 'com.ruoyi.web.controller.system.SysOrderMmController.add()', 'POST', 1, 'admin', NULL, '/system/orderMm', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"omCustomer\":\"zzyf\",\"omId\":42,\"omTotalPrice\":59.0,\"params\":{},\"status\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-22 17:21:42', 4);
INSERT INTO `sys_oper_log` VALUES (659, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/39', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-22 19:15:14', 8);
INSERT INTO `sys_oper_log` VALUES (660, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/39', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-05-22 19:15:17', 3);
INSERT INTO `sys_oper_log` VALUES (661, '总订单管理', 3, 'com.ruoyi.web.controller.system.SysOrderMmController.remove()', 'DELETE', 1, 'admin', NULL, '/system/orderMm/42', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-22 19:15:21', 5);

-- ----------------------------
-- Table structure for sys_order
-- ----------------------------
DROP TABLE IF EXISTS `sys_order`;
CREATE TABLE `sys_order`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_order
-- ----------------------------
INSERT INTO `sys_order` VALUES (1, 'zyf', '121', 783, '0', 'IpMn9hqLOZ', '2020-12-28 14:07:07', 'admin', '2023-11-11 23:28:22', '零食大礼包');
INSERT INTO `sys_order` VALUES (2, 'mzq', '132', 823, '1', 'wGVEOlXuSx', '2023-09-24 10:58:44', 'admin', '2023-11-10 22:55:45', '电动牙刷');
INSERT INTO `sys_order` VALUES (3, 'lzy', '150', 704, '0', 'Px4PGfWpEL', '2007-03-06 20:43:09', 'admin', '2023-11-10 22:56:02', '鼠标垫');

-- ----------------------------
-- Table structure for sys_order_dd
-- ----------------------------
DROP TABLE IF EXISTS `sys_order_dd`;
CREATE TABLE `sys_order_dd`  (
  `od_id` int NOT NULL AUTO_INCREMENT COMMENT '单项id',
  `pr_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '产品名称',
  `pr_num` int NULL DEFAULT NULL COMMENT '产品数量',
  `pr_unit_price` double NULL DEFAULT NULL COMMENT '产品单价',
  `om_id` int NULL DEFAULT NULL COMMENT '订单编号，与主表连接的外键',
  PRIMARY KEY (`od_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_order_dd
-- ----------------------------

-- ----------------------------
-- Table structure for sys_order_good
-- ----------------------------
DROP TABLE IF EXISTS `sys_order_good`;
CREATE TABLE `sys_order_good`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `good_id` int NOT NULL,
  `good_num` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_order_good
-- ----------------------------

-- ----------------------------
-- Table structure for sys_order_mm
-- ----------------------------
DROP TABLE IF EXISTS `sys_order_mm`;
CREATE TABLE `sys_order_mm`  (
  `om_id` int NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `om_customer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` int NULL DEFAULT NULL COMMENT '订单状态',
  `om_total_price` double NULL DEFAULT NULL COMMENT '订单总价',
  PRIMARY KEY (`om_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_order_mm
-- ----------------------------
INSERT INTO `sys_order_mm` VALUES (6, 'zzyf', '2024-05-11 20:19:28', 1, 12);
INSERT INTO `sys_order_mm` VALUES (7, 'yxxc', '2024-05-11 21:58:01', 1, 41);
INSERT INTO `sys_order_mm` VALUES (8, 'lzzy', '2024-05-22 16:36:39', 0, 0);
INSERT INTO `sys_order_mm` VALUES (13, 'mzqq', '2024-05-11 19:30:53', 0, 400);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-10-31 22:03:57', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-10-31 22:03:57', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-10-31 22:03:57', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '店员', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-10-31 22:03:57', 'admin', '2024-05-12 21:55:47', '普通角色');
INSERT INTO `sys_role` VALUES (100, '采购人员', 'purchase', 3, '1', 1, 1, '0', '0', 'admin', '2023-11-01 22:42:59', 'admin', '2024-05-12 21:55:15', NULL);
INSERT INTO `sys_role` VALUES (101, '店长', 'shopdirector', 0, '1', 1, 1, '0', '0', 'admin', '2023-11-08 22:48:09', 'admin', '2024-05-12 21:59:19', NULL);
INSERT INTO `sys_role` VALUES (102, '仓库管理员', 'storagekeeper', 0, '1', 1, 1, '0', '0', 'admin', '2023-11-08 22:58:10', 'admin', '2023-11-11 18:15:44', NULL);
INSERT INTO `sys_role` VALUES (103, '销售', 'sell', 0, '1', 1, 1, '0', '0', 'admin', '2023-11-09 00:00:17', 'admin', '2024-05-12 21:55:42', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 2);
INSERT INTO `sys_role_menu` VALUES (100, 107);
INSERT INTO `sys_role_menu` VALUES (100, 108);
INSERT INTO `sys_role_menu` VALUES (100, 500);
INSERT INTO `sys_role_menu` VALUES (100, 501);
INSERT INTO `sys_role_menu` VALUES (100, 1035);
INSERT INTO `sys_role_menu` VALUES (100, 1039);
INSERT INTO `sys_role_menu` VALUES (100, 1040);
INSERT INTO `sys_role_menu` VALUES (100, 1041);
INSERT INTO `sys_role_menu` VALUES (100, 1042);
INSERT INTO `sys_role_menu` VALUES (100, 1043);
INSERT INTO `sys_role_menu` VALUES (100, 1044);
INSERT INTO `sys_role_menu` VALUES (100, 1045);
INSERT INTO `sys_role_menu` VALUES (100, 1049);
INSERT INTO `sys_role_menu` VALUES (100, 1050);
INSERT INTO `sys_role_menu` VALUES (100, 1051);
INSERT INTO `sys_role_menu` VALUES (100, 1052);
INSERT INTO `sys_role_menu` VALUES (100, 1053);
INSERT INTO `sys_role_menu` VALUES (100, 1054);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (101, 1);
INSERT INTO `sys_role_menu` VALUES (101, 2);
INSERT INTO `sys_role_menu` VALUES (101, 100);
INSERT INTO `sys_role_menu` VALUES (101, 103);
INSERT INTO `sys_role_menu` VALUES (101, 104);
INSERT INTO `sys_role_menu` VALUES (101, 107);
INSERT INTO `sys_role_menu` VALUES (101, 108);
INSERT INTO `sys_role_menu` VALUES (101, 109);
INSERT INTO `sys_role_menu` VALUES (101, 500);
INSERT INTO `sys_role_menu` VALUES (101, 501);
INSERT INTO `sys_role_menu` VALUES (101, 1000);
INSERT INTO `sys_role_menu` VALUES (101, 1001);
INSERT INTO `sys_role_menu` VALUES (101, 1002);
INSERT INTO `sys_role_menu` VALUES (101, 1003);
INSERT INTO `sys_role_menu` VALUES (101, 1004);
INSERT INTO `sys_role_menu` VALUES (101, 1005);
INSERT INTO `sys_role_menu` VALUES (101, 1006);
INSERT INTO `sys_role_menu` VALUES (101, 1016);
INSERT INTO `sys_role_menu` VALUES (101, 1017);
INSERT INTO `sys_role_menu` VALUES (101, 1018);
INSERT INTO `sys_role_menu` VALUES (101, 1019);
INSERT INTO `sys_role_menu` VALUES (101, 1020);
INSERT INTO `sys_role_menu` VALUES (101, 1021);
INSERT INTO `sys_role_menu` VALUES (101, 1022);
INSERT INTO `sys_role_menu` VALUES (101, 1023);
INSERT INTO `sys_role_menu` VALUES (101, 1024);
INSERT INTO `sys_role_menu` VALUES (101, 1035);
INSERT INTO `sys_role_menu` VALUES (101, 1036);
INSERT INTO `sys_role_menu` VALUES (101, 1037);
INSERT INTO `sys_role_menu` VALUES (101, 1038);
INSERT INTO `sys_role_menu` VALUES (101, 1039);
INSERT INTO `sys_role_menu` VALUES (101, 1040);
INSERT INTO `sys_role_menu` VALUES (101, 1041);
INSERT INTO `sys_role_menu` VALUES (101, 1042);
INSERT INTO `sys_role_menu` VALUES (101, 1043);
INSERT INTO `sys_role_menu` VALUES (101, 1044);
INSERT INTO `sys_role_menu` VALUES (101, 1045);
INSERT INTO `sys_role_menu` VALUES (101, 1046);
INSERT INTO `sys_role_menu` VALUES (101, 1047);
INSERT INTO `sys_role_menu` VALUES (101, 1048);
INSERT INTO `sys_role_menu` VALUES (101, 1049);
INSERT INTO `sys_role_menu` VALUES (101, 1050);
INSERT INTO `sys_role_menu` VALUES (101, 1051);
INSERT INTO `sys_role_menu` VALUES (101, 1052);
INSERT INTO `sys_role_menu` VALUES (101, 1053);
INSERT INTO `sys_role_menu` VALUES (101, 1054);
INSERT INTO `sys_role_menu` VALUES (101, 2000);
INSERT INTO `sys_role_menu` VALUES (101, 2001);
INSERT INTO `sys_role_menu` VALUES (101, 2002);
INSERT INTO `sys_role_menu` VALUES (101, 2003);
INSERT INTO `sys_role_menu` VALUES (101, 2005);
INSERT INTO `sys_role_menu` VALUES (101, 2007);
INSERT INTO `sys_role_menu` VALUES (101, 2008);
INSERT INTO `sys_role_menu` VALUES (101, 2009);
INSERT INTO `sys_role_menu` VALUES (102, 1);
INSERT INTO `sys_role_menu` VALUES (102, 2);
INSERT INTO `sys_role_menu` VALUES (102, 107);
INSERT INTO `sys_role_menu` VALUES (102, 108);
INSERT INTO `sys_role_menu` VALUES (102, 500);
INSERT INTO `sys_role_menu` VALUES (102, 501);
INSERT INTO `sys_role_menu` VALUES (102, 1035);
INSERT INTO `sys_role_menu` VALUES (102, 1039);
INSERT INTO `sys_role_menu` VALUES (102, 1040);
INSERT INTO `sys_role_menu` VALUES (102, 1041);
INSERT INTO `sys_role_menu` VALUES (102, 1042);
INSERT INTO `sys_role_menu` VALUES (102, 1043);
INSERT INTO `sys_role_menu` VALUES (102, 1044);
INSERT INTO `sys_role_menu` VALUES (102, 1045);
INSERT INTO `sys_role_menu` VALUES (102, 2002);
INSERT INTO `sys_role_menu` VALUES (102, 2005);
INSERT INTO `sys_role_menu` VALUES (103, 1);
INSERT INTO `sys_role_menu` VALUES (103, 2);
INSERT INTO `sys_role_menu` VALUES (103, 107);
INSERT INTO `sys_role_menu` VALUES (103, 108);
INSERT INTO `sys_role_menu` VALUES (103, 500);
INSERT INTO `sys_role_menu` VALUES (103, 501);
INSERT INTO `sys_role_menu` VALUES (103, 1035);
INSERT INTO `sys_role_menu` VALUES (103, 1039);
INSERT INTO `sys_role_menu` VALUES (103, 1040);
INSERT INTO `sys_role_menu` VALUES (103, 1041);
INSERT INTO `sys_role_menu` VALUES (103, 1042);
INSERT INTO `sys_role_menu` VALUES (103, 1043);
INSERT INTO `sys_role_menu` VALUES (103, 1044);
INSERT INTO `sys_role_menu` VALUES (103, 1045);
INSERT INTO `sys_role_menu` VALUES (103, 1049);
INSERT INTO `sys_role_menu` VALUES (103, 1050);
INSERT INTO `sys_role_menu` VALUES (103, 1051);
INSERT INTO `sys_role_menu` VALUES (103, 1052);
INSERT INTO `sys_role_menu` VALUES (103, 1053);
INSERT INTO `sys_role_menu` VALUES (103, 1054);
INSERT INTO `sys_role_menu` VALUES (103, 2001);
INSERT INTO `sys_role_menu` VALUES (103, 2002);
INSERT INTO `sys_role_menu` VALUES (103, 2003);
INSERT INTO `sys_role_menu` VALUES (103, 2005);

-- ----------------------------
-- Table structure for sys_supplier
-- ----------------------------
DROP TABLE IF EXISTS `sys_supplier`;
CREATE TABLE `sys_supplier`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1003 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_supplier
-- ----------------------------
INSERT INTO `sys_supplier` VALUES (1, '家家悦', '威海环翠区', 783, '0', 'IpMn9hqLOZ', '2020-12-28 14:07:07', 'admin', '2023-11-05 21:39:52', 'ekg6lQ09sA');
INSERT INTO `sys_supplier` VALUES (1002, '肯德基', '北京海淀', 0, '0', 'admin', '2023-11-05 20:17:59', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '周经理', '00', 'wiser@163.com', '15888888888', '0', '/profile/avatar/2024/05/12/blob_20240512215606A001.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-05-22 20:07:31', 'admin', '2023-10-31 22:03:57', '', '2024-05-22 20:07:31', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '2', '127.0.0.1', '2023-10-31 22:03:57', 'admin', '2023-10-31 22:03:57', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (100, 105, 'mingguang', '111', '00', '', '15666666666', '0', '', '$2a$10$iBxwIuiGRlI4YRhSHFOt8OVtSQaz2bPGA2PDu06mvGhWvXhzh19iG', '0', '2', '', NULL, 'admin', '2023-11-07 22:26:35', 'admin', '2023-11-08 10:48:41', NULL);
INSERT INTO `sys_user` VALUES (102, 101, 'dianzhang', 'dianzhang', '00', '', '', '0', '', '$2a$10$T0GiOanibjKUdsz3e9lDdudWqciMqYOL0cdom/ji37V2v47tGuSOy', '0', '0', '127.0.0.1', '2024-05-22 20:20:24', '', '2023-11-08 22:52:40', 'admin', '2024-05-22 20:20:24', NULL);
INSERT INTO `sys_user` VALUES (103, 107, 'dianyuan', 'dianyuan', '00', '', '', '0', '', '$2a$10$jt0g0hhM.QsLxOil5wq.B.UOzkcOFHiHml6rF9nAW2MiZBh6QMdvW', '0', '0', '127.0.0.1', '2023-11-08 23:50:12', '', '2023-11-08 22:58:39', 'admin', '2024-05-22 17:19:03', NULL);
INSERT INTO `sys_user` VALUES (104, 200, 'cangguan', 'cangguan', '00', '', '', '0', '', '$2a$10$5gjDBGbEUDHmkSc39VsyQ.OaeggBkenYYX9G5O.T5bfJ0.0G1ARRi', '0', '0', '127.0.0.1', '2024-05-22 20:22:19', '', '2023-11-08 23:00:16', 'admin', '2024-05-22 20:22:19', NULL);
INSERT INTO `sys_user` VALUES (105, 107, 'dy', 'dy', '00', '', '', '0', '', '$2a$10$TbNsxJA6xTkvQxD0kL6tiOf64V7WDhDpIoQUqifp7grxz5S4kt7X6', '0', '0', '127.0.0.1', '2024-05-22 20:21:39', '', '2023-11-08 23:58:26', 'admin', '2024-05-22 20:21:39', NULL);
INSERT INTO `sys_user` VALUES (106, 105, 'caigou', 'caigou', '00', '', '', '0', '', '$2a$10$kkg.jhM4kmk2CY7/OKZtE.9f73LboC7vz54A7vSojKfcPrbdE98Gy', '0', '0', '127.0.0.1', '2024-05-22 17:29:07', '', '2023-11-11 18:09:18', 'admin', '2024-05-22 17:29:07', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (102, 101);
INSERT INTO `sys_user_role` VALUES (103, 2);
INSERT INTO `sys_user_role` VALUES (104, 102);
INSERT INTO `sys_user_role` VALUES (105, 103);
INSERT INTO `sys_user_role` VALUES (106, 100);

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer`  (
  `CUSTOMER_ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '客户ID',
  `NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `GENDER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '性别',
  `PHONE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '电话',
  `TYPE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户类型',
  `VIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '会员标记',
  `POINTS` bigint UNSIGNED NULL DEFAULT NULL COMMENT '积分',
  `BALANCE` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '客户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES (2, '李四', '男', '15211112222', '零售客户', '0', NULL, NULL);
INSERT INTO `t_customer` VALUES (3, '王五', '女', '15433334444', '批发客户', '1', 10, 90);
INSERT INTO `t_customer` VALUES (4, '六', '男', '11111111111', '零售客户', '1', 0, 20);

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept`  (
  `DEPT_ID` bigint NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `PARENT_ID` bigint NOT NULL COMMENT '上级部门ID',
  `DEPT_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '部门名称',
  `ORDER_NUM` bigint NULL DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`DEPT_ID`) USING BTREE,
  INDEX `t_dept_parent_id`(`PARENT_ID` ASC) USING BTREE,
  INDEX `t_dept_dept_name`(`DEPT_NAME` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES (1, 0, '开发部', 1, '2019-06-14 20:56:41', NULL);
INSERT INTO `t_dept` VALUES (6, 0, '销售部', 4, '2019-06-14 21:00:15', NULL);

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods`  (
  `GOODS_ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '货品ID',
  `NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '货品名',
  `PURCHASE_PRICE` bigint UNSIGNED NOT NULL COMMENT '进货价格',
  `WHOLESALE_PRICE` bigint UNSIGNED NOT NULL COMMENT '批发价格',
  `RETAIL_PRICE` bigint UNSIGNED NOT NULL COMMENT '零售价格',
  PRIMARY KEY (`GOODS_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '货品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES (1, '键盘', 210, 300, 400);
INSERT INTO `t_goods` VALUES (3, '鼠标', 10, 20, 30);
INSERT INTO `t_goods` VALUES (7, '手机', 1000, 1200, 1300);
INSERT INTO `t_goods` VALUES (10, 'test', 10, 20, 30);

-- ----------------------------
-- Table structure for t_goods_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_detail`;
CREATE TABLE `t_goods_detail`  (
  `GOODS_DETAIL_ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '货品信息ID',
  `GOODS_ID` bigint UNSIGNED NOT NULL COMMENT '货品ID',
  `GOODS_ATTRIBUTE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '属性',
  `GOODS_ATTRIBUTE_VALUE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '属性值',
  PRIMARY KEY (`GOODS_DETAIL_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '货品详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_goods_detail
-- ----------------------------
INSERT INTO `t_goods_detail` VALUES (1, 1, '重量', '0.5');
INSERT INTO `t_goods_detail` VALUES (2, 1, '颜色', '黑色');
INSERT INTO `t_goods_detail` VALUES (6, 4, '高度(cm)', '60');
INSERT INTO `t_goods_detail` VALUES (7, 5, '桌高(cm)', '120');
INSERT INTO `t_goods_detail` VALUES (9, 7, '颜色', '白色');
INSERT INTO `t_goods_detail` VALUES (10, 10, '颜色', '白');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log`  (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `USERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作用户',
  `OPERATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '操作内容',
  `TIME` decimal(11, 0) NULL DEFAULT NULL COMMENT '耗时',
  `METHOD` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '操作方法',
  `PARAMS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '方法参数',
  `IP` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作者IP',
  `CREATE_TIME` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作地点',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `t_log_create_time`(`CREATE_TIME`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1489 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '操作日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES (1011, 'MrBird', '新增菜单/按钮', 39, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=179, parentId=0, menuName=订单管理, url=, perms=, icon=layui-icon-filedone, type=0, orderNum=null, createTime=Sun Jul 26 17:39:33 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-26 17:39:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1012, 'MrBird', '新增菜单/按钮', 46, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=新增订单, url=, perms=, icon=layui-icon-file-add, type=0, orderNum=null, createTime=Sun Jul 26 17:41:25 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-26 17:41:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1013, 'MrBird', '新增菜单/按钮', 47, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=181, parentId=179, menuName=审批订单, url=, perms=, icon=layui-icon-fileprotect, type=0, orderNum=null, createTime=Sun Jul 26 17:42:50 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-26 17:42:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1014, 'MrBird', '新增菜单/按钮', 26, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=182, parentId=179, menuName=归档订单, url=, perms=, icon=layui-icon-reconciliation, type=0, orderNum=null, createTime=Sun Jul 26 17:43:42 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-26 17:43:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1015, 'MrBird', '新增菜单/按钮', 19, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=183, parentId=181, menuName=销售审批, url=null, perms=, icon=null, type=1, orderNum=null, createTime=Sun Jul 26 17:44:13 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-26 17:44:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1016, 'MrBird', '修改菜单/按钮', 20, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=183, parentId=181, menuName=销售审核, url=null, perms=, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Sun Jul 26 17:44:24 CST 2020)\"', '192.168.137.1', '2020-07-26 17:44:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1017, 'MrBird', '新增菜单/按钮', 9, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=184, parentId=181, menuName=财务审核, url=null, perms=, icon=null, type=1, orderNum=null, createTime=Sun Jul 26 17:44:43 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-26 17:44:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1018, 'MrBird', '新增菜单/按钮', 13, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=185, parentId=181, menuName=交付审核, url=null, perms=, icon=null, type=1, orderNum=null, createTime=Sun Jul 26 17:45:04 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-26 17:45:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1019, 'MrBird', '修改角色', 119, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Sun Jul 26 17:45:53 CST 2020, menuIds=179,180,181,183,184,185,182,1,3,13,11,12,160,161,4,162,14,15,16,5,163,17,18,19,6,164,20,21,22,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178)\"', '192.168.137.1', '2020-07-26 17:45:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1020, 'MrBird', '修改菜单/按钮', 18, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=新增订单, url=, perms=, icon=layui-icon-file-add, type=0, orderNum=1, createTime=null, modifyTime=Sun Jul 26 17:46:25 CST 2020)\"', '192.168.137.1', '2020-07-26 17:46:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1021, 'MrBird', '修改菜单/按钮', 20, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=182, parentId=179, menuName=归档订单, url=, perms=, icon=layui-icon-reconciliation, type=0, orderNum=2, createTime=null, modifyTime=Sun Jul 26 17:46:34 CST 2020)\"', '192.168.137.1', '2020-07-26 17:46:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1022, 'MrBird', '修改菜单/按钮', 22, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=181, parentId=179, menuName=审批订单, url=, perms=, icon=layui-icon-fileprotect, type=0, orderNum=3, createTime=null, modifyTime=Sun Jul 26 17:46:41 CST 2020)\"', '192.168.137.1', '2020-07-26 17:46:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1023, 'MrBird', '修改菜单/按钮', 22, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=181, parentId=179, menuName=审批订单, url=, perms=, icon=layui-icon-fileprotect, type=0, orderNum=2, createTime=null, modifyTime=Sun Jul 26 17:46:50 CST 2020)\"', '192.168.137.1', '2020-07-26 17:46:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1024, 'MrBird', '修改菜单/按钮', 20, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=182, parentId=179, menuName=归档订单, url=, perms=, icon=layui-icon-reconciliation, type=0, orderNum=3, createTime=null, modifyTime=Sun Jul 26 17:46:57 CST 2020)\"', '192.168.137.1', '2020-07-26 17:46:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1025, 'MrBird', '新增角色', 27, 'cc.mrbird.febs.system.controller.RoleController.addRole()', ' role: \"Role(roleId=81, roleName=销售人员, remark=车辆销售, createTime=Sun Jul 26 18:20:03 CST 2020, modifyTime=null, menuIds=180)\"', '192.168.137.1', '2020-07-26 18:20:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1026, 'MrBird', '新增用户', 28, 'cc.mrbird.febs.system.controller.UserController.addUser()', ' user: \"User(userId=8, username=zhangsan, password=92dac726ea92d5bdd01eab9aef544c95, deptId=6, email=12345@asd.com, mobile=13911112222, status=1, createTime=Sun Jul 26 18:21:47 CST 2020, modifyTime=null, lastLoginTime=null, sex=0, avatar=default.jpg, theme=black, isTab=1, description=, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=81, roleName=null, deptIds=null)\"', '192.168.137.1', '2020-07-26 18:21:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1027, 'MrBird', '修改角色', 36, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=81, roleName=销售人员, remark=车辆销售, createTime=null, modifyTime=Sun Jul 26 18:26:05 CST 2020, menuIds=179,180)\"', '192.168.137.1', '2020-07-26 18:26:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1028, 'MrBird', '修改菜单/按钮', 16, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=新增订单, url=, perms=user:view, icon=layui-icon-file-add, type=0, orderNum=1, createTime=null, modifyTime=Sun Jul 26 18:43:26 CST 2020)\"', '192.168.137.1', '2020-07-26 18:43:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1029, 'MrBird', '修改菜单/按钮', 10, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=新增订单, url=/system/user, perms=user:view, icon=layui-icon-file-add, type=0, orderNum=1, createTime=null, modifyTime=Sun Jul 26 18:43:58 CST 2020)\"', '192.168.137.1', '2020-07-26 18:43:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1030, 'MrBird', '修改菜单/按钮', 15, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=新增订单, url=/system/order, perms=user:view, icon=layui-icon-file-add, type=0, orderNum=1, createTime=null, modifyTime=Sun Jul 26 18:52:30 CST 2020)\"', '192.168.137.1', '2020-07-26 18:52:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1031, 'MrBird', '修改菜单/按钮', 12, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=新增订单, url=/system/order, perms=order:view, icon=layui-icon-file-add, type=0, orderNum=1, createTime=null, modifyTime=Sun Jul 26 18:52:59 CST 2020)\"', '192.168.137.1', '2020-07-26 18:53:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1032, 'MrBird', '修改菜单/按钮', 42, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=新增订单, url=/system/order, perms=order:create, icon=layui-icon-file-add, type=0, orderNum=1, createTime=null, modifyTime=Sun Jul 26 19:44:01 CST 2020)\"', '192.168.137.1', '2020-07-26 19:44:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1033, 'MrBird', '修改菜单/按钮', 22, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=181, parentId=179, menuName=审批订单, url=, perms=order:approve, icon=layui-icon-fileprotect, type=0, orderNum=2, createTime=null, modifyTime=Sun Jul 26 19:44:41 CST 2020)\"', '192.168.137.1', '2020-07-26 19:44:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1034, 'MrBird', '修改菜单/按钮', 14, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=182, parentId=179, menuName=归档订单, url=, perms=order:archive, icon=layui-icon-reconciliation, type=0, orderNum=3, createTime=null, modifyTime=Sun Jul 26 19:44:55 CST 2020)\"', '192.168.137.1', '2020-07-26 19:44:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1035, 'MrBird', '修改菜单/按钮', 17, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=新增订单, url=/system/order, perms=order:view, icon=layui-icon-file-add, type=0, orderNum=1, createTime=null, modifyTime=Sun Jul 26 19:53:42 CST 2020)\"', '192.168.137.1', '2020-07-26 19:53:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1036, 'MrBird', '修改菜单/按钮', 17, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=179, parentId=0, menuName=订单管理, url=, perms=order:view, icon=layui-icon-filedone, type=0, orderNum=null, createTime=null, modifyTime=Sun Jul 26 19:58:42 CST 2020)\"', '192.168.137.1', '2020-07-26 19:58:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1037, 'MrBird', '修改菜单/按钮', 9, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=新增订单, url=/system/order, perms=order:create, icon=layui-icon-file-add, type=0, orderNum=1, createTime=null, modifyTime=Sun Jul 26 19:59:11 CST 2020)\"', '192.168.137.1', '2020-07-26 19:59:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1038, 'MrBird', '新增订单', 57, 'cc.mrbird.febs.system.controller.OrderController.createOrder()', ' order: \"Order(orderId=2, salesId=13, customerName=lisi, customerPhone=12345678912, vehicleId=11, price=202222, createTime=Mon Jul 27 14:31:09 CST 2020, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-07-27 14:31:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1039, 'MrBird', '新增订单', 20, 'cc.mrbird.febs.system.controller.OrderController.createOrder()', ' order: \"Order(orderId=3, salesId=22, customerName=wangwu, customerPhone=12379845632, vehicleId=22, price=3333333, createTime=Mon Jul 27 14:34:05 CST 2020, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-07-27 14:34:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1040, 'MrBird', '新增订单', 57, 'cc.mrbird.febs.system.controller.OrderController.createOrder()', ' order: \"Order(orderId=4, salesId=22, customerName=xxx, customerPhone=12345679811, vehicleId=22, price=200000, createTime=Mon Jul 27 14:46:48 CST 2020, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-07-27 14:46:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1041, 'MrBird', '新增订单', 66, 'cc.mrbird.febs.system.controller.OrderController.createOrder()', ' order: \"Order(orderId=5, salesId=211, customerName=sss, customerPhone=12345678955, vehicleId=11, price=200000, createTime=Mon Jul 27 14:50:00 CST 2020, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-07-27 14:50:01', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1042, 'MrBird', '新增订单', 36, 'cc.mrbird.febs.system.controller.OrderController.createOrder()', ' order: \"Order(orderId=6, salesId=22, customerName=qwer, customerPhone=12230000222, vehicleId=33, price=666666, createTime=Mon Jul 27 15:32:05 CST 2020, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-07-27 15:32:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1043, 'MrBird', '新增订单', 31, 'cc.mrbird.febs.system.controller.OrderController.createOrder()', ' order: \"Order(orderId=7, salesId=null, customerName=, customerPhone=, vehicleId=null, price=null, createTime=Mon Jul 27 16:51:21 CST 2020, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-07-27 16:51:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1044, 'MrBird', '新增订单', 58, 'cc.mrbird.febs.system.controller.OrderController.createOrder()', ' order: \"Order(orderId=8, salesId=15, customerName=aaaaa, customerPhone=15533336666, vehicleId=88, price=150000, createTime=Tue Jul 28 10:37:09 CST 2020, status=待审核, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-07-28 10:37:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1045, 'MrBird', '修改订单', 56, 'cc.mrbird.febs.system.controller.OrderController.updateUser()', ' order: \"Order(orderId=1, salesId=11, customerName=zhangsan, customerPhone=15034659999, vehicleId=52, price=120000, createTime=null, status=待审核, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-07-28 12:53:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1046, 'MrBird', '修改菜单/按钮', 40, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=181, parentId=179, menuName=审批订单, url=/system/order, perms=order:approve, icon=layui-icon-fileprotect, type=0, orderNum=2, createTime=null, modifyTime=Tue Jul 28 14:01:45 CST 2020)\"', '192.168.137.1', '2020-07-28 14:01:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1047, 'MrBird', '修改菜单/按钮', 13, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=182, parentId=179, menuName=归档订单, url=/system/order, perms=order:archive, icon=layui-icon-reconciliation, type=0, orderNum=3, createTime=null, modifyTime=Tue Jul 28 14:01:51 CST 2020)\"', '192.168.137.1', '2020-07-28 14:01:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1048, 'MrBird', '新增订单', 73, 'cc.mrbird.febs.system.controller.OrderController.createOrder()', ' order: \"Order(orderId=9, salesId=11, customerName=22, customerPhone=12300000000, vehicleId=11, price=200000, createTime=Tue Jul 28 14:15:45 CST 2020, status=待审核, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-07-28 14:15:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1049, 'MrBird', '修改订单', 19, 'cc.mrbird.febs.system.controller.OrderController.updateUser()', ' order: \"Order(orderId=1, salesId=11, customerName=zhangsan, customerPhone=15034659998, vehicleId=52, price=120000, createTime=null, status=待审核, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-07-28 14:16:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1050, 'MrBird', '修改菜单/按钮', 13, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=新增订单, url=/system/order/create, perms=order:create, icon=layui-icon-file-add, type=0, orderNum=1, createTime=null, modifyTime=Tue Jul 28 14:18:27 CST 2020)\"', '192.168.137.1', '2020-07-28 14:18:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1051, 'MrBird', '修改菜单/按钮', 18, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=181, parentId=179, menuName=审批订单, url=/system/order/approve, perms=order:approve, icon=layui-icon-fileprotect, type=0, orderNum=2, createTime=null, modifyTime=Tue Jul 28 14:18:53 CST 2020)\"', '192.168.137.1', '2020-07-28 14:18:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1052, 'MrBird', '修改菜单/按钮', 18, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=182, parentId=179, menuName=归档订单, url=/system/order/archive, perms=order:archive, icon=layui-icon-reconciliation, type=0, orderNum=3, createTime=null, modifyTime=Tue Jul 28 14:19:03 CST 2020)\"', '192.168.137.1', '2020-07-28 14:19:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1053, 'MrBird', '修改菜单/按钮', 20, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=179, parentId=0, menuName=订单管理, url=/system/order/, perms=order:view, icon=layui-icon-filedone, type=0, orderNum=null, createTime=null, modifyTime=Tue Jul 28 14:19:44 CST 2020)\"', '192.168.137.1', '2020-07-28 14:19:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1054, 'MrBird', '审批订单', 90, 'cc.mrbird.febs.system.controller.OrderController.approveOrder()', ' orderIds: \"7\"', '192.168.137.1', '2020-07-28 14:34:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1055, 'MrBird', '新增角色', 27, 'cc.mrbird.febs.system.controller.RoleController.addRole()', ' role: \"Role(roleId=82, roleName=销售经理, remark=负责管理销售人员及订单审批, createTime=Tue Jul 28 14:41:50 CST 2020, modifyTime=null, menuIds=179,180,181,183)\"', '192.168.137.1', '2020-07-28 14:41:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1056, 'MrBird', '修改角色', 33, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=82, roleName=销售经理, remark=负责管理销售人员及订单审批, createTime=null, modifyTime=Tue Jul 28 14:42:04 CST 2020, menuIds=179,180,181,183,182)\"', '192.168.137.1', '2020-07-28 14:42:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1057, 'MrBird', '新增角色', 27, 'cc.mrbird.febs.system.controller.RoleController.addRole()', ' role: \"Role(roleId=83, roleName=财务会计, remark=负责审核账单及订单校对, createTime=Tue Jul 28 14:42:58 CST 2020, modifyTime=null, menuIds=179,181,184)\"', '192.168.137.1', '2020-07-28 14:42:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1058, 'MrBird', '修改角色', 27, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=81, roleName=销售人员, remark=车辆销售, createTime=null, modifyTime=Tue Jul 28 14:43:06 CST 2020, menuIds=179,180,182)\"', '192.168.137.1', '2020-07-28 14:43:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1059, 'MrBird', '修改角色', 24, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=81, roleName=销售人员, remark=车辆销售, createTime=null, modifyTime=Tue Jul 28 14:43:32 CST 2020, menuIds=179,180,185)\"', '192.168.137.1', '2020-07-28 14:43:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1060, 'MrBird', '修改菜单/按钮', 36, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=181, parentId=179, menuName=审批订单, url=/system/order/approve, perms=order:approve:manager, icon=layui-icon-fileprotect, type=0, orderNum=2, createTime=null, modifyTime=Tue Jul 28 16:17:49 CST 2020)\"', '192.168.137.1', '2020-07-28 16:17:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1061, 'MrBird', '修改菜单/按钮', 12, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=185, parentId=181, menuName=交付审核, url=null, perms=order:approve:sales, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Tue Jul 28 16:19:09 CST 2020)\"', '192.168.137.1', '2020-07-28 16:19:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1062, 'MrBird', '修改菜单/按钮', 10, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=184, parentId=181, menuName=财务审核, url=null, perms=order:approve:accounting, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Tue Jul 28 16:19:20 CST 2020)\"', '192.168.137.1', '2020-07-28 16:19:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1063, 'MrBird', '修改菜单/按钮', 24, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=183, parentId=181, menuName=销售审核, url=null, perms=order:approve:manager, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Tue Jul 28 16:19:25 CST 2020)\"', '192.168.137.1', '2020-07-28 16:19:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1064, 'MrBird', '修改菜单/按钮', 10, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=183, parentId=181, menuName=经理审核, url=null, perms=order:approve:manager, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Tue Jul 28 16:19:34 CST 2020)\"', '192.168.137.1', '2020-07-28 16:19:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1065, 'MrBird', '修改菜单/按钮', 17, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=185, parentId=181, menuName=销售审核, url=null, perms=order:approve:sales, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Tue Jul 28 16:19:46 CST 2020)\"', '192.168.137.1', '2020-07-28 16:19:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1066, 'MrBird', '修改菜单/按钮', 19, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=181, parentId=179, menuName=审批订单, url=/system/order/approve, perms=order:approve, icon=layui-icon-fileprotect, type=0, orderNum=2, createTime=null, modifyTime=Tue Jul 28 16:20:00 CST 2020)\"', '192.168.137.1', '2020-07-28 16:20:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1067, 'MrBird', '修改菜单/按钮', 17, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=181, parentId=179, menuName=审批订单, url=/system/order/approve, perms=, icon=layui-icon-fileprotect, type=0, orderNum=2, createTime=null, modifyTime=Tue Jul 28 16:20:27 CST 2020)\"', '192.168.137.1', '2020-07-28 16:20:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1068, 'MrBird', '修改菜单/按钮', 18, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=181, parentId=179, menuName=审批订单, url=/system/order/approve, perms=order:approve:manager, icon=layui-icon-fileprotect, type=0, orderNum=2, createTime=null, modifyTime=Tue Jul 28 16:21:02 CST 2020)\"', '192.168.137.1', '2020-07-28 16:21:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1069, 'MrBird', '修改菜单/按钮', 15, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=181, parentId=179, menuName=审批订单, url=/system/order/approve, perms=order:approve, icon=layui-icon-fileprotect, type=0, orderNum=2, createTime=null, modifyTime=Tue Jul 28 16:21:11 CST 2020)\"', '192.168.137.1', '2020-07-28 16:21:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1070, 'MrBird', '审批订单', 43, 'cc.mrbird.febs.system.controller.OrderController.managerApproveOrder()', ' orderIds: \"8\"', '192.168.137.1', '2020-07-28 16:28:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1071, 'MrBird', '审批订单', 10, 'cc.mrbird.febs.system.controller.OrderController.managerApproveOrder()', ' orderIds: \"8\"', '192.168.137.1', '2020-07-28 16:28:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1072, 'MrBird', '审批订单', 99, 'cc.mrbird.febs.system.controller.OrderController.managerApproveOrder()', ' orderIds: \"8\"', '192.168.137.1', '2020-07-28 16:33:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1073, 'MrBird', '审批订单', 28, 'cc.mrbird.febs.system.controller.OrderController.accountingApproveOrder()', ' orderIds: \"8\"', '192.168.137.1', '2020-07-28 16:33:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1074, 'MrBird', '审批订单', 25, 'cc.mrbird.febs.system.controller.OrderController.salesApproveOrder()', ' orderIds: \"8\"', '192.168.137.1', '2020-07-28 16:33:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1075, 'MrBird', '修改角色', 47, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=83, roleName=财务会计, remark=负责审核账单及订单校对, createTime=null, modifyTime=Tue Jul 28 16:38:56 CST 2020, menuIds=179,181,184)\"', '192.168.137.1', '2020-07-28 16:38:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1076, 'MrBird', '修改角色', 40, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=83, roleName=财务会计, remark=负责审核账单及付款校对, createTime=null, modifyTime=Tue Jul 28 16:39:20 CST 2020, menuIds=179,181,184)\"', '192.168.137.1', '2020-07-28 16:39:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1077, 'MrBird', '归档订单', 97, 'cc.mrbird.febs.system.controller.OrderController.archiveOrder()', ' orderIds: \"8\"', '192.168.137.1', '2020-07-28 19:02:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1078, 'MrBird', '归档订单', 25, 'cc.mrbird.febs.system.controller.OrderController.archiveOrder()', ' orderIds: \"4\"', '192.168.137.1', '2020-07-28 19:03:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1079, 'MrBird', '归档订单', 24, 'cc.mrbird.febs.system.controller.OrderController.archiveOrder()', ' orderIds: \"1\"', '192.168.137.1', '2020-07-28 19:03:18', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1080, 'MrBird', '新增订单', 31, 'cc.mrbird.febs.system.controller.OrderController.createOrder()', ' order: \"Order(orderId=10, salesId=15, customerName=oppo, customerPhone=15233002255, vehicleId=11, price=200000, createTime=Tue Jul 28 19:19:26 CST 2020, status=待审核, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-07-28 19:19:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1081, 'MrBird', '经理审批订单', 23, 'cc.mrbird.febs.system.controller.OrderController.managerApproveOrder()', ' orderIds: \"10\"', '192.168.137.1', '2020-07-28 19:19:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1082, 'MrBird', '财务审批订单', 24, 'cc.mrbird.febs.system.controller.OrderController.accountingApproveOrder()', ' orderIds: \"10\"', '192.168.137.1', '2020-07-28 19:20:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1083, 'MrBird', '销售审批订单', 15, 'cc.mrbird.febs.system.controller.OrderController.salesApproveOrder()', ' orderIds: \"10\"', '192.168.137.1', '2020-07-28 19:20:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1084, 'MrBird', '归档订单', 25, 'cc.mrbird.febs.system.controller.OrderController.archiveOrder()', ' orderIds: \"10\"', '192.168.137.1', '2020-07-28 19:20:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1085, 'MrBird', '修改订单', 15, 'cc.mrbird.febs.system.controller.OrderController.updateUser()', ' order: \"Order(orderId=1, salesId=12, customerName=zhangsan, customerPhone=15034659998, vehicleId=52, price=120000, createTime=null, status=待审核, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-07-28 20:13:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1086, 'MrBird', '新增订单', 48, 'cc.mrbird.febs.system.controller.OrderController.createOrder()', ' order: \"Order(orderId=11, salesId=123, customerName=aann, customerPhone=, vehicleId=11, price=20000, createTime=Tue Jul 28 20:22:24 CST 2020, status=待审核, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-07-28 20:22:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1087, 'MrBird', '新增订单', 19, 'cc.mrbird.febs.system.controller.OrderController.createOrder()', ' order: \"Order(orderId=12, salesId=null, customerName=, customerPhone=, vehicleId=null, price=null, createTime=Tue Jul 28 20:24:38 CST 2020, status=待审核, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-07-28 20:24:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1088, 'MrBird', '新增订单', 16, 'cc.mrbird.febs.system.controller.OrderController.createOrder()', ' order: \"Order(orderId=13, salesId=null, customerName=, customerPhone=, vehicleId=null, price=null, createTime=Tue Jul 28 20:25:01 CST 2020, status=待审核, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-07-28 20:25:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1089, 'MrBird', '新增菜单/按钮', 22, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=186, parentId=0, menuName=车辆管理, url=, perms=, icon=layui-icon-car, type=0, orderNum=null, createTime=Tue Jul 28 21:46:09 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-28 21:46:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1090, 'MrBird', '修改菜单/按钮', 24, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=186, parentId=0, menuName=车辆管理, url=system/vehicle, perms=, icon=layui-icon-car, type=0, orderNum=null, createTime=null, modifyTime=Tue Jul 28 21:46:35 CST 2020)\"', '192.168.137.1', '2020-07-28 21:46:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1091, 'MrBird', '修改菜单/按钮', 12, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=186, parentId=0, menuName=车辆管理, url=system/vehicle/, perms=, icon=layui-icon-car, type=0, orderNum=null, createTime=null, modifyTime=Tue Jul 28 21:46:42 CST 2020)\"', '192.168.137.1', '2020-07-28 21:46:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1092, 'MrBird', '修改角色', 98, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Tue Jul 28 22:01:17 CST 2020, menuIds=179,180,181,183,184,185,182,186,1,3,13,160,161,11,12,4,162,14,15,16,5,163,17,18,19,6,164,20,21,22,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178)\"', '192.168.137.1', '2020-07-28 22:01:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1093, 'MrBird', '新增菜单/按钮', 23, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=187, parentId=0, menuName=新增车辆, url=system/vehicle/create, perms=vehicle:create, icon=, type=0, orderNum=null, createTime=Tue Jul 28 22:42:20 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-28 22:42:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1094, 'MrBird', '新增菜单/按钮', 11, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=188, parentId=0, menuName=保养车辆, url=system/vehicle/maintenance, perms=vehicle:maintenance, icon=, type=0, orderNum=null, createTime=Tue Jul 28 22:43:26 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-28 22:43:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1095, 'MrBird', '修改角色', 49, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Tue Jul 28 22:45:34 CST 2020, menuIds=179,180,181,183,184,185,182,186,187,188,1,3,13,161,11,12,160,4,162,14,15,16,5,163,17,18,19,6,164,20,21,22,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178)\"', '192.168.137.1', '2020-07-28 22:45:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1096, 'MrBird', '修改菜单/按钮', 20, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=186, parentId=0, menuName=车辆管理, url=system/vehicle/, perms=vehicle:view, icon=layui-icon-car, type=0, orderNum=null, createTime=null, modifyTime=Tue Jul 28 22:48:24 CST 2020)\"', '192.168.137.1', '2020-07-28 22:48:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1097, 'MrBird', '修改菜单/按钮', 26, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=186, parentId=0, menuName=车辆管理, url=/system/vehicle/, perms=vehicle:view, icon=layui-icon-car, type=0, orderNum=null, createTime=null, modifyTime=Tue Jul 28 23:08:41 CST 2020)\"', '192.168.137.1', '2020-07-28 23:08:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1098, 'MrBird', '修改菜单/按钮', 20, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=187, parentId=186, menuName=新增车辆, url=/system/vehicle/create, perms=vehicle:create, icon=, type=0, orderNum=null, createTime=null, modifyTime=Tue Jul 28 23:10:03 CST 2020)\"', '192.168.137.1', '2020-07-28 23:10:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1099, 'MrBird', '修改菜单/按钮', 10, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=188, parentId=186, menuName=保养车辆, url=/system/vehicle/maintenance, perms=vehicle:maintenance, icon=, type=0, orderNum=null, createTime=null, modifyTime=Tue Jul 28 23:10:08 CST 2020)\"', '192.168.137.1', '2020-07-28 23:10:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1100, 'MrBird', '新增用户', 50, 'cc.mrbird.febs.system.controller.UserController.addUser()', ' user: \"User(userId=9, username=beiyan, password=67c721ec501e9ae880dc517f9c74e9e2, deptId=2, email=beiyan@qq.com, mobile=15034654506, status=1, createTime=Wed Jul 29 09:42:39 CST 2020, modifyTime=null, lastLoginTime=null, sex=2, avatar=default.jpg, theme=black, isTab=1, description=测试管理员账号, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=1, roleName=null, deptIds=null)\"', '192.168.137.1', '2020-07-29 09:42:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1101, 'MrBird', '新增车辆', 55, 'cc.mrbird.febs.system.controller.VehicleController.createVehicle()', ' vehicle: \"Vehicle(vehicleId=1, type=suv, color=白色, deadWeight=1500, manufactureDate=Wed Jul 29 11:29:27 CST 2020, lowestPrice=200000, status=0, maintenanceTimes=10, manufactureDateFrom=null, manufactureDateTo=null)\"', '192.168.137.1', '2020-07-29 11:29:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1102, 'MrBird', '删除菜单/按钮', 47, 'cc.mrbird.febs.system.controller.MenuController.deleteMenus()', ' menuIds: \"185\"', '192.168.137.1', '2020-07-29 13:09:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1103, 'MrBird', '删除菜单/按钮', 18, 'cc.mrbird.febs.system.controller.MenuController.deleteMenus()', ' menuIds: \"184\"', '192.168.137.1', '2020-07-29 13:09:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1104, 'MrBird', '删除菜单/按钮', 29, 'cc.mrbird.febs.system.controller.MenuController.deleteMenus()', ' menuIds: \"183\"', '192.168.137.1', '2020-07-29 13:09:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1105, 'MrBird', '修改菜单/按钮', 23, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=179, parentId=0, menuName=公司管理, url=/system/order/, perms=order:view, icon=layui-icon-filedone, type=0, orderNum=null, createTime=null, modifyTime=Wed Jul 29 13:10:39 CST 2020)\"', '192.168.137.1', '2020-07-29 13:10:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1106, 'MrBird', '修改菜单/按钮', 22, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=订单管理, url=/system/order/, perms=order:view, icon=layui-icon-file-add, type=0, orderNum=1, createTime=null, modifyTime=Wed Jul 29 13:13:07 CST 2020)\"', '192.168.137.1', '2020-07-29 13:13:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1107, 'MrBird', '修改菜单/按钮', 10, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=179, parentId=0, menuName=公司管理, url=, perms=, icon=layui-icon-home, type=0, orderNum=null, createTime=null, modifyTime=Wed Jul 29 13:15:27 CST 2020)\"', '192.168.137.1', '2020-07-29 13:15:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1108, 'MrBird', '修改菜单/按钮', 17, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=180, parentId=179, menuName=订单管理, url=/system/order/, perms=order:view, icon=layui-icon-filedone, type=0, orderNum=1, createTime=null, modifyTime=Wed Jul 29 13:16:23 CST 2020)\"', '192.168.137.1', '2020-07-29 13:16:23', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1109, 'MrBird', '修改角色', 69, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Wed Jul 29 13:18:02 CST 2020, menuIds=179,186,187,188,180,181,182,1,3,13,160,161,11,12,4,162,14,15,16,5,163,17,18,19,6,164,20,21,22,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,173,103,104,105,106,107,108,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178)\"', '192.168.137.1', '2020-07-29 13:18:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1110, 'MrBird', '新增菜单/按钮', 18, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=189, parentId=0, menuName=经理审批, url=null, perms=order:approve:manager, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 13:23:53 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-29 13:23:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1111, 'MrBird', '修改角色', 65, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Wed Jul 29 13:24:58 CST 2020, menuIds=179,186,187,188,180,181,189,182,1,3,13,160,161,11,12,4,162,14,15,16,5,163,17,18,19,6,164,20,21,22,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178)\"', '192.168.137.1', '2020-07-29 13:24:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1112, 'MrBird', '修改菜单/按钮', 10, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=189, parentId=181, menuName=审批, url=null, perms=order:approve:manager, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Wed Jul 29 13:39:38 CST 2020)\"', '192.168.137.1', '2020-07-29 13:39:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1113, 'MrBird', '修改菜单/按钮', 18, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=189, parentId=180, menuName=经理审批, url=null, perms=order:approve:manager, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Wed Jul 29 13:40:52 CST 2020)\"', '192.168.137.1', '2020-07-29 13:40:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1114, 'MrBird', '新增菜单/按钮', 8, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=190, parentId=180, menuName=新增订单, url=null, perms=order:create, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 13:41:29 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-29 13:41:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1115, 'MrBird', '新增菜单/按钮', 18, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=191, parentId=180, menuName=财务审批, url=null, perms=order:approve:accounting, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 13:42:37 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-29 13:42:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1116, 'MrBird', '新增菜单/按钮', 17, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=192, parentId=180, menuName=交付审批, url=null, perms=order:approve:sales, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 13:43:27 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-29 13:43:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1117, 'MrBird', '修改角色', 47, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Wed Jul 29 13:43:49 CST 2020, menuIds=179,186,187,188,180,189,190,191,192,181,182,1,3,13,161,11,12,160,4,162,14,15,16,5,163,17,18,19,6,164,20,21,22,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178)\"', '192.168.137.1', '2020-07-29 13:43:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1118, 'MrBird', '修改菜单/按钮', 16, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=187, parentId=186, menuName=新增车辆, url=/system/vehicle/create, perms=vehicle:create, icon=, type=0, orderNum=1, createTime=null, modifyTime=Wed Jul 29 13:45:50 CST 2020)\"', '192.168.137.1', '2020-07-29 13:45:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1119, 'MrBird', '修改菜单/按钮', 9, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=188, parentId=186, menuName=保养车辆, url=/system/vehicle/maintenance, perms=vehicle:maintenance, icon=, type=0, orderNum=3, createTime=null, modifyTime=Wed Jul 29 13:45:58 CST 2020)\"', '192.168.137.1', '2020-07-29 13:45:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1120, 'MrBird', '新增菜单/按钮', 6, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=193, parentId=186, menuName=出售车辆, url=, perms=vehicle:sale, icon=, type=0, orderNum=2, createTime=Wed Jul 29 13:46:34 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-29 13:46:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1121, 'MrBird', '删除菜单/按钮', 24, 'cc.mrbird.febs.system.controller.MenuController.deleteMenus()', ' menuIds: \"187\"', '192.168.137.1', '2020-07-29 13:49:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1122, 'MrBird', '新增菜单/按钮', 6, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=194, parentId=186, menuName=新增车辆, url=null, perms=vehicle:create, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 13:49:27 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-29 13:49:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1123, 'MrBird', '修改角色', 54, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Wed Jul 29 13:49:50 CST 2020, menuIds=179,186,187,188,180,189,190,191,192,181,182,1,3,13,161,11,12,160,4,162,14,15,16,5,163,17,18,19,6,164,20,21,22,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178)\"', '192.168.137.1', '2020-07-29 13:49:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1124, 'MrBird', '修改角色', 47, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Wed Jul 29 13:50:13 CST 2020, menuIds=179,186,194,193,188,180,189,190,191,192,181,182,1,3,13,160,161,11,12,4,162,14,15,16,5,163,17,18,19,6,164,20,21,22,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178)\"', '192.168.137.1', '2020-07-29 13:50:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1125, 'MrBird', '新增菜单/按钮', 17, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=195, parentId=180, menuName=修改订单, url=null, perms=order:update, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 13:57:58 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-29 13:57:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1126, 'MrBird', '修改菜单/按钮', 15, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=195, parentId=180, menuName=修改订单, url=null, perms=order:approve, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Wed Jul 29 13:58:43 CST 2020)\"', '192.168.137.1', '2020-07-29 13:58:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1127, 'MrBird', '删除菜单/按钮', 46, 'cc.mrbird.febs.system.controller.MenuController.deleteMenus()', ' menuIds: \"179,195\"', '192.168.137.1', '2020-07-29 13:59:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1128, 'MrBird', '新增菜单/按钮', 9, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=196, parentId=0, menuName=公司管理, url=, perms=, icon=layui-icon-home, type=0, orderNum=null, createTime=Wed Jul 29 14:01:31 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-29 14:01:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1129, 'MrBird', '新增菜单/按钮', 15, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=197, parentId=196, menuName=订单管理, url=/system/order/, perms=order:view, icon=layui-icon-filedone, type=0, orderNum=1, createTime=Wed Jul 29 14:02:14 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-29 14:02:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1130, 'MrBird', '新增菜单/按钮', 7, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=198, parentId=197, menuName=新增订单, url=null, perms=order:create, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 14:02:35 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-29 14:02:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1131, 'MrBird', '新增菜单/按钮', 13, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=199, parentId=197, menuName=经理审批, url=null, perms=order:approve:manager, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 14:04:16 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-29 14:04:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1132, 'MrBird', '新增菜单/按钮', 21, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=200, parentId=197, menuName=财务审批, url=null, perms=order:approve:accounting, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 14:04:43 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-29 14:04:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1133, 'MrBird', '新增菜单/按钮', 17, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=201, parentId=197, menuName=交付审批, url=null, perms=order:approve:sales, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 14:05:10 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-29 14:05:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1134, 'MrBird', '新增菜单/按钮', 16, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=202, parentId=197, menuName=归档订单, url=null, perms=order:archive, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 14:05:41 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-29 14:05:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1135, 'MrBird', '新增菜单/按钮', 17, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=203, parentId=197, menuName=审批订单, url=/system/order/approve, perms=order:approve, icon=, type=0, orderNum=null, createTime=Wed Jul 29 14:06:47 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-29 14:06:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1136, 'MrBird', '新增菜单/按钮', 8, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=204, parentId=197, menuName=归档订单, url=/system/order/archive, perms=order:archive, icon=, type=0, orderNum=null, createTime=Wed Jul 29 14:07:38 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-29 14:07:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1137, 'MrBird', '删除菜单/按钮', 17, 'cc.mrbird.febs.system.controller.MenuController.deleteMenus()', ' menuIds: \"202\"', '192.168.137.1', '2020-07-29 14:07:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1138, 'MrBird', '新增菜单/按钮', 18, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=205, parentId=196, menuName=车辆管理, url=/system/vehicle, perms=vehicle:view, icon=layui-icon-car, type=0, orderNum=2, createTime=Wed Jul 29 14:09:46 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-29 14:09:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1139, 'MrBird', '新增菜单/按钮', 16, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=206, parentId=205, menuName=新增车辆, url=null, perms=vehicle:create, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 14:10:49 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-29 14:10:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1140, 'MrBird', '新增菜单/按钮', 16, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=207, parentId=205, menuName=出售车辆, url=null, perms=vehicle:sale, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 14:11:20 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-29 14:11:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1141, 'MrBird', '新增菜单/按钮', 16, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=208, parentId=205, menuName=保养车辆, url=null, perms=vehicle:maintenance, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 14:12:54 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-29 14:12:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1142, 'MrBird', '修改角色', 49, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Wed Jul 29 14:13:24 CST 2020, menuIds=196,197,198,199,200,201,203,204,205,206,207,208,1,3,13,11,12,160,161,4,14,15,16,162,5,163,17,18,19,6,164,20,21,22,2,8,23,10,170,24,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178)\"', '192.168.137.1', '2020-07-29 14:13:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1143, 'MrBird', '新增车辆', 20, 'cc.mrbird.febs.system.controller.VehicleController.createVehicle()', ' vehicle: \"Vehicle(vehicleId=2, type=suv, color=黑色, deadWeight=1400, manufactureDate=Wed Jul 29 14:27:09 CST 2020, lowestPrice=190000, status=0, maintenanceTimes=10, manufactureDateFrom=null, manufactureDateTo=null)\"', '192.168.137.1', '2020-07-29 14:27:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1144, 'MrBird', '新增车辆', 18, 'cc.mrbird.febs.system.controller.VehicleController.createVehicle()', ' vehicle: \"Vehicle(vehicleId=3, type=suv, color=宝蓝, deadWeight=1600, manufactureDate=Wed Jul 29 14:31:32 CST 2020, lowestPrice=300000, status=0, maintenanceTimes=20, manufactureDateFrom=null, manufactureDateTo=null)\"', '192.168.137.1', '2020-07-29 14:31:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1145, 'MrBird', '修改菜单/按钮', 33, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=207, parentId=205, menuName=修改或删除车辆, url=null, perms=vehicle:modify, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Wed Jul 29 15:03:50 CST 2020)\"', '192.168.137.1', '2020-07-29 15:03:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1146, 'MrBird', '新增车辆', 47, 'cc.mrbird.febs.system.controller.VehicleController.createVehicle()', ' vehicle: \"Vehicle(vehicleId=4, type=小型车, color=白色, deadWeight=1000, manufactureDate=Wed Jul 29 15:54:51 CST 2020, lowestPrice=30000, status=0, maintenanceTimes=5, manufactureDateFrom=null, manufactureDateTo=null)\"', '192.168.137.1', '2020-07-29 15:54:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1147, 'MrBird', '删除车辆', 44, 'cc.mrbird.febs.system.controller.VehicleController.deleteVehicles()', ' vehicleIds: \"1\"', '192.168.137.1', '2020-07-29 16:02:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1148, 'MrBird', '删除车辆', 1, 'cc.mrbird.febs.system.controller.VehicleController.deleteVehicles()', ' vehicleIds: \"1\"', '192.168.137.1', '2020-07-29 16:03:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1149, 'MrBird', '删除车辆', 3, 'cc.mrbird.febs.system.controller.VehicleController.deleteVehicles()', ' vehicleIds: \"3\"', '192.168.137.1', '2020-07-29 16:03:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1150, 'MrBird', '删除车辆', 8, 'cc.mrbird.febs.system.controller.VehicleController.deleteVehicles()', ' vehicleIds: \"2\"', '192.168.137.1', '2020-07-29 16:03:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1151, 'MrBird', '新增菜单/按钮', 30, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=209, parentId=205, menuName=出售车辆, url=null, perms=vehicle:sale, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 16:38:21 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-29 16:38:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1152, 'MrBird', '修改角色', 105, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Wed Jul 29 16:38:34 CST 2020, menuIds=196,197,199,200,201,203,204,198,205,206,207,208,209,1,3,13,11,12,160,161,4,14,15,16,162,5,163,17,18,19,6,164,20,21,22,2,8,23,10,170,24,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178)\"', '192.168.137.1', '2020-07-29 16:38:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1153, 'MrBird', '出售车辆', 44, 'cc.mrbird.febs.system.controller.VehicleController.saleVehicles()', ' vehicleIds: \"1\"', '192.168.137.1', '2020-07-29 16:38:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1154, 'MrBird', '保养车辆', 27, 'cc.mrbird.febs.system.controller.VehicleController.maintenanceVehicles()', ' vehicleIds: \"1\"', '192.168.137.1', '2020-07-29 16:39:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1155, 'MrBird', '删除车辆', 21, 'cc.mrbird.febs.system.controller.VehicleController.deleteVehicles()', ' vehicleId: \"4\"', '192.168.137.1', '2020-07-29 16:39:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1156, 'MrBird', '新增菜单/按钮', 70, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=210, parentId=205, menuName=出售车辆, url=system/vehicle/sale, perms=, icon=, type=0, orderNum=null, createTime=Wed Jul 29 17:01:48 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-29 17:01:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1157, 'MrBird', '新增菜单/按钮', 11, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=211, parentId=205, menuName=保养车辆, url=system/vehicle/maintenance, perms=, icon=, type=0, orderNum=null, createTime=Wed Jul 29 17:02:17 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-29 17:02:18', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1158, 'MrBird', '修改菜单/按钮', 26, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=210, parentId=205, menuName=出售车辆, url=/system/vehicle/sale, perms=, icon=, type=0, orderNum=null, createTime=null, modifyTime=Wed Jul 29 17:02:32 CST 2020)\"', '192.168.137.1', '2020-07-29 17:02:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1159, 'MrBird', '删除菜单/按钮', 31, 'cc.mrbird.febs.system.controller.MenuController.deleteMenus()', ' menuIds: \"209\"', '192.168.137.1', '2020-07-29 17:02:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1160, 'MrBird', '修改菜单/按钮', 10, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=210, parentId=205, menuName=出售车辆, url=/system/vehicle/sale, perms=vehicle:sale, icon=, type=0, orderNum=1, createTime=null, modifyTime=Wed Jul 29 17:02:52 CST 2020)\"', '192.168.137.1', '2020-07-29 17:02:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1161, 'MrBird', '删除菜单/按钮', 16, 'cc.mrbird.febs.system.controller.MenuController.deleteMenus()', ' menuIds: \"208\"', '192.168.137.1', '2020-07-29 17:03:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1162, 'MrBird', '修改菜单/按钮', 16, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=211, parentId=205, menuName=保养车辆, url=system/vehicle/maintenance, perms=vehicle:maintenance, icon=, type=0, orderNum=2, createTime=null, modifyTime=Wed Jul 29 17:03:21 CST 2020)\"', '192.168.137.1', '2020-07-29 17:03:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1163, 'MrBird', '修改角色', 78, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Wed Jul 29 17:03:49 CST 2020, menuIds=196,197,199,200,201,203,204,198,205,206,207,210,211,1,3,13,161,11,12,160,4,162,14,15,16,5,163,17,18,19,6,164,20,21,22,2,8,23,10,24,170,136,171,172,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178)\"', '192.168.137.1', '2020-07-29 17:03:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1164, 'MrBird', '出售车辆', 17, 'cc.mrbird.febs.system.controller.VehicleController.saleVehicles()', ' vehicleIds: \"2\"', '192.168.137.1', '2020-07-29 17:10:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1165, 'MrBird', '出售车辆', 31, 'cc.mrbird.febs.system.controller.VehicleController.saleVehicles()', ' vehicleIds: \"1,2,3\"', '192.168.137.1', '2020-07-29 17:14:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1166, 'MrBird', '修改菜单/按钮', 17, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=211, parentId=205, menuName=保养车辆, url=/system/vehicle/maintenance, perms=vehicle:maintenance, icon=, type=0, orderNum=2, createTime=null, modifyTime=Wed Jul 29 17:16:47 CST 2020)\"', '192.168.137.1', '2020-07-29 17:16:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1167, 'MrBird', '保养车辆', 28, 'cc.mrbird.febs.system.controller.VehicleController.maintenanceVehicles()', ' vehicleIds: \"1\"', '192.168.137.1', '2020-07-29 17:16:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1168, 'MrBird', '保养车辆', 41, 'cc.mrbird.febs.system.controller.VehicleController.maintenanceVehicles()', ' vehicleIds: \"1,2,3\"', '192.168.137.1', '2020-07-29 17:17:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1169, 'MrBird', '新增菜单/按钮', 31, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=212, parentId=196, menuName=客户管理, url=/system/customer/, perms=customer:view, icon=layui-icon-team, type=0, orderNum=3, createTime=Wed Jul 29 22:37:50 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-29 22:37:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1170, 'MrBird', '新增菜单/按钮', 18, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=213, parentId=212, menuName=新增客户, url=null, perms=customer:create, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 22:38:45 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-29 22:38:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1171, 'MrBird', '新增菜单/按钮', 20, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=214, parentId=212, menuName=修改用户, url=null, perms=customer:update, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 22:39:20 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-29 22:39:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1172, 'MrBird', '新增菜单/按钮', 18, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=215, parentId=212, menuName=删除客户, url=null, perms=customer:delete, icon=null, type=1, orderNum=null, createTime=Wed Jul 29 22:40:15 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-29 22:40:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1173, 'MrBird', '修改角色', 77, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Wed Jul 29 22:40:28 CST 2020, menuIds=196,197,203,200,199,198,201,204,205,206,207,210,211,212,213,214,215,1,3,11,12,13,161,160,4,14,162,15,16,5,163,17,18,19,6,20,21,22,164,2,8,23,10,24,170,136,172,171,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,174,110,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,169,168,167,178)\"', '192.168.137.1', '2020-07-29 22:40:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1174, 'MrBird', '新增客户', 89, 'cc.mrbird.febs.system.controller.CustomerController.createCustomer()', ' customer: \"Customer(customerId=1, name=张三, gender=0, phone=15533334444, purchasingDate=Wed Jul 29 13:44:11 CST 2020, vehicleId=11, purchasingDateFrom=null, purchasingDateTo=null)\"', '192.168.137.1', '2020-07-29 23:19:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1175, 'MrBird', '新增客户', 12, 'cc.mrbird.febs.system.controller.CustomerController.createCustomer()', ' customer: \"Customer(customerId=2, name=李四, gender=1, phone=12333335555, purchasingDate=Wed Jul 29 12:33:16 CST 2020, vehicleId=22, purchasingDateFrom=null, purchasingDateTo=null)\"', '192.168.137.1', '2020-07-29 23:25:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1176, 'MrBird', '新增客户', 12, 'cc.mrbird.febs.system.controller.CustomerController.createCustomer()', ' customer: \"Customer(customerId=3, name=王五, gender=0, phone=12654789632, purchasingDate=Sat Jul 11 12:00:00 CST 2020, vehicleId=22, purchasingDateFrom=null, purchasingDateTo=null)\"', '192.168.137.1', '2020-07-29 23:27:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1177, 'MrBird', '新增车辆', 50, 'cc.mrbird.febs.system.controller.VehicleController.createVehicle()', ' vehicle: \"Vehicle(vehicleId=5, type=小型车, color=白色, deadWeight=10000, manufactureDate=Wed Jul 29 23:32:21 CST 2020, lowestPrice=40000, status=0, maintenanceTimes=6, manufactureDateFrom=null, manufactureDateTo=null)\"', '192.168.137.1', '2020-07-29 23:32:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1178, 'MrBird', '删除客户', 58, 'cc.mrbird.febs.system.controller.CustomerController.deleteCustomers()', ' customerIds: \"2\"', '192.168.137.1', '2020-07-29 23:54:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1179, 'MrBird', '删除客户', 12, 'cc.mrbird.febs.system.controller.CustomerController.deleteCustomers()', ' customerIds: \"1,3\"', '192.168.137.1', '2020-07-29 23:56:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1180, 'MrBird', '新增客户', 11, 'cc.mrbird.febs.system.controller.CustomerController.createCustomer()', ' customer: \"Customer(customerId=4, name=张三, gender=0, phone=15322223333, purchasingDate=Wed Jul 29 11:11:11 CST 2020, vehicleId=22, purchasingDateFrom=null, purchasingDateTo=null)\"', '192.168.137.1', '2020-07-29 23:56:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1181, 'MrBird', '修改菜单/按钮', 21, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=214, parentId=212, menuName=修改客户, url=null, perms=customer:update, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Wed Jul 29 23:57:51 CST 2020)\"', '192.168.137.1', '2020-07-29 23:57:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1182, 'MrBird', '修改客户', 44, 'cc.mrbird.febs.system.controller.CustomerController.updateCustomer()', ' customer: \"Customer(customerId=4, name=张三, gender=null, phone=15322223334, purchasingDate=null, vehicleId=22, purchasingDateFrom=null, purchasingDateTo=null)\"', '192.168.137.1', '2020-07-30 00:09:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1183, 'MrBird', '修改客户', 7, 'cc.mrbird.febs.system.controller.CustomerController.updateCustomer()', ' customer: \"Customer(customerId=4, name=张三, gender=null, phone=15322223334, purchasingDate=null, vehicleId=22, purchasingDateFrom=null, purchasingDateTo=null)\"', '192.168.137.1', '2020-07-30 00:09:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1184, 'MrBird', '新增客户', 55, 'cc.mrbird.febs.system.controller.CustomerController.createCustomer()', ' customer: \"Customer(customerId=5, name=王五, gender=0, phone=12345678900, purchasingDate=Thu Jul 30 10:00:03 CST 2020, vehicleId=22, purchasingDateFrom=null, purchasingDateTo=null)\"', '192.168.137.1', '2020-07-30 00:15:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1185, 'MrBird', '修改客户', 20, 'cc.mrbird.febs.system.controller.CustomerController.updateCustomer()', ' customer: \"Customer(customerId=5, name=王五, gender=null, phone=12345678901, purchasingDate=null, vehicleId=22, purchasingDateFrom=null, purchasingDateTo=null)\"', '192.168.137.1', '2020-07-30 00:15:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1186, 'MrBird', '删除客户', 18, 'cc.mrbird.febs.system.controller.CustomerController.deleteCustomers()', ' customerIds: \"5\"', '192.168.137.1', '2020-07-30 00:15:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1187, 'MrBird', '修改订单', 56, 'cc.mrbird.febs.system.controller.OrderController.updateOrder()', ' order: \"Order(orderId=2, salesId=13, customerName=lisi, customerPhone=12345678911, vehicleId=11, price=202222, createTime=null, status=null, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-07-30 09:08:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1188, 'MrBird', '修改角色', 88, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Thu Jul 30 09:16:14 CST 2020, menuIds=196,197,203,200,199,198,201,204,205,206,207,210,211,212,213,215,1,3,11,12,13,161,160,4,14,162,15,16,5,163,17,18,19,6,20,21,22,164,2,8,23,10,24,170,136,172,171,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,174,110,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,169,168,167,178)\"', '192.168.137.1', '2020-07-30 09:16:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1189, 'MrBird', '修改角色', 64, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Thu Jul 30 09:26:33 CST 2020, menuIds=196,197,203,200,199,198,201,204,205,206,207,210,211,212,213,214,215,1,3,11,12,13,161,160,4,14,162,15,16,5,163,17,18,19,6,20,21,22,164,2,8,23,10,24,170,136,172,171,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,174,110,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,169,168,167,178)\"', '192.168.137.1', '2020-07-30 09:26:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1190, 'MrBird', '保养车辆', 83, 'cc.mrbird.febs.system.controller.VehicleController.maintenanceVehicles()', ' vehicleIds: \"3\"', '192.168.137.1', '2020-07-30 09:55:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1191, 'MrBird', '出售车辆', 23, 'cc.mrbird.febs.system.controller.VehicleController.saleVehicles()', ' vehicleIds: \"1\"', '192.168.137.1', '2020-07-30 10:00:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1192, 'MrBird', '出售车辆', 19, 'cc.mrbird.febs.system.controller.VehicleController.saleVehicles()', ' vehicleIds: \"2\"', '192.168.137.1', '2020-07-30 10:00:18', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1193, 'MrBird', '出售车辆', 21, 'cc.mrbird.febs.system.controller.VehicleController.saleVehicles()', ' vehicleIds: \"5\"', '192.168.137.1', '2020-07-30 10:00:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1194, 'MrBird', '归档订单', 76, 'cc.mrbird.febs.system.controller.OrderController.archiveOrder()', ' orderIds: \"4\"', '192.168.137.1', '2020-07-30 10:08:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1195, 'MrBird', '修改角色', 41, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=81, roleName=销售人员, remark=车辆销售, createTime=null, modifyTime=Thu Jul 30 11:41:11 CST 2020, menuIds=196,197,198,201,205,210,211,212,213)\"', '192.168.137.1', '2020-07-30 11:41:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1196, 'MrBird', '修改角色', 65, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Thu Jul 30 11:51:50 CST 2020, menuIds=196,197,203,200,199,198,201,204,205,206,207,210,212,213,214,215,1,3,11,12,13,161,160,4,14,162,15,16,5,163,17,18,19,6,20,21,22,164,2,8,23,10,24,170,136,172,171,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,174,110,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,169,168,167,178)\"', '192.168.137.1', '2020-07-30 11:51:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1197, 'MrBird', '修改角色', 57, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Thu Jul 30 11:52:45 CST 2020, menuIds=196,197,203,200,199,198,201,204,205,206,207,210,211,212,213,214,215,1,3,11,12,13,161,160,4,14,162,15,16,5,163,17,18,19,6,20,21,22,164,2,8,23,10,24,170,136,172,171,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,174,110,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,169,168,167,178)\"', '192.168.137.1', '2020-07-30 11:52:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1198, 'MrBird', '新增菜单/按钮', 18, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=216, parentId=205, menuName=保养按钮, url=null, perms=, icon=null, type=1, orderNum=null, createTime=Thu Jul 30 11:54:13 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-30 11:54:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1199, 'MrBird', '修改菜单/按钮', 19, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=216, parentId=205, menuName=保养按钮, url=null, perms=vehicle:maintenance, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Thu Jul 30 11:54:30 CST 2020)\"', '192.168.137.1', '2020-07-30 11:54:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1200, 'MrBird', '修改角色', 64, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Thu Jul 30 11:54:43 CST 2020, menuIds=196,197,201,200,199,198,203,204,205,206,207,216,210,211,212,213,214,215,1,3,11,12,13,161,160,4,14,162,15,16,5,163,17,18,19,6,20,21,22,164,2,8,23,10,24,170,136,172,171,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,174,110,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,169,168,167,178)\"', '192.168.137.1', '2020-07-30 11:54:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1201, 'MrBird', '修改角色', 28, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=81, roleName=销售人员, remark=车辆销售, createTime=null, modifyTime=Thu Jul 30 11:54:58 CST 2020, menuIds=196,197,201,198,205,216,210,211,212,213)\"', '192.168.137.1', '2020-07-30 11:54:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1202, 'MrBird', '修改角色', 26, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=81, roleName=销售人员, remark=车辆销售, createTime=null, modifyTime=Thu Jul 30 11:55:50 CST 2020, menuIds=196,197,201,198,205,206,207,216,210,211,212,213)\"', '192.168.137.1', '2020-07-30 11:55:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1203, 'MrBird', '删除菜单/按钮', 31, 'cc.mrbird.febs.system.controller.MenuController.deleteMenus()', ' menuIds: \"216\"', '192.168.137.1', '2020-07-30 11:56:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1204, 'MrBird', '修改角色', 29, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=81, roleName=销售人员, remark=车辆销售, createTime=null, modifyTime=Thu Jul 30 11:56:46 CST 2020, menuIds=196,197,198,201,205,206,210,211,212,213)\"', '192.168.137.1', '2020-07-30 11:56:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1205, 'MrBird', '修改角色', 25, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=81, roleName=销售人员, remark=车辆销售, createTime=null, modifyTime=Thu Jul 30 11:57:12 CST 2020, menuIds=196,197,198,201,205,207,210,211,212,213)\"', '192.168.137.1', '2020-07-30 11:57:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1206, 'MrBird', '修改角色', 96, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=81, roleName=销售人员, remark=车辆销售, createTime=null, modifyTime=Thu Jul 30 11:59:10 CST 2020, menuIds=196,197,198,201,205,210,211,212,213)\"', '192.168.137.1', '2020-07-30 11:59:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1207, 'zhangsan', '保养车辆', 31, 'cc.mrbird.febs.system.controller.VehicleController.maintenanceVehicles()', ' vehicleIds: \"2\"', '0:0:0:0:0:0:0:1', '2020-07-30 11:59:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1208, 'MrBird', '新增菜单/按钮', 25, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=217, parentId=196, menuName=业绩统计, url=, perms=achivement, icon=layui-icon-linechart, type=0, orderNum=null, createTime=Thu Jul 30 14:05:08 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-07-30 14:05:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1209, 'MrBird', '修改角色', 78, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Thu Jul 30 14:05:19 CST 2020, menuIds=196,217,197,201,200,199,198,203,204,205,206,207,210,211,212,213,214,215,1,3,11,12,13,161,160,4,14,162,15,16,5,163,17,18,19,6,20,21,22,164,2,8,23,10,24,170,136,172,171,127,128,129,131,175,101,102,103,104,105,106,107,108,173,109,174,110,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,169,168,167,178)\"', '192.168.137.1', '2020-07-30 14:05:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1210, 'MrBird', '修改菜单/按钮', 25, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=217, parentId=196, menuName=业绩统计, url=, perms=achivement, icon=layui-icon-linechart, type=0, orderNum=4, createTime=null, modifyTime=Thu Jul 30 14:05:38 CST 2020)\"', '192.168.137.1', '2020-07-30 14:05:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1211, 'MrBird', '修改菜单/按钮', 17, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=217, parentId=196, menuName=业绩统计, url=/system/achievement/, perms=achivement, icon=layui-icon-linechart, type=0, orderNum=4, createTime=null, modifyTime=Thu Jul 30 14:06:27 CST 2020)\"', '192.168.137.1', '2020-07-30 14:06:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1212, 'MrBird', '修改菜单/按钮', 10, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=217, parentId=196, menuName=业绩统计, url=/system/achievement/, perms=achivement:view, icon=layui-icon-linechart, type=0, orderNum=4, createTime=null, modifyTime=Thu Jul 30 14:08:15 CST 2020)\"', '192.168.137.1', '2020-07-30 14:08:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1213, 'MrBird', '修改菜单/按钮', 17, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=217, parentId=196, menuName=业绩统计, url=/system/achievement/, perms=achievement:view, icon=layui-icon-linechart, type=0, orderNum=4, createTime=null, modifyTime=Thu Jul 30 14:08:45 CST 2020)\"', '192.168.137.1', '2020-07-30 14:08:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1214, 'MrBird', '修改角色', 65, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=82, roleName=销售经理, remark=负责管理销售人员及订单审批, createTime=null, modifyTime=Thu Jul 30 20:11:06 CST 2020, menuIds=196,197,199,198,203,204,205,206,207,210,211,212,213,214,215,217)\"', '192.168.137.1', '2020-07-30 20:11:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1215, 'MrBird', '修改角色', 27, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=83, roleName=财务会计, remark=负责审核账单及付款校对, createTime=null, modifyTime=Thu Jul 30 20:11:18 CST 2020, menuIds=196,197,200,203)\"', '192.168.137.1', '2020-07-30 20:11:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1216, 'MrBird', '修改角色', 33, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=81, roleName=销售人员, remark=车辆销售, createTime=null, modifyTime=Thu Jul 30 20:12:02 CST 2020, menuIds=196,197,201,198,205,210,211,212,213)\"', '192.168.137.1', '2020-07-30 20:12:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1217, 'MrBird', '删除订单', 33, 'cc.mrbird.febs.system.controller.OrderController.deleteOrders()', ' orderIds: \"13\"', '192.168.137.1', '2020-07-31 10:15:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1218, 'MrBird', '新增订单', 67, 'cc.mrbird.febs.system.controller.OrderController.createOrder()', ' order: \"Order(orderId=14, salesId=3, customerName=zzz, customerPhone=12536489000, vehicleId=2, price=22222222, createTime=Fri Jul 31 13:27:37 CST 2020, status=待审核, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-07-31 13:27:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1219, 'MrBird', '修改订单', 89, 'cc.mrbird.febs.system.controller.OrderController.updateOrder()', ' order: \"Order(orderId=14, salesId=3, customerName=zzz, customerPhone=12536489000, vehicleId=111, price=22222222, createTime=null, status=null, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-07-31 13:27:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1220, 'MrBird', '删除订单', 48, 'cc.mrbird.febs.system.controller.OrderController.deleteOrders()', ' orderIds: \"14\"', '192.168.137.1', '2020-07-31 13:28:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1221, 'MrBird', '经理审批订单', 47, 'cc.mrbird.febs.system.controller.OrderController.managerApproveOrder()', ' orderIds: \"1\"', '192.168.137.1', '2020-07-31 13:28:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1222, 'MrBird', '财务审批订单', 68, 'cc.mrbird.febs.system.controller.OrderController.accountingApproveOrder()', ' orderIds: \"1\"', '192.168.137.1', '2020-07-31 13:28:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1223, 'MrBird', '销售审批订单', 38, 'cc.mrbird.febs.system.controller.OrderController.salesApproveOrder()', ' orderIds: \"1\"', '192.168.137.1', '2020-07-31 13:28:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1224, 'MrBird', '归档订单', 30, 'cc.mrbird.febs.system.controller.OrderController.archiveOrder()', ' orderIds: \"1\"', '192.168.137.1', '2020-07-31 13:29:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1225, 'MrBird', '出售车辆', 35, 'cc.mrbird.febs.system.controller.VehicleController.saleVehicles()', ' vehicleIds: \"3\"', '192.168.137.1', '2020-07-31 13:29:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1226, 'MrBird', '保养车辆', 42, 'cc.mrbird.febs.system.controller.VehicleController.maintenanceVehicles()', ' vehicleIds: \"3\"', '192.168.137.1', '2020-07-31 13:29:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1227, 'MrBird', '保养车辆', 51, 'cc.mrbird.febs.system.controller.VehicleController.maintenanceVehicles()', ' vehicleIds: \"3\"', '192.168.137.1', '2020-07-31 13:29:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1228, 'MrBird', '修改菜单/按钮', 45, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=203, parentId=197, menuName=审批订单, url=/system/order/approve, perms=order:approve, icon=, type=0, orderNum=1, createTime=null, modifyTime=Fri Jul 31 13:53:09 CST 2020)\"', '192.168.137.1', '2020-07-31 13:53:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1229, 'MrBird', '修改菜单/按钮', 9, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=204, parentId=197, menuName=归档订单, url=/system/order/archive, perms=order:archive, icon=, type=0, orderNum=2, createTime=null, modifyTime=Fri Jul 31 13:53:15 CST 2020)\"', '192.168.137.1', '2020-07-31 13:53:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1230, 'MrBird', '归档订单', 24, 'cc.mrbird.febs.system.controller.OrderController.archiveOrder()', ' orderIds: \"4\"', '192.168.137.1', '2020-07-31 13:54:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1231, 'MrBird', '删除角色', 40, 'cc.mrbird.febs.system.controller.RoleController.deleteRoles()', ' roleIds: \"83,82,81\"', '192.168.43.143', '2020-11-26 08:55:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1232, 'MrBird', '新增角色', 19, 'cc.mrbird.febs.system.controller.RoleController.addRole()', ' role: \"Role(roleId=84, roleName=店主, remark=店主, createTime=Thu Nov 26 08:57:44 CST 2020, modifyTime=null, menuIds=196,197,212,213,214,215)\"', '192.168.43.143', '2020-11-26 08:57:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1233, 'MrBird', '修改菜单/按钮', 47, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=205, parentId=196, menuName=货物管理, url=/system/goods, perms=goods:view, icon=layui-icon-car, type=0, orderNum=2, createTime=null, modifyTime=Thu Nov 26 09:06:56 CST 2020)\"', '192.168.43.143', '2020-11-26 09:06:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1234, 'MrBird', '修改菜单/按钮', 9, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=206, parentId=205, menuName=新增货物, url=null, perms=vehicle:create, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Thu Nov 26 09:07:11 CST 2020)\"', '192.168.43.143', '2020-11-26 09:07:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1235, 'MrBird', '修改菜单/按钮', 18, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=207, parentId=205, menuName=修改或删除货物, url=null, perms=vehicle:modify, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Thu Nov 26 09:07:54 CST 2020)\"', '192.168.43.143', '2020-11-26 09:07:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1236, 'MrBird', '修改菜单/按钮', 8, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=210, parentId=205, menuName=出售货物, url=/system/goods/sale, perms=goods:sale, icon=, type=0, orderNum=1, createTime=null, modifyTime=Thu Nov 26 09:08:18 CST 2020)\"', '192.168.43.143', '2020-11-26 09:08:18', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1237, 'MrBird', '删除菜单/按钮', 24, 'cc.mrbird.febs.system.controller.MenuController.deleteMenus()', ' menuIds: \"211\"', '192.168.43.143', '2020-11-26 09:08:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1238, 'MrBird', '修改菜单/按钮', 9, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=205, parentId=196, menuName=货品管理, url=/system/goods, perms=goods:view, icon=layui-icon-car, type=0, orderNum=2, createTime=null, modifyTime=Thu Nov 26 09:10:36 CST 2020)\"', '192.168.43.143', '2020-11-26 09:10:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1239, 'MrBird', '修改菜单/按钮', 16, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=206, parentId=205, menuName=新增货品, url=null, perms=vehicle:create, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Thu Nov 26 09:10:43 CST 2020)\"', '192.168.43.143', '2020-11-26 09:10:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1240, 'MrBird', '修改菜单/按钮', 17, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=207, parentId=205, menuName=修改或删除货品, url=null, perms=vehicle:modify, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Thu Nov 26 09:10:52 CST 2020)\"', '192.168.43.143', '2020-11-26 09:10:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1241, 'MrBird', '修改菜单/按钮', 15, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=210, parentId=205, menuName=出售货品, url=/system/goods/sale, perms=goods:sale, icon=, type=0, orderNum=1, createTime=null, modifyTime=Thu Nov 26 09:11:03 CST 2020)\"', '192.168.43.143', '2020-11-26 09:11:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1242, 'MrBird', '修改菜单/按钮', 29, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=207, parentId=205, menuName=修改或删除货品, url=null, perms=goods:modify, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Thu Nov 26 10:13:54 CST 2020)\"', '172.20.88.167', '2020-11-26 10:13:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1243, 'MrBird', '修改菜单/按钮', 9, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=206, parentId=205, menuName=新增货品, url=null, perms=goods:create, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Thu Nov 26 10:14:03 CST 2020)\"', '172.20.88.167', '2020-11-26 10:14:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1244, 'MrBird', '新增车辆', 28, 'cc.mrbird.febs.system.controller.GoodsController.createGoods()', ' goods: \"Goods(goodsId=1, name=键盘, price=200, inventory=10)\"', '172.20.88.167', '2020-11-26 10:27:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1245, 'MrBird', '修改菜单/按钮', 18, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=205, parentId=0, menuName=货品管理, url=/system/goods, perms=goods:view, icon=layui-icon-car, type=0, orderNum=null, createTime=null, modifyTime=Thu Nov 26 10:38:28 CST 2020)\"', '172.20.88.167', '2020-11-26 10:38:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1246, 'MrBird', '修改菜单/按钮', 8, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=205, parentId=0, menuName=货品管理, url=/system/goods, perms=goods:view, icon=layui-icon-car, type=0, orderNum=1, createTime=null, modifyTime=Thu Nov 26 10:38:47 CST 2020)\"', '172.20.88.167', '2020-11-26 10:38:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1247, 'MrBird', '修改菜单/按钮', 8, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=205, parentId=0, menuName=货品管理, url=/system/goods, perms=goods:view, icon=layui-icon-car, type=0, orderNum=0, createTime=null, modifyTime=Thu Nov 26 10:39:01 CST 2020)\"', '172.20.88.167', '2020-11-26 10:39:01', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1248, 'MrBird', '修改菜单/按钮', 17, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=212, parentId=0, menuName=客户管理, url=/system/customer/, perms=customer:view, icon=layui-icon-team, type=0, orderNum=1, createTime=null, modifyTime=Thu Nov 26 10:46:47 CST 2020)\"', '172.20.88.167', '2020-11-26 10:46:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1249, 'MrBird', '修改菜单/按钮', 19, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=212, parentId=0, menuName=客户管理, url=/system/customer/, perms=customer:view, icon=layui-icon-team, type=0, orderNum=0, createTime=null, modifyTime=Thu Nov 26 10:46:59 CST 2020)\"', '172.20.88.167', '2020-11-26 10:46:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1250, 'MrBird', '新增客户', 26, 'cn.edu.hit.spat.system.controller.CustomerController.createCustomer()', ' customer: \"Customer(customerId=6, name=李四, gender=1, phone=15066667777, type=零售客户)\"', '192.168.43.143', '2020-11-30 10:13:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1251, 'MrBird', '新增客户', 61, 'cn.edu.hit.spat.system.controller.CustomerController.createCustomer()', ' customer: \"Customer(customerId=1, name=张三, gender=0, phone=15100001111, type=零售客户)\"', '192.168.43.143', '2020-11-30 10:30:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1252, 'MrBird', '新增客户', 21, 'cn.edu.hit.spat.system.controller.CustomerController.createCustomer()', ' customer: \"Customer(customerId=2, name=李四, gender=1, phone=15211112222, type=批发客户)\"', '192.168.43.143', '2020-11-30 10:30:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1253, 'MrBird', '删除客户', 10, 'cn.edu.hit.spat.system.controller.CustomerController.deleteCustomers()', ' customerIds: \"1\"', '192.168.43.143', '2020-11-30 10:38:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1254, 'MrBird', '修改客户', 19, 'cn.edu.hit.spat.system.controller.CustomerController.updateCustomer()', ' customer: \"Customer(customerId=2, name=李四, gender=女性, phone=15211112222, type=零售客户)\"', '192.168.43.143', '2020-11-30 10:41:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1255, 'MrBird', '修改客户', 8, 'cn.edu.hit.spat.system.controller.CustomerController.updateCustomer()', ' customer: \"Customer(customerId=2, name=李四, gender=男性, phone=15211112222, type=零售客户)\"', '192.168.43.143', '2020-11-30 10:41:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1256, 'MrBird', '删除菜单/按钮', 46, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"217\"', '192.168.43.143', '2020-11-30 18:11:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1257, 'MrBird', '删除菜单/按钮', 19, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"196\"', '192.168.43.143', '2020-11-30 18:11:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1258, 'MrBird', '修改角色', 37, 'cn.edu.hit.spat.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=84, roleName=店主, remark=店主, createTime=null, modifyTime=Mon Nov 30 18:33:12 CST 2020, menuIds=212,213,214,215,205,206,207,210,197)\"', '192.168.43.143', '2020-11-30 18:33:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1259, 'MrBird', '新增角色', 20, 'cn.edu.hit.spat.system.controller.RoleController.addRole()', ' role: \"Role(roleId=85, roleName=经理, remark=经理, createTime=Mon Nov 30 18:34:16 CST 2020, modifyTime=null, menuIds=212,213,214,215,197)\"', '192.168.43.143', '2020-11-30 18:34:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1260, 'MrBird', '新增角色', 22, 'cn.edu.hit.spat.system.controller.RoleController.addRole()', ' role: \"Role(roleId=86, roleName=店员, remark=店员, createTime=Mon Nov 30 18:36:06 CST 2020, modifyTime=null, menuIds=212,213,214,197,198)\"', '192.168.43.143', '2020-11-30 18:36:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1261, 'MrBird', '修改菜单/按钮', 19, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=197, parentId=0, menuName=订单管理, url=/system/order/, perms=order:view, icon=layui-icon-filedone, type=0, orderNum=0, createTime=null, modifyTime=Mon Nov 30 18:42:01 CST 2020)\"', '192.168.43.143', '2020-11-30 18:42:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1262, 'MrBird', '修改菜单/按钮', 10, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=212, parentId=0, menuName=客户管理, url=/system/customer/, perms=customer:view, icon=layui-icon-team, type=0, orderNum=1, createTime=null, modifyTime=Mon Nov 30 18:42:11 CST 2020)\"', '192.168.43.143', '2020-11-30 18:42:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1263, 'MrBird', '修改菜单/按钮', 18, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=205, parentId=0, menuName=货品管理, url=/system/goods, perms=goods:view, icon=layui-icon-car, type=0, orderNum=2, createTime=null, modifyTime=Mon Nov 30 18:42:19 CST 2020)\"', '192.168.43.143', '2020-11-30 18:42:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1264, 'MrBird', '修改菜单/按钮', 9, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=1, parentId=0, menuName=系统管理, url=, perms=, icon=layui-icon-setting, type=0, orderNum=3, createTime=null, modifyTime=Mon Nov 30 18:42:33 CST 2020)\"', '192.168.43.143', '2020-11-30 18:42:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1265, 'MrBird', '修改菜单/按钮', 17, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=2, parentId=0, menuName=系统监控, url=, perms=, icon=layui-icon-alert, type=0, orderNum=4, createTime=null, modifyTime=Mon Nov 30 18:42:45 CST 2020)\"', '192.168.43.143', '2020-11-30 18:42:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1266, 'MrBird', '新增客户', 9, 'cn.edu.hit.spat.system.controller.CustomerController.createCustomer()', ' customer: \"Customer(customerId=3, name=王五, gender=女, phone=15433334444, type=批发客户)\"', '192.168.43.143', '2020-11-30 18:50:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1267, 'MrBird', '新增客户', 15, 'cn.edu.hit.spat.system.controller.CustomerController.createCustomer()', ' customer: \"Customer(customerId=4, name=六, gender=男, phone=11111111111, type=零售客户)\"', '192.168.43.143', '2020-11-30 18:57:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1268, 'MrBird', '修改菜单/按钮', 25, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=210, parentId=205, menuName=删除货品, url=null, perms=goods:delete, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Mon Nov 30 19:43:12 CST 2020)\"', '192.168.43.143', '2020-11-30 19:43:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1269, 'MrBird', '修改菜单/按钮', 17, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=207, parentId=205, menuName=修改货品, url=null, perms=goods:update, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Mon Nov 30 19:43:24 CST 2020)\"', '192.168.43.143', '2020-11-30 19:43:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1270, 'MrBird', '新增货品', 26, 'cn.edu.hit.spat.system.controller.GoodsController.createGoods()', ' goods: \"Goods(goodsId=2, name=鼠标, purchasePrice=10, wholesalePrice=20, retailPrice=30)\"', '192.168.43.143', '2020-11-30 20:00:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1271, 'MrBird', '删除货品', 21, 'cn.edu.hit.spat.system.controller.GoodsController.deleteGoodss()', ' goodsId: \"2\"', '192.168.43.143', '2020-11-30 20:00:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1272, 'MrBird', '修改货品', 19, 'cn.edu.hit.spat.system.controller.GoodsController.updateGoods()', ' goods: \"Goods(goodsId=1, name=键盘, purchasePrice=210, wholesalePrice=300, retailPrice=400)\"', '192.168.43.143', '2020-11-30 20:00:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1273, 'MrBird', '修改货品', 3, 'cn.edu.hit.spat.system.controller.GoodsController.updateGoods()', ' goods: \"Goods(goodsId=1, name=键盘, purchasePrice=210, wholesalePrice=300, retailPrice=400)\"', '192.168.43.143', '2020-11-30 20:00:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1274, 'MrBird', '修改菜单/按钮', 21, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=203, parentId=197, menuName=零售订单, url=/system/order/retail, perms=order:retail, icon=, type=0, orderNum=1, createTime=null, modifyTime=Mon Nov 30 20:05:26 CST 2020)\"', '192.168.43.143', '2020-11-30 20:05:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1275, 'MrBird', '修改菜单/按钮', 9, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=204, parentId=197, menuName=批发订单, url=/system/order/wholesale, perms=order:wholesale, icon=, type=0, orderNum=2, createTime=null, modifyTime=Mon Nov 30 20:06:36 CST 2020)\"', '192.168.43.143', '2020-11-30 20:06:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1276, 'MrBird', '添加货品属性', 23, 'cn.edu.hit.spat.system.controller.GoodsController.addAttribute()', ' goodsDetail: GoodsDetail(goodsDetailId=1, goodsId=1, goodsAttribute=重量, goodsAttributeValue=0.8)', '192.168.43.143', '2020-12-01 21:37:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1277, 'MrBird', '添加货品属性', 28, 'cn.edu.hit.spat.system.controller.GoodsController.addAttribute()', ' goodsDetail: GoodsDetail(goodsDetailId=2, goodsId=1, goodsAttribute=颜色, goodsAttributeValue=黑色)', '192.168.43.143', '2020-12-02 20:18:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1278, 'MrBird', '新增货品', 17, 'cn.edu.hit.spat.system.controller.GoodsController.createGoods()', ' goods: \"Goods(goodsId=3, name=鼠标, purchasePrice=10, wholesalePrice=20, retailPrice=30, detailList=null)\"', '192.168.43.143', '2020-12-04 10:02:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1279, 'MrBird', '修改货品属性', 32, 'cn.edu.hit.spat.system.controller.GoodsController.updateGoodsDetail()', ' goodsDetail: GoodsDetail(goodsDetailId=1, goodsId=1, goodsAttribute=重量, goodsAttributeValue=0.5)', '192.168.43.143', '2020-12-04 10:46:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1280, 'MrBird', '添加货品属性', 31, 'cn.edu.hit.spat.system.controller.GoodsController.addAttribute()', ' goodsDetail: GoodsDetail(goodsDetailId=3, goodsId=3, goodsAttribute=color, goodsAttributeValue=white)', '192.168.43.143', '2020-12-04 10:52:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1281, 'MrBird', '添加货品属性', 24, 'cn.edu.hit.spat.system.controller.GoodsController.addAttribute()', ' goodsDetail: GoodsDetail(goodsDetailId=4, goodsId=3, goodsAttribute=颜色, goodsAttributeValue=白色)', '192.168.43.143', '2020-12-04 12:31:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1282, 'MrBird', '添加货品属性', 17, 'cn.edu.hit.spat.system.controller.GoodsController.addAttribute()', ' goodsDetail: GoodsDetail(goodsDetailId=1, goodsId=1, goodsAttribute=重量, goodsAttributeValue=0.5)', '192.168.43.143', '2020-12-04 12:33:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1283, 'MrBird', '添加货品属性', 22, 'cn.edu.hit.spat.system.controller.GoodsController.addAttribute()', ' goodsDetail: GoodsDetail(goodsDetailId=5, goodsId=3, goodsAttribute=重量, goodsAttributeValue=0.3)', '192.168.43.143', '2020-12-04 12:34:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1284, 'MrBird', '修改货品属性', 20, 'cn.edu.hit.spat.system.controller.GoodsController.updateGoodsDetail()', ' goodsDetail: GoodsDetail(goodsDetailId=4, goodsId=3, goodsAttribute=颜色, goodsAttributeValue=黑色)', '192.168.43.143', '2020-12-04 12:40:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1285, 'MrBird', '删除货品', 20, 'cn.edu.hit.spat.system.controller.GoodsController.deleteGoodsDetail()', ' goodsDetailId: \"3\"', '192.168.43.143', '2020-12-04 12:41:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1286, 'MrBird', '新增货品', 18, 'cn.edu.hit.spat.system.controller.GoodsController.createGoods()', ' goods: \"Goods(goodsId=4, name=椅子, purchasePrice=100, wholesalePrice=200, retailPrice=300, detailList=null)\"', '192.168.43.143', '2020-12-04 12:57:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1287, 'MrBird', '新增货品', 28, 'cn.edu.hit.spat.system.controller.GoodsController.createGoods()', ' goods: \"Goods(goodsId=5, name=桌子, purchasePrice=200, wholesalePrice=300, retailPrice=400, detailList=null)\"', '192.168.43.143', '2020-12-04 13:00:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1288, 'MrBird', '添加货品属性', 20, 'cn.edu.hit.spat.system.controller.GoodsController.addAttribute()', ' goodsDetail: GoodsDetail(goodsDetailId=6, goodsId=4, goodsAttribute=高度, goodsAttributeValue=50)', '192.168.43.143', '2020-12-04 13:00:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1289, 'MrBird', '修改货品属性', 19, 'cn.edu.hit.spat.system.controller.GoodsController.updateGoodsDetail()', ' goodsDetail: GoodsDetail(goodsDetailId=6, goodsId=4, goodsAttribute=高度(cm), goodsAttributeValue=60)', '192.168.43.143', '2020-12-04 13:02:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1290, 'MrBird', '删除货品', 27, 'cn.edu.hit.spat.system.controller.GoodsController.deleteGoods()', ' goodsIds: \"4\"', '192.168.43.143', '2020-12-04 13:03:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1291, 'MrBird', '添加货品属性', 21, 'cn.edu.hit.spat.system.controller.GoodsController.addAttribute()', ' goodsDetail: GoodsDetail(goodsDetailId=7, goodsId=5, goodsAttribute=桌高, goodsAttributeValue=100)', '192.168.43.143', '2020-12-04 13:12:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1292, 'MrBird', '修改货品属性', 60, 'cn.edu.hit.spat.system.controller.GoodsController.updateGoodsDetail()', ' goodsDetail: GoodsDetail(goodsDetailId=7, goodsId=5, goodsAttribute=桌高(cm), goodsAttributeValue=120)', '192.168.43.143', '2020-12-04 13:12:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1293, 'MrBird', '删除货品', 14, 'cn.edu.hit.spat.system.controller.GoodsController.deleteGoods()', ' goodsIds: \"5\"', '192.168.43.143', '2020-12-04 13:12:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1294, 'MrBird', '新增货品', 68, 'cn.edu.hit.spat.system.controller.GoodsController.createGoods()', ' goods: \"Goods(goodsId=6, name=铅笔, purchasePrice=2, wholesalePrice=3, retailPrice=4, detailList=null)\"', '192.168.43.143', '2020-12-04 13:14:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1295, 'MrBird', '添加货品属性', 20, 'cn.edu.hit.spat.system.controller.GoodsController.addAttribute()', ' goodsDetail: GoodsDetail(goodsDetailId=8, goodsId=6, goodsAttribute=类型, goodsAttributeValue=HB)', '192.168.43.143', '2020-12-04 13:15:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1296, 'MrBird', '删除货品', 24, 'cn.edu.hit.spat.system.controller.GoodsController.deleteGoods()', ' goodsIds: \"6\"', '192.168.43.143', '2020-12-04 13:15:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1297, 'MrBird', '新增菜单/按钮', 29, 'cn.edu.hit.spat.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=218, parentId=0, menuName=仓库管理, url=, perms=storage:view, icon=, type=0, orderNum=null, createTime=Fri Dec 04 22:32:19 CST 2020, modifyTime=null)\"', '192.168.43.143', '2020-12-04 22:32:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1298, 'MrBird', '新增菜单/按钮', 20, 'cn.edu.hit.spat.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=219, parentId=218, menuName=仓库总览, url=/system/storage, perms=storage:view, icon=, type=0, orderNum=0, createTime=Fri Dec 04 22:33:53 CST 2020, modifyTime=null)\"', '192.168.43.143', '2020-12-04 22:33:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1299, 'MrBird', '新增菜单/按钮', 21, 'cn.edu.hit.spat.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=220, parentId=219, menuName=新增仓库, url=null, perms=storage:create, icon=null, type=1, orderNum=null, createTime=Fri Dec 04 22:35:51 CST 2020, modifyTime=null)\"', '192.168.43.143', '2020-12-04 22:35:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1300, 'MrBird', '新增菜单/按钮', 20, 'cn.edu.hit.spat.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=221, parentId=219, menuName=修改仓库, url=null, perms=storage:create, icon=null, type=1, orderNum=null, createTime=Fri Dec 04 22:36:23 CST 2020, modifyTime=null)\"', '192.168.43.143', '2020-12-04 22:36:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1301, 'MrBird', '新增菜单/按钮', 16, 'cn.edu.hit.spat.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=222, parentId=219, menuName=删除仓库, url=null, perms=storage:delete, icon=null, type=1, orderNum=null, createTime=Fri Dec 04 22:37:07 CST 2020, modifyTime=null)\"', '192.168.43.143', '2020-12-04 22:37:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1302, 'MrBird', '修改菜单/按钮', 21, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=220, parentId=219, menuName=新增仓库, url=null, perms=storage:update, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Fri Dec 04 22:37:16 CST 2020)\"', '192.168.43.143', '2020-12-04 22:37:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1303, 'MrBird', '修改菜单/按钮', 9, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=220, parentId=219, menuName=新增仓库, url=null, perms=storage:create, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Fri Dec 04 22:37:43 CST 2020)\"', '192.168.43.143', '2020-12-04 22:37:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1304, 'MrBird', '修改菜单/按钮', 9, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=221, parentId=219, menuName=修改仓库, url=null, perms=storage:update, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Fri Dec 04 22:37:51 CST 2020)\"', '192.168.43.143', '2020-12-04 22:37:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1305, 'MrBird', '新增菜单/按钮', 7, 'cn.edu.hit.spat.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=223, parentId=218, menuName=库存记录, url=/system/record, perms=record:view, icon=, type=0, orderNum=1, createTime=Fri Dec 04 22:40:47 CST 2020, modifyTime=null)\"', '192.168.43.143', '2020-12-04 22:40:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1306, 'MrBird', '新增菜单/按钮', 9, 'cn.edu.hit.spat.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=224, parentId=223, menuName=新货入库, url=null, perms=record:create, icon=null, type=1, orderNum=null, createTime=Fri Dec 04 22:42:16 CST 2020, modifyTime=null)\"', '192.168.43.143', '2020-12-04 22:42:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1307, 'MrBird', '新增菜单/按钮', 19, 'cn.edu.hit.spat.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=225, parentId=223, menuName=货品出库, url=null, perms=record:out, icon=null, type=1, orderNum=null, createTime=Fri Dec 04 22:43:27 CST 2020, modifyTime=null)\"', '192.168.43.143', '2020-12-04 22:43:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1308, 'MrBird', '新增菜单/按钮', 8, 'cn.edu.hit.spat.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=226, parentId=223, menuName=已有货品入库, url=null, perms=record:update, icon=null, type=1, orderNum=null, createTime=Fri Dec 04 22:44:39 CST 2020, modifyTime=null)\"', '192.168.43.143', '2020-12-04 22:44:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1309, 'MrBird', '新增菜单/按钮', 18, 'cn.edu.hit.spat.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=227, parentId=223, menuName=货品转移, url=null, perms=record:trans, icon=null, type=1, orderNum=null, createTime=Fri Dec 04 22:45:03 CST 2020, modifyTime=null)\"', '192.168.43.143', '2020-12-04 22:45:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1310, 'MrBird', '修改角色', 76, 'cn.edu.hit.spat.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Fri Dec 04 22:45:51 CST 2020, menuIds=218,219,220,221,222,223,224,225,226,227,197,198,199,200,201,203,204,212,213,214,215,205,206,207,210,101,102,103,173,104,105,106,107,108,109,174,110,1,3,11,12,13,160,161,4,15,14,16,162,5,17,18,19,163,6,164,20,21,22,137,138,165,139,166,2,8,23,10,170,24,136,171,172,127,128,129,131,175,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178)\"', '192.168.43.143', '2020-12-04 22:45:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1311, 'MrBird', '修改菜单/按钮', 20, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=197, parentId=0, menuName=订单管理, url=, perms=order:view, icon=layui-icon-filedone, type=0, orderNum=0, createTime=null, modifyTime=Fri Dec 04 22:48:21 CST 2020)\"', '192.168.43.143', '2020-12-04 22:48:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1312, 'MrBird', '修改菜单/按钮', 29, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=199, parentId=197, menuName=审批订单, url=null, perms=order:approve:audit, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Fri Dec 04 23:47:02 CST 2020)\"', '192.168.43.143', '2020-12-04 23:47:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1313, 'MrBird', '新增菜单/按钮', 22, 'cn.edu.hit.spat.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=228, parentId=204, menuName=修改订单及退货, url=null, perms=order:update, icon=null, type=1, orderNum=null, createTime=Sat Dec 05 00:00:26 CST 2020, modifyTime=null)\"', '192.168.43.143', '2020-12-05 00:00:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1314, 'MrBird', '新增菜单/按钮', 61, 'cn.edu.hit.spat.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=229, parentId=204, menuName=删除订单, url=null, perms=order:delete, icon=null, type=1, orderNum=null, createTime=Sat Dec 05 00:01:25 CST 2020, modifyTime=null)\"', '192.168.43.143', '2020-12-05 00:01:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1315, 'MrBird', '修改角色', 79, 'cn.edu.hit.spat.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Sat Dec 05 00:02:09 CST 2020, menuIds=218,219,220,221,222,223,224,225,226,227,197,203,204,198,199,200,201,228,229,212,213,214,215,205,206,207,210,101,102,103,173,104,105,106,107,108,109,174,110,1,3,11,12,13,160,161,4,15,14,16,162,5,17,18,19,163,6,20,21,22,164,2,8,23,10,170,24,136,171,172,127,128,129,131,175,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169,178)\"', '192.168.43.143', '2020-12-05 00:02:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1316, 'MrBird', '修改菜单/按钮', 17, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=198, parentId=204, menuName=新增订单, url=null, perms=orders:create, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Sat Dec 05 00:11:24 CST 2020)\"', '192.168.43.143', '2020-12-05 00:11:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1317, 'MrBird', '修改菜单/按钮', 10, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=133, parentId=132, menuName=表单组件, url=/others/gwarbms/form, perms=febs:form:view, icon=, type=0, orderNum=1, createTime=null, modifyTime=Sat Dec 05 10:11:00 CST 2020)\"', '192.168.43.143', '2020-12-05 10:11:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1318, 'MrBird', '修改菜单/按钮', 7, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=133, parentId=132, menuName=表单组件, url=/others/gwarbms/form, perms=gwarbms:form:view, icon=, type=0, orderNum=1, createTime=null, modifyTime=Sat Dec 05 10:11:09 CST 2020)\"', '192.168.43.143', '2020-12-05 10:11:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1319, 'MrBird', '修改菜单/按钮', 17, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=159, parentId=132, menuName=其他组件, url=/others/febs/others, perms=others:gwarbms:others, icon=, type=0, orderNum=5, createTime=null, modifyTime=Sat Dec 05 10:12:21 CST 2020)\"', '192.168.43.143', '2020-12-05 10:12:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1320, 'MrBird', '修改菜单/按钮', 17, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=159, parentId=132, menuName=其他组件, url=/others/gwarbms/others, perms=others:gwarbms:others, icon=, type=0, orderNum=5, createTime=null, modifyTime=Sat Dec 05 10:13:09 CST 2020)\"', '192.168.43.143', '2020-12-05 10:13:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1321, 'MrBird', '删除菜单/按钮', 39, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"117,119,120,121,122,123\"', '192.168.43.143', '2020-12-05 10:33:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1322, 'MrBird', '删除菜单/按钮', 14, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"116\"', '192.168.43.143', '2020-12-05 10:33:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1323, 'MrBird', '删除菜单/按钮', 12, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"118\"', '192.168.43.143', '2020-12-05 10:34:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1324, 'MrBird', '删除菜单/按钮', 27, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"133,135,134,159\"', '192.168.43.143', '2020-12-05 10:35:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1325, 'MrBird', '删除菜单/按钮', 26, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"125,167,168,169\"', '192.168.43.143', '2020-12-05 10:36:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1326, 'MrBird', '修改菜单/按钮', 16, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=126, parentId=132, menuName=系统图标, url=/others/icon, perms=gwarbms:icons:view, icon=, type=0, orderNum=4, createTime=null, modifyTime=Sat Dec 05 10:36:49 CST 2020)\"', '192.168.43.143', '2020-12-05 10:36:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1327, 'MrBird', '删除菜单/按钮', 42, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"126\"', '192.168.43.143', '2020-12-05 10:39:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1328, 'MrBird', '删除菜单/按钮', 26, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"132\"', '192.168.43.143', '2020-12-05 10:39:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1329, 'MrBird', '删除菜单/按钮', 25, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"115\"', '192.168.43.143', '2020-12-05 10:40:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1330, 'MrBird', '删除菜单/按钮', 43, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"139,166\"', '192.168.43.143', '2020-12-05 10:56:18', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1331, 'MrBird', '删除菜单/按钮', 18, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"165\"', '192.168.43.143', '2020-12-05 10:56:23', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1332, 'MrBird', '删除菜单/按钮', 16, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"138\"', '192.168.43.143', '2020-12-05 10:56:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1333, 'MrBird', '删除菜单/按钮', 26, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"137\"', '192.168.43.143', '2020-12-05 10:56:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1334, 'MrBird', '删除菜单/按钮', 56, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"178\"', '192.168.43.143', '2020-12-05 11:01:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1335, 'MrBird', '删除菜单/按钮', 19, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"103,104,105,106,107,108,173\"', '192.168.43.143', '2020-12-05 11:09:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1336, 'MrBird', '删除菜单/按钮', 16, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"102\"', '192.168.43.143', '2020-12-05 11:09:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1337, 'MrBird', '删除菜单/按钮', 25, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"110,174\"', '192.168.43.143', '2020-12-05 11:09:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1338, 'MrBird', '删除菜单/按钮', 13, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"109\"', '192.168.43.143', '2020-12-05 11:09:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1339, 'MrBird', '删除菜单/按钮', 24, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"101\"', '192.168.43.143', '2020-12-05 11:09:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1340, 'MrBird', '删除菜单/按钮', 40, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"175\"', '192.168.43.143', '2020-12-05 13:16:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1341, 'MrBird', '删除菜单/按钮', 26, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"129,131\"', '192.168.43.143', '2020-12-05 13:16:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1342, 'MrBird', '删除菜单/按钮', 31, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"128\"', '192.168.43.143', '2020-12-05 13:16:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1343, 'MrBird', '删除菜单/按钮', 23, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"127\"', '192.168.43.143', '2020-12-05 13:16:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1344, 'MrBird', '删除菜单/按钮', 25, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"172,171\"', '192.168.43.143', '2020-12-05 13:17:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1345, 'MrBird', '删除菜单/按钮', 16, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"136\"', '192.168.43.143', '2020-12-05 13:17:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1346, 'MrBird', '删除菜单/按钮', 26, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"170,24\"', '192.168.43.143', '2020-12-05 13:17:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1347, 'MrBird', '删除菜单/按钮', 14, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"10\"', '192.168.43.143', '2020-12-05 13:17:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1348, 'MrBird', '修改菜单/按钮', 19, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=8, parentId=0, menuName=在线用户, url=/monitor/online, perms=online:view, icon=, type=0, orderNum=4, createTime=null, modifyTime=Sat Dec 05 13:18:55 CST 2020)\"', '192.168.43.143', '2020-12-05 13:18:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1349, 'MrBird', '修改菜单/按钮', 17, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=8, parentId=0, menuName=在线用户, url=/monitor/online, perms=online:view, icon=layui-icon-alert, type=0, orderNum=4, createTime=null, modifyTime=Sat Dec 05 13:21:00 CST 2020)\"', '192.168.43.143', '2020-12-05 13:21:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1350, 'MrBird', '删除菜单/按钮', 14, 'cn.edu.hit.spat.system.controller.MenuController.deleteMenus()', ' menuIds: \"2\"', '192.168.43.143', '2020-12-05 13:21:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1351, 'MrBird', '删除用户', 47, 'cn.edu.hit.spat.system.controller.UserController.deleteUsers()', ' userIds: \"5\"', '192.168.43.143', '2020-12-05 14:13:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1352, 'MrBird', '删除用户', 28, 'cn.edu.hit.spat.system.controller.UserController.deleteUsers()', ' userIds: \"7\"', '192.168.43.143', '2020-12-05 14:13:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1353, 'MrBird', '删除用户', 27, 'cn.edu.hit.spat.system.controller.UserController.deleteUsers()', ' userIds: \"4\"', '192.168.43.143', '2020-12-05 14:14:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1354, 'MrBird', '删除用户', 34, 'cn.edu.hit.spat.system.controller.UserController.deleteUsers()', ' userIds: \"3\"', '192.168.43.143', '2020-12-05 14:14:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1355, 'MrBird', '修改用户', 77, 'cn.edu.hit.spat.system.controller.UserController.updateUser()', ' user: \"User(userId=6, username=null, password=null, deptId=1, email=Georgie@qq.com, mobile=17766666666, status=0, createTime=null, modifyTime=Sat Dec 05 14:14:51 CST 2020, lastLoginTime=null, sex=2, avatar=null, theme=null, isTab=null, description=生产执行rm -rf *，账号封禁T T, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=80, roleName=null, deptIds=)\"', '192.168.43.143', '2020-12-05 14:14:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1356, 'MrBird', '修改用户', 21, 'cn.edu.hit.spat.system.controller.UserController.updateUser()', ' user: \"User(userId=2, username=null, password=null, deptId=1, email=scott@gmail.com, mobile=17722222222, status=1, createTime=null, modifyTime=Sat Dec 05 14:15:09 CST 2020, lastLoginTime=null, sex=0, avatar=null, theme=null, isTab=null, description=我是scott。, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=2, roleName=null, deptIds=1,2)\"', '192.168.43.143', '2020-12-05 14:15:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1357, 'MrBird', '删除部门', 26, 'cn.edu.hit.spat.system.controller.DeptController.deleteDepts()', ' deptIds: \"10\"', '192.168.43.143', '2020-12-05 14:16:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1358, 'MrBird', '删除部门', 16, 'cn.edu.hit.spat.system.controller.DeptController.deleteDepts()', ' deptIds: \"2,3,4,5,7,8,9\"', '192.168.43.143', '2020-12-05 14:16:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1359, 'MrBird', '修改用户', 20, 'cn.edu.hit.spat.system.controller.UserController.updateUser()', ' user: \"User(userId=9, username=null, password=null, deptId=6, email=beiyan@qq.com, mobile=15066666666, status=1, createTime=null, modifyTime=Sat Dec 05 14:16:42 CST 2020, lastLoginTime=null, sex=2, avatar=null, theme=null, isTab=null, description=测试管理员账号, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=1, roleName=null, deptIds=)\"', '192.168.43.143', '2020-12-05 14:16:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1360, 'MrBird', '修改用户', 26, 'cn.edu.hit.spat.system.controller.UserController.updateUser()', ' user: \"User(userId=10, username=null, password=null, deptId=null, email=, mobile=, status=1, createTime=null, modifyTime=Sat Dec 05 14:26:00 CST 2020, lastLoginTime=null, sex=2, avatar=null, theme=null, isTab=null, description=注册用户, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=84, roleName=null, deptIds=)\"', '192.168.43.143', '2020-12-05 14:26:01', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1361, 'MrBird', '修改角色', 86, 'cn.edu.hit.spat.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=84, roleName=店主, remark=店主, createTime=null, modifyTime=Sat Dec 05 14:26:57 CST 2020, menuIds=218,219,222,220,221,223,224,225,226,227,197,203,204,229,228,198,199,200,201,212,213,214,215,205,206,207,210,1,3,11,12,13,160,161,8,23)\"', '192.168.43.143', '2020-12-05 14:26:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1362, 'MrBird', '新增用户', 21, 'cn.edu.hit.spat.system.controller.UserController.addUser()', ' user: \"User(userId=11, username=Manager, password=1910ab772c0cd7ba2f5ab5b02b29db05, deptId=null, email=, mobile=, status=1, createTime=Sat Dec 05 14:31:15 CST 2020, modifyTime=null, lastLoginTime=null, sex=2, avatar=default.jpg, theme=black, isTab=1, description=, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=85, roleName=null, deptIds=null)\"', '192.168.43.143', '2020-12-05 14:31:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1363, 'MrBird', '新增用户', 20, 'cn.edu.hit.spat.system.controller.UserController.addUser()', ' user: \"User(userId=12, username=Employee, password=fa08edc78a947e2217e156e06be0d46c, deptId=null, email=, mobile=, status=1, createTime=Sat Dec 05 14:32:13 CST 2020, modifyTime=null, lastLoginTime=null, sex=2, avatar=default.jpg, theme=black, isTab=1, description=, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=86, roleName=null, deptIds=null)\"', '192.168.43.143', '2020-12-05 14:32:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1364, 'MrBird', '修改角色', 36, 'cn.edu.hit.spat.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=85, roleName=经理, remark=经理, createTime=null, modifyTime=Sat Dec 05 14:32:47 CST 2020, menuIds=218,219,222,220,221,223,224,225,226,227,197,203,204,229,228,198,199,200,201,212,213,214,215,205,206,207,210)\"', '192.168.43.143', '2020-12-05 14:32:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1365, 'MrBird', '修改角色', 16, 'cn.edu.hit.spat.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=2, roleName=注册账户, remark=注册账户，拥有查看，新增权限（新增用户除外）和导出Excel权限, createTime=null, modifyTime=Sat Dec 05 14:33:31 CST 2020, menuIds=218,219,223,205,8)\"', '192.168.43.143', '2020-12-05 14:33:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1366, 'MrBird', '修改用户', 27, 'cn.edu.hit.spat.system.controller.UserController.updateUser()', ' user: \"User(userId=6, username=null, password=null, deptId=1, email=Georgie@qq.com, mobile=17766666666, status=0, createTime=null, modifyTime=Sat Dec 05 14:34:03 CST 2020, lastLoginTime=null, sex=2, avatar=null, theme=null, isTab=null, description=生产执行rm -rf *，账号封禁T T, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=2, roleName=null, deptIds=)\"', '192.168.43.143', '2020-12-05 14:34:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1367, 'MrBird', '删除用户', 23, 'cn.edu.hit.spat.system.controller.UserController.deleteUsers()', ' userIds: \"8\"', '192.168.43.143', '2020-12-05 14:34:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1368, 'MrBird', '删除用户', 23, 'cn.edu.hit.spat.system.controller.UserController.deleteUsers()', ' userIds: \"9\"', '192.168.43.143', '2020-12-05 14:34:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1369, 'MrBird', '删除角色', 17, 'cn.edu.hit.spat.system.controller.RoleController.deleteRoles()', ' roleIds: \"79\"', '192.168.43.143', '2020-12-05 14:35:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1370, 'MrBird', '删除角色', 24, 'cn.edu.hit.spat.system.controller.RoleController.deleteRoles()', ' roleIds: \"78\"', '192.168.43.143', '2020-12-05 14:35:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1371, 'MrBird', '删除角色', 12, 'cn.edu.hit.spat.system.controller.RoleController.deleteRoles()', ' roleIds: \"77\"', '192.168.43.143', '2020-12-05 14:35:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1372, 'MrBird', '删除角色', 21, 'cn.edu.hit.spat.system.controller.RoleController.deleteRoles()', ' roleIds: \"80\"', '192.168.43.143', '2020-12-05 14:35:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1373, 'MrBird', '修改角色', 17, 'cn.edu.hit.spat.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=2, roleName=注册账户, remark=注册账户，拥有查看权限, createTime=null, modifyTime=Sat Dec 05 14:36:16 CST 2020, menuIds=218,219,223,205,8)\"', '192.168.43.143', '2020-12-05 14:36:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1374, 'MrBird', '修改销售单', 20, 'cn.edu.hit.spat.system.controller.OrdersController.updateOrders()', ' orders: \"Orders(ordersId=1, customerName=张三, customerPhone=13123989123, goodsId=1, goodsNum=199, ordersprice=1000.0, pricepaid=200.0, ordersperiod=5.0, status=4, createTime=null, ordersaddress=黑龙江省哈尔滨市南岗区哈尔滨工业大学, storehouse=nn, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-12-06 10:00:47', NULL);
INSERT INTO `t_log` VALUES (1375, 'MrBird', '修改菜单/按钮', 17, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=203, parentId=197, menuName=零售订单, url=/system/order, perms=order:retail;order:view, icon=, type=0, orderNum=1, createTime=null, modifyTime=Sun Dec 06 10:01:48 CST 2020)\"', '192.168.137.1', '2020-12-06 10:01:48', NULL);
INSERT INTO `t_log` VALUES (1376, 'MrBird', '新增菜单/按钮', 19, 'cn.edu.hit.spat.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=230, parentId=203, menuName=新增订单, url=null, perms=order:retail, icon=null, type=1, orderNum=null, createTime=Sun Dec 06 10:08:57 CST 2020, modifyTime=null)\"', '192.168.137.1', '2020-12-06 10:08:57', NULL);
INSERT INTO `t_log` VALUES (1377, 'MrBird', '修改角色', 55, 'cn.edu.hit.spat.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Sun Dec 06 10:09:07 CST 2020, menuIds=218,219,220,221,222,223,224,225,226,227,197,203,230,204,228,229,198,199,200,201,212,213,214,215,205,206,207,210,1,3,11,12,13,160,161,4,14,15,16,162,5,17,18,19,163,6,20,21,22,164,8,23)\"', '192.168.137.1', '2020-12-06 10:09:08', NULL);
INSERT INTO `t_log` VALUES (1378, 'MrBird', '修改菜单/按钮', 14, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=203, parentId=197, menuName=零售订单, url=/system/order, perms=order:view, icon=, type=0, orderNum=1, createTime=null, modifyTime=Sun Dec 06 10:10:23 CST 2020)\"', '192.168.137.1', '2020-12-06 10:10:23', NULL);
INSERT INTO `t_log` VALUES (1379, 'MrBird', '新增零售单', 31, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=2, customerName=ss, customerPhone=11111111111, orderPrice=22.0, goodsId=1,1, name=null, createTime=Sun Dec 06 16:56:14 CST 2020, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-12-06 16:56:14', NULL);
INSERT INTO `t_log` VALUES (1380, 'MrBird', '新增零售单', 47, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=3, customerName=ww, customerPhone=11111111111, orderPrice=11.0, goodsId=1, name=[键盘], createTime=Sun Dec 06 18:01:29 CST 2020, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-12-06 18:01:29', NULL);
INSERT INTO `t_log` VALUES (1381, 'MrBird', '新增零售单', 42, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=4, customerName=ss, customerPhone=13629837999, orderPrice=2.0, goodsId=1, name=[键盘], createTime=Sun Dec 06 18:08:09 CST 2020, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-12-06 18:08:10', NULL);
INSERT INTO `t_log` VALUES (1382, 'MrBird', '新增零售单', 50, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=5, customerName=w, customerPhone=13629837931, orderPrice=2.0, goodsId=1, name=[键盘], createTime=Sun Dec 06 18:22:43 CST 2020, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-12-06 18:22:43', NULL);
INSERT INTO `t_log` VALUES (1383, 'MrBird', '新增零售单', 39, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=6, customerName=q, customerPhone=11111111111, orderPrice=1.0, goodsId=1, name=[键盘], createTime=Sun Dec 06 18:32:21 CST 2020, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-12-06 18:32:22', NULL);
INSERT INTO `t_log` VALUES (1384, 'MrBird', '新增零售单', 42, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=7, customerName=w, customerPhone=11111111111, orderPrice=2.0, goodsId=1, name=[键盘], createTime=Sun Dec 06 19:02:12 CST 2020, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-12-06 19:02:12', NULL);
INSERT INTO `t_log` VALUES (1385, 'MrBird', '新货品入库', 23, 'cn.edu.hit.spat.system.controller.RecordController.createRecord()', ' record: \"Record(recordId=1, storageId=1, storageName=门店库房, goodsId=1, goodsName=键盘, number=23)\"', '192.168.137.1', '2020-12-06 21:03:41', NULL);
INSERT INTO `t_log` VALUES (1386, 'MrBird', '新增零售单', 27, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=8, customerName=qw, customerPhone=11111111111, orderPrice=null, goodsId=1, name=[键盘], createTime=Sun Dec 06 21:34:45 CST 2020, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-12-06 21:34:46', NULL);
INSERT INTO `t_log` VALUES (1387, 'MrBird', '新增零售单', 43, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=9, customerName=rrr, customerPhone=11111111111, orderPrice=30.0, goodsId=3, name=[鼠标], createTime=Sun Dec 06 21:45:35 CST 2020, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-12-06 21:45:36', NULL);
INSERT INTO `t_log` VALUES (1388, 'MrBird', '新增零售单', 23, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=10, customerName=qqq, customerPhone=11111111111, orderPrice=60.0, goodsId=3,3, name=[鼠标, 鼠标], createTime=Sun Dec 06 21:46:22 CST 2020, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-12-06 21:46:23', NULL);
INSERT INTO `t_log` VALUES (1389, 'MrBird', '货品出库', 16, 'cn.edu.hit.spat.system.controller.RecordController.outRecord()', ' record: \"Record(recordId=1, storageId=1, storageName=门店库房, goodsId=1, goodsName=键盘, number=21)\"', '192.168.137.1', '2020-12-06 21:55:10', NULL);
INSERT INTO `t_log` VALUES (1390, 'MrBird', '新增零售单', 63, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=11, customerName=eeo, customerPhone=11111111111, orderPrice=800.0, goodsId=1,1, name=[键盘, 键盘], createTime=Sun Dec 06 22:22:29 CST 2020, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-12-06 22:22:30', NULL);
INSERT INTO `t_log` VALUES (1391, 'MrBird', '新增零售单', 25, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=12, customerName=22, customerPhone=11111111111, orderPrice=400.0, goodsId=1, name=[键盘], createTime=Sun Dec 06 22:24:38 CST 2020, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-12-06 22:24:38', NULL);
INSERT INTO `t_log` VALUES (1392, 'MrBird', '新增零售单', 28, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=13, customerName=1, customerPhone=11111111111, orderPrice=400.0, goodsId=1, name=[键盘], createTime=Sun Dec 06 22:25:52 CST 2020, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-12-06 22:25:52', NULL);
INSERT INTO `t_log` VALUES (1393, 'MrBird', '新增零售单', 26, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=14, customerName=ququ, customerPhone=11111111111, orderPrice=400.0, goodsId=1, name=[键盘], createTime=Sun Dec 06 22:31:10 CST 2020, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-12-06 22:31:10', NULL);
INSERT INTO `t_log` VALUES (1394, 'MrBird', '新增零售单', 63, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=15, customerName=ww, customerPhone=19999999999, orderPrice=800.0, goodsId=1,1, name=[键盘, 键盘], createTime=Tue Dec 08 10:34:20 CST 2020, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-12-08 10:34:21', NULL);
INSERT INTO `t_log` VALUES (1395, 'MrBird', '新增零售单', 60, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=16, customerName=q, customerPhone=11111111111, orderPrice=400.0, goodsId=1, name=[键盘], createTime=Tue Dec 08 10:38:16 CST 2020, createTimeFrom=null, createTimeTo=null)\"', '192.168.137.1', '2020-12-08 10:38:16', NULL);
INSERT INTO `t_log` VALUES (1396, 'MrBird', '新增仓库', 31, 'cn.edu.hit.spat.system.controller.StorageController.createStorage()', ' storage: \"Storage(storageId=3, storageName=测试)\"', '192.168.43.143', '2020-12-11 13:34:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1397, 'MrBird', '修改仓库', 22, 'cn.edu.hit.spat.system.controller.StorageController.updateStorage()', ' storage: \"Storage(storageId=3, storageName=测试0)\"', '192.168.43.143', '2020-12-11 13:34:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1398, 'MrBird', '新增货品', 12, 'cn.edu.hit.spat.system.controller.GoodsController.createGoods()', ' goods: \"Goods(goodsId=7, name=手机, purchasePrice=1000.0, wholesalePrice=1200.0, retailPrice=1300.0, detailList=null)\"', '192.168.43.143', '2020-12-11 13:35:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1399, 'MrBird', '添加货品属性', 26, 'cn.edu.hit.spat.system.controller.GoodsController.createGoodsDetail()', ' goodsDetail: GoodsDetail(goodsDetailId=9, goodsId=7, goodsAttribute=颜色, goodsAttributeValue=白)', '192.168.43.143', '2020-12-11 13:35:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1400, 'MrBird', '修改货品属性', 22, 'cn.edu.hit.spat.system.controller.GoodsController.updateGoodsDetail()', ' goodsDetail: GoodsDetail(goodsDetailId=9, goodsId=7, goodsAttribute=颜色, goodsAttributeValue=白色)', '192.168.43.143', '2020-12-11 13:35:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1401, 'MrBird', '新货品入库', 29, 'cn.edu.hit.spat.system.controller.RecordController.createRecord()', ' record: \"Record(recordId=2, storageId=1, storageName=门店库房, goodsId=3, goodsName=鼠标, number=10)\"', '192.168.43.143', '2020-12-11 13:36:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1402, 'MrBird', '已有货品入库', 23, 'cn.edu.hit.spat.system.controller.RecordController.updateRecord()', ' record: \"Record(recordId=2, storageId=1, storageName=门店库房, goodsId=3, goodsName=鼠标, number=20)\"', '192.168.43.143', '2020-12-11 13:36:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1403, 'MrBird', '新增零售单', 45, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=18, customerName=李四, customerPhone=15211112222, orderPrice=430.0, goodsId=1,3, name=[键盘, 鼠标], createTime=Fri Dec 11 13:37:15 CST 2020, createTimeFrom=null, createTimeTo=null)\"', '192.168.43.143', '2020-12-11 13:37:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1404, 'MrBird', '新增菜单/按钮', 13, 'cn.edu.hit.spat.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=231, parentId=204, menuName=订单退货, url=null, perms=orders:return, icon=null, type=1, orderNum=null, createTime=Fri Dec 11 13:50:26 CST 2020, modifyTime=null)\"', '192.168.43.143', '2020-12-11 13:50:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1405, 'MrBird', '新增菜单/按钮', 19, 'cn.edu.hit.spat.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=232, parentId=204, menuName=单期收款, url=null, perms=orders:payone, icon=null, type=1, orderNum=null, createTime=Fri Dec 11 13:50:51 CST 2020, modifyTime=null)\"', '192.168.43.143', '2020-12-11 13:50:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1406, 'MrBird', '修改角色', 85, 'cn.edu.hit.spat.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=84, roleName=店主, remark=店主, createTime=null, modifyTime=Fri Dec 11 14:14:55 CST 2020, menuIds=218,219,220,221,222,223,226,227,224,225,197,203,230,204,228,229,231,232,198,199,200,201,212,213,214,215,205,206,207,210,1,3,11,12,13,160,161,8,23)\"', '192.168.43.143', '2020-12-11 14:14:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1407, 'MrBird', '修改角色', 61, 'cn.edu.hit.spat.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Fri Dec 11 14:15:15 CST 2020, menuIds=218,219,220,221,222,223,226,227,224,225,197,203,230,204,228,229,231,232,198,199,200,201,212,213,214,215,205,206,207,210,1,3,11,12,13,160,161,4,14,15,16,162,5,17,18,19,163,6,20,21,22,164,8,23)\"', '192.168.43.143', '2020-12-11 14:15:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1408, 'MrBird', '新增货品', 30, 'cn.edu.hit.spat.system.controller.GoodsController.createGoods()', ' goods: \"Goods(goodsId=8, name=123, purchasePrice=123.0, wholesalePrice=123.0, retailPrice=123.0, detailList=null)\"', '192.168.43.143', '2020-12-11 16:27:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1409, 'MrBird', '新增货品', 24, 'cn.edu.hit.spat.system.controller.GoodsController.createGoods()', ' goods: \"Goods(goodsId=9, name=111, purchasePrice=1.0, wholesalePrice=2.0, retailPrice=3.0, detailList=null)\"', '192.168.43.143', '2020-12-11 16:30:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1410, 'MrBird', '删除货品', 34, 'cn.edu.hit.spat.system.controller.GoodsController.deleteGoods()', ' goodsIds: \"9\"', '192.168.43.143', '2020-12-11 16:30:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1411, 'MrBird', '新增订单', 42, 'cn.edu.hit.spat.system.controller.OrdersController.createOrders()', ' orders: \"Orders(ordersId=12, customerName=李四, customerPhone=15011112222, goodsId=1, goodsNum=1, goodsName=键盘, ordersprice=300.0, ordersprofile=90.0, pricepaid=0.0, ordersperiod=1.0, status=0, createTime=Sun Dec 13 14:15:44 CST 2020, ordersaddress=黑龙江, storehouse=大库, createTimeFrom=null, createTimeTo=null)\"', '172.20.42.2', '2020-12-13 14:15:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1412, 'MrBird', '提交订单', 17, 'cn.edu.hit.spat.system.controller.OrdersController.archiveOrders()', ' ordersIds: \"12\"', '172.20.42.2', '2020-12-13 14:16:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1413, 'MrBird', '修改角色', 39, 'cn.edu.hit.spat.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=86, roleName=店员, remark=店员, createTime=null, modifyTime=Sun Dec 13 14:23:45 CST 2020, menuIds=197,203,230,204,198,212,213,214)\"', '172.20.42.2', '2020-12-13 14:23:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1414, 'MrBird', '修改角色', 52, 'cn.edu.hit.spat.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=85, roleName=经理, remark=经理, createTime=null, modifyTime=Sun Dec 13 14:24:05 CST 2020, menuIds=218,219,220,221,222,223,226,227,224,225,197,203,230,204,228,229,231,232,198,199,200,201,212,213,214,215,205,206,207,210)\"', '172.20.42.2', '2020-12-13 14:24:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1415, 'Master', '新增仓库', 20, 'cn.edu.hit.spat.system.controller.StorageController.createStorage()', ' storage: \"Storage(storageId=4, storageName=test)\"', '172.20.42.2', '2020-12-13 14:37:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1416, 'Master', '删除仓库', 32, 'cn.edu.hit.spat.system.controller.StorageController.deleteStorages()', ' storageIds: \"3\"', '172.20.42.2', '2020-12-13 14:37:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1417, 'Master', '新货品入库', 27, 'cn.edu.hit.spat.system.controller.RecordController.createRecord()', ' record: \"Record(recordId=3, storageId=2, storageName=大库, goodsId=1, goodsName=键盘, number=100)\"', '172.20.42.2', '2020-12-13 14:39:18', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1418, 'Master', '已有货品入库', 23, 'cn.edu.hit.spat.system.controller.RecordController.updateRecord()', ' record: \"Record(recordId=3, storageId=2, storageName=大库, goodsId=1, goodsName=键盘, number=110)\"', '172.20.42.2', '2020-12-13 14:39:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1419, 'Master', '已有货品入库', 23, 'cn.edu.hit.spat.system.controller.RecordController.updateRecord()', ' record: \"Record(recordId=3, storageId=2, storageName=大库, goodsId=1, goodsName=键盘, number=120)\"', '172.20.42.2', '2020-12-13 14:40:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1420, 'Master', '货品出库', 21, 'cn.edu.hit.spat.system.controller.RecordController.outRecord()', ' record: \"Record(recordId=3, storageId=2, storageName=大库, goodsId=1, goodsName=键盘, number=110)\"', '172.20.42.2', '2020-12-13 14:41:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1421, 'Master', '货品转移', 36, 'cn.edu.hit.spat.system.controller.RecordController.transRecord()', ' storageTrans: StorageTrans(goodsId=1, goodsName=键盘, sourceStorageName=大库, desStorageName=门店库房, number=10)', '172.20.42.2', '2020-12-13 14:41:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1422, 'Master', '新增订单', 14, 'cn.edu.hit.spat.system.controller.OrdersController.createOrders()', ' orders: \"Orders(ordersId=13, customerName=ss, customerPhone=15011112222, goodsId=1, goodsNum=10, goodsName=键盘, ordersprice=3000.0, ordersprofile=900.0, pricepaid=0.0, ordersperiod=1.0, status=0, createTime=Sun Dec 13 15:03:34 CST 2020, ordersaddress=hwsdfs, storehouse=大库, createTimeFrom=null, createTimeTo=null)\"', '172.20.42.2', '2020-12-13 15:03:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1423, 'Master', '提交订单', 10, 'cn.edu.hit.spat.system.controller.OrdersController.archiveOrders()', ' ordersIds: \"13\"', '172.20.42.2', '2020-12-13 15:10:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1424, 'Master', '审核订单', 19, 'cn.edu.hit.spat.system.controller.OrdersController.auditOrders()', ' ordersIds: \"13\"', '172.20.42.2', '2020-12-13 15:10:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1425, 'Master', '分期付款', 20, 'cn.edu.hit.spat.system.controller.OrdersController.payoneOrders()', ' ordersId: \"13\"', '172.20.42.2', '2020-12-13 15:10:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1426, 'Master', '收款完毕', 20, 'cn.edu.hit.spat.system.controller.OrdersController.payOrders()', ' ordersIds: \"13\"', '172.20.42.2', '2020-12-13 15:10:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1427, 'Master', '新增货品', 25, 'cn.edu.hit.spat.system.controller.GoodsController.createGoods()', ' goods: \"Goods(goodsId=10, name=test, purchasePrice=10.0, wholesalePrice=20.0, retailPrice=30.0, detailList=null)\"', '172.20.42.2', '2020-12-13 15:11:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1428, 'Master', '添加货品属性', 21, 'cn.edu.hit.spat.system.controller.GoodsController.createGoodsDetail()', ' goodsDetail: GoodsDetail(goodsDetailId=10, goodsId=10, goodsAttribute=颜色, goodsAttributeValue=白色)', '172.20.42.2', '2020-12-13 15:11:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1429, 'Master', '修改货品属性', 17, 'cn.edu.hit.spat.system.controller.GoodsController.updateGoodsDetail()', ' goodsDetail: GoodsDetail(goodsDetailId=10, goodsId=10, goodsAttribute=颜色, goodsAttributeValue=白)', '172.20.42.2', '2020-12-13 15:12:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1430, 'MrBird', '会员充值', 11, 'cn.edu.hit.spat.system.controller.CustomerController.chargeCustomer()', ' customer: \"Customer(customerId=3, name=王五, gender=女, phone=15433334444, type=null, vip=null, points=null, balance=100)\"', '192.168.1.6', '2021-01-11 21:48:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1431, 'MrBird', '会员充值', 31, 'cn.edu.hit.spat.system.controller.CustomerController.chargeCustomer()', ' customer: \"Customer(customerId=3, name=王五, gender=女, phone=15433334444, type=null, vip=null, points=null, balance=100)\"', '192.168.1.6', '2021-01-11 21:50:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1432, 'MrBird', '会员积分兑换', 20, 'cn.edu.hit.spat.system.controller.CustomerController.exchangeCustomer()', ' customer: \"Customer(customerId=4, name=六, gender=男, phone=11111111111, type=null, vip=null, points=1000, balance=10)\"', '192.168.1.6', '2021-01-11 21:51:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1433, 'MrBird', '新增菜单/按钮', 30, 'cn.edu.hit.spat.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=233, parentId=212, menuName=设定积分规则, url=null, perms=customer:pointsRule, icon=null, type=1, orderNum=null, createTime=Mon Jan 11 23:05:58 CST 2021, modifyTime=null)\"', '192.168.1.6', '2021-01-11 23:05:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1434, 'MrBird', '修改角色', 70, 'cn.edu.hit.spat.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Mon Jan 11 23:06:12 CST 2021, menuIds=218,219,220,221,222,223,227,224,225,226,197,203,230,204,228,229,231,232,198,199,200,201,212,233,213,214,215,205,206,207,210,1,3,11,12,13,160,161,4,14,15,16,162,5,17,18,19,163,6,20,21,22,164,8,23)\"', '192.168.1.6', '2021-01-11 23:06:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1435, 'MrBird', '修改客户', 28, 'cn.edu.hit.spat.system.controller.CustomerController.updateCustomer()', ' customer: \"Customer(customerId=2, name=李四, gender=女, phone=15211112222, type=零售客户, vip=null, points=null, balance=null)\"', '192.168.1.6', '2021-01-11 23:28:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1436, 'MrBird', '修改客户', 22, 'cn.edu.hit.spat.system.controller.CustomerController.updateCustomer()', ' customer: \"Customer(customerId=2, name=李四, gender=男, phone=15211112222, type=零售客户, vip=null, points=null, balance=null)\"', '192.168.1.6', '2021-01-11 23:28:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1437, 'MrBird', '设定积分规则', 20, 'cn.edu.hit.spat.system.controller.CustomerController.updatePointsRule()', ' pointsRule: \"PointsRule(pointsRuleId=1, toPoints=1.0, toBalance=100.0)\"', '192.168.1.6', '2021-01-11 23:28:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1438, 'MrBird', '修改客户', 16, 'cn.edu.hit.spat.system.controller.CustomerController.updateCustomer()', ' customer: \"Customer(customerId=2, name=李四, gender=男, phone=15211112222, type=零售客户, vip=1, points=null, balance=null)\"', '192.168.1.6', '2021-01-13 09:32:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1439, 'MrBird', '修改客户', 18, 'cn.edu.hit.spat.system.controller.CustomerController.updateCustomer()', ' customer: \"Customer(customerId=2, name=李四, gender=男, phone=15211112222, type=零售客户, vip=0, points=null, balance=null)\"', '192.168.1.6', '2021-01-13 09:32:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1440, 'MrBird', '修改客户', 18, 'cn.edu.hit.spat.system.controller.CustomerController.updateCustomer()', ' customer: \"Customer(customerId=3, name=王五, gender=女, phone=15433334444, type=批发客户, vip=0, points=null, balance=null)\"', '192.168.1.6', '2021-01-13 09:32:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1441, 'MrBird', '修改客户', 26, 'cn.edu.hit.spat.system.controller.CustomerController.updateCustomer()', ' customer: \"Customer(customerId=3, name=王五, gender=女, phone=15433334444, type=批发客户, vip=1, points=null, balance=null)\"', '192.168.1.6', '2021-01-13 09:33:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1442, 'MrBird', '新增零售单', 8, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=null, customerName=, customerPhone=, orderPrice=null, retailGoodsList=null, createTime=null, createTimeFrom=null, createTimeTo=null)\" retailGoods: null', '192.168.1.6', '2021-01-13 17:48:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1443, 'MrBird', '新增零售单', 1, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=null, customerName=, customerPhone=, orderPrice=null, retailGoodsList=null, createTime=null, createTimeFrom=null, createTimeTo=null)\" retailGoods: null', '192.168.1.6', '2021-01-13 17:48:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1444, 'MrBird', '新增零售单', 1, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=null, customerName=, customerPhone=, orderPrice=null, retailGoodsList=null, createTime=null, createTimeFrom=null, createTimeTo=null)\" retailGoods: null', '192.168.1.6', '2021-01-13 17:48:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1445, 'MrBird', '新增零售单', 1, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=null, customerName=, customerPhone=, orderPrice=null, retailGoodsList=null, createTime=null, createTimeFrom=null, createTimeTo=null)\" retailGoods: null', '192.168.1.6', '2021-01-13 17:48:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1446, 'MrBird', '新增零售单', 0, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=null, customerName=, customerPhone=, orderPrice=null, retailGoodsList=null, createTime=null, createTimeFrom=null, createTimeTo=null)\" retailGoods: null', '192.168.1.6', '2021-01-13 17:48:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1447, 'MrBird', '新增零售单', 0, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=null, customerName=, customerPhone=, orderPrice=null, retailGoodsList=null, createTime=null, createTimeFrom=null, createTimeTo=null)\" retailGoods: null', '192.168.1.6', '2021-01-13 17:48:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1448, 'MrBird', '新增零售单', 1, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=null, customerName=, customerPhone=, orderPrice=null, retailGoodsList=null, createTime=null, createTimeFrom=null, createTimeTo=null)\" retailGoods: null', '192.168.1.6', '2021-01-13 17:48:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1449, 'MrBird', '新增零售单', 0, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=null, customerName=, customerPhone=, orderPrice=null, retailGoodsList=null, createTime=null, createTimeFrom=null, createTimeTo=null)\" retailGoods: null', '192.168.1.6', '2021-01-13 17:48:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1450, 'MrBird', '新增零售单', 1, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=null, customerName=, customerPhone=, orderPrice=null, retailGoodsList=null, createTime=null, createTimeFrom=null, createTimeTo=null)\" retailGoods: null', '192.168.1.6', '2021-01-13 17:48:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1451, 'MrBird', '新增零售单', 1, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=null, customerName=, customerPhone=, orderPrice=null, retailGoodsList=null, createTime=null, createTimeFrom=null, createTimeTo=null)\" retailGoods: null', '192.168.1.6', '2021-01-13 17:48:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1452, 'MrBird', '新增零售单', 0, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=null, customerName=, customerPhone=, orderPrice=null, retailGoodsList=null, createTime=null, createTimeFrom=null, createTimeTo=null)\" retailGoods: null', '192.168.1.6', '2021-01-13 17:48:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1453, 'MrBird', '新增零售单', 0, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=null, customerName=, customerPhone=, orderPrice=null, retailGoodsList=null, createTime=null, createTimeFrom=null, createTimeTo=null)\" retailGoods: null', '192.168.1.6', '2021-01-13 17:48:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1454, 'MrBird', '新增零售单', 1, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=null, customerName=, customerPhone=, orderPrice=null, retailGoodsList=null, createTime=null, createTimeFrom=null, createTimeTo=null)\" retailGoods: null', '192.168.1.6', '2021-01-13 17:48:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1455, 'MrBird', '新增零售单', 0, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=null, customerName=, customerPhone=, orderPrice=null, retailGoodsList=null, createTime=null, createTimeFrom=null, createTimeTo=null)\" retailGoods: null', '192.168.1.6', '2021-01-13 17:48:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1456, 'MrBird', '新增零售单', 1, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=null, customerName=, customerPhone=, orderPrice=null, retailGoodsList=null, createTime=null, createTimeFrom=null, createTimeTo=null)\" retailGoods: null', '192.168.1.6', '2021-01-13 17:48:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1457, 'MrBird', '新增零售单', 1, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=null, customerName=null, customerPhone=null, orderPrice=null, retailGoodsList=null, createTime=null, createTimeFrom=null, createTimeTo=null)\" retailGoods: null', '192.168.1.6', '2021-01-13 17:52:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1458, 'MrBird', '新增零售单', 7, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=null, customerName=null, customerPhone=null, orderPrice=null, retailGoodsList=null, createTime=null, createTimeFrom=null, createTimeTo=null)\" retailGoods: null', '192.168.1.6', '2021-01-13 17:54:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1459, 'MrBird', '新增零售单', 1, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=null, customerName=null, customerPhone=null, orderPrice=null, retailGoodsList=null, createTime=null, createTimeFrom=null, createTimeTo=null)\" retailGoods: null', '192.168.1.6', '2021-01-13 17:55:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1460, 'MrBird', '新增零售单', 1, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=null, customerName=null, customerPhone=null, orderPrice=null, retailGoodsList=null, createTime=null, createTimeFrom=null, createTimeTo=null)\" retailGoods: null', '192.168.1.6', '2021-01-13 17:56:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1461, 'MrBird', '新增零售单', 2, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=null, customerName=null, customerPhone=null, orderPrice=null, retailGoodsList=null, createTime=null, createTimeFrom=null, createTimeTo=null)\" retailGoods: null', '192.168.1.6', '2021-01-13 17:57:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1462, 'MrBird', '新增零售单', 13, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=null, customerName=null, customerPhone=null, orderPrice=null, retailGoodsList=null, createTime=null, createTimeFrom=null, createTimeTo=null)\"', '192.168.1.6', '2021-01-13 18:08:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1463, 'MrBird', '新增零售单', 1, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: \"Order(orderId=null, customerName=null, customerPhone=null, orderPrice=null, retailGoodsList=null, createTime=null, createTimeFrom=null, createTimeTo=null)\"', '192.168.1.6', '2021-01-13 18:09:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1464, 'MrBird', '新增零售单', 8, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: null', '192.168.1.6', '2021-01-13 18:40:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1465, 'MrBird', '新增零售单', 0, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' order: null', '192.168.1.6', '2021-01-13 18:41:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1466, 'MrBird', '新增零售单', 6, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' message: null', '192.168.1.6', '2021-01-13 18:46:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1467, 'MrBird', '新增零售单', 34, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' message: \",\"', '192.168.1.6', '2021-01-13 18:54:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1468, 'MrBird', '新增零售单', 9, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' message: \",\"', '192.168.1.6', '2021-01-13 18:54:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1469, 'MrBird', '新增零售单', 1, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' message: \",\"', '192.168.1.6', '2021-01-13 18:54:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1470, 'MrBird', '新增零售单', 5, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' message: \",\"', '192.168.1.6', '2021-01-13 18:57:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1471, 'MrBird', '新增零售单', 6, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' message: \",\"', '192.168.1.6', '2021-01-13 18:58:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1472, 'MrBird', '删除订单', 4, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' message: \",\"', '192.168.1.6', '2021-01-13 19:01:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1473, 'MrBird', '新增零售单', 10, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' message: null', '192.168.1.6', '2021-01-13 19:07:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1474, 'MrBird', '新增零售单', 10, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' message: \",;1,1,售,1.0,键盘,400;\"', '192.168.1.6', '2021-01-13 19:24:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1475, 'MrBird', '新增零售单', 52, 'cn.edu.hit.spat.system.controller.OrderController.addOrder()', ' customerName: \"\" customerPhone: \"\" message: \";1,1,售,1.0,键盘,400\"', '192.168.1.6', '2021-01-13 19:54:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1476, 'MrBird', '新增菜单/按钮', 24, 'cn.edu.hit.spat.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=234, parentId=0, menuName=统计查询, url=, perms=, icon=layui-icon-linechart, type=0, orderNum=5, createTime=Wed Jan 13 20:59:41 CST 2021, modifyTime=null)\"', '192.168.1.6', '2021-01-13 20:59:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1477, 'MrBird', '修改菜单/按钮', 10, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=234, parentId=0, menuName=统计查询, url=, perms=, icon=layui-icon-linechart, type=0, orderNum=2, createTime=null, modifyTime=Wed Jan 13 21:00:08 CST 2021)\"', '192.168.1.6', '2021-01-13 21:00:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1478, 'MrBird', '新增菜单/按钮', 9, 'cn.edu.hit.spat.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=235, parentId=234, menuName=客户结款统计, url=/system/pay, perms=pay:view, icon=, type=0, orderNum=null, createTime=Wed Jan 13 21:00:47 CST 2021, modifyTime=null)\"', '192.168.1.6', '2021-01-13 21:00:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1479, 'MrBird', '修改菜单/按钮', 22, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=234, parentId=0, menuName=统计查询, url=, perms=, icon=layui-icon-linechart, type=0, orderNum=3, createTime=null, modifyTime=Wed Jan 13 21:00:59 CST 2021)\"', '192.168.1.6', '2021-01-13 21:00:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1480, 'MrBird', '新增菜单/按钮', 19, 'cn.edu.hit.spat.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=236, parentId=234, menuName=库存统计, url=lsystem/inventory, perms=inventory:view, icon=, type=0, orderNum=null, createTime=Wed Jan 13 21:01:40 CST 2021, modifyTime=null)\"', '192.168.1.6', '2021-01-13 21:01:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1481, 'MrBird', '新增菜单/按钮', 9, 'cn.edu.hit.spat.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=237, parentId=234, menuName=销售统计, url=lsystem/sale, perms=sale:view, icon=, type=0, orderNum=null, createTime=Wed Jan 13 21:02:06 CST 2021, modifyTime=null)\"', '192.168.1.6', '2021-01-13 21:02:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1482, 'MrBird', '修改角色', 69, 'cn.edu.hit.spat.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Wed Jan 13 21:02:20 CST 2021, menuIds=218,219,220,221,222,223,224,225,226,227,197,203,230,204,229,231,232,198,199,200,201,228,212,233,213,214,215,205,206,207,210,1,3,12,11,13,160,161,4,14,15,16,162,5,19,17,18,163,6,20,21,22,164,234,237,235,236,8,23)\"', '192.168.1.6', '2021-01-13 21:02:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1483, 'MrBird', '修改角色', 40, 'cn.edu.hit.spat.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=85, roleName=经理, remark=经理, createTime=null, modifyTime=Wed Jan 13 21:02:28 CST 2021, menuIds=218,219,220,221,222,223,224,225,226,227,197,203,230,204,229,231,232,198,199,200,201,228,212,213,214,215,205,206,207,210,234,237,235,236)\"', '192.168.1.6', '2021-01-13 21:02:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1484, 'MrBird', '修改角色', 48, 'cn.edu.hit.spat.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=84, roleName=店主, remark=店主, createTime=null, modifyTime=Wed Jan 13 21:02:33 CST 2021, menuIds=218,219,220,221,222,223,224,225,226,227,197,203,230,204,229,231,232,198,199,200,201,228,212,213,214,215,205,206,207,210,1,3,12,11,13,160,161,234,237,235,236,8,23)\"', '192.168.1.6', '2021-01-13 21:02:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1485, 'MrBird', '修改菜单/按钮', 9, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=237, parentId=234, menuName=销售统计, url=/system/sale, perms=sale:view, icon=, type=0, orderNum=null, createTime=null, modifyTime=Wed Jan 13 21:03:05 CST 2021)\"', '192.168.1.6', '2021-01-13 21:03:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1486, 'MrBird', '修改菜单/按钮', 9, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=236, parentId=234, menuName=库存统计, url=/system/inventory, perms=inventory:view, icon=, type=0, orderNum=null, createTime=null, modifyTime=Wed Jan 13 21:03:16 CST 2021)\"', '192.168.1.6', '2021-01-13 21:03:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1487, 'MrBird', '修改菜单/按钮', 9, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=1, parentId=0, menuName=系统管理, url=, perms=, icon=layui-icon-setting, type=0, orderNum=4, createTime=null, modifyTime=Wed Jan 13 21:04:12 CST 2021)\"', '192.168.1.6', '2021-01-13 21:04:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (1488, 'MrBird', '修改菜单/按钮', 32, 'cn.edu.hit.spat.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=198, parentId=204, menuName=新增订单, url=null, perms=customer:create , icon=null, type=1, orderNum=null, createTime=null, modifyTime=Wed Jan 13 21:25:01 CST 2021)\"', '192.168.1.6', '2021-01-13 21:25:01', '内网IP|0|0|内网IP|内网IP');

-- ----------------------------
-- Table structure for t_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_login_log`;
CREATE TABLE `t_login_log`  (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `USERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `LOGIN_TIME` datetime NOT NULL COMMENT '登录时间',
  `LOCATION` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录地点',
  `IP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `SYSTEM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作系统',
  `BROWSER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '浏览器',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `t_login_log_login_time`(`LOGIN_TIME`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 353 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '登录日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_login_log
-- ----------------------------
INSERT INTO `t_login_log` VALUES (70, 'mrbird', '2020-07-21 15:33:05', '内网IP|0|0|内网IP|内网IP', '192.168.160.1', 'Windows 10', 'Chrome 83');
INSERT INTO `t_login_log` VALUES (71, 'mrbird', '2020-07-21 15:45:15', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 83');
INSERT INTO `t_login_log` VALUES (72, 'mrbird', '2020-07-21 15:53:37', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 83');
INSERT INTO `t_login_log` VALUES (73, 'mrbird', '2020-07-26 17:25:35', '内网IP|0|0|内网IP|内网IP', '192.168.137.1', 'Windows 10', 'Chrome 83');
INSERT INTO `t_login_log` VALUES (74, 'zhangsan', '2020-07-26 18:25:28', '内网IP|0|0|内网IP|内网IP', '192.168.137.1', 'Windows 10', 'Chrome 83');
INSERT INTO `t_login_log` VALUES (75, 'mrbird', '2020-07-26 18:25:49', '内网IP|0|0|内网IP|内网IP', '192.168.137.1', 'Windows 10', 'Chrome 83');
INSERT INTO `t_login_log` VALUES (76, 'zhangsan', '2020-07-26 18:26:20', '内网IP|0|0|内网IP|内网IP', '192.168.137.1', 'Windows 10', 'Chrome 83');
INSERT INTO `t_login_log` VALUES (77, 'mrbird', '2020-07-26 18:27:43', '内网IP|0|0|内网IP|内网IP', '192.168.137.1', 'Windows 10', 'Chrome 83');
INSERT INTO `t_login_log` VALUES (78, 'mrbird', '2020-07-27 11:51:34', '内网IP|0|0|内网IP|内网IP', '192.168.137.1', 'Windows 10', 'Chrome 83');
INSERT INTO `t_login_log` VALUES (79, 'mrbird', '2020-07-27 14:17:14', '内网IP|0|0|内网IP|内网IP', '192.168.137.1', 'Windows 10', 'Chrome 83');
INSERT INTO `t_login_log` VALUES (80, 'mrbird', '2020-07-27 22:11:19', '内网IP|0|0|内网IP|内网IP', '192.168.137.1', 'Windows 10', 'Chrome 83');
INSERT INTO `t_login_log` VALUES (81, 'mrbird', '2020-07-28 09:08:05', '内网IP|0|0|内网IP|内网IP', '192.168.137.1', 'Windows 10', 'Chrome 83');
INSERT INTO `t_login_log` VALUES (82, 'mrbird', '2020-07-28 14:01:08', '内网IP|0|0|内网IP|内网IP', '192.168.137.1', 'Windows 10', 'Chrome 83');
INSERT INTO `t_login_log` VALUES (83, 'mrbird', '2020-07-28 14:22:32', '内网IP|0|0|内网IP|内网IP', '192.168.137.1', 'Windows 10', 'Chrome 83');
INSERT INTO `t_login_log` VALUES (84, 'zhangsan', '2020-07-28 16:15:17', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 83');
INSERT INTO `t_login_log` VALUES (85, 'mrbird', '2020-07-28 18:36:43', '内网IP|0|0|内网IP|内网IP', '192.168.137.1', 'Windows 10', 'Chrome 83');
INSERT INTO `t_login_log` VALUES (86, 'mrbird', '2020-07-28 19:18:17', '内网IP|0|0|内网IP|内网IP', '192.168.137.1', 'Windows 10', 'Chrome 83');
INSERT INTO `t_login_log` VALUES (87, 'mrbird', '2020-07-28 19:18:52', '内网IP|0|0|内网IP|内网IP', '192.168.137.1', 'Windows 10', 'Chrome 83');
INSERT INTO `t_login_log` VALUES (88, 'mrbird', '2020-07-28 21:44:54', '内网IP|0|0|内网IP|内网IP', '192.168.137.1', 'Windows 10', 'Chrome 84');
INSERT INTO `t_login_log` VALUES (89, 'mrbird', '2020-07-29 09:40:03', '内网IP|0|0|内网IP|内网IP', '192.168.137.1', 'Windows 10', 'Chrome 84');
INSERT INTO `t_login_log` VALUES (90, 'beiyan', '2020-07-29 09:46:13', '中国|华北|山西省|晋中市|联通', '60.223.188.27', 'Linux', 'Chrome 77');
INSERT INTO `t_login_log` VALUES (91, 'beiyan', '2020-07-29 09:59:44', '中国|华东|浙江省|杭州市|移动', '117.148.171.72', 'Linux', 'Chrome 77');
INSERT INTO `t_login_log` VALUES (92, 'beiyan', '2020-07-29 10:01:09', '内网IP|0|0|内网IP|内网IP', '183.236.67.139, 14.116.144.205', 'Linux', 'Chrome 57');
INSERT INTO `t_login_log` VALUES (93, 'beiyan', '2020-07-29 10:03:49', '中国|华北|山西省|晋中市|联通', '60.223.132.110', 'Linux', 'Chrome 78');
INSERT INTO `t_login_log` VALUES (94, 'mrbird', '2020-07-29 20:09:26', '内网IP|0|0|内网IP|内网IP', '192.168.137.1', 'Windows 10', 'Chrome 84');
INSERT INTO `t_login_log` VALUES (95, 'mrbird', '2020-07-29 22:36:49', '内网IP|0|0|内网IP|内网IP', '192.168.137.1', 'Windows 10', 'Chrome 84');
INSERT INTO `t_login_log` VALUES (96, 'mrbird', '2020-07-30 08:56:44', '内网IP|0|0|内网IP|内网IP', '192.168.137.1', 'Windows 10', 'Chrome 84');
INSERT INTO `t_login_log` VALUES (97, 'zhangsan', '2020-07-30 11:40:36', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 84');
INSERT INTO `t_login_log` VALUES (98, 'zhangsan', '2020-07-30 13:19:52', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 84');
INSERT INTO `t_login_log` VALUES (99, 'mrbird', '2020-07-30 13:45:46', '内网IP|0|0|内网IP|内网IP', '192.168.137.1', 'Windows 10', 'Chrome 84');
INSERT INTO `t_login_log` VALUES (100, 'mrbird', '2020-07-30 15:35:45', '中国|华东|福建省|泉州市|移动', '112.47.211.43', 'Windows 10', 'Chrome 84');
INSERT INTO `t_login_log` VALUES (101, 'mrbird', '2020-07-30 16:00:07', '内网IP|0|0|内网IP|内网IP', '192.168.137.1', 'Windows 10', 'Chrome 84');
INSERT INTO `t_login_log` VALUES (102, 'mrbird', '2020-07-30 18:54:27', '内网IP|0|0|内网IP|内网IP', '192.168.137.1', 'Windows 10', 'Chrome 84');
INSERT INTO `t_login_log` VALUES (103, 'mrbird', '2020-07-30 22:53:23', '内网IP|0|0|内网IP|内网IP', '192.168.137.1', 'Windows 10', 'Chrome 84');
INSERT INTO `t_login_log` VALUES (104, 'mrbird', '2020-07-31 09:50:39', '内网IP|0|0|内网IP|内网IP', '192.168.137.1', 'Windows 10', 'Chrome 84');
INSERT INTO `t_login_log` VALUES (105, 'zhangsan', '2020-07-31 11:50:32', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 84');
INSERT INTO `t_login_log` VALUES (106, 'mrbird', '2020-07-31 13:26:55', '内网IP|0|0|内网IP|内网IP', '192.168.137.1', 'Windows 10', 'Chrome 84');
INSERT INTO `t_login_log` VALUES (107, 'zhangsan', '2020-07-31 13:30:25', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 84');
INSERT INTO `t_login_log` VALUES (108, 'mrbird', '2020-11-25 22:56:32', NULL, '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (109, 'mrbird', '2020-11-25 23:11:05', NULL, '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (110, 'mrbird', '2020-11-25 23:39:56', NULL, '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (111, 'mrbird', '2020-11-26 08:43:54', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (112, 'mrbird', '2020-11-26 08:54:19', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (113, 'mrbird', '2020-11-26 09:19:48', '内网IP|0|0|内网IP|内网IP', '172.20.88.167', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (114, 'mrbird', '2020-11-26 09:32:33', '内网IP|0|0|内网IP|内网IP', '172.20.88.167', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (115, 'mrbird', '2020-11-26 09:36:36', '内网IP|0|0|内网IP|内网IP', '172.20.88.167', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (116, 'mrbird', '2020-11-26 09:55:02', '内网IP|0|0|内网IP|内网IP', '172.20.88.167', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (117, 'mrbird', '2020-11-26 09:57:35', '内网IP|0|0|内网IP|内网IP', '172.20.88.167', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (118, 'mrbird', '2020-11-26 10:01:39', '内网IP|0|0|内网IP|内网IP', '172.20.88.167', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (119, 'mrbird', '2020-11-26 10:03:50', '内网IP|0|0|内网IP|内网IP', '172.20.88.167', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (120, 'mrbird', '2020-11-26 10:05:03', '内网IP|0|0|内网IP|内网IP', '172.20.88.167', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (121, 'mrbird', '2020-11-26 10:22:46', '内网IP|0|0|内网IP|内网IP', '172.20.88.167', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (122, 'mrbird', '2020-11-26 10:27:12', '内网IP|0|0|内网IP|内网IP', '172.20.88.167', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (123, 'mrbird', '2020-11-26 10:53:32', '内网IP|0|0|内网IP|内网IP', '172.20.88.167', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (124, 'mrbird', '2020-11-26 11:02:56', '内网IP|0|0|内网IP|内网IP', '172.20.88.167', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (125, 'mrbird', '2020-11-26 12:09:23', '内网IP|0|0|内网IP|内网IP', '172.20.88.167', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (126, 'mrbird', '2020-11-27 10:49:46', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (127, 'mrbird', '2020-11-27 10:54:50', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (128, 'mrbird', '2020-11-27 10:55:55', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (129, 'mrbird', '2020-11-27 14:09:20', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (130, 'mrbird', '2020-11-27 14:11:03', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (131, 'mrbird', '2020-11-27 14:17:29', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (132, 'mrbird', '2020-11-27 14:24:22', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (133, 'mrbird', '2020-11-27 14:34:53', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (134, 'mrbird', '2020-11-27 14:36:34', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (135, 'mrbird', '2020-11-27 14:45:08', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (136, 'mrbird', '2020-11-27 14:46:56', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (137, 'mrbird', '2020-11-27 14:57:25', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (138, 'mrbird', '2020-11-27 15:05:56', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (139, 'mrbird', '2020-11-27 15:08:28', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (140, 'mrbird', '2020-11-27 15:16:33', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (141, 'mrbird', '2020-11-27 15:22:17', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (142, 'mrbird', '2020-11-27 15:28:52', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (143, 'mrbird', '2020-11-27 15:31:35', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (144, 'mrbird', '2020-11-27 15:33:32', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (145, 'mrbird', '2020-11-27 15:40:46', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (146, 'mrbird', '2020-11-27 15:44:25', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (147, 'mrbird', '2020-11-27 15:58:35', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (148, 'mrbird', '2020-11-27 16:00:56', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (149, 'mrbird', '2020-11-27 16:05:17', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (150, 'mrbird', '2020-11-27 16:06:06', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (151, 'mrbird', '2020-11-27 16:07:17', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (152, 'mrbird', '2020-11-27 16:36:37', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (153, 'mrbird', '2020-11-27 16:47:13', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (154, 'mrbird', '2020-11-27 16:54:11', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (155, 'mrbird', '2020-11-27 17:08:08', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (156, 'mrbird', '2020-11-27 17:40:37', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (157, 'mrbird', '2020-11-30 09:02:08', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (158, 'mrbird', '2020-11-30 09:22:37', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (159, 'mrbird', '2020-11-30 09:26:15', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (160, 'mrbird', '2020-11-30 09:44:37', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (161, 'mrbird', '2020-11-30 09:48:20', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (162, 'mrbird', '2020-11-30 09:51:55', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (163, 'mrbird', '2020-11-30 09:59:16', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (164, 'mrbird', '2020-11-30 10:00:03', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (165, 'mrbird', '2020-11-30 10:00:40', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (166, 'mrbird', '2020-11-30 10:01:25', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (167, 'mrbird', '2020-11-30 10:01:51', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (168, 'mrbird', '2020-11-30 11:09:51', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (169, 'mrbird', '2020-11-30 11:15:27', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (170, 'mrbird', '2020-11-30 12:38:31', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (171, 'mrbird', '2020-11-30 12:44:50', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (172, 'mrbird', '2020-11-30 13:05:01', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (173, 'mrbird', '2020-11-30 18:06:30', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (174, 'mrbird', '2020-11-30 19:46:04', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (175, 'mrbird', '2020-11-30 19:48:51', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (176, 'mrbird', '2020-11-30 19:50:08', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (177, 'mrbird', '2020-12-01 19:13:31', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (178, 'mrbird', '2020-12-01 21:01:12', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (179, 'mrbird', '2020-12-01 21:03:55', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (180, 'mrbird', '2020-12-01 21:06:59', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (181, 'mrbird', '2020-12-01 21:12:53', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (182, 'mrbird', '2020-12-01 21:30:29', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (183, 'mrbird', '2020-12-01 21:37:15', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (184, 'mrbird', '2020-12-02 18:17:33', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (185, 'mrbird', '2020-12-02 19:01:57', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (186, 'mrbird', '2020-12-02 19:05:53', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (187, 'mrbird', '2020-12-02 19:07:15', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (188, 'mrbird', '2020-12-02 19:12:17', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (189, 'mrbird', '2020-12-02 19:15:47', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (190, 'mrbird', '2020-12-02 19:19:07', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (191, 'mrbird', '2020-12-02 19:23:32', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (192, 'mrbird', '2020-12-02 19:43:44', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (193, 'mrbird', '2020-12-02 21:47:20', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (194, 'mrbird', '2020-12-02 21:58:07', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (195, 'mrbird', '2020-12-02 22:05:25', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (196, 'mrbird', '2020-12-03 19:50:22', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (197, 'mrbird', '2020-12-03 20:07:31', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (198, 'mrbird', '2020-12-03 20:21:55', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (199, 'mrbird', '2020-12-03 20:53:06', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (200, 'mrbird', '2020-12-03 20:58:56', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (201, 'mrbird', '2020-12-03 21:51:12', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (202, 'mrbird', '2020-12-03 21:53:16', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (203, 'mrbird', '2020-12-03 22:20:28', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (204, 'mrbird', '2020-12-03 22:25:10', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (205, 'mrbird', '2020-12-03 23:02:35', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (206, 'mrbird', '2020-12-03 23:24:29', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (207, 'mrbird', '2020-12-03 23:27:44', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (208, 'mrbird', '2020-12-03 23:39:04', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (209, 'mrbird', '2020-12-03 23:55:02', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (210, 'mrbird', '2020-12-04 00:01:16', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (211, 'mrbird', '2020-12-04 00:03:19', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (212, 'mrbird', '2020-12-04 00:09:19', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (213, 'mrbird', '2020-12-04 00:13:58', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (214, 'mrbird', '2020-12-04 00:21:02', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (215, 'mrbird', '2020-12-04 00:29:38', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (216, 'mrbird', '2020-12-04 00:31:52', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (217, 'mrbird', '2020-12-04 08:47:58', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (218, 'mrbird', '2020-12-04 08:56:02', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (219, 'mrbird', '2020-12-04 09:00:47', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (220, 'mrbird', '2020-12-04 09:06:03', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (221, 'mrbird', '2020-12-04 09:07:08', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (222, 'mrbird', '2020-12-04 09:09:55', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (223, 'mrbird', '2020-12-04 09:11:03', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (224, 'mrbird', '2020-12-04 09:12:48', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (225, 'mrbird', '2020-12-04 10:01:16', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (226, 'mrbird', '2020-12-04 10:44:20', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (227, 'mrbird', '2020-12-04 10:50:12', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (228, 'mrbird', '2020-12-04 10:52:13', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (229, 'mrbird', '2020-12-04 11:04:52', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (230, 'mrbird', '2020-12-04 12:24:46', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (231, 'mrbird', '2020-12-04 12:29:53', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (232, 'mrbird', '2020-12-04 12:30:53', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (233, 'mrbird', '2020-12-04 12:33:28', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (234, 'mrbird', '2020-12-04 12:56:22', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (235, 'mrbird', '2020-12-04 13:13:54', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (236, 'mrbird', '2020-12-04 13:29:42', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (237, 'mrbird', '2020-12-04 22:17:05', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (238, 'mrbird', '2020-12-04 22:30:39', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (239, 'mrbird', '2020-12-04 23:45:56', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (240, 'mrbird', '2020-12-05 00:17:31', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (241, 'mrbird', '2020-12-05 09:42:29', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (242, 'mrbird', '2020-12-05 10:37:58', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (243, 'mrbird', '2020-12-05 10:41:23', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (244, 'mrbird', '2020-12-05 11:00:34', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (245, 'mrbird', '2020-12-05 11:11:39', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (246, 'mrbird', '2020-12-05 13:15:12', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (247, 'mrbird', '2020-12-05 14:12:34', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (248, '123', '2020-12-05 14:19:01', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (249, '1234', '2020-12-05 14:25:40', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (250, '1234', '2020-12-05 14:27:36', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (251, 'master', '2020-12-05 14:29:42', '内网IP|0|0|内网IP|内网IP', '127.0.0.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (252, 'mrbird', '2020-12-06 10:00:05', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (253, 'mrbird', '2020-12-06 10:07:50', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (254, 'mrbird', '2020-12-06 10:22:08', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (255, 'mrbird', '2020-12-06 15:48:26', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (256, 'mrbird', '2020-12-06 15:53:28', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (257, 'mrbird', '2020-12-06 16:11:08', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (258, 'mrbird', '2020-12-06 16:21:19', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (259, 'mrbird', '2020-12-06 16:37:05', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (260, 'mrbird', '2020-12-06 16:55:53', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (261, 'mrbird', '2020-12-06 17:39:49', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (262, 'mrbird', '2020-12-06 17:48:39', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (263, 'mrbird', '2020-12-06 17:50:17', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (264, 'mrbird', '2020-12-06 18:01:11', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (265, 'mrbird', '2020-12-06 18:07:38', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (266, 'mrbird', '2020-12-06 18:11:15', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (267, 'mrbird', '2020-12-06 18:12:43', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (268, 'mrbird', '2020-12-06 18:22:10', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (269, 'mrbird', '2020-12-06 18:25:52', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (270, 'mrbird', '2020-12-06 18:27:26', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (271, 'mrbird', '2020-12-06 18:29:06', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (272, 'mrbird', '2020-12-06 18:31:59', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (273, 'mrbird', '2020-12-06 18:35:23', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (274, 'mrbird', '2020-12-06 18:47:57', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (275, 'mrbird', '2020-12-06 18:52:24', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (276, 'mrbird', '2020-12-06 19:00:11', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (277, 'mrbird', '2020-12-06 20:57:04', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (278, 'mrbird', '2020-12-06 21:45:17', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (279, 'mrbird', '2020-12-06 22:22:04', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (280, 'mrbird', '2020-12-08 10:33:44', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (281, 'mrbird', '2020-12-08 10:37:41', NULL, '192.168.137.1', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (282, 'mrbird', '2020-12-11 13:33:31', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (283, 'mrbird', '2020-12-11 14:14:06', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (284, 'mrbird', '2020-12-11 16:27:39', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (285, 'mrbird', '2020-12-11 16:30:23', '内网IP|0|0|内网IP|内网IP', '192.168.43.143', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (286, 'mrbird', '2020-12-13 12:11:36', '内网IP|0|0|内网IP|内网IP', '172.20.42.2', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (287, 'mrbird', '2020-12-13 14:15:07', '内网IP|0|0|内网IP|内网IP', '172.20.42.2', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (288, 'master', '2020-12-13 14:36:45', '内网IP|0|0|内网IP|内网IP', '172.20.42.2', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (289, 'mrbird', '2021-01-11 18:55:57', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (290, 'mrbird', '2021-01-11 20:31:20', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (291, 'mrbird', '2021-01-11 20:39:01', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (292, 'mrbird', '2021-01-11 20:43:04', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (293, 'mrbird', '2021-01-11 21:30:25', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (294, 'mrbird', '2021-01-11 21:47:05', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (295, 'mrbird', '2021-01-11 21:50:29', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (296, 'mrbird', '2021-01-11 23:05:17', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (297, 'mrbird', '2021-01-11 23:08:37', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (298, 'mrbird', '2021-01-11 23:16:39', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (299, 'mrbird', '2021-01-11 23:19:24', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (300, 'mrbird', '2021-01-11 23:25:06', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (301, 'mrbird', '2021-01-12 00:02:27', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (302, 'mrbird', '2021-01-13 09:31:52', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (303, 'mrbird', '2021-01-13 10:15:01', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (304, 'mrbird', '2021-01-13 12:38:14', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (305, 'mrbird', '2021-01-13 12:42:43', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (306, 'mrbird', '2021-01-13 12:44:13', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (307, 'mrbird', '2021-01-13 12:45:53', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (308, 'mrbird', '2021-01-13 12:46:51', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (309, 'mrbird', '2021-01-13 12:50:08', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (310, 'mrbird', '2021-01-13 12:51:47', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (311, 'mrbird', '2021-01-13 13:25:06', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (312, 'mrbird', '2021-01-13 13:26:24', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (313, 'mrbird', '2021-01-13 13:28:32', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (314, 'mrbird', '2021-01-13 13:57:02', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (315, 'Mrbird', '2021-01-13 14:51:29', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (316, 'mrbird', '2021-01-13 15:39:40', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (317, 'mrbird', '2021-01-13 15:58:52', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (318, 'mrbird', '2021-01-13 16:35:11', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (319, 'mrbird', '2021-01-13 17:37:50', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (320, 'mrbird', '2021-01-13 17:43:59', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (321, 'mrbird', '2021-01-13 17:48:12', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (322, 'mrbird', '2021-01-13 17:54:19', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (323, 'mrbird', '2021-01-13 18:07:42', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (324, 'mrbird', '2021-01-13 18:35:15', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (325, 'mrbird', '2021-01-13 18:40:12', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (326, 'mrbird', '2021-01-13 18:45:51', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (327, 'mrbird', '2021-01-13 18:51:44', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (328, 'mrbird', '2021-01-13 18:54:07', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (329, 'mrbird', '2021-01-13 18:56:39', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (330, 'mrbird', '2021-01-13 18:58:30', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (331, 'mrbird', '2021-01-13 19:00:42', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (332, 'mrbird', '2021-01-13 19:01:43', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (333, 'mrbird', '2021-01-13 19:06:14', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (334, 'mrbird', '2021-01-13 19:38:46', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (335, 'mrbird', '2021-01-13 19:46:24', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (336, 'mrbird', '2021-01-13 19:49:17', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (337, 'mrbird', '2021-01-13 19:50:46', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (338, 'mrbird', '2021-01-13 19:52:24', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (339, 'mrbird', '2021-01-13 19:54:15', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (340, 'mrbird', '2021-01-13 20:34:26', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (341, 'mrbird', '2021-01-13 20:41:29', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (342, 'mrbird', '2021-01-13 21:08:27', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (343, 'mrbird', '2021-01-13 21:25:49', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (344, 'mrbird', '2021-01-13 21:32:56', '内网IP|0|0|内网IP|内网IP', '192.168.1.6', 'Windows 10', 'Chrome 87');
INSERT INTO `t_login_log` VALUES (345, '111', '2023-10-31 20:58:23', '内网IP|0|0|内网IP|内网IP', '10.236.138.81', 'Windows 10', 'Chrome 92');
INSERT INTO `t_login_log` VALUES (346, '111', '2023-10-31 21:06:42', '内网IP|0|0|内网IP|内网IP', '10.236.138.81', 'Windows 10', 'Chrome 92');
INSERT INTO `t_login_log` VALUES (347, '111', '2023-10-31 21:12:59', '内网IP|0|0|内网IP|内网IP', '10.236.138.81', 'Windows 10', 'Chrome 92');
INSERT INTO `t_login_log` VALUES (348, '111', '2023-10-31 21:25:48', '内网IP|0|0|内网IP|内网IP', '10.236.138.81', 'Windows 10', 'Chrome 92');
INSERT INTO `t_login_log` VALUES (349, '111', '2023-11-01 22:03:42', '内网IP|0|0|内网IP|内网IP', '10.241.96.192', 'Windows 10', 'Chrome 92');
INSERT INTO `t_login_log` VALUES (350, '111', '2023-11-05 22:25:48', '内网IP|0|0|内网IP|内网IP', '10.241.96.192', 'Windows 10', 'Chrome 92');
INSERT INTO `t_login_log` VALUES (351, '111', '2023-11-10 22:47:22', '内网IP|0|0|内网IP|内网IP', '10.241.96.192', 'Windows 10', 'Chrome 10');
INSERT INTO `t_login_log` VALUES (352, '111', '2023-11-10 22:49:55', '内网IP|0|0|内网IP|内网IP', '10.241.96.192', 'Windows 10', 'Chrome 10');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `MENU_ID` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单/按钮ID',
  `PARENT_ID` bigint NOT NULL COMMENT '上级菜单ID',
  `MENU_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单/按钮名称',
  `URL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `PERMS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '权限标识',
  `ICON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图标',
  `TYPE` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型 0菜单 1按钮',
  `ORDER_NUM` bigint NULL DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`MENU_ID`) USING BTREE,
  INDEX `t_menu_parent_id`(`PARENT_ID` ASC) USING BTREE,
  INDEX `t_menu_menu_id`(`MENU_ID` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 237 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, 0, '系统管理', '', '', 'layui-icon-setting', '0', 4, '2017-12-27 16:39:07', '2021-01-13 21:04:12');
INSERT INTO `t_menu` VALUES (3, 1, '用户管理', '/system/user', 'user:view', '', '0', 1, '2017-12-27 16:47:13', '2019-12-04 16:46:50');
INSERT INTO `t_menu` VALUES (4, 1, '角色管理', '/system/role', 'role:view', '', '0', 2, '2017-12-27 16:48:09', '2019-06-13 08:57:19');
INSERT INTO `t_menu` VALUES (5, 1, '菜单管理', '/system/menu', 'menu:view', '', '0', 3, '2017-12-27 16:48:57', '2019-06-13 08:57:34');
INSERT INTO `t_menu` VALUES (6, 1, '部门管理', '/system/dept', 'dept:view', '', '0', 4, '2017-12-27 16:57:33', '2019-06-14 19:56:00');
INSERT INTO `t_menu` VALUES (8, 0, '在线用户', '/monitor/online', 'online:view', 'layui-icon-alert', '0', 4, '2017-12-27 16:59:33', '2020-12-05 13:21:00');
INSERT INTO `t_menu` VALUES (11, 3, '新增用户', NULL, 'user:add', NULL, '1', NULL, '2017-12-27 17:02:58', NULL);
INSERT INTO `t_menu` VALUES (12, 3, '修改用户', NULL, 'user:update', NULL, '1', NULL, '2017-12-27 17:04:07', NULL);
INSERT INTO `t_menu` VALUES (13, 3, '删除用户', NULL, 'user:delete', NULL, '1', NULL, '2017-12-27 17:04:58', NULL);
INSERT INTO `t_menu` VALUES (14, 4, '新增角色', NULL, 'role:add', NULL, '1', NULL, '2017-12-27 17:06:38', NULL);
INSERT INTO `t_menu` VALUES (15, 4, '修改角色', NULL, 'role:update', NULL, '1', NULL, '2017-12-27 17:06:38', NULL);
INSERT INTO `t_menu` VALUES (16, 4, '删除角色', NULL, 'role:delete', NULL, '1', NULL, '2017-12-27 17:06:38', NULL);
INSERT INTO `t_menu` VALUES (17, 5, '新增菜单', NULL, 'menu:add', NULL, '1', NULL, '2017-12-27 17:08:02', NULL);
INSERT INTO `t_menu` VALUES (18, 5, '修改菜单', NULL, 'menu:update', NULL, '1', NULL, '2017-12-27 17:08:02', NULL);
INSERT INTO `t_menu` VALUES (19, 5, '删除菜单', NULL, 'menu:delete', NULL, '1', NULL, '2017-12-27 17:08:02', NULL);
INSERT INTO `t_menu` VALUES (20, 6, '新增部门', NULL, 'dept:add', NULL, '1', NULL, '2017-12-27 17:09:24', NULL);
INSERT INTO `t_menu` VALUES (21, 6, '修改部门', NULL, 'dept:update', NULL, '1', NULL, '2017-12-27 17:09:24', NULL);
INSERT INTO `t_menu` VALUES (22, 6, '删除部门', NULL, 'dept:delete', NULL, '1', NULL, '2017-12-27 17:09:24', NULL);
INSERT INTO `t_menu` VALUES (23, 8, '踢出用户', NULL, 'user:kickout', NULL, '1', NULL, '2017-12-27 17:11:13', NULL);
INSERT INTO `t_menu` VALUES (160, 3, '密码重置', NULL, 'user:password:reset', NULL, '1', NULL, '2019-06-13 08:40:13', NULL);
INSERT INTO `t_menu` VALUES (161, 3, '导出Excel', NULL, 'user:export', NULL, '1', NULL, '2019-06-13 08:40:34', NULL);
INSERT INTO `t_menu` VALUES (162, 4, '导出Excel', NULL, 'role:export', NULL, '1', NULL, '2019-06-13 14:29:00', '2019-06-13 14:29:11');
INSERT INTO `t_menu` VALUES (163, 5, '导出Excel', NULL, 'menu:export', NULL, '1', NULL, '2019-06-13 14:29:32', NULL);
INSERT INTO `t_menu` VALUES (164, 6, '导出Excel', NULL, 'dept:export', NULL, '1', NULL, '2019-06-13 14:29:59', NULL);
INSERT INTO `t_menu` VALUES (197, 0, '订单管理', '', 'order:view', 'layui-icon-filedone', '0', 0, '2020-07-29 14:02:14', '2020-12-04 22:48:21');
INSERT INTO `t_menu` VALUES (198, 204, '新增订单', NULL, 'customer:create ', NULL, '1', NULL, '2020-07-29 14:02:35', '2021-01-13 21:25:01');
INSERT INTO `t_menu` VALUES (199, 204, '提交订单', NULL, 'orders:submit', NULL, '1', NULL, '2020-07-29 14:04:17', '2020-12-04 23:47:02');
INSERT INTO `t_menu` VALUES (200, 204, '审批订单', NULL, 'orders:audit', NULL, '1', NULL, '2020-07-29 14:04:43', NULL);
INSERT INTO `t_menu` VALUES (201, 204, '完成收款', NULL, 'orders:pay', NULL, '1', NULL, '2020-07-29 14:05:10', NULL);
INSERT INTO `t_menu` VALUES (203, 197, '零售订单', '/system/order', 'order:view', '', '0', 1, '2020-07-29 14:06:48', '2020-12-06 10:10:23');
INSERT INTO `t_menu` VALUES (204, 197, '批发订单', '/system/order/wholesale', 'orders:view', '', '0', 2, '2020-07-29 14:07:38', '2020-11-30 20:06:37');
INSERT INTO `t_menu` VALUES (205, 0, '货品管理', '/system/goods', 'goods:view', 'layui-icon-gift', '0', 2, '2020-07-29 14:09:46', '2020-11-30 18:42:19');
INSERT INTO `t_menu` VALUES (206, 205, '新增货品', NULL, 'goods:create', NULL, '1', NULL, '2020-07-29 14:10:49', '2020-11-26 10:14:03');
INSERT INTO `t_menu` VALUES (207, 205, '修改货品', NULL, 'goods:update', NULL, '1', NULL, '2020-07-29 14:11:20', '2020-11-30 19:43:25');
INSERT INTO `t_menu` VALUES (210, 205, '删除货品', '', 'goods:delete', '', '1', NULL, '2020-07-29 17:01:49', '2020-11-30 19:43:12');
INSERT INTO `t_menu` VALUES (212, 0, '客户管理', '/system/customer/', 'customer:view', 'layui-icon-team', '0', 1, '2020-07-29 22:37:50', '2020-11-30 18:42:12');
INSERT INTO `t_menu` VALUES (213, 212, '新增客户', NULL, 'customer:create', NULL, '1', NULL, '2020-07-29 22:38:45', NULL);
INSERT INTO `t_menu` VALUES (214, 212, '修改客户', NULL, 'customer:update', NULL, '1', NULL, '2020-07-29 22:39:20', '2020-07-29 23:57:52');
INSERT INTO `t_menu` VALUES (215, 212, '删除客户', NULL, 'customer:delete', NULL, '1', NULL, '2020-07-29 22:40:16', NULL);
INSERT INTO `t_menu` VALUES (218, 0, '仓库管理', '', 'storage:view', 'layui-icon-home', '0', NULL, '2020-12-04 22:32:20', NULL);
INSERT INTO `t_menu` VALUES (219, 218, '仓库总览', '/system/storage', 'storage:view', '', '0', 0, '2020-12-04 22:33:54', NULL);
INSERT INTO `t_menu` VALUES (220, 219, '新增仓库', NULL, 'storage:create', NULL, '1', NULL, '2020-12-04 22:35:52', '2020-12-04 22:37:43');
INSERT INTO `t_menu` VALUES (221, 219, '修改仓库', NULL, 'storage:update', NULL, '1', NULL, '2020-12-04 22:36:24', '2020-12-04 22:37:51');
INSERT INTO `t_menu` VALUES (222, 219, '删除仓库', NULL, 'storage:delete', NULL, '1', NULL, '2020-12-04 22:37:07', NULL);
INSERT INTO `t_menu` VALUES (223, 218, '库存记录', '/system/record', 'record:view', '', '0', 1, '2020-12-04 22:40:48', NULL);
INSERT INTO `t_menu` VALUES (224, 223, '新货入库', NULL, 'record:create', NULL, '1', NULL, '2020-12-04 22:42:16', NULL);
INSERT INTO `t_menu` VALUES (225, 223, '货品出库', NULL, 'record:out', NULL, '1', NULL, '2020-12-04 22:43:27', NULL);
INSERT INTO `t_menu` VALUES (226, 223, '已有货品入库', NULL, 'record:update', NULL, '1', NULL, '2020-12-04 22:44:39', NULL);
INSERT INTO `t_menu` VALUES (227, 223, '货品转移', NULL, 'record:trans', NULL, '1', NULL, '2020-12-04 22:45:04', NULL);
INSERT INTO `t_menu` VALUES (228, 204, '修改订单', NULL, 'orders:update', NULL, '1', NULL, '2020-12-05 00:00:26', NULL);
INSERT INTO `t_menu` VALUES (229, 204, '删除订单', NULL, 'orders:delete', NULL, '1', NULL, '2020-12-05 00:01:25', NULL);
INSERT INTO `t_menu` VALUES (230, 203, '新增订单', NULL, 'order:retail', NULL, '1', NULL, '2020-12-06 10:08:57', NULL);
INSERT INTO `t_menu` VALUES (231, 204, '订单退货', NULL, 'orders:return', NULL, '1', NULL, '2020-12-11 13:50:26', NULL);
INSERT INTO `t_menu` VALUES (232, 204, '单期收款', NULL, 'orders:payone', NULL, '1', NULL, '2020-12-11 13:50:51', NULL);
INSERT INTO `t_menu` VALUES (233, 212, '设定积分规则', NULL, 'customer:pointsRule', NULL, '1', NULL, '2021-01-11 23:05:59', NULL);
INSERT INTO `t_menu` VALUES (234, 0, '统计查询', '', '', 'layui-icon-linechart', '0', 3, '2021-01-13 20:59:41', '2021-01-13 21:00:59');
INSERT INTO `t_menu` VALUES (235, 234, '客户结款统计', '/system/pay', 'pay:view', '', '0', NULL, '2021-01-13 21:00:47', NULL);
INSERT INTO `t_menu` VALUES (236, 234, '库存统计', '/system/inventory', 'inventory:view', '', '0', NULL, '2021-01-13 21:01:41', '2021-01-13 21:03:16');
INSERT INTO `t_menu` VALUES (237, 234, '销售统计', '/system/sale', 'sale:view', '', '0', NULL, '2021-01-13 21:02:07', '2021-01-13 21:03:06');

-- ----------------------------
-- Table structure for t_order_retail
-- ----------------------------
DROP TABLE IF EXISTS `t_order_retail`;
CREATE TABLE `t_order_retail`  (
  `order_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '零售单号',
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `customer_phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户电话',
  `order_price` double NOT NULL COMMENT '零售单价格',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '零售订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_order_retail
-- ----------------------------
INSERT INTO `t_order_retail` VALUES (1, 'xx', '11111111111', 11, '2020-12-01 20:33:44');
INSERT INTO `t_order_retail` VALUES (2, 'ss', '11111111111', 22, '2020-12-06 16:56:14');
INSERT INTO `t_order_retail` VALUES (3, 'ww', '11111111111', 11, '2020-12-06 18:01:29');
INSERT INTO `t_order_retail` VALUES (4, 'ss', '13629837999', 2, '2020-12-06 18:08:10');
INSERT INTO `t_order_retail` VALUES (5, 'w', '13629837931', 2, '2020-12-06 18:22:43');
INSERT INTO `t_order_retail` VALUES (6, 'q', '11111111111', 1, '2020-12-06 18:32:22');
INSERT INTO `t_order_retail` VALUES (7, 'w', '11111111111', 2, '2020-12-06 19:02:12');
INSERT INTO `t_order_retail` VALUES (8, 'qw', '11111111111', 1, '2020-12-06 21:34:46');
INSERT INTO `t_order_retail` VALUES (9, 'rrr', '11111111111', 30, '2020-12-06 21:45:36');
INSERT INTO `t_order_retail` VALUES (10, 'qqq', '11111111111', 60, '2020-12-06 21:46:23');
INSERT INTO `t_order_retail` VALUES (11, 'eeo', '11111111111', 800, '2020-12-06 22:22:29');
INSERT INTO `t_order_retail` VALUES (12, '22', '11111111111', 400, '2020-12-06 22:24:38');
INSERT INTO `t_order_retail` VALUES (13, '1', '11111111111', 400, '2020-12-06 22:25:52');
INSERT INTO `t_order_retail` VALUES (14, 'ququ', '11111111111', 400, '2020-12-06 22:31:10');
INSERT INTO `t_order_retail` VALUES (15, 'ww', '19999999999', 800, '2020-12-08 10:34:21');
INSERT INTO `t_order_retail` VALUES (16, 'q', '11111111111', 400, '2020-12-08 10:38:16');
INSERT INTO `t_order_retail` VALUES (18, '李四', '15211112222', 430, '2020-12-11 13:37:16');
INSERT INTO `t_order_retail` VALUES (22, '', '', 400, '2021-01-13 19:54:30');

-- ----------------------------
-- Table structure for t_order_wholesale
-- ----------------------------
DROP TABLE IF EXISTS `t_order_wholesale`;
CREATE TABLE `t_order_wholesale`  (
  `orders_id` int NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `customer_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `customer_phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户手机号码',
  `goods_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '货品ID',
  `goods_num` bigint UNSIGNED NULL DEFAULT NULL COMMENT '货品数量',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `price_paid` double NULL DEFAULT NULL COMMENT '已收款金额',
  `orders_price` double NULL DEFAULT NULL COMMENT '销售单价格',
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '订单状态',
  `orders_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收货地址',
  `storehouse` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发货仓库',
  `orders_period` double NULL DEFAULT NULL COMMENT '订单分期数',
  `orders_profile` double NULL DEFAULT NULL COMMENT '订单利润',
  `goods_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品名称',
  PRIMARY KEY (`orders_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '批发订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_order_wholesale
-- ----------------------------
INSERT INTO `t_order_wholesale` VALUES (1, '张三', '13123989123', 1, 199, '2020-12-02 21:00:00', 200, 1000, '4', '黑龙江省哈尔滨市南岗区哈尔滨工业大学', '大库', 5, 17910, '键盘');
INSERT INTO `t_order_wholesale` VALUES (2, '李四', '18759525258', 1, 111, '2020-12-02 21:13:34', 2220, 11100, '2', '黑龙江省哈尔滨市香坊区', '门店库房', 5, 9990, '键盘');
INSERT INTO `t_order_wholesale` VALUES (4, '王五', '18759513412', 3, 70, '2020-12-03 12:47:24', 0, 1400, '2', '黑龙江省哈尔滨市南岗区西大直街12号', '门店库房', 6, 700, '鼠标');
INSERT INTO `t_order_wholesale` VALUES (5, '王六', '18759513412', 3, 300, '2020-12-03 13:01:11', 30000, 30000, '3', '黑龙江省哈尔滨市南岗区西大直街12号', '大库', 3, 3000, '鼠标');
INSERT INTO `t_order_wholesale` VALUES (6, '王五', '18759513412', 1, 50, '2020-12-06 23:56:37', 0, 15000, '2', '黑龙江省哈尔滨市南岗区西大直街12号', '大库', 5, 4500, '键盘');
INSERT INTO `t_order_wholesale` VALUES (7, '王二', '18759213412', 1, 66, '2020-12-07 00:27:54', 19800, 19800, '4', '黑龙江省哈尔滨市南岗区西大直街12号', '大库', 6, 5940, '键盘');
INSERT INTO `t_order_wholesale` VALUES (8, '王森', '18759513412', 1, 20, '2020-12-07 02:11:34', 6000, 6000, '4', '黑龙江省哈尔滨市南岗区西大直街12号', '大库', 2, 1800, '键盘');
INSERT INTO `t_order_wholesale` VALUES (9, '王五', '18759513412', 3, 66, '2020-12-07 09:40:59', 0, 1320, '2', '黑龙江省哈尔滨市南岗区西大直街12号', '大库', 6, 660, '鼠标');
INSERT INTO `t_order_wholesale` VALUES (10, '陈五', '18759513412', 1, 45, '2020-12-07 09:41:58', 0, 13500, '1', '黑龙江省哈尔滨市南岗区西大直街12号', '门店库房', 7, 4050, '键盘');
INSERT INTO `t_order_wholesale` VALUES (11, '李五', '18759513412', 1, 12, '2020-12-07 09:43:03', 0, 3600, '0', '黑龙江省哈尔滨市南岗区西大直街12号', '门店库房', 2, 1080, '键盘');
INSERT INTO `t_order_wholesale` VALUES (12, '李四', '15011112222', 1, 1, '2020-12-13 14:15:45', 0, 300, '1', '黑龙江', '大库', 1, 90, '键盘');
INSERT INTO `t_order_wholesale` VALUES (13, 'ss', '15011112222', 1, 10, '2020-12-13 15:03:35', 3000, 3000, '3', 'hwsdfs', '大库', 1, 900, '键盘');

-- ----------------------------
-- Table structure for t_points_rule
-- ----------------------------
DROP TABLE IF EXISTS `t_points_rule`;
CREATE TABLE `t_points_rule`  (
  `POINTS_RULE_ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `TO_POINTS` double NOT NULL COMMENT '付账累计积分时的比例',
  `TO_BALANCE` double NOT NULL COMMENT '积分兑换余额的比例',
  PRIMARY KEY (`POINTS_RULE_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_points_rule
-- ----------------------------
INSERT INTO `t_points_rule` VALUES (1, 1, 100);

-- ----------------------------
-- Table structure for t_retail_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_retail_goods`;
CREATE TABLE `t_retail_goods`  (
  `order_id` bigint UNSIGNED NOT NULL COMMENT '零售单号',
  `goods_id` bigint UNSIGNED NOT NULL COMMENT '商品编号',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '销售类型',
  `discount` bigint UNSIGNED NULL DEFAULT NULL COMMENT '折扣',
  `number` bigint UNSIGNED NOT NULL,
  INDEX `t_retail_goods_goods_id`(`goods_id` ASC) USING BTREE,
  INDEX `t_retail_goods_order_id`(`order_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '零售订单项表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_retail_goods
-- ----------------------------
INSERT INTO `t_retail_goods` VALUES (1, 1, '', NULL, 0);
INSERT INTO `t_retail_goods` VALUES (2, 1, '', NULL, 0);
INSERT INTO `t_retail_goods` VALUES (2, 1, '', NULL, 0);
INSERT INTO `t_retail_goods` VALUES (3, 1, '', NULL, 0);
INSERT INTO `t_retail_goods` VALUES (4, 1, '', NULL, 0);
INSERT INTO `t_retail_goods` VALUES (5, 1, '', NULL, 0);
INSERT INTO `t_retail_goods` VALUES (6, 1, '', NULL, 0);
INSERT INTO `t_retail_goods` VALUES (7, 1, '', NULL, 0);
INSERT INTO `t_retail_goods` VALUES (8, 1, '', NULL, 0);
INSERT INTO `t_retail_goods` VALUES (9, 3, '', NULL, 0);
INSERT INTO `t_retail_goods` VALUES (10, 3, '', NULL, 0);
INSERT INTO `t_retail_goods` VALUES (10, 3, '', NULL, 0);
INSERT INTO `t_retail_goods` VALUES (11, 1, '', NULL, 0);
INSERT INTO `t_retail_goods` VALUES (11, 1, '', NULL, 0);
INSERT INTO `t_retail_goods` VALUES (12, 1, '', NULL, 0);
INSERT INTO `t_retail_goods` VALUES (13, 1, '', NULL, 0);
INSERT INTO `t_retail_goods` VALUES (14, 1, '', NULL, 0);
INSERT INTO `t_retail_goods` VALUES (15, 1, '', NULL, 0);
INSERT INTO `t_retail_goods` VALUES (15, 1, '', NULL, 0);
INSERT INTO `t_retail_goods` VALUES (16, 1, '', NULL, 0);
INSERT INTO `t_retail_goods` VALUES (18, 1, '', NULL, 0);
INSERT INTO `t_retail_goods` VALUES (18, 3, '', NULL, 0);
INSERT INTO `t_retail_goods` VALUES (22, 1, '售', 1, 1);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `ROLE_ID` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `ROLE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `REMARK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色描述',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ROLE_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '系统管理员', '系统管理员，拥有所有操作权限 ^_^', '2019-06-14 16:23:11', '2021-01-13 21:02:21');
INSERT INTO `t_role` VALUES (2, '注册账户', '注册账户，拥有查看权限', '2019-06-14 16:00:15', '2020-12-05 14:36:16');
INSERT INTO `t_role` VALUES (84, '店主', '店主', '2020-11-26 08:57:45', '2021-01-13 21:02:34');
INSERT INTO `t_role` VALUES (85, '经理', '经理', '2020-11-30 18:34:17', '2021-01-13 21:02:29');
INSERT INTO `t_role` VALUES (86, '店员', '店员', '2020-11-30 18:36:07', '2020-12-13 14:23:46');

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu`  (
  `ROLE_ID` bigint NOT NULL COMMENT '角色ID',
  `MENU_ID` bigint NOT NULL COMMENT '菜单/按钮ID',
  INDEX `t_role_menu_menu_id`(`MENU_ID` ASC) USING BTREE,
  INDEX `t_role_menu_role_id`(`ROLE_ID` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES (2, 218);
INSERT INTO `t_role_menu` VALUES (2, 219);
INSERT INTO `t_role_menu` VALUES (2, 223);
INSERT INTO `t_role_menu` VALUES (2, 205);
INSERT INTO `t_role_menu` VALUES (2, 8);
INSERT INTO `t_role_menu` VALUES (86, 197);
INSERT INTO `t_role_menu` VALUES (86, 203);
INSERT INTO `t_role_menu` VALUES (86, 230);
INSERT INTO `t_role_menu` VALUES (86, 204);
INSERT INTO `t_role_menu` VALUES (86, 198);
INSERT INTO `t_role_menu` VALUES (86, 212);
INSERT INTO `t_role_menu` VALUES (86, 213);
INSERT INTO `t_role_menu` VALUES (86, 214);
INSERT INTO `t_role_menu` VALUES (1, 218);
INSERT INTO `t_role_menu` VALUES (1, 219);
INSERT INTO `t_role_menu` VALUES (1, 220);
INSERT INTO `t_role_menu` VALUES (1, 221);
INSERT INTO `t_role_menu` VALUES (1, 222);
INSERT INTO `t_role_menu` VALUES (1, 223);
INSERT INTO `t_role_menu` VALUES (1, 224);
INSERT INTO `t_role_menu` VALUES (1, 225);
INSERT INTO `t_role_menu` VALUES (1, 226);
INSERT INTO `t_role_menu` VALUES (1, 227);
INSERT INTO `t_role_menu` VALUES (1, 197);
INSERT INTO `t_role_menu` VALUES (1, 203);
INSERT INTO `t_role_menu` VALUES (1, 230);
INSERT INTO `t_role_menu` VALUES (1, 204);
INSERT INTO `t_role_menu` VALUES (1, 229);
INSERT INTO `t_role_menu` VALUES (1, 231);
INSERT INTO `t_role_menu` VALUES (1, 232);
INSERT INTO `t_role_menu` VALUES (1, 198);
INSERT INTO `t_role_menu` VALUES (1, 199);
INSERT INTO `t_role_menu` VALUES (1, 200);
INSERT INTO `t_role_menu` VALUES (1, 201);
INSERT INTO `t_role_menu` VALUES (1, 228);
INSERT INTO `t_role_menu` VALUES (1, 212);
INSERT INTO `t_role_menu` VALUES (1, 233);
INSERT INTO `t_role_menu` VALUES (1, 213);
INSERT INTO `t_role_menu` VALUES (1, 214);
INSERT INTO `t_role_menu` VALUES (1, 215);
INSERT INTO `t_role_menu` VALUES (1, 205);
INSERT INTO `t_role_menu` VALUES (1, 206);
INSERT INTO `t_role_menu` VALUES (1, 207);
INSERT INTO `t_role_menu` VALUES (1, 210);
INSERT INTO `t_role_menu` VALUES (1, 1);
INSERT INTO `t_role_menu` VALUES (1, 3);
INSERT INTO `t_role_menu` VALUES (1, 12);
INSERT INTO `t_role_menu` VALUES (1, 11);
INSERT INTO `t_role_menu` VALUES (1, 13);
INSERT INTO `t_role_menu` VALUES (1, 160);
INSERT INTO `t_role_menu` VALUES (1, 161);
INSERT INTO `t_role_menu` VALUES (1, 4);
INSERT INTO `t_role_menu` VALUES (1, 14);
INSERT INTO `t_role_menu` VALUES (1, 15);
INSERT INTO `t_role_menu` VALUES (1, 16);
INSERT INTO `t_role_menu` VALUES (1, 162);
INSERT INTO `t_role_menu` VALUES (1, 5);
INSERT INTO `t_role_menu` VALUES (1, 19);
INSERT INTO `t_role_menu` VALUES (1, 17);
INSERT INTO `t_role_menu` VALUES (1, 18);
INSERT INTO `t_role_menu` VALUES (1, 163);
INSERT INTO `t_role_menu` VALUES (1, 6);
INSERT INTO `t_role_menu` VALUES (1, 20);
INSERT INTO `t_role_menu` VALUES (1, 21);
INSERT INTO `t_role_menu` VALUES (1, 22);
INSERT INTO `t_role_menu` VALUES (1, 164);
INSERT INTO `t_role_menu` VALUES (1, 234);
INSERT INTO `t_role_menu` VALUES (1, 237);
INSERT INTO `t_role_menu` VALUES (1, 235);
INSERT INTO `t_role_menu` VALUES (1, 236);
INSERT INTO `t_role_menu` VALUES (1, 8);
INSERT INTO `t_role_menu` VALUES (1, 23);
INSERT INTO `t_role_menu` VALUES (85, 218);
INSERT INTO `t_role_menu` VALUES (85, 219);
INSERT INTO `t_role_menu` VALUES (85, 220);
INSERT INTO `t_role_menu` VALUES (85, 221);
INSERT INTO `t_role_menu` VALUES (85, 222);
INSERT INTO `t_role_menu` VALUES (85, 223);
INSERT INTO `t_role_menu` VALUES (85, 224);
INSERT INTO `t_role_menu` VALUES (85, 225);
INSERT INTO `t_role_menu` VALUES (85, 226);
INSERT INTO `t_role_menu` VALUES (85, 227);
INSERT INTO `t_role_menu` VALUES (85, 197);
INSERT INTO `t_role_menu` VALUES (85, 203);
INSERT INTO `t_role_menu` VALUES (85, 230);
INSERT INTO `t_role_menu` VALUES (85, 204);
INSERT INTO `t_role_menu` VALUES (85, 229);
INSERT INTO `t_role_menu` VALUES (85, 231);
INSERT INTO `t_role_menu` VALUES (85, 232);
INSERT INTO `t_role_menu` VALUES (85, 198);
INSERT INTO `t_role_menu` VALUES (85, 199);
INSERT INTO `t_role_menu` VALUES (85, 200);
INSERT INTO `t_role_menu` VALUES (85, 201);
INSERT INTO `t_role_menu` VALUES (85, 228);
INSERT INTO `t_role_menu` VALUES (85, 212);
INSERT INTO `t_role_menu` VALUES (85, 213);
INSERT INTO `t_role_menu` VALUES (85, 214);
INSERT INTO `t_role_menu` VALUES (85, 215);
INSERT INTO `t_role_menu` VALUES (85, 205);
INSERT INTO `t_role_menu` VALUES (85, 206);
INSERT INTO `t_role_menu` VALUES (85, 207);
INSERT INTO `t_role_menu` VALUES (85, 210);
INSERT INTO `t_role_menu` VALUES (85, 234);
INSERT INTO `t_role_menu` VALUES (85, 237);
INSERT INTO `t_role_menu` VALUES (85, 235);
INSERT INTO `t_role_menu` VALUES (85, 236);
INSERT INTO `t_role_menu` VALUES (84, 218);
INSERT INTO `t_role_menu` VALUES (84, 219);
INSERT INTO `t_role_menu` VALUES (84, 220);
INSERT INTO `t_role_menu` VALUES (84, 221);
INSERT INTO `t_role_menu` VALUES (84, 222);
INSERT INTO `t_role_menu` VALUES (84, 223);
INSERT INTO `t_role_menu` VALUES (84, 224);
INSERT INTO `t_role_menu` VALUES (84, 225);
INSERT INTO `t_role_menu` VALUES (84, 226);
INSERT INTO `t_role_menu` VALUES (84, 227);
INSERT INTO `t_role_menu` VALUES (84, 197);
INSERT INTO `t_role_menu` VALUES (84, 203);
INSERT INTO `t_role_menu` VALUES (84, 230);
INSERT INTO `t_role_menu` VALUES (84, 204);
INSERT INTO `t_role_menu` VALUES (84, 229);
INSERT INTO `t_role_menu` VALUES (84, 231);
INSERT INTO `t_role_menu` VALUES (84, 232);
INSERT INTO `t_role_menu` VALUES (84, 198);
INSERT INTO `t_role_menu` VALUES (84, 199);
INSERT INTO `t_role_menu` VALUES (84, 200);
INSERT INTO `t_role_menu` VALUES (84, 201);
INSERT INTO `t_role_menu` VALUES (84, 228);
INSERT INTO `t_role_menu` VALUES (84, 212);
INSERT INTO `t_role_menu` VALUES (84, 213);
INSERT INTO `t_role_menu` VALUES (84, 214);
INSERT INTO `t_role_menu` VALUES (84, 215);
INSERT INTO `t_role_menu` VALUES (84, 205);
INSERT INTO `t_role_menu` VALUES (84, 206);
INSERT INTO `t_role_menu` VALUES (84, 207);
INSERT INTO `t_role_menu` VALUES (84, 210);
INSERT INTO `t_role_menu` VALUES (84, 1);
INSERT INTO `t_role_menu` VALUES (84, 3);
INSERT INTO `t_role_menu` VALUES (84, 12);
INSERT INTO `t_role_menu` VALUES (84, 11);
INSERT INTO `t_role_menu` VALUES (84, 13);
INSERT INTO `t_role_menu` VALUES (84, 160);
INSERT INTO `t_role_menu` VALUES (84, 161);
INSERT INTO `t_role_menu` VALUES (84, 234);
INSERT INTO `t_role_menu` VALUES (84, 237);
INSERT INTO `t_role_menu` VALUES (84, 235);
INSERT INTO `t_role_menu` VALUES (84, 236);
INSERT INTO `t_role_menu` VALUES (84, 8);
INSERT INTO `t_role_menu` VALUES (84, 23);

-- ----------------------------
-- Table structure for t_storage
-- ----------------------------
DROP TABLE IF EXISTS `t_storage`;
CREATE TABLE `t_storage`  (
  `storage_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '仓库ID',
  `storage_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '仓库名',
  PRIMARY KEY (`storage_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '仓库总表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_storage
-- ----------------------------
INSERT INTO `t_storage` VALUES (1, '门店库房');
INSERT INTO `t_storage` VALUES (2, '大库');
INSERT INTO `t_storage` VALUES (4, 'test');

-- ----------------------------
-- Table structure for t_storage_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_storage_goods`;
CREATE TABLE `t_storage_goods`  (
  `RECORD_ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `STORAGE_ID` bigint UNSIGNED NOT NULL COMMENT '仓库ID',
  `STORAGE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '仓库名',
  `GOODS_ID` bigint UNSIGNED NOT NULL COMMENT '货品ID',
  `GOODS_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '货品名',
  `NUMBER` bigint UNSIGNED NOT NULL COMMENT '库存数量',
  `VALUE` double NOT NULL COMMENT '积压资金额',
  PRIMARY KEY (`RECORD_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '仓库子表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_storage_goods
-- ----------------------------
INSERT INTO `t_storage_goods` VALUES (1, 1, '门店库房', 1, '键盘', 21, 4410);
INSERT INTO `t_storage_goods` VALUES (2, 1, '门店库房', 3, '鼠标', 19, 190);
INSERT INTO `t_storage_goods` VALUES (3, 2, '大库', 1, '键盘', 90, 18900);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `USER_ID` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `USERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `PASSWORD` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `DEPT_ID` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `EMAIL` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `MOBILE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态 0锁定 1有效',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `LAST_LOGIN_TIME` datetime NULL DEFAULT NULL COMMENT '最近访问时间',
  `SSEX` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别 0男 1女 2保密',
  `IS_TAB` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否开启tab，0关闭 1开启',
  `THEME` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '主题',
  `AVATAR` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `DESCRIPTION` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`USER_ID`) USING BTREE,
  INDEX `t_user_username`(`USERNAME` ASC) USING BTREE,
  INDEX `t_user_mobile`(`MOBILE` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'MrBird', 'cb62ad1497597283961545d608f80241', 1, 'mrbird@qq.com', '17788888888', '1', '2019-06-14 20:39:22', '2019-12-04 16:47:11', '2021-01-13 21:32:58', '0', '1', 'black', 'cnrhVkzwxjPwAaCfPbdc.png', '我是帅比作者。');
INSERT INTO `t_user` VALUES (2, 'Scott', '1d685729d113cfd03872f154939bee1c', 1, 'scott@gmail.com', '17722222222', '1', '2019-06-14 20:55:53', '2020-12-05 14:15:10', '2019-08-18 17:36:18', '0', '1', 'black', 'gaOngJwsRYRaVAuXXcmB.png', '我是scott。');
INSERT INTO `t_user` VALUES (6, 'Georgie', 'dffc683378cdaa015a0ee9554c532225', 1, 'Georgie@qq.com', '17766666666', '0', '2019-06-14 21:15:09', '2020-12-05 14:34:04', '2019-06-14 21:16:11', '2', '0', 'black', 'BiazfanxmamNRoxxVxka.png', '生产执行rm -rf *，账号封禁T T');
INSERT INTO `t_user` VALUES (10, 'Master', 'bd6c486fb63480e5ca347d8e1e29ad08', NULL, '', '', '1', '2020-12-05 14:18:50', '2020-12-05 14:26:01', '2020-12-13 14:36:46', '2', '1', 'black', 'default.jpg', '注册用户');
INSERT INTO `t_user` VALUES (11, 'Manager', '1910ab772c0cd7ba2f5ab5b02b29db05', NULL, '', '', '1', '2020-12-05 14:31:15', NULL, NULL, '2', '1', 'black', 'default.jpg', '');
INSERT INTO `t_user` VALUES (12, 'Employee', 'fa08edc78a947e2217e156e06be0d46c', NULL, '', '', '1', '2020-12-05 14:32:14', NULL, NULL, '2', '1', 'black', 'default.jpg', '');
INSERT INTO `t_user` VALUES (13, '111', 'b157142fba60c25288603cc5c5a0240d', NULL, NULL, NULL, '1', '2023-10-31 20:58:11', NULL, '2023-11-10 22:49:55', '2', '1', 'black', 'default.jpg', '注册用户');

-- ----------------------------
-- Table structure for t_user_data_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_user_data_permission`;
CREATE TABLE `t_user_data_permission`  (
  `USER_ID` bigint NOT NULL,
  `DEPT_ID` bigint NOT NULL,
  PRIMARY KEY (`USER_ID`, `DEPT_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户数据权限关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user_data_permission
-- ----------------------------
INSERT INTO `t_user_data_permission` VALUES (1, 1);
INSERT INTO `t_user_data_permission` VALUES (1, 6);
INSERT INTO `t_user_data_permission` VALUES (2, 1);

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `USER_ID` bigint NOT NULL COMMENT '用户ID',
  `ROLE_ID` bigint NOT NULL COMMENT '角色ID',
  INDEX `t_user_role_user_id`(`USER_ID` ASC) USING BTREE,
  INDEX `t_user_role_role_id`(`ROLE_ID` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, 1);
INSERT INTO `t_user_role` VALUES (2, 2);
INSERT INTO `t_user_role` VALUES (10, 84);
INSERT INTO `t_user_role` VALUES (11, 85);
INSERT INTO `t_user_role` VALUES (12, 86);
INSERT INTO `t_user_role` VALUES (6, 2);
INSERT INTO `t_user_role` VALUES (13, 2);

SET FOREIGN_KEY_CHECKS = 1;
