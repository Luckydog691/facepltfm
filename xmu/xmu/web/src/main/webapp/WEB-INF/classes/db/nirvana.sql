/*
Navicat MySQL Data Transfer

Source Server         : nirvana
Source Server Version : 50646
Source Host           : 139.9.104.150:3306
Source Database       : nirvana

Target Server Type    : MYSQL
Target Server Version : 50646
File Encoding         : 65001

Date: 2019-11-26 19:17:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for js_filemanager_folder
-- ----------------------------
DROP TABLE IF EXISTS `js_filemanager_folder`;
CREATE TABLE `js_filemanager_folder` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_code` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(1000) NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10,0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1000) NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4,0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(1000) NOT NULL COMMENT '全节点名',
  `folder_name` varchar(100) NOT NULL COMMENT '文件夹名',
  `group_type` varchar(64) NOT NULL COMMENT '文件分组类型',
  `office_code` varchar(64) DEFAULT NULL COMMENT '部门编码',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  PRIMARY KEY (`id`),
  KEY `idx_sys_file_tree_pc` (`parent_code`),
  KEY `idx_sys_file_tree_ts` (`tree_sort`),
  KEY `idx_sys_file_tree_gt` (`group_type`),
  KEY `idx_sys_file_tree_oc` (`office_code`),
  KEY `idx_sys_file_tree_cb` (`create_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件管理文件夹';

-- ----------------------------
-- Records of js_filemanager_folder
-- ----------------------------

-- ----------------------------
-- Table structure for js_filemanager_shared
-- ----------------------------
DROP TABLE IF EXISTS `js_filemanager_shared`;
CREATE TABLE `js_filemanager_shared` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `folder_id` varchar(64) DEFAULT NULL COMMENT '文件夹编码',
  `file_upload_id` varchar(64) DEFAULT NULL COMMENT '文件上传编码',
  `file_name` varchar(500) NOT NULL COMMENT '文件或文件夹名',
  `receive_user_code` varchar(100) NOT NULL COMMENT '接受者用户编码',
  `receive_user_name` varchar(200) NOT NULL COMMENT '接收者用户名称',
  `click_num` decimal(10,0) DEFAULT NULL COMMENT '点击次数',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `idx_sys_file_share_ruc` (`receive_user_code`),
  KEY `idx_sys_file_share_cb` (`create_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件管理共享表';

-- ----------------------------
-- Records of js_filemanager_shared
-- ----------------------------

-- ----------------------------
-- Table structure for js_gen_table
-- ----------------------------
DROP TABLE IF EXISTS `js_gen_table`;
CREATE TABLE `js_gen_table` (
  `table_name` varchar(64) NOT NULL COMMENT '表名',
  `class_name` varchar(100) NOT NULL COMMENT '实体类名称',
  `comments` varchar(500) NOT NULL COMMENT '表说明',
  `parent_table_name` varchar(64) DEFAULT NULL COMMENT '关联父表的表名',
  `parent_table_fk_name` varchar(64) DEFAULT NULL COMMENT '本表关联父表的外键名',
  `data_source_name` varchar(64) DEFAULT NULL COMMENT '数据源名称',
  `tpl_category` varchar(200) DEFAULT NULL COMMENT '使用的模板',
  `package_name` varchar(500) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(200) DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(50) DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_base_dir` varchar(1000) DEFAULT NULL COMMENT '生成基础路径',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`table_name`),
  KEY `idx_gen_table_ptn` (`parent_table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码生成表';

-- ----------------------------
-- Records of js_gen_table
-- ----------------------------
INSERT INTO `js_gen_table` VALUES ('test_data', 'TestData', '测试数据', null, null, null, 'crud', 'com.jeesite.modules', 'test', '', '测试数据', '数据', 'ThinkGem', null, '{\"isHaveDelete\":\"1\",\"isFileUpload\":\"1\",\"isHaveDisableEnable\":\"1\",\"isImageUpload\":\"1\"}', 'system', '2019-11-26 09:10:25', 'system', '2019-11-26 09:10:25', null);
INSERT INTO `js_gen_table` VALUES ('test_data_child', 'TestDataChild', '测试数据子表', 'test_data', 'test_data_id', null, 'crud', 'com.jeesite.modules', 'test', '', '测试子表', '数据', 'ThinkGem', null, null, 'system', '2019-11-26 09:10:25', 'system', '2019-11-26 09:10:25', null);
INSERT INTO `js_gen_table` VALUES ('test_tree', 'TestTree', '测试树表', null, null, null, 'treeGrid', 'com.jeesite.modules', 'test', '', '测试树表', '数据', 'ThinkGem', null, '{\"treeViewName\":\"tree_name\",\"isHaveDelete\":\"1\",\"treeViewCode\":\"tree_code\",\"isFileUpload\":\"1\",\"isHaveDisableEnable\":\"1\",\"isImageUpload\":\"1\"}', 'system', '2019-11-26 09:10:25', 'system', '2019-11-26 09:10:25', null);

-- ----------------------------
-- Table structure for js_gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `js_gen_table_column`;
CREATE TABLE `js_gen_table_column` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `table_name` varchar(64) NOT NULL COMMENT '表名',
  `column_name` varchar(64) NOT NULL COMMENT '列名',
  `column_sort` decimal(10,0) DEFAULT NULL COMMENT '列排序（升序）',
  `column_type` varchar(100) NOT NULL COMMENT '类型',
  `column_label` varchar(50) DEFAULT NULL COMMENT '列标签名',
  `comments` varchar(500) NOT NULL COMMENT '列备注说明',
  `attr_name` varchar(200) NOT NULL COMMENT '类的属性名',
  `attr_type` varchar(200) NOT NULL COMMENT '类的属性类型',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键',
  `is_null` char(1) DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否插入字段',
  `is_update` char(1) DEFAULT NULL COMMENT '是否更新字段',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) DEFAULT NULL COMMENT '查询方式',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段',
  `show_type` varchar(200) DEFAULT NULL COMMENT '表单类型',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  PRIMARY KEY (`id`),
  KEY `idx_gen_table_column_tn` (`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码生成表列';

-- ----------------------------
-- Records of js_gen_table_column
-- ----------------------------
INSERT INTO `js_gen_table_column` VALUES ('1199133270238269440', 'test_data', 'id', '10', 'varchar(64)', '编号', '编号', 'id', 'String', '1', '0', '1', null, null, null, null, '1', 'hidden', '{\"fieldValid\":\"abc\"}');
INSERT INTO `js_gen_table_column` VALUES ('1199133270250852352', 'test_data', 'test_input', '20', 'varchar(200)', '单行文本', '单行文本', 'testInput', 'String', null, '1', '1', '1', '1', '1', 'LIKE', '1', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133270267629568', 'test_data', 'test_textarea', '30', 'varchar(200)', '多行文本', '多行文本', 'testTextarea', 'String', null, '1', '1', '1', '1', '1', 'LIKE', '1', 'textarea', '{\"isNewLine\":\"1\",\"gridRowCol\":\"12/2/10\"}');
INSERT INTO `js_gen_table_column` VALUES ('1199133270288601088', 'test_data', 'test_select', '40', 'varchar(10)', '下拉框', '下拉框', 'testSelect', 'String', null, '1', '1', '1', '1', '1', null, '1', 'select', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1199133270305378304', 'test_data', 'test_select_multiple', '50', 'varchar(200)', '下拉多选', '下拉多选', 'testSelectMultiple', 'String', null, '1', '1', '1', '1', '1', null, '1', 'select_multiple', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1199133270322155520', 'test_data', 'test_radio', '60', 'varchar(10)', '单选框', '单选框', 'testRadio', 'String', null, '1', '1', '1', '1', '1', null, '1', 'radio', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1199133270338932736', 'test_data', 'test_checkbox', '70', 'varchar(200)', '复选框', '复选框', 'testCheckbox', 'String', null, '1', '1', '1', '1', '1', null, '1', 'checkbox', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1199133270351515648', 'test_data', 'test_date', '80', 'datetime', '日期选择', '日期选择', 'testDate', 'java.util.Date', null, '1', '1', '1', '1', '1', 'BETWEEN', '1', 'date', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133270372487168', 'test_data', 'test_datetime', '90', 'datetime', '日期时间', '日期时间', 'testDatetime', 'java.util.Date', null, '1', '1', '1', '1', '1', 'BETWEEN', '1', 'datetime', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133270393458688', 'test_data', 'test_user_code', '100', 'varchar(64)', '用户选择', '用户选择', 'testUser', 'com.jeesite.modules.sys.entity.User', null, '1', '1', '1', '1', '1', null, '1', 'userselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133270406041600', 'test_data', 'test_office_code', '110', 'varchar(64)', '机构选择', '机构选择', 'testOffice', 'com.jeesite.modules.sys.entity.Office', null, '1', '1', '1', '1', '1', null, '1', 'officeselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133270422818816', 'test_data', 'test_area_code', '120', 'varchar(64)', '区域选择', '区域选择', 'testAreaCode|testAreaName', 'String', null, '1', '1', '1', '1', '1', null, '1', 'areaselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133270439596032', 'test_data', 'test_area_name', '130', 'varchar(100)', '区域名称', '区域名称', 'testAreaName', 'String', null, '1', '1', '1', '1', '0', 'LIKE', '0', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133270452178944', 'test_data', 'status', '140', 'char(1)', '状态', '状态（0正常 1删除 2停用）', 'status', 'String', null, '0', '1', '0', '1', '1', null, null, 'select', '{\"dictName\":\"sys_search_status\",\"dictType\":\"sys_search_status\"}');
INSERT INTO `js_gen_table_column` VALUES ('1199133270468956160', 'test_data', 'create_by', '150', 'varchar(64)', '创建者', '创建者', 'createBy', 'String', null, '0', '1', null, null, null, null, null, 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133270481539072', 'test_data', 'create_date', '160', 'datetime', '创建时间', '创建时间', 'createDate', 'java.util.Date', null, '0', '1', null, null, null, null, null, 'dateselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133270498316288', 'test_data', 'update_by', '170', 'varchar(64)', '更新者', '更新者', 'updateBy', 'String', null, '0', '1', '1', null, null, null, null, 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133270515093504', 'test_data', 'update_date', '180', 'datetime', '更新时间', '更新时间', 'updateDate', 'java.util.Date', null, '0', '1', '1', '1', null, null, null, 'dateselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133270527676416', 'test_data', 'remarks', '190', 'varchar(500)', '备注信息', '备注信息', 'remarks', 'String', null, '1', '1', '1', '1', '1', 'LIKE', '1', 'textarea', '{\"isNewLine\":\"1\",\"gridRowCol\":\"12/2/10\"}');
INSERT INTO `js_gen_table_column` VALUES ('1199133270607368192', 'test_data_child', 'id', '10', 'varchar(64)', '编号', '编号', 'id', 'String', '1', '0', '1', null, null, null, null, '1', 'hidden', '{\"fieldValid\":\"abc\"}');
INSERT INTO `js_gen_table_column` VALUES ('1199133270624145408', 'test_data_child', 'test_sort', '20', 'int(11)', '排序号', '排序号', 'testSort', 'Long', null, '1', '1', '1', '1', '1', null, '1', 'input', '{\"fieldValid\":\"digits\"}');
INSERT INTO `js_gen_table_column` VALUES ('1199133270636728320', 'test_data_child', 'test_data_id', '30', 'varchar(64)', '父表主键', '父表主键', 'testData', 'String', null, '1', '1', '1', '1', '1', null, '1', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133270653505536', 'test_data_child', 'test_input', '40', 'varchar(200)', '单行文本', '单行文本', 'testInput', 'String', null, '1', '1', '1', '1', '1', 'LIKE', '1', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133270666088448', 'test_data_child', 'test_textarea', '50', 'varchar(200)', '多行文本', '多行文本', 'testTextarea', 'String', null, '1', '1', '1', '1', '1', 'LIKE', '1', 'textarea', '{\"isNewLine\":\"1\",\"gridRowCol\":\"12/2/10\"}');
INSERT INTO `js_gen_table_column` VALUES ('1199133270682865664', 'test_data_child', 'test_select', '60', 'varchar(10)', '下拉框', '下拉框', 'testSelect', 'String', null, '1', '1', '1', '1', '1', null, '1', 'select', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1199133270695448576', 'test_data_child', 'test_select_multiple', '70', 'varchar(200)', '下拉多选', '下拉多选', 'testSelectMultiple', 'String', null, '1', '1', '1', '1', '1', null, '1', 'select_multiple', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1199133270712225792', 'test_data_child', 'test_radio', '80', 'varchar(10)', '单选框', '单选框', 'testRadio', 'String', null, '1', '1', '1', '1', '1', null, '1', 'radio', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1199133270724808704', 'test_data_child', 'test_checkbox', '90', 'varchar(200)', '复选框', '复选框', 'testCheckbox', 'String', null, '1', '1', '1', '1', '1', null, '1', 'checkbox', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1199133270741585920', 'test_data_child', 'test_date', '100', 'datetime', '日期选择', '日期选择', 'testDate', 'java.util.Date', null, '1', '1', '1', '1', '1', 'BETWEEN', '1', 'date', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133270758363136', 'test_data_child', 'test_datetime', '110', 'datetime', '日期时间', '日期时间', 'testDatetime', 'java.util.Date', null, '1', '1', '1', '1', '1', 'BETWEEN', '1', 'datetime', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133270770946048', 'test_data_child', 'test_user_code', '120', 'varchar(64)', '用户选择', '用户选择', 'testUser', 'com.jeesite.modules.sys.entity.User', null, '1', '1', '1', '1', '1', null, '1', 'userselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133270787723264', 'test_data_child', 'test_office_code', '130', 'varchar(64)', '机构选择', '机构选择', 'testOffice', 'com.jeesite.modules.sys.entity.Office', null, '1', '1', '1', '1', '1', null, '1', 'officeselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133270804500480', 'test_data_child', 'test_area_code', '140', 'varchar(64)', '区域选择', '区域选择', 'testAreaCode|testAreaName', 'String', null, '1', '1', '1', '1', '1', null, '1', 'areaselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133270817083392', 'test_data_child', 'test_area_name', '150', 'varchar(100)', '区域名称', '区域名称', 'testAreaName', 'String', null, '1', '1', '1', '1', '0', 'LIKE', '0', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133270896775168', 'test_tree', 'tree_code', '10', 'varchar(64)', '节点编码', '节点编码', 'treeCode', 'String', '1', '0', '1', null, null, null, null, '1', 'input', '{\"fieldValid\":\"abc\"}');
INSERT INTO `js_gen_table_column` VALUES ('1199133270909358080', 'test_tree', 'parent_code', '20', 'varchar(64)', '父级编号', '父级编号', 'parentCode|parentName', 'This', null, '0', '1', '1', null, null, null, null, 'treeselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133270921940992', 'test_tree', 'parent_codes', '30', 'varchar(1000)', '所有父级编号', '所有父级编号', 'parentCodes', 'String', null, '0', '1', '1', null, null, 'LIKE', '0', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133270938718208', 'test_tree', 'tree_sort', '40', 'decimal(10,0)', '本级排序号', '本级排序号（升序）', 'treeSort', 'Integer', null, '0', '1', '1', '1', null, null, '1', 'input', '{\"fieldValid\":\"digits\"}');
INSERT INTO `js_gen_table_column` VALUES ('1199133270951301120', 'test_tree', 'tree_sorts', '50', 'varchar(1000)', '所有级别排序号', '所有级别排序号', 'treeSorts', 'String', null, '0', '1', '1', '0', null, null, '0', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133270968078336', 'test_tree', 'tree_leaf', '60', 'char(1)', '是否最末级', '是否最末级', 'treeLeaf', 'String', null, '0', '1', '1', null, null, null, null, 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133270980661248', 'test_tree', 'tree_level', '70', 'decimal(4,0)', '层次级别', '层次级别', 'treeLevel', 'Integer', null, '0', '1', '1', null, null, null, null, 'input', '{\"fieldValid\":\"digits\"}');
INSERT INTO `js_gen_table_column` VALUES ('1199133270997438464', 'test_tree', 'tree_names', '80', 'varchar(1000)', '全节点名', '全节点名', 'treeNames', 'String', null, '0', '1', '1', null, '1', 'LIKE', null, 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133271014215680', 'test_tree', 'tree_name', '90', 'varchar(200)', '节点名称', '节点名称', 'treeName', 'String', null, '0', '1', '1', '1', '1', 'LIKE', '1', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133271026798592', 'test_tree', 'status', '100', 'char(1)', '状态', '状态（0正常 1删除 2停用）', 'status', 'String', null, '0', '1', '0', '1', '1', null, null, 'select', '{\"dictName\":\"sys_search_status\",\"dictType\":\"sys_search_status\"}');
INSERT INTO `js_gen_table_column` VALUES ('1199133271039381504', 'test_tree', 'create_by', '110', 'varchar(64)', '创建者', '创建者', 'createBy', 'String', null, '0', '1', null, null, null, null, null, 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133271051964416', 'test_tree', 'create_date', '120', 'datetime', '创建时间', '创建时间', 'createDate', 'java.util.Date', null, '0', '1', null, null, null, null, null, 'dateselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133271068741632', 'test_tree', 'update_by', '130', 'varchar(64)', '更新者', '更新者', 'updateBy', 'String', null, '0', '1', '1', null, null, null, null, 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133271081324544', 'test_tree', 'update_date', '140', 'datetime', '更新时间', '更新时间', 'updateDate', 'java.util.Date', null, '0', '1', '1', '1', null, null, null, 'dateselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1199133271093907456', 'test_tree', 'remarks', '150', 'varchar(500)', '备注信息', '备注信息', 'remarks', 'String', null, '1', '1', '1', '1', '1', 'LIKE', '1', 'textarea', '{\"isNewLine\":\"1\",\"gridRowCol\":\"12/2/10\"}');

-- ----------------------------
-- Table structure for js_job_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `js_job_blob_triggers`;
CREATE TABLE `js_job_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `js_job_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `js_job_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_calendars
-- ----------------------------
DROP TABLE IF EXISTS `js_job_calendars`;
CREATE TABLE `js_job_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `js_job_cron_triggers`;
CREATE TABLE `js_job_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `js_job_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `js_job_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `js_job_fired_triggers`;
CREATE TABLE `js_job_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_job_details
-- ----------------------------
DROP TABLE IF EXISTS `js_job_job_details`;
CREATE TABLE `js_job_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_locks
-- ----------------------------
DROP TABLE IF EXISTS `js_job_locks`;
CREATE TABLE `js_job_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_locks
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `js_job_paused_trigger_grps`;
CREATE TABLE `js_job_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `js_job_scheduler_state`;
CREATE TABLE `js_job_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `js_job_simple_triggers`;
CREATE TABLE `js_job_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `js_job_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `js_job_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `js_job_simprop_triggers`;
CREATE TABLE `js_job_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `js_job_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `js_job_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_triggers
-- ----------------------------
DROP TABLE IF EXISTS `js_job_triggers`;
CREATE TABLE `js_job_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `js_job_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `js_job_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_area
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_area`;
CREATE TABLE `js_sys_area` (
  `area_code` varchar(100) NOT NULL COMMENT '区域编码',
  `parent_code` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(1000) NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10,0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1000) NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4,0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(1000) NOT NULL COMMENT '全节点名',
  `area_name` varchar(100) NOT NULL COMMENT '区域名称',
  `area_type` char(1) DEFAULT NULL COMMENT '区域类型',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`area_code`),
  KEY `idx_sys_area_pc` (`parent_code`),
  KEY `idx_sys_area_ts` (`tree_sort`),
  KEY `idx_sys_area_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行政区划';

-- ----------------------------
-- Records of js_sys_area
-- ----------------------------
INSERT INTO `js_sys_area` VALUES ('370000', '0', '0,', '370000', '0000370000,', '0', '0', '山东省', '山东省', '1', '0', 'system', '2019-11-26 09:10:14', 'system', '2019-11-26 09:10:14', null);
INSERT INTO `js_sys_area` VALUES ('370100', '370000', '0,370000,', '370100', '0000370000,0000370100,', '0', '1', '山东省/济南市', '济南市', '2', '0', 'system', '2019-11-26 09:10:14', 'system', '2019-11-26 09:10:14', null);
INSERT INTO `js_sys_area` VALUES ('370102', '370100', '0,370000,370100,', '370102', '0000370000,0000370100,0000370102,', '1', '2', '山东省/济南市/历下区', '历下区', '3', '0', 'system', '2019-11-26 09:10:14', 'system', '2019-11-26 09:10:14', null);
INSERT INTO `js_sys_area` VALUES ('370103', '370100', '0,370000,370100,', '370103', '0000370000,0000370100,0000370103,', '1', '2', '山东省/济南市/市中区', '市中区', '3', '0', 'system', '2019-11-26 09:10:14', 'system', '2019-11-26 09:10:14', null);
INSERT INTO `js_sys_area` VALUES ('370104', '370100', '0,370000,370100,', '370104', '0000370000,0000370100,0000370104,', '1', '2', '山东省/济南市/槐荫区', '槐荫区', '3', '0', 'system', '2019-11-26 09:10:14', 'system', '2019-11-26 09:10:14', null);
INSERT INTO `js_sys_area` VALUES ('370105', '370100', '0,370000,370100,', '370105', '0000370000,0000370100,0000370105,', '1', '2', '山东省/济南市/天桥区', '天桥区', '3', '0', 'system', '2019-11-26 09:10:14', 'system', '2019-11-26 09:10:14', null);
INSERT INTO `js_sys_area` VALUES ('370112', '370100', '0,370000,370100,', '370112', '0000370000,0000370100,0000370112,', '1', '2', '山东省/济南市/历城区', '历城区', '3', '0', 'system', '2019-11-26 09:10:14', 'system', '2019-11-26 09:10:14', null);
INSERT INTO `js_sys_area` VALUES ('370113', '370100', '0,370000,370100,', '370113', '0000370000,0000370100,0000370113,', '1', '2', '山东省/济南市/长清区', '长清区', '3', '0', 'system', '2019-11-26 09:10:14', 'system', '2019-11-26 09:10:14', null);
INSERT INTO `js_sys_area` VALUES ('370114', '370100', '0,370000,370100,', '370114', '0000370000,0000370100,0000370114,', '1', '2', '山东省/济南市/章丘区', '章丘区', '3', '0', 'system', '2019-11-26 09:10:14', 'system', '2019-11-26 09:10:14', null);
INSERT INTO `js_sys_area` VALUES ('370124', '370100', '0,370000,370100,', '370124', '0000370000,0000370100,0000370124,', '1', '2', '山东省/济南市/平阴县', '平阴县', '3', '0', 'system', '2019-11-26 09:10:14', 'system', '2019-11-26 09:10:14', null);
INSERT INTO `js_sys_area` VALUES ('370125', '370100', '0,370000,370100,', '370125', '0000370000,0000370100,0000370125,', '1', '2', '山东省/济南市/济阳县', '济阳县', '3', '0', 'system', '2019-11-26 09:10:14', 'system', '2019-11-26 09:10:14', null);
INSERT INTO `js_sys_area` VALUES ('370126', '370100', '0,370000,370100,', '370126', '0000370000,0000370100,0000370126,', '1', '2', '山东省/济南市/商河县', '商河县', '3', '0', 'system', '2019-11-26 09:10:14', 'system', '2019-11-26 09:10:14', null);
INSERT INTO `js_sys_area` VALUES ('370200', '370000', '0,370000,', '370200', '0000370000,0000370200,', '0', '1', '山东省/青岛市', '青岛市', '2', '0', 'system', '2019-11-26 09:10:14', 'system', '2019-11-26 09:10:14', null);
INSERT INTO `js_sys_area` VALUES ('370202', '370200', '0,370000,370200,', '370202', '0000370000,0000370200,0000370202,', '1', '2', '山东省/青岛市/市南区', '市南区', '3', '0', 'system', '2019-11-26 09:10:14', 'system', '2019-11-26 09:10:14', null);
INSERT INTO `js_sys_area` VALUES ('370203', '370200', '0,370000,370200,', '370203', '0000370000,0000370200,0000370203,', '1', '2', '山东省/青岛市/市北区', '市北区', '3', '0', 'system', '2019-11-26 09:10:15', 'system', '2019-11-26 09:10:15', null);
INSERT INTO `js_sys_area` VALUES ('370211', '370200', '0,370000,370200,', '370211', '0000370000,0000370200,0000370211,', '1', '2', '山东省/青岛市/黄岛区', '黄岛区', '3', '0', 'system', '2019-11-26 09:10:15', 'system', '2019-11-26 09:10:15', null);
INSERT INTO `js_sys_area` VALUES ('370212', '370200', '0,370000,370200,', '370212', '0000370000,0000370200,0000370212,', '1', '2', '山东省/青岛市/崂山区', '崂山区', '3', '0', 'system', '2019-11-26 09:10:15', 'system', '2019-11-26 09:10:15', null);
INSERT INTO `js_sys_area` VALUES ('370213', '370200', '0,370000,370200,', '370213', '0000370000,0000370200,0000370213,', '1', '2', '山东省/青岛市/李沧区', '李沧区', '3', '0', 'system', '2019-11-26 09:10:15', 'system', '2019-11-26 09:10:15', null);
INSERT INTO `js_sys_area` VALUES ('370214', '370200', '0,370000,370200,', '370214', '0000370000,0000370200,0000370214,', '1', '2', '山东省/青岛市/城阳区', '城阳区', '3', '0', 'system', '2019-11-26 09:10:15', 'system', '2019-11-26 09:10:15', null);
INSERT INTO `js_sys_area` VALUES ('370281', '370200', '0,370000,370200,', '370281', '0000370000,0000370200,0000370281,', '1', '2', '山东省/青岛市/胶州市', '胶州市', '3', '0', 'system', '2019-11-26 09:10:15', 'system', '2019-11-26 09:10:15', null);
INSERT INTO `js_sys_area` VALUES ('370282', '370200', '0,370000,370200,', '370282', '0000370000,0000370200,0000370282,', '1', '2', '山东省/青岛市/即墨区', '即墨区', '3', '0', 'system', '2019-11-26 09:10:15', 'system', '2019-11-26 09:10:15', null);
INSERT INTO `js_sys_area` VALUES ('370283', '370200', '0,370000,370200,', '370283', '0000370000,0000370200,0000370283,', '1', '2', '山东省/青岛市/平度市', '平度市', '3', '0', 'system', '2019-11-26 09:10:15', 'system', '2019-11-26 09:10:15', null);
INSERT INTO `js_sys_area` VALUES ('370285', '370200', '0,370000,370200,', '370285', '0000370000,0000370200,0000370285,', '1', '2', '山东省/青岛市/莱西市', '莱西市', '3', '0', 'system', '2019-11-26 09:10:15', 'system', '2019-11-26 09:10:15', null);

-- ----------------------------
-- Table structure for js_sys_company
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_company`;
CREATE TABLE `js_sys_company` (
  `company_code` varchar(64) NOT NULL COMMENT '公司编码',
  `parent_code` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(1000) NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10,0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1000) NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4,0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(1000) NOT NULL COMMENT '全节点名',
  `view_code` varchar(100) NOT NULL COMMENT '公司代码',
  `company_name` varchar(200) NOT NULL COMMENT '公司名称',
  `full_name` varchar(200) NOT NULL COMMENT '公司全称',
  `area_code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  `extend_s1` varchar(500) DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`company_code`),
  KEY `idx_sys_company_cc` (`corp_code`),
  KEY `idx_sys_company_pc` (`parent_code`),
  KEY `idx_sys_company_ts` (`tree_sort`),
  KEY `idx_sys_company_status` (`status`),
  KEY `idx_sys_company_vc` (`view_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司表';

-- ----------------------------
-- Records of js_sys_company
-- ----------------------------
INSERT INTO `js_sys_company` VALUES ('SD', '0', '0,', '40', '0000000040,', '0', '0', '山东公司', 'SD', '山东公司', '山东公司', null, '0', 'system', '2019-11-26 09:10:23', 'system', '2019-11-26 09:10:23', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_company` VALUES ('SDJN', 'SD', '0,SD,', '30', '0000000040,0000000030,', '1', '1', '山东公司/济南公司', 'SDJN', '济南公司', '山东济南公司', null, '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_company` VALUES ('SDQD', 'SD', '0,SD,', '40', '0000000040,0000000040,', '1', '1', '山东公司/青岛公司', 'SDQD', '青岛公司', '山东青岛公司', null, '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for js_sys_company_office
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_company_office`;
CREATE TABLE `js_sys_company_office` (
  `company_code` varchar(64) NOT NULL COMMENT '公司编码',
  `office_code` varchar(64) NOT NULL COMMENT '机构编码',
  PRIMARY KEY (`company_code`,`office_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司部门关联表';

-- ----------------------------
-- Records of js_sys_company_office
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_config
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_config`;
CREATE TABLE `js_sys_config` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `config_name` varchar(100) NOT NULL COMMENT '名称',
  `config_key` varchar(100) NOT NULL COMMENT '参数键',
  `config_value` varchar(1000) DEFAULT NULL COMMENT '参数值',
  `is_sys` char(1) NOT NULL COMMENT '系统内置（1是 0否）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sys_config_key` (`config_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of js_sys_config
-- ----------------------------
INSERT INTO `js_sys_config` VALUES ('1199133228161011712', '研发工具-代码生成默认包名', 'gen.defaultPackageName', 'com.jeesite.modules', '0', 'system', '2019-11-26 09:10:15', 'system', '2019-11-26 09:10:15', '新建项目后，修改该键值，在生成代码的时候就不要再修改了');
INSERT INTO `js_sys_config` VALUES ('1199133228320395264', '主框架页-桌面仪表盘首页地址', 'sys.index.desktopUrl', '/desktop', '0', 'system', '2019-11-26 09:10:15', 'system', '2019-11-26 09:10:15', '主页面的第一个页签首页桌面地址');
INSERT INTO `js_sys_config` VALUES ('1199133228412669952', '主框架页-主导航菜单显示风格', 'sys.index.menuStyle', '1', '0', 'system', '2019-11-26 09:10:15', 'system', '2019-11-26 09:10:15', '1：菜单全部在左侧；2：根菜单显示在顶部');
INSERT INTO `js_sys_config` VALUES ('1199133228509138944', '主框架页-侧边栏的默认显示样式', 'sys.index.sidebarStyle', '1', '0', 'system', '2019-11-26 09:10:15', 'system', '2019-11-26 09:10:15', '1：默认显示侧边栏；2：默认折叠侧边栏');
INSERT INTO `js_sys_config` VALUES ('1199133228601413632', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue-light2', '0', 'system', '2019-11-26 09:10:15', 'system', '2019-11-26 09:10:15', 'skin-black-light、skin-black、skin-blue-light、skin-blue、skin-green-light、skin-green、skin-purple-light、skin-purple、skin-red-light、skin-red、skin-yellow-light、skin-yellow');
INSERT INTO `js_sys_config` VALUES ('1199133228689494016', '用户登录-登录失败多少次数后显示验证码', 'sys.login.failedNumAfterValidCode', '100', '0', 'system', '2019-11-26 09:10:15', 'system', '2019-11-26 09:10:15', '设置为0强制使用验证码登录');
INSERT INTO `js_sys_config` VALUES ('1199133228785963008', '用户登录-登录失败多少次数后锁定账号', 'sys.login.failedNumAfterLockAccount', '200', '0', 'system', '2019-11-26 09:10:15', 'system', '2019-11-26 09:10:15', '登录失败多少次数后锁定账号');
INSERT INTO `js_sys_config` VALUES ('1199133228882432000', '用户登录-登录失败多少次数后锁定账号的时间', 'sys.login.failedNumAfterLockMinute', '20', '0', 'system', '2019-11-26 09:10:15', 'system', '2019-11-26 09:10:15', '锁定账号的时间（单位：分钟）');
INSERT INTO `js_sys_config` VALUES ('1199133228978900992', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', '0', 'system', '2019-11-26 09:10:15', 'system', '2019-11-26 09:10:15', '是否开启注册用户功能');
INSERT INTO `js_sys_config` VALUES ('1199133229075369984', '账号自助-允许自助注册的用户类型', 'sys.account.registerUser.userTypes', '-1', '0', 'system', '2019-11-26 09:10:15', 'system', '2019-11-26 09:10:15', '允许注册的用户类型（多个用逗号隔开，如果注册时不选择用户类型，则第一个为默认类型）');
INSERT INTO `js_sys_config` VALUES ('1199133229163450368', '账号自助-验证码有效时间（分钟）', 'sys.account.validCodeTimeout', '10', '0', 'system', '2019-11-26 09:10:15', 'system', '2019-11-26 09:10:15', '找回密码时，短信/邮件验证码有效时间（单位：分钟，0表示不限制）');
INSERT INTO `js_sys_config` VALUES ('1199133229255725056', '用户管理-账号默认角色-员工类型', 'sys.user.defaultRoleCodes.employee', 'default', '0', 'system', '2019-11-26 09:10:15', 'system', '2019-11-26 09:10:15', '所有员工用户都拥有的角色权限（适用于菜单授权查询）');
INSERT INTO `js_sys_config` VALUES ('1199133229347999744', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', '0', 'system', '2019-11-26 09:10:15', 'system', '2019-11-26 09:10:15', '创建用户和重置密码的时候用户的密码');
INSERT INTO `js_sys_config` VALUES ('1199133229440274432', '用户管理-初始密码修改策略', 'sys.user.initPasswordModify', '1', '0', 'system', '2019-11-26 09:10:15', 'system', '2019-11-26 09:10:15', '0：初始密码修改策略关闭，没有任何提示；1：提醒用户，如果未修改初始密码，则在登录时和点击菜单就会提醒修改密码对话框；2：强制实行初始密码修改，登录后若不修改密码则不能进行系统操作');
INSERT INTO `js_sys_config` VALUES ('1199133229528354816', '用户管理-账号密码修改策略', 'sys.user.passwordModify', '1', '0', 'system', '2019-11-26 09:10:15', 'system', '2019-11-26 09:10:15', '0：密码修改策略关闭，没有任何提示；1：提醒用户，如果未修改初始密码，则在登录时和点击菜单就会提醒修改密码对话框；2：强制实行初始密码修改，登录后若不修改密码则不能进行系统操作。');
INSERT INTO `js_sys_config` VALUES ('1199133229620629504', '用户管理-账号密码修改策略验证周期', 'sys.user.passwordModifyCycle', '30', '0', 'system', '2019-11-26 09:10:15', 'system', '2019-11-26 09:10:15', '密码安全修改周期是指定时间内提醒或必须修改密码（例如设置30天）的验证时间（天），超过这个时间登录系统时需，提醒用户修改密码或强制修改密码才能继续使用系统。单位：天，如果设置30天，则第31天开始强制修改密码');
INSERT INTO `js_sys_config` VALUES ('1199133229712904192', '用户管理-密码修改多少次内不允许重复', 'sys.user.passwordModifyNotRepeatNum', '1', '0', 'system', '2019-11-26 09:10:15', 'system', '2019-11-26 09:10:15', '默认1次，表示不能与上次密码重复；若设置为3，表示并与前3次密码重复');
INSERT INTO `js_sys_config` VALUES ('1199133229809373184', '用户管理-账号密码修改最低安全等级', 'sys.user.passwordModifySecurityLevel', '0', '0', 'system', '2019-11-26 09:10:15', 'system', '2019-11-26 09:10:15', '0：不限制等级（用户在修改密码的时候不进行等级验证）\r；1：限制最低等级为很弱\r；2：限制最低等级为弱\r；3：限制最低等级为安全\r；4：限制最低等级为很安全');

-- ----------------------------
-- Table structure for js_sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_dict_data`;
CREATE TABLE `js_sys_dict_data` (
  `dict_code` varchar(64) NOT NULL COMMENT '字典编码',
  `parent_code` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(1000) NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10,0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1000) NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4,0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(1000) NOT NULL COMMENT '全节点名',
  `dict_label` varchar(100) NOT NULL COMMENT '字典标签',
  `dict_value` varchar(100) NOT NULL COMMENT '字典键值',
  `dict_type` varchar(100) NOT NULL COMMENT '字典类型',
  `is_sys` char(1) NOT NULL COMMENT '系统内置（1是 0否）',
  `description` varchar(500) DEFAULT NULL COMMENT '字典描述',
  `css_style` varchar(500) DEFAULT NULL COMMENT 'css样式（如：color:red)',
  `css_class` varchar(500) DEFAULT NULL COMMENT 'css类名（如：red）',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  `extend_s1` varchar(500) DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`dict_code`),
  KEY `idx_sys_dict_data_cc` (`corp_code`),
  KEY `idx_sys_dict_data_dt` (`dict_type`),
  KEY `idx_sys_dict_data_pc` (`parent_code`),
  KEY `idx_sys_dict_data_status` (`status`),
  KEY `idx_sys_dict_data_ts` (`tree_sort`),
  KEY `idx_sys_dict_data_dv` (`dict_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of js_sys_dict_data
-- ----------------------------
INSERT INTO `js_sys_dict_data` VALUES ('1199133234351804416', '0', '0,', '30', '0000000030,', '1', '0', '是', '是', '1', 'sys_yes_no', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133234574102528', '0', '0,', '40', '0000000040,', '1', '0', '否', '否', '0', 'sys_yes_no', '1', '', 'color:#aaa;', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133234657988608', '0', '0,', '20', '0000000020,', '1', '0', '正常', '正常', '0', 'sys_status', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133234733486080', '0', '0,', '30', '0000000030,', '1', '0', '删除', '删除', '1', 'sys_status', '1', '', 'color:#f00;', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133234813177856', '0', '0,', '40', '0000000040,', '1', '0', '停用', '停用', '2', 'sys_status', '1', '', 'color:#f00;', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133234901258240', '0', '0,', '50', '0000000050,', '1', '0', '冻结', '冻结', '3', 'sys_status', '1', '', 'color:#fa0;', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133234976755712', '0', '0,', '60', '0000000060,', '1', '0', '待审', '待审', '4', 'sys_status', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133235052253184', '0', '0,', '70', '0000000070,', '1', '0', '驳回', '驳回', '5', 'sys_status', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133235152916480', '0', '0,', '80', '0000000080,', '1', '0', '草稿', '草稿', '9', 'sys_status', '1', '', 'color:#aaa;', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133235240996864', '0', '0,', '30', '0000000030,', '1', '0', '显示', '显示', '1', 'sys_show_hide', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133235320688640', '0', '0,', '40', '0000000040,', '1', '0', '隐藏', '隐藏', '0', 'sys_show_hide', '1', '', 'color:#aaa;', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133235408769024', '0', '0,', '30', '0000000030,', '1', '0', '简体中文', '简体中文', 'zh_CN', 'sys_lang_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133235484266496', '0', '0,', '40', '0000000040,', '1', '0', 'English', 'English', 'en', 'sys_lang_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133235563958272', '0', '0,', '60', '0000000060,', '1', '0', '日本語', '日本語', 'ja_JP', 'sys_lang_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133235643650048', '0', '0,', '30', '0000000030,', '1', '0', 'PC电脑', 'PC电脑', 'pc', 'sys_device_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133235723341824', '0', '0,', '40', '0000000040,', '1', '0', '手机APP', '手机APP', 'mobileApp', 'sys_device_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133235811422208', '0', '0,', '50', '0000000050,', '1', '0', '手机Web', '手机Web', 'mobileWeb', 'sys_device_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133235886919680', '0', '0,', '60', '0000000060,', '1', '0', '微信设备', '微信设备', 'weixin', 'sys_device_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133235970805760', '0', '0,', '30', '0000000030,', '1', '0', '主导航菜单', '主导航菜单', 'default', 'sys_menu_sys_code', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133236042108928', '0', '0,', '30', '0000000030,', '1', '0', '菜单', '菜单', '1', 'sys_menu_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133236117606400', '0', '0,', '40', '0000000040,', '1', '0', '权限', '权限', '2', 'sys_menu_type', '1', '', 'color:#c243d6;', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133236205686784', '0', '0,', '30', '0000000030,', '1', '0', '默认权重', '默认权重', '20', 'sys_menu_weight', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133236289572864', '0', '0,', '40', '0000000040,', '1', '0', '二级管理员', '二级管理员', '40', 'sys_menu_weight', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133236365070336', '0', '0,', '50', '0000000050,', '1', '0', '系统管理员', '系统管理员', '60', 'sys_menu_weight', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133236436373504', '0', '0,', '60', '0000000060,', '1', '0', '超级管理员', '超级管理员', '80', 'sys_menu_weight', '1', '', 'color:#c243d6;', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133236516065280', '0', '0,', '30', '0000000030,', '1', '0', '国家', '国家', '0', 'sys_area_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133236608339968', '0', '0,', '40', '0000000040,', '1', '0', '省份直辖市', '省份直辖市', '1', 'sys_area_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133236683837440', '0', '0,', '50', '0000000050,', '1', '0', '地市', '地市', '2', 'sys_area_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133236776112128', '0', '0,', '60', '0000000060,', '1', '0', '区县', '区县', '3', 'sys_area_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133236851609600', '0', '0,', '30', '0000000030,', '1', '0', '省级公司', '省级公司', '1', 'sys_office_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133236931301376', '0', '0,', '40', '0000000040,', '1', '0', '市级公司', '市级公司', '2', 'sys_office_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133237006798848', '0', '0,', '50', '0000000050,', '1', '0', '部门', '部门', '3', 'sys_office_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133237094879232', '0', '0,', '30', '0000000030,', '1', '0', '正常', '正常', '0', 'sys_search_status', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133237170376704', '0', '0,', '40', '0000000040,', '1', '0', '停用', '停用', '2', 'sys_search_status', '1', '', 'color:#f00;', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133237245874176', '0', '0,', '30', '0000000030,', '1', '0', '男', '男', '1', 'sys_user_sex', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133237317177344', '0', '0,', '40', '0000000040,', '1', '0', '女', '女', '2', 'sys_user_sex', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133237396869120', '0', '0,', '30', '0000000030,', '1', '0', '正常', '正常', '0', 'sys_user_status', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133237472366592', '0', '0,', '40', '0000000040,', '1', '0', '停用', '停用', '2', 'sys_user_status', '1', '', 'color:#f00;', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133237556252672', '0', '0,', '50', '0000000050,', '1', '0', '冻结', '冻结', '3', 'sys_user_status', '1', '', 'color:#fa0;', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133237644333056', '0', '0,', '30', '0000000030,', '1', '0', '员工', '员工', 'employee', 'sys_user_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133237719830528', '0', '0,', '40', '0000000040,', '1', '0', '会员', '会员', 'member', 'sys_user_type', '1', '', '', '', '2', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133237807910912', '0', '0,', '50', '0000000050,', '1', '0', '单位', '单位', 'btype', 'sys_user_type', '1', '', '', '', '2', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133237879214080', '0', '0,', '60', '0000000060,', '1', '0', '个人', '个人', 'persion', 'sys_user_type', '1', '', '', '', '2', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133237963100160', '0', '0,', '70', '0000000070,', '1', '0', '专家', '专家', 'expert', 'sys_user_type', '1', '', '', '', '2', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133238046986240', '0', '0,', '30', '0000000030,', '1', '0', '高管', '高管', '1', 'sys_role_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133238114095104', '0', '0,', '40', '0000000040,', '1', '0', '中层', '中层', '2', 'sys_role_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133238189592576', '0', '0,', '50', '0000000050,', '1', '0', '基层', '基层', '3', 'sys_role_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133238256701440', '0', '0,', '60', '0000000060,', '1', '0', '其它', '其它', '4', 'sys_role_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:17', 'system', '2019-11-26 09:10:17', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133238336393216', '0', '0,', '30', '0000000030,', '1', '0', '未设置', '未设置', '0', 'sys_role_data_scope', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133238424473600', '0', '0,', '40', '0000000040,', '1', '0', '全部数据', '全部数据', '1', 'sys_role_data_scope', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133238491582464', '0', '0,', '50', '0000000050,', '1', '0', '自定义数据', '自定义数据', '2', 'sys_role_data_scope', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133238579662848', '0', '0,', '60', '0000000060,', '1', '0', '本部门数据', '本部门数据', '3', 'sys_role_data_scope', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133238667743232', '0', '0,', '70', '0000000070,', '1', '0', '本公司数据', '本公司数据', '4', 'sys_role_data_scope', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133238747435008', '0', '0,', '80', '0000000080,', '1', '0', '本部门和本公司数据', '本部门和本公司数据', '5', 'sys_role_data_scope', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133238814543872', '0', '0,', '30', '0000000030,', '1', '0', '组织管理', '组织管理', 'office_user', 'sys_role_biz_scope', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133238902624256', '0', '0,', '30', '0000000030,', '1', '0', '高管', '高管', '1', 'sys_post_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133238986510336', '0', '0,', '40', '0000000040,', '1', '0', '中层', '中层', '2', 'sys_post_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133239078785024', '0', '0,', '50', '0000000050,', '1', '0', '基层', '基层', '3', 'sys_post_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133239150088192', '0', '0,', '60', '0000000060,', '1', '0', '其它', '其它', '4', 'sys_post_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133239225585664', '0', '0,', '30', '0000000030,', '1', '0', '接入日志', '接入日志', 'access', 'sys_log_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133239305277440', '0', '0,', '40', '0000000040,', '1', '0', '修改日志', '修改日志', 'update', 'sys_log_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133239376580608', '0', '0,', '50', '0000000050,', '1', '0', '查询日志', '查询日志', 'select', 'sys_log_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133239447883776', '0', '0,', '60', '0000000060,', '1', '0', '登录登出', '登录登出', 'loginLogout', 'sys_log_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133239527575552', '0', '0,', '30', '0000000030,', '1', '0', '默认', '默认', 'DEFAULT', 'sys_job_group', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133239615655936', '0', '0,', '40', '0000000040,', '1', '0', '系统', '系统', 'SYSTEM', 'sys_job_group', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133239686959104', '0', '0,', '30', '0000000030,', '1', '0', '错过计划等待本次计划完成后立即执行一次', '错过计划等待本次计划完成后立即执行一次', '1', 'sys_job_misfire_instruction', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133239775039488', '0', '0,', '40', '0000000040,', '1', '0', '本次执行时间根据上次结束时间重新计算（时间间隔方式）', '本次执行时间根据上次结束时间重新计算（时间间隔方式）', '2', 'sys_job_misfire_instruction', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133239850536960', '0', '0,', '30', '0000000030,', '1', '0', '正常', '正常', '0', 'sys_job_status', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133239930228736', '0', '0,', '40', '0000000040,', '1', '0', '删除', '删除', '1', 'sys_job_status', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133240005726208', '0', '0,', '50', '0000000050,', '1', '0', '暂停', '暂停', '2', 'sys_job_status', '1', '', 'color:#f00;', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133240081223680', '0', '0,', '30', '0000000030,', '1', '0', '完成', '完成', '3', 'sys_job_status', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133240169304064', '0', '0,', '40', '0000000040,', '1', '0', '错误', '错误', '4', 'sys_job_status', '1', '', 'color:#f00;', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133240244801536', '0', '0,', '50', '0000000050,', '1', '0', '运行', '运行', '5', 'sys_job_status', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133240328687616', '0', '0,', '30', '0000000030,', '1', '0', '计划日志', '计划日志', 'scheduler', 'sys_job_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133240416768000', '0', '0,', '40', '0000000040,', '1', '0', '任务日志', '任务日志', 'job', 'sys_job_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133240488071168', '0', '0,', '50', '0000000050,', '1', '0', '触发日志', '触发日志', 'trigger', 'sys_job_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133240571957248', '0', '0,', '30', '0000000030,', '1', '0', '计划创建', '计划创建', 'jobScheduled', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133240643260416', '0', '0,', '40', '0000000040,', '1', '0', '计划移除', '计划移除', 'jobUnscheduled', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133240722952192', '0', '0,', '50', '0000000050,', '1', '0', '计划暂停', '计划暂停', 'triggerPaused', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133240798449664', '0', '0,', '60', '0000000060,', '1', '0', '计划恢复', '计划恢复', 'triggerResumed', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133240873947136', '0', '0,', '70', '0000000070,', '1', '0', '调度错误', '调度错误', 'schedulerError', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133240945250304', '0', '0,', '80', '0000000080,', '1', '0', '任务执行', '任务执行', 'jobToBeExecuted', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133241024942080', '0', '0,', '90', '0000000090,', '1', '0', '任务结束', '任务结束', 'jobWasExecuted', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133241092050944', '0', '0,', '100', '0000000100,', '1', '0', '任务停止', '任务停止', 'jobExecutionVetoed', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133241175937024', '0', '0,', '110', '0000000110,', '1', '0', '触发计划', '触发计划', 'triggerFired', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133241276600320', '0', '0,', '120', '0000000120,', '1', '0', '触发验证', '触发验证', 'vetoJobExecution', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133241364680704', '0', '0,', '130', '0000000130,', '1', '0', '触发完成', '触发完成', 'triggerComplete', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133241440178176', '0', '0,', '140', '0000000140,', '1', '0', '触发错过', '触发错过', 'triggerMisfired', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133241507287040', '0', '0,', '30', '0000000030,', '1', '0', 'PC', 'PC', 'pc', 'sys_msg_type', '1', '消息类型', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133241586978816', '0', '0,', '40', '0000000040,', '1', '0', 'APP', 'APP', 'app', 'sys_msg_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133241670864896', '0', '0,', '50', '0000000050,', '1', '0', '短信', '短信', 'sms', 'sys_msg_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133241746362368', '0', '0,', '60', '0000000060,', '1', '0', '邮件', '邮件', 'email', 'sys_msg_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133241826054144', '0', '0,', '70', '0000000070,', '1', '0', '微信', '微信', 'weixin', 'sys_msg_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133241914134528', '0', '0,', '30', '0000000030,', '1', '0', '待推送', '待推送', '0', 'sys_msg_push_status', '1', '推送状态', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133241993826304', '0', '0,', '30', '0000000030,', '1', '0', '成功', '成功', '1', 'sys_msg_push_status', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133242065129472', '0', '0,', '40', '0000000040,', '1', '0', '失败', '失败', '2', 'sys_msg_push_status', '1', '', 'color:#f00;', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133242149015552', '0', '0,', '30', '0000000030,', '1', '0', '未送达', '未送达', '0', 'sys_msg_read_status', '1', '读取状态', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133242232901632', '0', '0,', '40', '0000000040,', '1', '0', '已读', '已读', '1', 'sys_msg_read_status', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133242320982016', '0', '0,', '50', '0000000050,', '1', '0', '未读', '未读', '2', 'sys_msg_read_status', '1', '', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133242409062400', '0', '0,', '30', '0000000030,', '1', '0', '普通', '普通', '1', 'msg_inner_content_level', '1', '内容级别', '', '', '0', 'system', '2019-11-26 09:10:18', 'system', '2019-11-26 09:10:18', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133242492948480', '0', '0,', '40', '0000000040,', '1', '0', '一般', '一般', '2', 'msg_inner_content_level', '1', '', '', '', '0', 'system', '2019-11-26 09:10:19', 'system', '2019-11-26 09:10:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133242576834560', '0', '0,', '50', '0000000050,', '1', '0', '紧急', '紧急', '3', 'msg_inner_content_level', '1', '', 'color:#f00;', '', '0', 'system', '2019-11-26 09:10:19', 'system', '2019-11-26 09:10:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133242660720640', '0', '0,', '30', '0000000030,', '1', '0', '公告', '公告', '1', 'msg_inner_content_type', '1', '内容类型', '', '', '0', 'system', '2019-11-26 09:10:19', 'system', '2019-11-26 09:10:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133242744606720', '0', '0,', '40', '0000000040,', '1', '0', '新闻', '新闻', '2', 'msg_inner_content_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:19', 'system', '2019-11-26 09:10:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133242828492800', '0', '0,', '50', '0000000050,', '1', '0', '会议', '会议', '3', 'msg_inner_content_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:19', 'system', '2019-11-26 09:10:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133242895601664', '0', '0,', '60', '0000000060,', '1', '0', '其它', '其它', '4', 'msg_inner_content_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:19', 'system', '2019-11-26 09:10:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133242979487744', '0', '0,', '30', '0000000030,', '1', '0', '全部', '全部', '0', 'msg_inner_receiver_type', '1', '接受类型', '', '', '0', 'system', '2019-11-26 09:10:19', 'system', '2019-11-26 09:10:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133243050790912', '0', '0,', '30', '0000000030,', '1', '0', '用户', '用户', '1', 'msg_inner_receiver_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:19', 'system', '2019-11-26 09:10:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133243134676992', '0', '0,', '40', '0000000040,', '1', '0', '部门', '部门', '2', 'msg_inner_receiver_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:19', 'system', '2019-11-26 09:10:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133243210174464', '0', '0,', '50', '0000000050,', '1', '0', '角色', '角色', '3', 'msg_inner_receiver_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:19', 'system', '2019-11-26 09:10:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133243298254848', '0', '0,', '60', '0000000060,', '1', '0', '岗位', '岗位', '4', 'msg_inner_receiver_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:19', 'system', '2019-11-26 09:10:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133243373752320', '0', '0,', '30', '0000000030,', '1', '0', '正常', '正常', '0', 'msg_inner_msg_status', '1', '消息状态', '', '', '0', 'system', '2019-11-26 09:10:19', 'system', '2019-11-26 09:10:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133243453444096', '0', '0,', '40', '0000000040,', '1', '0', '删除', '删除', '1', 'msg_inner_msg_status', '1', '', '', '', '0', 'system', '2019-11-26 09:10:19', 'system', '2019-11-26 09:10:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133243520552960', '0', '0,', '50', '0000000050,', '1', '0', '审核', '审核', '4', 'msg_inner_msg_status', '1', '', '', '', '0', 'system', '2019-11-26 09:10:19', 'system', '2019-11-26 09:10:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133243596050432', '0', '0,', '60', '0000000060,', '1', '0', '驳回', '驳回', '5', 'msg_inner_msg_status', '1', '', 'color:#f00;', '', '0', 'system', '2019-11-26 09:10:19', 'system', '2019-11-26 09:10:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133243663159296', '0', '0,', '70', '0000000070,', '1', '0', '草稿', '草稿', '9', 'msg_inner_msg_status', '1', '', '', '', '0', 'system', '2019-11-26 09:10:19', 'system', '2019-11-26 09:10:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133243734462464', '0', '0,', '30', '0000000030,', '1', '0', '公共文件柜', '公共文件柜', 'global', 'filemanager_group_type', '1', '文件组类型', '', '', '0', 'system', '2019-11-26 09:10:19', 'system', '2019-11-26 09:10:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133243818348544', '0', '0,', '40', '0000000040,', '1', '0', '个人文件柜', '个人文件柜', 'self', 'filemanager_group_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:19', 'system', '2019-11-26 09:10:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1199133243889651712', '0', '0,', '50', '0000000050,', '1', '0', '部门文件柜', '部门文件柜', 'office', 'filemanager_group_type', '1', '', '', '', '0', 'system', '2019-11-26 09:10:19', 'system', '2019-11-26 09:10:19', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for js_sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_dict_type`;
CREATE TABLE `js_sys_dict_type` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `dict_name` varchar(100) NOT NULL COMMENT '字典名称',
  `dict_type` varchar(100) NOT NULL COMMENT '字典类型',
  `is_sys` char(1) NOT NULL COMMENT '是否系统字典',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `idx_sys_dict_type_is` (`is_sys`),
  KEY `idx_sys_dict_type_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of js_sys_dict_type
-- ----------------------------
INSERT INTO `js_sys_dict_type` VALUES ('1199133231797473280', '是否', 'sys_yes_no', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133231885553664', '状态', 'sys_status', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133231935885312', '显示隐藏', 'sys_show_hide', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133231977828352', '国际化语言类型', 'sys_lang_type', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133232023965696', '客户端设备类型', 'sys_device_type', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133232070103040', '菜单归属系统', 'sys_menu_sys_code', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133232116240384', '菜单类型', 'sys_menu_type', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133232158183424', '菜单权重', 'sys_menu_weight', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133232208515072', '区域类型', 'sys_area_type', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133232254652416', '机构类型', 'sys_office_type', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133232296595456', '查询状态', 'sys_search_status', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133232346927104', '用户性别', 'sys_user_sex', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133232393064448', '用户状态', 'sys_user_status', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133232439201792', '用户类型', 'sys_user_type', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133232485339136', '角色分类', 'sys_role_type', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133232535670784', '角色数据范围', 'sys_role_data_scope', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133232581808128', '角色业务范围', 'sys_role_biz_scope', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133232623751168', '岗位分类', 'sys_post_type', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133232669888512', '日志类型', 'sys_log_type', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133232728608768', '作业分组', 'sys_job_group', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133232787329024', '作业错过策略', 'sys_job_misfire_instruction', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133232837660672', '作业状态', 'sys_job_status', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133232883798016', '作业任务类型', 'sys_job_type', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133232929935360', '作业任务事件', 'sys_job_event', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133232980267008', '消息类型', 'sys_msg_type', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133233026404352', '推送状态', 'sys_msg_push_status', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133233072541696', '读取状态', 'sys_msg_read_status', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133233118679040', '内容级别', 'msg_inner_content_level', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133233164816384', '内容类型', 'msg_inner_content_type', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133233210953728', '接受类型', 'msg_inner_receiver_type', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133233257091072', '消息状态', 'msg_inner_msg_status', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_dict_type` VALUES ('1199133233303228416', '文件组类型', 'filemanager_group_type', '1', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);

-- ----------------------------
-- Table structure for js_sys_employee
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_employee`;
CREATE TABLE `js_sys_employee` (
  `emp_code` varchar(64) NOT NULL COMMENT '员工编码',
  `emp_name` varchar(100) NOT NULL COMMENT '员工姓名',
  `emp_name_en` varchar(100) DEFAULT NULL COMMENT '英文名',
  `office_code` varchar(64) NOT NULL COMMENT '机构编码',
  `office_name` varchar(100) NOT NULL COMMENT '机构名称',
  `company_code` varchar(64) DEFAULT NULL COMMENT '公司编码',
  `company_name` varchar(200) DEFAULT NULL COMMENT '公司名称',
  `status` char(1) NOT NULL COMMENT '状态（0在职 1删除 2离职）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  PRIMARY KEY (`emp_code`),
  KEY `idx_sys_employee_cco` (`company_code`),
  KEY `idx_sys_employee_cc` (`corp_code`),
  KEY `idx_sys_employee_ud` (`update_date`),
  KEY `idx_sys_employee_oc` (`office_code`),
  KEY `idx_sys_employee_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Records of js_sys_employee
-- ----------------------------
INSERT INTO `js_sys_employee` VALUES ('user10_wmu8', '用户10', null, 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user11_mvwx', '用户11', null, 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user12_ay2a', '用户12', null, 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user13_kniv', '用户13', null, 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2019-11-26 09:10:25', 'system', '2019-11-26 09:10:25', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user14_1oit', '用户14', null, 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2019-11-26 09:10:25', 'system', '2019-11-26 09:10:25', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user15_jxyf', '用户15', null, 'SDQD01', '企管部', 'SDQD', '青岛公司', '0', 'system', '2019-11-26 09:10:25', 'system', '2019-11-26 09:10:25', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user16_o68a', '用户16', null, 'SDQD01', '企管部', 'SDQD', '青岛公司', '0', 'system', '2019-11-26 09:10:25', 'system', '2019-11-26 09:10:25', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user17_dti3', '用户17', null, 'SDQD01', '企管部', 'SDQD', '青岛公司', '0', 'system', '2019-11-26 09:10:25', 'system', '2019-11-26 09:10:25', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user18_o5js', '用户18', null, 'SDQD02', '财务部', 'SDQD', '青岛公司', '0', 'system', '2019-11-26 09:10:25', 'system', '2019-11-26 09:10:25', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user19_qdoy', '用户19', null, 'SDQD02', '财务部', 'SDQD', '青岛公司', '0', 'system', '2019-11-26 09:10:25', 'system', '2019-11-26 09:10:25', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user1_hciz', '用户01', null, 'SDJN01', '企管部', 'SDJN', '济南公司', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user20_yr6o', '用户20', null, 'SDQD02', '财务部', 'SDQD', '青岛公司', '0', 'system', '2019-11-26 09:10:25', 'system', '2019-11-26 09:10:25', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user21_eolk', '用户21', null, 'SDQD03', '研发部', 'SDQD', '青岛公司', '0', 'system', '2019-11-26 09:10:25', 'system', '2019-11-26 09:10:25', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user22_bbsa', '用户22', null, 'SDQD03', '研发部', 'SDQD', '青岛公司', '0', 'system', '2019-11-26 09:10:25', 'system', '2019-11-26 09:10:25', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user23_q1e5', '用户23', null, 'SDQD03', '研发部', 'SDQD', '青岛公司', '0', 'system', '2019-11-26 09:10:25', 'system', '2019-11-26 09:10:25', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user2_yo3k', '用户02', null, 'SDJN01', '企管部', 'SDJN', '济南公司', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user3_7b27', '用户03', null, 'SDJN01', '企管部', 'SDJN', '济南公司', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user4_4opy', '用户04', null, 'SDJN02', '财务部', 'SDJN', '济南公司', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user5_horq', '用户05', null, 'SDJN02', '财务部', 'SDJN', '济南公司', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user6_zxhu', '用户06', null, 'SDJN02', '财务部', 'SDJN', '济南公司', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user7_oqpw', '用户07', null, 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user8_tg06', '用户08', null, 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user9_pavg', '用户09', null, 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite');

-- ----------------------------
-- Table structure for js_sys_employee_office
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_employee_office`;
CREATE TABLE `js_sys_employee_office` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `emp_code` varchar(64) NOT NULL COMMENT '员工编码',
  `office_code` varchar(64) NOT NULL COMMENT '机构编码',
  `post_code` varchar(64) DEFAULT NULL COMMENT '岗位编码',
  PRIMARY KEY (`emp_code`,`office_code`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工附属机构关系表';

-- ----------------------------
-- Records of js_sys_employee_office
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_employee_post
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_employee_post`;
CREATE TABLE `js_sys_employee_post` (
  `emp_code` varchar(64) NOT NULL COMMENT '员工编码',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  PRIMARY KEY (`emp_code`,`post_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工与岗位关联表';

-- ----------------------------
-- Records of js_sys_employee_post
-- ----------------------------
INSERT INTO `js_sys_employee_post` VALUES ('user10_wmu8', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user11_mvwx', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user12_ay2a', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user13_kniv', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user14_1oit', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user15_jxyf', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user16_o68a', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user17_dti3', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user18_o5js', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user19_qdoy', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user1_hciz', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user20_yr6o', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user21_eolk', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user22_bbsa', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user23_q1e5', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user2_yo3k', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user3_7b27', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user4_4opy', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user5_horq', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user6_zxhu', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user7_oqpw', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user8_tg06', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user9_pavg', 'user');

-- ----------------------------
-- Table structure for js_sys_file_entity
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_file_entity`;
CREATE TABLE `js_sys_file_entity` (
  `file_id` varchar(64) NOT NULL COMMENT '文件编号',
  `file_md5` varchar(64) NOT NULL COMMENT '文件MD5',
  `file_path` varchar(1000) NOT NULL COMMENT '文件相对路径',
  `file_content_type` varchar(200) NOT NULL COMMENT '文件内容类型',
  `file_extension` varchar(100) NOT NULL COMMENT '文件后缀扩展名',
  `file_size` decimal(31,0) NOT NULL COMMENT '文件大小(单位B)',
  `file_meta` varchar(255) DEFAULT NULL COMMENT '文件信息(JSON格式)',
  PRIMARY KEY (`file_id`),
  KEY `idx_sys_file_entity_md5` (`file_md5`),
  KEY `idx_sys_file_entity_size` (`file_size`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件实体表';

-- ----------------------------
-- Records of js_sys_file_entity
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_file_upload
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_file_upload`;
CREATE TABLE `js_sys_file_upload` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `file_id` varchar(64) NOT NULL COMMENT '文件编号',
  `file_name` varchar(500) NOT NULL COMMENT '文件名称',
  `file_type` varchar(20) NOT NULL COMMENT '文件分类（image、media、file）',
  `file_sort` decimal(10,0) DEFAULT NULL COMMENT '文件排序（升序）',
  `biz_key` varchar(64) DEFAULT NULL COMMENT '业务主键',
  `biz_type` varchar(64) DEFAULT NULL COMMENT '业务类型',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `idx_sys_file_biz_ft` (`file_type`),
  KEY `idx_sys_file_biz_fi` (`file_id`),
  KEY `idx_sys_file_biz_status` (`status`),
  KEY `idx_sys_file_biz_cb` (`create_by`),
  KEY `idx_sys_file_biz_ud` (`update_date`),
  KEY `idx_sys_file_biz_bt` (`biz_type`),
  KEY `idx_sys_file_biz_bk` (`biz_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传表';

-- ----------------------------
-- Records of js_sys_file_upload
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_job
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_job`;
CREATE TABLE `js_sys_job` (
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `description` varchar(100) NOT NULL COMMENT '任务描述',
  `invoke_target` varchar(1000) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) NOT NULL COMMENT 'Cron执行表达式',
  `misfire_instruction` decimal(1,0) NOT NULL COMMENT '计划执行错误策略',
  `concurrent` char(1) NOT NULL COMMENT '是否并发执行',
  `instance_name` varchar(64) NOT NULL DEFAULT 'JeeSiteScheduler' COMMENT '集群的实例名字',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1删除 2暂停）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`job_name`,`job_group`),
  KEY `idx_sys_job_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作业调度表';

-- ----------------------------
-- Records of js_sys_job
-- ----------------------------
INSERT INTO `js_sys_job` VALUES ('MsgLocalMergePushTask', 'SYSTEM', '消息推送服务 (合并推送)', 'msgLocalMergePushTask.execute()', '0 0/30 * * * ?', '2', '0', 'JeeSiteScheduler', '2', 'system', '2019-11-26 09:10:25', 'system', '2019-11-26 09:10:25', null);
INSERT INTO `js_sys_job` VALUES ('MsgLocalPushTask', 'SYSTEM', '消息推送服务 (实时推送)', 'msgLocalPushTask.execute()', '0/3 * * * * ?', '2', '0', 'JeeSiteScheduler', '2', 'system', '2019-11-26 09:10:25', 'system', '2019-11-26 09:10:25', null);

-- ----------------------------
-- Table structure for js_sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_job_log`;
CREATE TABLE `js_sys_job_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `job_type` varchar(50) DEFAULT NULL COMMENT '日志类型',
  `job_event` varchar(200) DEFAULT NULL COMMENT '日志事件',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `is_exception` char(1) DEFAULT NULL COMMENT '是否异常',
  `exception_info` text COMMENT '异常信息',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_sys_job_log_jn` (`job_name`),
  KEY `idx_sys_job_log_jg` (`job_group`),
  KEY `idx_sys_job_log_t` (`job_type`),
  KEY `idx_sys_job_log_e` (`job_event`),
  KEY `idx_sys_job_log_ie` (`is_exception`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作业调度日志表';

-- ----------------------------
-- Records of js_sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_lang
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_lang`;
CREATE TABLE `js_sys_lang` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `module_code` varchar(64) NOT NULL COMMENT '归属模块',
  `lang_code` varchar(500) NOT NULL COMMENT '语言编码',
  `lang_text` varchar(500) NOT NULL COMMENT '语言译文',
  `lang_type` varchar(50) NOT NULL COMMENT '语言类型',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `idx_sys_lang_type` (`lang_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='国际化语言';

-- ----------------------------
-- Records of js_sys_lang
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_log`;
CREATE TABLE `js_sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `log_type` varchar(50) NOT NULL COMMENT '日志类型',
  `log_title` varchar(500) NOT NULL COMMENT '日志标题',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_by_name` varchar(100) NOT NULL COMMENT '用户名称',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `request_uri` varchar(500) DEFAULT NULL COMMENT '请求URI',
  `request_method` varchar(10) DEFAULT NULL COMMENT '操作方式',
  `request_params` longtext COMMENT '操作提交的数据',
  `diff_modify_data` text COMMENT '新旧数据比较结果',
  `biz_key` varchar(64) DEFAULT NULL COMMENT '业务主键',
  `biz_type` varchar(64) DEFAULT NULL COMMENT '业务类型',
  `remote_addr` varchar(255) NOT NULL COMMENT '操作IP地址',
  `server_addr` varchar(255) NOT NULL COMMENT '请求服务器地址',
  `is_exception` char(1) DEFAULT NULL COMMENT '是否异常',
  `exception_info` text COMMENT '异常信息',
  `user_agent` varchar(500) DEFAULT NULL COMMENT '用户代理',
  `device_name` varchar(100) DEFAULT NULL COMMENT '设备名称/操作系统',
  `browser_name` varchar(100) DEFAULT NULL COMMENT '浏览器名称',
  `execute_time` decimal(19,0) DEFAULT NULL COMMENT '执行时间',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  PRIMARY KEY (`id`),
  KEY `idx_sys_log_cb` (`create_by`),
  KEY `idx_sys_log_cc` (`corp_code`),
  KEY `idx_sys_log_lt` (`log_type`),
  KEY `idx_sys_log_bk` (`biz_key`),
  KEY `idx_sys_log_bt` (`biz_type`),
  KEY `idx_sys_log_ie` (`is_exception`),
  KEY `idx_sys_log_cd` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志表';

-- ----------------------------
-- Records of js_sys_log
-- ----------------------------
INSERT INTO `js_sys_log` VALUES ('1199133617170366464', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-11-26 09:11:48', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&__url=', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199133687370432512', 'access', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-11-26 09:12:05', '/js/a/sys/empUser/index', 'GET', '', null, '', 'EmpUser', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '64', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199133688288985088', 'select', '系统管理/组织管理/用户管理/查看', 'system', '超级管理员', '2019-11-26 09:12:05', '/js/a/sys/empUser/list', 'GET', '', null, '', 'EmpUser', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '173', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199133689559859200', 'select', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-11-26 09:12:05', '/js/a/sys/empUser/listData', 'POST', 'ctrlPermi=2&loginCode=&userName=&email=&mobile=&phone=&refName=&employee.office.officeName=&employee.office.officeCode=&employee.company.companyName=&employee.company.companyCode=&employee.postCode=&status=&pageNo=&pageSize=&orderBy=', null, '', 'EmpUser', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '200', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199133905126113280', 'access', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-11-26 09:12:56', '/js/a/sys/empUser/index', 'GET', '', null, '', 'EmpUser', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '19', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199133905759453184', 'select', '系统管理/组织管理/用户管理/查看', 'system', '超级管理员', '2019-11-26 09:12:57', '/js/a/sys/empUser/list', 'GET', '', null, '', 'EmpUser', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '30', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199133906619285504', 'select', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-11-26 09:12:57', '/js/a/sys/empUser/listData', 'POST', 'ctrlPermi=2&loginCode=&userName=&email=&mobile=&phone=&refName=&employee.office.officeName=&employee.office.officeCode=&employee.company.companyName=&employee.company.companyCode=&employee.postCode=&status=&pageNo=&pageSize=&orderBy=', null, '', 'EmpUser', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '86', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199135580498903040', 'access', '系统管理/系统监控/在线用户', 'system', '超级管理员', '2019-11-26 09:19:36', '/js/a/sys/online/list', 'GET', '', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '34', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199135580993830912', 'access', '系统管理/系统监控/在线用户', 'system', '超级管理员', '2019-11-26 09:19:36', '/js/a/sys/online/listData', 'POST', 'userCode=&!isAllOnline=0&!isVisitor=0&pageNo=&pageSize=&orderBy=', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '3', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199135594658873344', 'access', '系统管理/系统监控/服务器监控', 'system', '超级管理员', '2019-11-26 09:19:39', '/js/a/state/server/index', 'GET', '', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '191', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199135606566502400', 'access', '系统管理/系统监控/缓存监控', 'system', '超级管理员', '2019-11-26 09:19:42', '/js/a/state/cache/index', 'GET', '', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '18', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199135606948184064', 'access', '系统管理/系统监控/缓存监控', 'system', '超级管理员', '2019-11-26 09:19:42', '/js/a/state/cache/cacheKeyList', 'POST', '', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '6', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199135606948184065', 'access', '系统管理/系统监控/缓存监控', 'system', '超级管理员', '2019-11-26 09:19:42', '/js/a/state/cache/cacheNameList', 'POST', '', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '16', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199135620449648640', 'access', '系统管理/系统监控/访问日志', 'system', '超级管理员', '2019-11-26 09:19:45', '/js/a/sys/log/list', 'GET', '', null, '', 'Log', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '44', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199135620877467648', 'select', '系统管理/系统监控/访问日志', 'system', '超级管理员', '2019-11-26 09:19:46', '/js/a/sys/log/listData', 'POST', 'logTitle=&requestUri=&logType=&createBy=&isException=&bizType=&bizKey=&createDate_gte=&createDate_lte=&remoteAddr=&pageNo=&pageSize=&orderBy=', null, '', 'Log', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '42', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199136579594698752', 'access', '我的工作/文件管理', 'system', '超级管理员', '2019-11-26 09:23:34', '/js/a/filemanager/index', 'GET', '', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '26', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199136579871522816', 'access', '未知操作', 'system', '超级管理员', '2019-11-26 09:23:34', '/js/a/filemanager/list', 'GET', '', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '16', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199136580521639936', 'select', '未知操作', 'system', '超级管理员', '2019-11-26 09:23:34', '/js/a/filemanager/listData', 'POST', 'groupType=global&folderId=&sharedId=&fileName=&createByName=&createBy=&createDate_gte=&createDate_lte=&pageNo=&pageSize=&orderBy=', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '57', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199136585131180032', 'access', '未知操作', 'system', '超级管理员', '2019-11-26 09:23:35', '/js/a/filemanager/filemanagerShared/list', 'GET', '', null, '', 'FilemanagerShared', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '26', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199136585470918656', 'select', '未知操作', 'system', '超级管理员', '2019-11-26 09:23:36', '/js/a/filemanager/filemanagerShared/listData', 'POST', 'myShared=false&fileName=&createByName=&createBy=&createDate_gte=&createDate_lte=&pageNo=&pageSize=&orderBy=', null, '', 'FilemanagerShared', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '26', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199136602453655552', 'access', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-11-26 09:23:40', '/js/a/sys/empUser/index', 'GET', '', null, '', 'EmpUser', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '4', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199136602600456192', 'select', '系统管理/组织管理/用户管理/查看', 'system', '超级管理员', '2019-11-26 09:23:40', '/js/a/sys/empUser/list', 'GET', '', null, '', 'EmpUser', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '14', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199136603212824576', 'select', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-11-26 09:23:40', '/js/a/sys/empUser/listData', 'POST', 'ctrlPermi=2&loginCode=&userName=&email=&mobile=&phone=&refName=&employee.office.officeName=&employee.office.officeCode=&employee.company.companyName=&employee.company.companyCode=&employee.postCode=&status=&pageNo=&pageSize=&orderBy=', null, '', 'EmpUser', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '54', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199136617964191744', 'access', '系统管理/组织管理/机构管理', 'system', '超级管理员', '2019-11-26 09:23:43', '/js/a/sys/office/index', 'GET', '', null, '', 'Office', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '36', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199136618169712640', 'access', '系统管理/组织管理/机构管理/查看', 'system', '超级管理员', '2019-11-26 09:23:43', '/js/a/sys/office/list', 'GET', '', null, '', 'Office', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '16', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199136618677223424', 'select', '系统管理/组织管理/机构管理/查看', 'system', '超级管理员', '2019-11-26 09:23:43', '/js/a/sys/office/listData', 'POST', 'ctrlPermi=2&officeCode=&viewCode=&officeName=&fullName=&officeType=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Office', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '31', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199136630098313216', 'access', '系统管理/组织管理/公司管理', 'system', '超级管理员', '2019-11-26 09:23:46', '/js/a/sys/company/list', 'GET', '', null, '', 'Company', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '42', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199136630417080320', 'select', '系统管理/组织管理/公司管理/查看', 'system', '超级管理员', '2019-11-26 09:23:46', '/js/a/sys/company/listData', 'POST', 'ctrlPermi=2&viewCode=&companyName=&fullName=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Company', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '33', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199136642567979008', 'access', '系统管理/组织管理/岗位管理', 'system', '超级管理员', '2019-11-26 09:23:49', '/js/a/sys/post/list', 'GET', '', null, '', 'Post', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '38', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199136642882551808', 'select', '系统管理/组织管理/岗位管理/查看', 'system', '超级管理员', '2019-11-26 09:23:49', '/js/a/sys/post/listData', 'POST', 'postCode=&postName_like=&postType=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Post', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '29', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199136733026533376', 'select', '系统管理/组织管理/用户管理/查看', 'system', '超级管理员', '2019-11-26 09:24:11', '/js/a/sys/empUser/form', 'GET', 'userCode=user20_yr6o&op=edit', null, 'user20_yr6o', 'EmpUser', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '134', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199136751263367168', 'access', '未知操作', 'system', '超级管理员', '2019-11-26 09:24:15', '/js/a/sys/user/checkLoginCode', 'GET', 'oldLoginCode=user20&loginCode=user20', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '16', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199136760188846080', 'access', '系统管理/系统监控/在线用户', 'system', '超级管理员', '2019-11-26 09:24:17', '/js/a/sys/online/list', 'GET', '', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '3', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199136760516001792', 'access', '系统管理/系统监控/在线用户', 'system', '超级管理员', '2019-11-26 09:24:17', '/js/a/sys/online/listData', 'POST', 'userCode=&!isAllOnline=0&!isVisitor=0&pageNo=&pageSize=&orderBy=', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '1', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199136786810093568', 'access', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-11-26 09:24:24', '/js/a/sys/empUser/index', 'GET', '', null, '', 'EmpUser', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '3', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199136787154026496', 'select', '系统管理/组织管理/用户管理/查看', 'system', '超级管理员', '2019-11-26 09:24:24', '/js/a/sys/empUser/list', 'GET', '', null, '', 'EmpUser', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '13', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199136788349403136', 'select', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-11-26 09:24:24', '/js/a/sys/empUser/listData', 'POST', 'ctrlPermi=2&loginCode=&userName=&email=&mobile=&phone=&refName=&employee.office.officeName=&employee.office.officeCode=&employee.company.companyName=&employee.company.companyCode=&employee.postCode=&status=&pageNo=&pageSize=&orderBy=', null, '', 'EmpUser', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '55', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199193524378718208', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-11-26 13:09:51', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&__url=', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199195334017953792', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-11-26 13:17:02', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&rememberUserCode=on&__url=', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199195787155886080', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-11-26 13:18:50', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&rememberUserCode=on&__url=', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199201869765570560', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-11-26 13:43:01', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&rememberUserCode=on&__url=', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199203446813483008', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-11-26 13:49:16', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&rememberUserCode=on&__url=', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199208193214431232', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-11-26 14:08:08', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&rememberUserCode=on&__url=', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199209242571214848', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-11-26 14:12:18', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&rememberUserCode=on&__url=', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199215424986763264', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-11-26 14:36:52', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&rememberUserCode=on&__url=', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199218753102577664', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-11-26 14:50:06', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&rememberUserCode=on&__url=', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199218763546394624', 'access', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-11-26 14:50:08', '/js/a/sys/empUser/index', 'GET', '', null, '', 'EmpUser', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '46', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199218764276203520', 'select', '系统管理/组织管理/用户管理/查看', 'system', '超级管理员', '2019-11-26 14:50:08', '/js/a/sys/empUser/list', 'GET', '', null, '', 'EmpUser', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '121', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199218766151057408', 'select', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-11-26 14:50:09', '/js/a/sys/empUser/listData', 'POST', 'ctrlPermi=2&loginCode=&userName=&email=&mobile=&phone=&refName=&employee.office.officeName=&employee.office.officeCode=&employee.company.companyName=&employee.company.companyCode=&employee.postCode=&status=&pageNo=&pageSize=&orderBy=', null, '', 'EmpUser', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '226', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199218770047565824', 'access', '系统管理/组织管理/机构管理', 'system', '超级管理员', '2019-11-26 14:50:10', '/js/a/sys/office/index', 'GET', '', null, '', 'Office', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '25', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199218770194366464', 'access', '系统管理/组织管理/机构管理/查看', 'system', '超级管理员', '2019-11-26 14:50:10', '/js/a/sys/office/list', 'GET', '', null, '', 'Office', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '17', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199218770651545600', 'select', '系统管理/组织管理/机构管理/查看', 'system', '超级管理员', '2019-11-26 14:50:10', '/js/a/sys/office/listData', 'POST', 'ctrlPermi=2&officeCode=&viewCode=&officeName=&fullName=&officeType=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Office', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '47', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199218774195732480', 'access', '系统管理/组织管理/公司管理', 'system', '超级管理员', '2019-11-26 14:50:11', '/js/a/sys/company/list', 'GET', '', null, '', 'Company', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '26', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199218774615162880', 'select', '系统管理/组织管理/公司管理/查看', 'system', '超级管理员', '2019-11-26 14:50:11', '/js/a/sys/company/listData', 'POST', 'ctrlPermi=2&viewCode=&companyName=&fullName=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Company', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '49', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199218776800395264', 'access', '系统管理/组织管理/岗位管理', 'system', '超级管理员', '2019-11-26 14:50:11', '/js/a/sys/post/list', 'GET', '', null, '', 'Post', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '22', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199218777140133888', 'select', '系统管理/组织管理/岗位管理/查看', 'system', '超级管理员', '2019-11-26 14:50:12', '/js/a/sys/post/listData', 'POST', 'postCode=&postName_like=&postType=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Post', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '43', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199218800238166016', 'access', '系统管理/系统监控/访问日志', 'system', '超级管理员', '2019-11-26 14:50:17', '/js/a/sys/log/list', 'GET', '', null, '', 'Log', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '27', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199218800665985024', 'select', '系统管理/系统监控/访问日志', 'system', '超级管理员', '2019-11-26 14:50:17', '/js/a/sys/log/listData', 'POST', 'logTitle=&requestUri=&logType=&createBy=&isException=&bizType=&bizKey=&createDate_gte=&createDate_lte=&remoteAddr=&pageNo=&pageSize=&orderBy=', null, '', 'Log', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '51', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199218843888287744', 'access', '系统管理/系统监控/缓存监控', 'system', '超级管理员', '2019-11-26 14:50:27', '/js/a/state/cache/index', 'GET', '', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '17', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199218844215443456', 'access', '系统管理/系统监控/缓存监控', 'system', '超级管理员', '2019-11-26 14:50:28', '/js/a/state/cache/cacheNameList', 'POST', '', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '4', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199218844307718144', 'access', '系统管理/系统监控/缓存监控', 'system', '超级管理员', '2019-11-26 14:50:28', '/js/a/state/cache/cacheKeyList', 'POST', '', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '2', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199218868554989568', 'access', '系统管理/系统监控/服务器监控', 'system', '超级管理员', '2019-11-26 14:50:33', '/js/a/state/server/index', 'GET', '', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '178', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199218916873371648', 'access', '系统管理/系统监控/在线用户', 'system', '超级管理员', '2019-11-26 14:50:45', '/js/a/sys/online/list', 'GET', '', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '11', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199218917095669760', 'access', '系统管理/系统监控/在线用户', 'system', '超级管理员', '2019-11-26 14:50:45', '/js/a/sys/online/listData', 'POST', 'userCode=&!isAllOnline=0&!isVisitor=0&pageNo=&pageSize=&orderBy=', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '3', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199218986758864896', 'access', '我的工作/文件管理', 'system', '超级管理员', '2019-11-26 14:51:02', '/js/a/filemanager/index', 'GET', '', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '23', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199218986901471232', 'access', '未知操作', 'system', '超级管理员', '2019-11-26 14:51:02', '/js/a/filemanager/list', 'GET', '', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '16', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199218987484479488', 'select', '未知操作', 'system', '超级管理员', '2019-11-26 14:51:02', '/js/a/filemanager/listData', 'POST', 'groupType=global&folderId=&sharedId=&fileName=&createByName=&createBy=&createDate_gte=&createDate_lte=&pageNo=&pageSize=&orderBy=', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '77', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199218994035982336', 'access', '未知操作', 'system', '超级管理员', '2019-11-26 14:51:03', '/js/a/filemanager/filemanagerShared/list', 'GET', '', null, '', 'FilemanagerShared', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '24', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199218994363138048', 'select', '未知操作', 'system', '超级管理员', '2019-11-26 14:51:03', '/js/a/filemanager/filemanagerShared/listData', 'POST', 'myShared=false&fileName=&createByName=&createBy=&createDate_gte=&createDate_lte=&pageNo=&pageSize=&orderBy=', null, '', 'FilemanagerShared', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '34', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199219066157039616', 'access', '系统管理/系统设置/行政区划', 'system', '超级管理员', '2019-11-26 14:51:20', '/js/a/sys/area/list', 'GET', '', null, '', 'Area', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '24', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199219066459029504', 'select', '系统管理/系统设置/行政区划', 'system', '超级管理员', '2019-11-26 14:51:21', '/js/a/sys/area/listPageData', 'POST', 'areaCode=&areaName=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Area', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '21', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199219079054524416', 'access', '系统管理/系统设置/字典管理', 'system', '超级管理员', '2019-11-26 14:51:24', '/js/a/sys/dictType/list', 'GET', '', null, '', 'DictType', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '22', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199219079390068736', 'select', '系统管理/系统设置/字典管理/类型查看', 'system', '超级管理员', '2019-11-26 14:51:24', '/js/a/sys/dictType/listData', 'POST', 'dictName=&dictType_like=&isSys=&status=&pageNo=&pageSize=&orderBy=', null, '', 'DictType', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '30', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199219101217226752', 'select', '系统管理/系统设置/字典管理/类型查看', 'system', '超级管理员', '2019-11-26 14:51:29', '/js/a/sys/dictType/form', 'GET', 'id=1199133233303228416', null, '1199133233303228416', 'DictType', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '24', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199219131344912384', 'access', '系统管理/系统设置/字典管理/数据查看', 'system', '超级管理员', '2019-11-26 14:51:36', '/js/a/sys/dictData/list', 'GET', 'dictType=filemanager_group_type', null, '', 'DictData', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '25', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199219131680456704', 'select', '系统管理/系统设置/字典管理/数据查看', 'system', '超级管理员', '2019-11-26 14:51:36', '/js/a/sys/dictData/listData', 'POST', 'dictLabelOrig=&dictValue=&dictType=filemanager_group_type&isSys=&status=&pageNo=&pageSize=&orderBy=', null, '', 'DictData', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '22', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199219159807459328', 'access', '系统管理/权限管理/角色管理', 'system', '超级管理员', '2019-11-26 14:51:43', '/js/a/sys/role/list', 'GET', '', null, '', 'Role', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '26', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199219160151392256', 'select', '系统管理/权限管理/角色管理', 'system', '超级管理员', '2019-11-26 14:51:43', '/js/a/sys/role/listData', 'POST', 'ctrlPermi=2&roleName_like=&roleCode_like=&userType=&isSys=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Role', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '33', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199219170469380096', 'access', '系统管理/权限管理/二级管理员', 'system', '超级管理员', '2019-11-26 14:51:45', '/js/a/sys/secAdmin/list', 'GET', '', null, '', 'User', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '18', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199219170758787072', 'select', '系统管理/权限管理/二级管理员', 'system', '超级管理员', '2019-11-26 14:51:45', '/js/a/sys/secAdmin/listData', 'POST', 'loginCode=&userName=&email=&mobile=&phone=&status=&pageNo=&pageSize=&orderBy=', null, '', 'User', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '30', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199219177650028544', 'access', '系统管理/权限管理/系统管理员', 'system', '超级管理员', '2019-11-26 14:51:47', '/js/a/sys/corpAdmin/list', 'GET', '', null, '', 'User', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '21', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199219177947824128', 'select', '系统管理/权限管理/系统管理员', 'system', '超级管理员', '2019-11-26 14:51:47', '/js/a/sys/corpAdmin/listData', 'POST', 'loginCode=&userName=&corpCode_=&corpName_=&status=&pageNo=&pageSize=&orderBy=', null, '', 'User', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '28', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199219196004302848', 'access', '未知操作', 'system', '超级管理员', '2019-11-26 14:51:51', '/js/a/sys/user/userSelect', 'POST', 'userType=employee&checkbox=false&selectData=%7B%7D', null, null, 'User', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '28', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199219196306292736', 'select', '未知操作', 'system', '超级管理员', '2019-11-26 14:51:51', '/js/a/sys/user/listData', 'POST', 'status=0&userType=employee&isAll=&loginCode=&userName=&email=&mobile=&phone=&pageNo=&pageSize=&orderBy=', null, null, 'User', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '29', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199219220159299584', 'access', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-11-26 14:51:57', '/js/a/sys/empUser/index', 'GET', '', null, '', 'EmpUser', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '2', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199219220289323008', 'select', '系统管理/组织管理/用户管理/查看', 'system', '超级管理员', '2019-11-26 14:51:57', '/js/a/sys/empUser/list', 'GET', '', null, '', 'EmpUser', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '13', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199219220813611008', 'select', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-11-26 14:51:57', '/js/a/sys/empUser/listData', 'POST', 'ctrlPermi=2&loginCode=&userName=&email=&mobile=&phone=&refName=&employee.office.officeName=&employee.office.officeCode=&employee.company.companyName=&employee.company.companyCode=&employee.postCode=&status=&pageNo=&pageSize=&orderBy=', null, '', 'EmpUser', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '57', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199219221736357888', 'access', '系统管理/组织管理/机构管理', 'system', '超级管理员', '2019-11-26 14:51:58', '/js/a/sys/office/index', 'GET', '', null, '', 'Office', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '3', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199219221853798400', 'access', '系统管理/组织管理/机构管理/查看', 'system', '超级管理员', '2019-11-26 14:51:58', '/js/a/sys/office/list', 'GET', '', null, '', 'Office', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '6', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199219222264840192', 'select', '系统管理/组织管理/机构管理/查看', 'system', '超级管理员', '2019-11-26 14:51:58', '/js/a/sys/office/listData', 'POST', 'ctrlPermi=2&officeCode=&viewCode=&officeName=&fullName=&officeType=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Office', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '29', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199219223556685824', 'access', '系统管理/组织管理/公司管理', 'system', '超级管理员', '2019-11-26 14:51:58', '/js/a/sys/company/list', 'GET', '', null, '', 'Company', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '6', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199219223871258624', 'select', '系统管理/组织管理/公司管理/查看', 'system', '超级管理员', '2019-11-26 14:51:58', '/js/a/sys/company/listData', 'POST', 'ctrlPermi=2&viewCode=&companyName=&fullName=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Company', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '29', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199219225427345408', 'access', '系统管理/组织管理/岗位管理', 'system', '超级管理员', '2019-11-26 14:51:58', '/js/a/sys/post/list', 'GET', '', null, '', 'Post', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '7', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199219225691586560', 'select', '系统管理/组织管理/岗位管理/查看', 'system', '超级管理员', '2019-11-26 14:51:58', '/js/a/sys/post/listData', 'POST', 'postCode=&postName_like=&postType=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Post', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '22', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199219258704953344', 'access', '系统管理/组织管理/岗位管理', 'system', '超级管理员', '2019-11-26 14:52:06', '/js/a/sys/post/list', 'GET', '', null, '', 'Post', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '5', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199219259438956544', 'select', '系统管理/组织管理/岗位管理/查看', 'system', '超级管理员', '2019-11-26 14:52:07', '/js/a/sys/post/listData', 'POST', 'postCode=&postName_like=&postType=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Post', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '19', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199240280015269888', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-11-26 16:15:38', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&rememberUserCode=on&__url=', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199240796849811456', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-11-26 16:17:41', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&rememberUserCode=on&__url=', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199240873639129088', 'access', '未知操作', 'system', '超级管理员', '2019-11-26 16:18:00', '/js/a/switchSkin/select', 'POST', '', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '107', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199240892802904064', 'access', '未知操作', 'system', '超级管理员', '2019-11-26 16:18:04', '/js/a/switch/default', 'GET', '', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '42', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199240903322218496', 'access', '未知操作', 'system', '超级管理员', '2019-11-26 16:18:07', '/js/a/sys/user/info', 'GET', '', null, null, 'User', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '37', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199240922892840960', 'access', '未知操作', 'system', '超级管理员', '2019-11-26 16:18:11', '/js/a/sys/user/info', 'GET', 'op=pwd', null, null, 'User', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '13', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199241106284589056', 'access', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-11-26 16:18:55', '/js/a/sys/menu/list', 'GET', '', null, '', 'Menu', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '42', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199241106792099840', 'select', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-11-26 16:18:55', '/js/a/sys/menu/listData', 'POST', 'moduleCodes=&sysCode=default&menuNameOrig=&pageNo=&pageSize=&orderBy=', null, '', 'Menu', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '39', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199241126215921664', 'select', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-11-26 16:19:00', '/js/a/sys/menu/listData', 'POST', 'id=&nodeid=1199133246846636032&parentid=0&n_level=0&_search=false&nd=1574756339922&pageSize=&pageNo=&orderBy=&sord=asc&moduleCodes=&sysCode=default&menuNameOrig=&parentCode=1199133246846636032', null, '', 'Menu', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '41', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199241139427979264', 'select', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-11-26 16:19:03', '/js/a/sys/menu/listData', 'POST', 'id=&nodeid=1199133257516945408&parentid=1199133246846636032&n_level=1&_search=false&nd=1574756343089&pageSize=&pageNo=&orderBy=&sord=asc&moduleCodes=&sysCode=default&menuNameOrig=&parentCode=1199133257516945408', null, '', 'Menu', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '26', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199241174823710720', 'update', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-11-26 16:19:12', '/js/a/sys/menu/delete', 'POST', 'menuCode=1199133258175451136', null, '1199133258175451136', 'Menu', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '67', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199241199679156224', 'update', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-11-26 16:19:17', '/js/a/sys/menu/delete', 'POST', 'menuCode=1199133257516945408', null, '1199133257516945408', 'Menu', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '81', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199241207157600256', 'access', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-11-26 16:19:19', '/js/a/sys/menu/list', 'GET', '', null, '', 'Menu', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '5', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199241208336199680', 'select', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-11-26 16:19:20', '/js/a/sys/menu/listData', 'POST', 'moduleCodes=&sysCode=default&menuNameOrig=&pageNo=&pageSize=&orderBy=', null, '', 'Menu', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '24', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199241210081030144', 'access', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-11-26 16:19:20', '/js/a/sys/menu/list', 'GET', '', null, '', 'Menu', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '3', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199241211175743488', 'select', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-11-26 16:19:20', '/js/a/sys/menu/listData', 'POST', 'moduleCodes=&sysCode=default&menuNameOrig=&pageNo=&pageSize=&orderBy=', null, '', 'Menu', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '22', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199241412464586752', 'access', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-11-26 16:20:08', '/js/a/sys/menu/list', 'GET', '', null, '', 'Menu', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '4', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199241413815152640', 'select', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-11-26 16:20:09', '/js/a/sys/menu/listData', 'POST', 'moduleCodes=&sysCode=default&menuNameOrig=&pageNo=&pageSize=&orderBy=', null, '', 'Menu', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '21', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199241420404404224', 'access', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-11-26 16:20:10', '/js/a/sys/menu/list', 'GET', '', null, '', 'Menu', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '3', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199241421511700480', 'select', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-11-26 16:20:10', '/js/a/sys/menu/listData', 'POST', 'moduleCodes=&sysCode=default&menuNameOrig=&pageNo=&pageSize=&orderBy=', null, '', 'Menu', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '20', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199242145044774912', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-11-26 16:23:03', '/js/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&rememberUserCode=on&__url=', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199242244953096192', 'access', '系统管理/研发工具/代码生成工具', 'system', '超级管理员', '2019-11-26 16:23:27', '/js/a/gen/genTable/list', 'GET', '', null, '', 'GenTable', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '48', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199242246031032320', 'select', '系统管理/研发工具/代码生成工具', 'system', '超级管理员', '2019-11-26 16:23:27', '/js/a/gen/genTable/listData', 'POST', 'parentTableName_isNull=&tableName_like=&comments=&pageNo=&pageSize=&orderBy=', null, '', 'GenTable', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '190', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199242661896273920', 'access', '系统管理/系统设置/行政区划', 'system', '超级管理员', '2019-11-26 16:25:06', '/js/a/sys/area/list', 'GET', '', null, '', 'Area', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '78', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199242662512836608', 'select', '系统管理/系统设置/行政区划', 'system', '超级管理员', '2019-11-26 16:25:06', '/js/a/sys/area/listPageData', 'POST', 'areaCode=&areaName=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Area', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '26', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199242666497425408', 'access', '系统管理/系统设置/字典管理', 'system', '超级管理员', '2019-11-26 16:25:07', '/js/a/sys/dictType/list', 'GET', '', null, '', 'DictType', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '79', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199242667063656448', 'select', '系统管理/系统设置/字典管理/类型查看', 'system', '超级管理员', '2019-11-26 16:25:07', '/js/a/sys/dictType/listData', 'POST', 'dictName=&dictType_like=&isSys=&status=&pageNo=&pageSize=&orderBy=', null, '', 'DictType', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '47', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199242674311413760', 'access', '系统管理/系统设置/参数设置', 'system', '超级管理员', '2019-11-26 16:25:09', '/js/a/sys/config/list', 'GET', '', null, '', 'Config', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '32', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199242674709872640', 'select', '系统管理/系统设置/参数设置', 'system', '超级管理员', '2019-11-26 16:25:09', '/js/a/sys/config/listData', 'POST', 'configName=&configKey_like=&isSys=&pageNo=&pageSize=&orderBy=', null, '', 'Config', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '32', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199242676924465152', 'access', '系统管理/系统设置/模块管理', 'system', '超级管理员', '2019-11-26 16:25:10', '/js/a/sys/module/list', 'GET', '', null, '', 'Module', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '32', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199242677444558848', 'select', '系统管理/系统设置/模块管理', 'system', '超级管理员', '2019-11-26 16:25:10', '/js/a/sys/module/listData', 'POST', 'moduleName=&mainClassName=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Module', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '47', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199242678862233600', 'access', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-11-26 16:25:10', '/js/a/sys/menu/list', 'GET', '', null, '', 'Menu', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '22', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199242679243915264', 'select', '系统管理/系统设置/菜单管理', 'system', '超级管理员', '2019-11-26 16:25:10', '/js/a/sys/menu/listData', 'POST', 'moduleCodes=&sysCode=default&menuNameOrig=&pageNo=&pageSize=&orderBy=', null, '', 'Menu', '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '33', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199242978010701824', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-11-26 16:26:21', '/web/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&__url=', null, null, null, '127.0.0.1', 'http://127.0.0.1:8980', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199285230905315328', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-11-26 19:14:15', '/web/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&__url=', null, null, null, '220.160.111.118', 'http://139.9.104.150:80', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199285443430699008', 'loginLogout', '系统登录', 'system', '超级管理员', '2019-11-26 19:15:06', '/web/a/login', 'POST', 'username=F3EDC7D2C193E0B8DCF554C726719ED2&password=*&validCode=&rememberUserCode=on&__url=', null, null, null, '220.160.111.118', 'http://139.9.104.150:80', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', 'Windows 10', 'Chrome', '0', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199285459868176384', 'access', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-11-26 19:15:10', '/web/a/sys/empUser/index', 'GET', '', null, '', 'EmpUser', '220.160.111.118', 'http://139.9.104.150:80', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '40', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199285460564430848', 'select', '系统管理/组织管理/用户管理/查看', 'system', '超级管理员', '2019-11-26 19:15:10', '/web/a/sys/empUser/list', 'GET', '', null, '', 'EmpUser', '220.160.111.118', 'http://139.9.104.150:80', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '89', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199285462799994880', 'select', '系统管理/组织管理/用户管理', 'system', '超级管理员', '2019-11-26 19:15:11', '/web/a/sys/empUser/listData', 'POST', 'ctrlPermi=2&loginCode=&userName=&email=&mobile=&phone=&refName=&employee.office.officeName=&employee.office.officeCode=&employee.company.companyName=&employee.company.companyCode=&employee.postCode=&status=&pageNo=&pageSize=&orderBy=', null, '', 'EmpUser', '220.160.111.118', 'http://139.9.104.150:80', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '128', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199285467350814720', 'access', '系统管理/组织管理/机构管理', 'system', '超级管理员', '2019-11-26 19:15:12', '/web/a/sys/office/index', 'GET', '', null, '', 'Office', '220.160.111.118', 'http://139.9.104.150:80', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '8', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199285467807993856', 'access', '系统管理/组织管理/机构管理/查看', 'system', '超级管理员', '2019-11-26 19:15:12', '/web/a/sys/office/list', 'GET', '', null, '', 'Office', '220.160.111.118', 'http://139.9.104.150:80', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '19', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199285468361641984', 'select', '系统管理/组织管理/机构管理/查看', 'system', '超级管理员', '2019-11-26 19:15:12', '/web/a/sys/office/listData', 'POST', 'ctrlPermi=2&officeCode=&viewCode=&officeName=&fullName=&officeType=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Office', '220.160.111.118', 'http://139.9.104.150:80', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '12', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199285471616421888', 'access', '系统管理/组织管理/公司管理', 'system', '超级管理员', '2019-11-26 19:15:13', '/web/a/sys/company/list', 'GET', '', null, '', 'Company', '220.160.111.118', 'http://139.9.104.150:80', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '35', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199285472186847232', 'select', '系统管理/组织管理/公司管理/查看', 'system', '超级管理员', '2019-11-26 19:15:13', '/web/a/sys/company/listData', 'POST', 'ctrlPermi=2&viewCode=&companyName=&fullName=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Company', '220.160.111.118', 'http://139.9.104.150:80', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '15', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199285473763905536', 'access', '系统管理/组织管理/岗位管理', 'system', '超级管理员', '2019-11-26 19:15:13', '/web/a/sys/post/list', 'GET', '', null, '', 'Post', '220.160.111.118', 'http://139.9.104.150:80', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '21', '0', 'JeeSite');
INSERT INTO `js_sys_log` VALUES ('1199285474338525184', 'select', '系统管理/组织管理/岗位管理/查看', 'system', '超级管理员', '2019-11-26 19:15:13', '/web/a/sys/post/listData', 'POST', 'postCode=&postName_like=&postType=&status=&pageNo=&pageSize=&orderBy=', null, '', 'Post', '220.160.111.118', 'http://139.9.104.150:80', '0', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 'Windows 10', 'Chrome', '23', '0', 'JeeSite');

-- ----------------------------
-- Table structure for js_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_menu`;
CREATE TABLE `js_sys_menu` (
  `menu_code` varchar(64) NOT NULL COMMENT '菜单编码',
  `parent_code` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(640) NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10,0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(640) NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4,0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(640) NOT NULL COMMENT '全节点名',
  `menu_name` varchar(100) NOT NULL COMMENT '菜单名称',
  `menu_type` char(1) NOT NULL COMMENT '菜单类型（1菜单 2权限 3开发）',
  `menu_href` varchar(640) DEFAULT NULL COMMENT '链接',
  `menu_target` varchar(20) DEFAULT NULL COMMENT '目标',
  `menu_icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `menu_color` varchar(50) DEFAULT NULL COMMENT '颜色',
  `menu_title` varchar(100) DEFAULT NULL COMMENT '菜单标题',
  `permission` varchar(640) DEFAULT NULL COMMENT '权限标识',
  `weight` decimal(4,0) DEFAULT NULL COMMENT '菜单权重',
  `is_show` char(1) NOT NULL COMMENT '是否显示（1显示 0隐藏）',
  `sys_code` varchar(64) NOT NULL COMMENT '归属系统（default:主导航菜单、mobileApp:APP菜单）',
  `module_codes` varchar(500) NOT NULL COMMENT '归属模块（多个用逗号隔开）',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `extend_s1` varchar(500) DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`menu_code`),
  KEY `idx_sys_menu_pc` (`parent_code`),
  KEY `idx_sys_menu_ts` (`tree_sort`),
  KEY `idx_sys_menu_status` (`status`),
  KEY `idx_sys_menu_mt` (`menu_type`),
  KEY `idx_sys_menu_sc` (`sys_code`),
  KEY `idx_sys_menu_is` (`is_show`),
  KEY `idx_sys_menu_wt` (`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of js_sys_menu
-- ----------------------------
INSERT INTO `js_sys_menu` VALUES ('1199133246846636032', '0', '0,', '9000', '0000009000,', '0', '0', '系统管理', '系统管理', '1', '', '', 'icon-settings', '', null, '', '40', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:20', 'system', '2019-11-26 09:10:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133247207346176', '1199133246846636032', '0,1199133246846636032,', '300', '0000009000,0000000300,', '0', '1', '系统管理/组织管理', '组织管理', '1', '', '', 'icon-grid', '', null, '', '40', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:20', 'system', '2019-11-26 09:10:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133247370924032', '1199133247207346176', '0,1199133246846636032,1199133247207346176,', '40', '0000009000,0000000300,0000000040,', '0', '2', '系统管理/组织管理/用户管理', '用户管理', '1', '/sys/empUser/index', '', 'icon-user', '', null, '', '40', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:20', 'system', '2019-11-26 09:10:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133247605805056', '1199133247370924032', '0,1199133246846636032,1199133247207346176,1199133247370924032,', '30', '0000009000,0000000300,0000000040,0000000030,', '1', '3', '系统管理/组织管理/用户管理/查看', '查看', '2', '', '', '', '', null, 'sys:empUser:view', '40', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:20', 'system', '2019-11-26 09:10:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133247794548736', '1199133247370924032', '0,1199133246846636032,1199133247207346176,1199133247370924032,', '40', '0000009000,0000000300,0000000040,0000000040,', '1', '3', '系统管理/组织管理/用户管理/编辑', '编辑', '2', '', '', '', '', null, 'sys:empUser:edit', '40', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:20', 'system', '2019-11-26 09:10:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133247962320896', '1199133247370924032', '0,1199133246846636032,1199133247207346176,1199133247370924032,', '60', '0000009000,0000000300,0000000040,0000000060,', '1', '3', '系统管理/组织管理/用户管理/分配角色', '分配角色', '2', '', '', '', '', null, 'sys:empUser:authRole', '40', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:20', 'system', '2019-11-26 09:10:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133248134287360', '1199133247370924032', '0,1199133246846636032,1199133247207346176,1199133247370924032,', '50', '0000009000,0000000300,0000000040,0000000050,', '1', '3', '系统管理/组织管理/用户管理/分配数据', '分配数据', '2', '', '', '', '', null, 'sys:empUser:authDataScope', '40', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:20', 'system', '2019-11-26 09:10:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133248314642432', '1199133247370924032', '0,1199133246846636032,1199133247207346176,1199133247370924032,', '60', '0000009000,0000000300,0000000040,0000000060,', '1', '3', '系统管理/组织管理/用户管理/停用启用', '停用启用', '2', '', '', '', '', null, 'sys:empUser:updateStatus', '40', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:20', 'system', '2019-11-26 09:10:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133248515969024', '1199133247370924032', '0,1199133246846636032,1199133247207346176,1199133247370924032,', '70', '0000009000,0000000300,0000000040,0000000070,', '1', '3', '系统管理/组织管理/用户管理/重置密码', '重置密码', '2', '', '', '', '', null, 'sys:empUser:resetpwd', '40', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:20', 'system', '2019-11-26 09:10:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133248679546880', '1199133247207346176', '0,1199133246846636032,1199133247207346176,', '50', '0000009000,0000000300,0000000050,', '0', '2', '系统管理/组织管理/机构管理', '机构管理', '1', '/sys/office/index', '', 'icon-grid', '', null, '', '60', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:20', 'system', '2019-11-26 09:10:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133248859901952', '1199133248679546880', '0,1199133246846636032,1199133247207346176,1199133248679546880,', '30', '0000009000,0000000300,0000000050,0000000030,', '1', '3', '系统管理/组织管理/机构管理/查看', '查看', '2', '', '', '', '', null, 'sys:office:view', '60', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:20', 'system', '2019-11-26 09:10:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133249019285504', '1199133248679546880', '0,1199133246846636032,1199133247207346176,1199133248679546880,', '40', '0000009000,0000000300,0000000050,0000000040,', '1', '3', '系统管理/组织管理/机构管理/编辑', '编辑', '2', '', '', '', '', null, 'sys:office:edit', '60', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:20', 'system', '2019-11-26 09:10:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133249187057664', '1199133247207346176', '0,1199133246846636032,1199133247207346176,', '70', '0000009000,0000000300,0000000070,', '0', '2', '系统管理/组织管理/公司管理', '公司管理', '1', '/sys/company/list', '', 'icon-fire', '', null, '', '60', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:20', 'system', '2019-11-26 09:10:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133249367412736', '1199133249187057664', '0,1199133246846636032,1199133247207346176,1199133249187057664,', '30', '0000009000,0000000300,0000000070,0000000030,', '1', '3', '系统管理/组织管理/公司管理/查看', '查看', '2', '', '', '', '', null, 'sys:company:view', '60', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:20', 'system', '2019-11-26 09:10:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133249535184896', '1199133249187057664', '0,1199133246846636032,1199133247207346176,1199133249187057664,', '40', '0000009000,0000000300,0000000070,0000000040,', '1', '3', '系统管理/组织管理/公司管理/编辑', '编辑', '2', '', '', '', '', null, 'sys:company:edit', '60', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:20', 'system', '2019-11-26 09:10:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133249702957056', '1199133247207346176', '0,1199133246846636032,1199133247207346176,', '70', '0000009000,0000000300,0000000070,', '0', '2', '系统管理/组织管理/岗位管理', '岗位管理', '1', '/sys/post/list', '', 'icon-trophy', '', null, '', '60', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:20', 'system', '2019-11-26 09:10:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133249879117824', '1199133249702957056', '0,1199133246846636032,1199133247207346176,1199133249702957056,', '30', '0000009000,0000000300,0000000070,0000000030,', '1', '3', '系统管理/组织管理/岗位管理/查看', '查看', '2', '', '', '', '', null, 'sys:post:view', '60', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:20', 'system', '2019-11-26 09:10:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133250051084288', '1199133249702957056', '0,1199133246846636032,1199133247207346176,1199133249702957056,', '40', '0000009000,0000000300,0000000070,0000000040,', '1', '3', '系统管理/组织管理/岗位管理/编辑', '编辑', '2', '', '', '', '', null, 'sys:post:edit', '60', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:20', 'system', '2019-11-26 09:10:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133250235633664', '1199133246846636032', '0,1199133246846636032,', '400', '0000009000,0000000400,', '0', '1', '系统管理/权限管理', '权限管理', '1', '', '', 'icon-social-dropbox', '', null, '', '60', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:20', 'system', '2019-11-26 09:10:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133250432765952', '1199133250235633664', '0,1199133246846636032,1199133250235633664,', '30', '0000009000,0000000400,0000000030,', '1', '2', '系统管理/权限管理/角色管理', '角色管理', '1', '/sys/role/list', '', 'icon-people', '', null, 'sys:role', '60', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:20', 'system', '2019-11-26 09:10:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133250592149504', '1199133250235633664', '0,1199133246846636032,1199133250235633664,', '40', '0000009000,0000000400,0000000040,', '1', '2', '系统管理/权限管理/二级管理员', '二级管理员', '1', '/sys/secAdmin/list', '', 'icon-user-female', '', null, 'sys:secAdmin', '60', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:20', 'system', '2019-11-26 09:10:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133250793476096', '1199133250235633664', '0,1199133246846636032,1199133250235633664,', '50', '0000009000,0000000400,0000000050,', '1', '2', '系统管理/权限管理/系统管理员', '系统管理员', '1', '/sys/corpAdmin/list', '', 'icon-badge', '', null, 'sys:corpAdmin', '80', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:20', 'system', '2019-11-26 09:10:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133250978025472', '1199133246846636032', '0,1199133246846636032,', '500', '0000009000,0000000500,', '0', '1', '系统管理/系统设置', '系统设置', '1', '', '', 'icon-settings', '', null, '', '60', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:21', 'system', '2019-11-26 09:10:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133251149991936', '1199133250978025472', '0,1199133246846636032,1199133250978025472,', '30', '0000009000,0000000500,0000000030,', '1', '2', '系统管理/系统设置/菜单管理', '菜单管理', '1', '/sys/menu/list', '', 'icon-book-open', '', null, 'sys:menu', '80', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:21', 'system', '2019-11-26 09:10:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133251313569792', '1199133250978025472', '0,1199133246846636032,1199133250978025472,', '40', '0000009000,0000000500,0000000040,', '1', '2', '系统管理/系统设置/模块管理', '模块管理', '1', '/sys/module/list', '', 'icon-grid', '', null, 'sys:module', '80', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:21', 'system', '2019-11-26 09:10:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133251472953344', '1199133250978025472', '0,1199133246846636032,1199133250978025472,', '50', '0000009000,0000000500,0000000050,', '1', '2', '系统管理/系统设置/参数设置', '参数设置', '1', '/sys/config/list', '', 'icon-wrench', '', null, 'sys:config', '60', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:21', 'system', '2019-11-26 09:10:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133251653308416', '1199133250978025472', '0,1199133246846636032,1199133250978025472,', '60', '0000009000,0000000500,0000000060,', '0', '2', '系统管理/系统设置/字典管理', '字典管理', '1', '/sys/dictType/list', '', 'icon-social-dropbox', '', null, '', '60', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:21', 'system', '2019-11-26 09:10:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133251846246400', '1199133251653308416', '0,1199133246846636032,1199133250978025472,1199133251653308416,', '30', '0000009000,0000000500,0000000060,0000000030,', '1', '3', '系统管理/系统设置/字典管理/类型查看', '类型查看', '2', '', '', '', '', null, 'sys:dictType:view', '60', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:21', 'system', '2019-11-26 09:10:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133252005629952', '1199133251653308416', '0,1199133246846636032,1199133250978025472,1199133251653308416,', '40', '0000009000,0000000500,0000000060,0000000040,', '1', '3', '系统管理/系统设置/字典管理/类型编辑', '类型编辑', '2', '', '', '', '', null, 'sys:dictType:edit', '80', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:21', 'system', '2019-11-26 09:10:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133252177596416', '1199133251653308416', '0,1199133246846636032,1199133250978025472,1199133251653308416,', '50', '0000009000,0000000500,0000000060,0000000050,', '1', '3', '系统管理/系统设置/字典管理/数据查看', '数据查看', '2', '', '', '', '', null, 'sys:dictData:view', '60', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:21', 'system', '2019-11-26 09:10:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133252399894528', '1199133251653308416', '0,1199133246846636032,1199133250978025472,1199133251653308416,', '60', '0000009000,0000000500,0000000060,0000000060,', '1', '3', '系统管理/系统设置/字典管理/数据编辑', '数据编辑', '2', '', '', '', '', null, 'sys:dictData:edit', '60', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:21', 'system', '2019-11-26 09:10:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133252567666688', '1199133250978025472', '0,1199133246846636032,1199133250978025472,', '70', '0000009000,0000000500,0000000070,', '1', '2', '系统管理/系统设置/行政区划', '行政区划', '1', '/sys/area/list', '', 'icon-map', '', null, 'sys:area', '60', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:21', 'system', '2019-11-26 09:10:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133252739633152', '1199133250978025472', '0,1199133246846636032,1199133250978025472,', '80', '0000009000,0000000500,0000000080,', '1', '2', '系统管理/系统设置/国际化管理', '国际化管理', '1', '/sys/lang/list', '', 'icon-globe', '', null, 'sys:lang', '80', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:21', 'system', '2019-11-26 09:10:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133252919988224', '1199133250978025472', '0,1199133246846636032,1199133250978025472,', '90', '0000009000,0000000500,0000000090,', '1', '2', '系统管理/系统设置/产品许可信息', '产品许可信息', '1', '//licence', '', 'icon-paper-plane', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:21', 'system', '2019-11-26 09:10:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133253079371776', '1199133246846636032', '0,1199133246846636032,', '600', '0000009000,0000000600,', '0', '1', '系统管理/系统监控', '系统监控', '1', '', '', 'icon-ghost', '', null, '', '60', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:21', 'system', '2019-11-26 09:10:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133253259726848', '1199133253079371776', '0,1199133246846636032,1199133253079371776,', '40', '0000009000,0000000600,0000000040,', '1', '2', '系统管理/系统监控/访问日志', '访问日志', '1', '/sys/log/list', '', 'fa fa-bug', '', null, 'sys:log', '60', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:21', 'system', '2019-11-26 09:10:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133253423304704', '1199133253079371776', '0,1199133246846636032,1199133253079371776,', '50', '0000009000,0000000600,0000000050,', '1', '2', '系统管理/系统监控/数据监控', '数据监控', '1', '//druid/index.html', '', 'icon-disc', '', null, 'sys:state:druid', '80', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:21', 'system', '2019-11-26 09:10:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133253591076864', '1199133253079371776', '0,1199133246846636032,1199133253079371776,', '60', '0000009000,0000000600,0000000060,', '1', '2', '系统管理/系统监控/缓存监控', '缓存监控', '1', '/state/cache/index', '', 'icon-social-dribbble', '', null, 'sys:stste:cache', '80', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:21', 'system', '2019-11-26 09:10:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133253788209152', '1199133253079371776', '0,1199133246846636032,1199133253079371776,', '70', '0000009000,0000000600,0000000070,', '1', '2', '系统管理/系统监控/服务器监控', '服务器监控', '1', '/state/server/index', '', 'icon-speedometer', '', null, 'sys:state:server', '80', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:21', 'system', '2019-11-26 09:10:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133253960175616', '1199133253079371776', '0,1199133246846636032,1199133253079371776,', '80', '0000009000,0000000600,0000000080,', '1', '2', '系统管理/系统监控/作业监控', '作业监控', '1', '/job/list', '', 'icon-notebook', '', null, 'sys:job', '80', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:21', 'system', '2019-11-26 09:10:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133254127947776', '1199133253079371776', '0,1199133246846636032,1199133253079371776,', '90', '0000009000,0000000600,0000000090,', '1', '2', '系统管理/系统监控/在线用户', '在线用户', '1', '/sys/online/list', '', 'icon-social-twitter', '', null, 'sys:online', '60', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:21', 'system', '2019-11-26 09:10:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133254337662976', '1199133253079371776', '0,1199133246846636032,1199133253079371776,', '100', '0000009000,0000000600,0000000100,', '1', '2', '系统管理/系统监控/在线文档', '在线文档', '1', '//swagger-ui.html', '', 'icon-book-open', '', null, 'sys:swagger', '80', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:21', 'system', '2019-11-26 09:10:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133254488657920', '1199133246846636032', '0,1199133246846636032,', '700', '0000009000,0000000700,', '0', '1', '系统管理/消息推送', '消息推送', '1', '', '', 'icon-envelope-letter', '', null, '', '60', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:21', 'system', '2019-11-26 09:10:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133254664818688', '1199133254488657920', '0,1199133246846636032,1199133254488657920,', '30', '0000009000,0000000700,0000000030,', '1', '2', '系统管理/消息推送/未完成消息', '未完成消息', '1', '/msg/msgPush/list', '', '', '', null, 'msg:msgPush', '60', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:21', 'system', '2019-11-26 09:10:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133254840979456', '1199133254488657920', '0,1199133246846636032,1199133254488657920,', '40', '0000009000,0000000700,0000000040,', '1', '2', '系统管理/消息推送/已完成消息', '已完成消息', '1', '/msg/msgPush/list?pushed=true', '', '', '', null, 'msg:msgPush', '60', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:21', 'system', '2019-11-26 09:10:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133255008751616', '1199133254488657920', '0,1199133246846636032,1199133254488657920,', '50', '0000009000,0000000700,0000000050,', '1', '2', '系统管理/消息推送/消息模板管理', '消息模板管理', '1', '/msg/msgTemplate/list', '', '', '', null, 'msg:msgTemplate', '60', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:21', 'system', '2019-11-26 09:10:21', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133255189106688', '1199133246846636032', '0,1199133246846636032,', '900', '0000009000,0000000900,', '0', '1', '系统管理/研发工具', '研发工具', '1', '', '', 'fa fa-code', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:22', 'system', '2019-11-26 09:10:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133255361073152', '1199133255189106688', '0,1199133246846636032,1199133255189106688,', '30', '0000009000,0000000900,0000000030,', '1', '2', '系统管理/研发工具/代码生成工具', '代码生成工具', '1', '/gen/genTable/list', '', 'fa fa-code', '', null, 'gen:genTable', '80', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:22', 'system', '2019-11-26 09:10:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133255528845312', '1199133255189106688', '0,1199133246846636032,1199133255189106688,', '100', '0000009000,0000000900,0000000100,', '0', '2', '系统管理/研发工具/代码生成实例', '代码生成实例', '1', '', '', 'icon-social-dropbox', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:22', 'system', '2019-11-26 09:10:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133255692423168', '1199133255528845312', '0,1199133246846636032,1199133255189106688,1199133255528845312,', '30', '0000009000,0000000900,0000000100,0000000030,', '1', '3', '系统管理/研发工具/代码生成实例/单表_主子表', '单表/主子表', '1', '/test/testData/list', '', '', '', null, 'test:testData', '80', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:22', 'system', '2019-11-26 09:10:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133255847612416', '1199133255528845312', '0,1199133246846636032,1199133255189106688,1199133255528845312,', '40', '0000009000,0000000900,0000000100,0000000040,', '1', '3', '系统管理/研发工具/代码生成实例/树表_树结构表', '树表/树结构表', '1', '/test/testTree/list', '', '', '', null, 'test:testTree', '80', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:22', 'system', '2019-11-26 09:10:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133256023773184', '1199133255189106688', '0,1199133246846636032,1199133255189106688,', '200', '0000009000,0000000900,0000000200,', '0', '2', '系统管理/研发工具/数据表格实例', '数据表格实例', '1', '', '', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:22', 'system', '2019-11-26 09:10:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133256187351040', '1199133256023773184', '0,1199133246846636032,1199133255189106688,1199133256023773184,', '30', '0000009000,0000000900,0000000200,0000000030,', '1', '3', '系统管理/研发工具/数据表格实例/多表头分组小计合计', '多表头分组小计合计', '1', '/demo/dataGrid/groupGrid', '', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:22', 'system', '2019-11-26 09:10:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133256359317504', '1199133256023773184', '0,1199133246846636032,1199133255189106688,1199133256023773184,', '40', '0000009000,0000000900,0000000200,0000000040,', '1', '3', '系统管理/研发工具/数据表格实例/编辑表格多行编辑', '编辑表格多行编辑', '1', '/demo/dataGrid/editGrid', '', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:22', 'system', '2019-11-26 09:10:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133256522895360', '1199133255189106688', '0,1199133246846636032,1199133255189106688,', '300', '0000009000,0000000900,0000000300,', '0', '2', '系统管理/研发工具/表单组件实例', '表单组件实例', '1', '', '', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:22', 'system', '2019-11-26 09:10:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133256699056128', '1199133256522895360', '0,1199133246846636032,1199133255189106688,1199133256522895360,', '30', '0000009000,0000000900,0000000300,0000000030,', '1', '3', '系统管理/研发工具/表单组件实例/组件应用实例', '组件应用实例', '1', '/demo/form/editForm', '', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:22', 'system', '2019-11-26 09:10:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133256879411200', '1199133256522895360', '0,1199133246846636032,1199133255189106688,1199133256522895360,', '40', '0000009000,0000000900,0000000300,0000000040,', '1', '3', '系统管理/研发工具/表单组件实例/栅格布局实例', '栅格布局实例', '1', '/demo/form/layoutForm', '', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:22', 'system', '2019-11-26 09:10:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133257047183360', '1199133256522895360', '0,1199133246846636032,1199133255189106688,1199133256522895360,', '50', '0000009000,0000000900,0000000300,0000000050,', '1', '3', '系统管理/研发工具/表单组件实例/表格表单实例', '表格表单实例', '1', '/demo/form/tableForm', '', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:22', 'system', '2019-11-26 09:10:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133257210761216', '1199133255189106688', '0,1199133246846636032,1199133255189106688,', '400', '0000009000,0000000900,0000000400,', '0', '2', '系统管理/研发工具/前端界面实例', '前端界面实例', '1', '', '', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:22', 'system', '2019-11-26 09:10:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133257357561856', '1199133257210761216', '0,1199133246846636032,1199133255189106688,1199133257210761216,', '30', '0000009000,0000000900,0000000400,0000000030,', '1', '3', '系统管理/研发工具/前端界面实例/图标样式查找', '图标样式查找', '1', '//tags/iconselect', '', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:22', 'system', '2019-11-26 09:10:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133257516945408', '1199133246846636032', '0,1199133246846636032,', '999', '0000009000,0000000999,', '0', '1', '系统管理/JeeSite社区', 'JeeSite社区', '1', '', '', 'icon-directions', '', null, '', '80', '1', 'default', 'core', '1', 'system', '2019-11-26 09:10:22', 'system', '2019-11-26 16:19:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133257680523264', '1199133257516945408', '0,1199133246846636032,1199133257516945408,', '30', '0000009000,0000000999,0000000030,', '1', '2', '系统管理/JeeSite社区/官方网站', '官方网站', '1', 'http://jeesite.com', '_blank', '', '', null, '', '80', '1', 'default', 'core', '1', 'system', '2019-11-26 09:10:22', 'system', '2019-11-26 16:19:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133257848295424', '1199133257516945408', '0,1199133246846636032,1199133257516945408,', '50', '0000009000,0000000999,0000000050,', '1', '2', '系统管理/JeeSite社区/作者博客', '作者博客', '1', 'https://my.oschina.net/thinkgem', '_blank', '', '', null, '', '80', '1', 'default', 'core', '1', 'system', '2019-11-26 09:10:22', 'system', '2019-11-26 16:19:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133258020261888', '1199133257516945408', '0,1199133246846636032,1199133257516945408,', '40', '0000009000,0000000999,0000000040,', '1', '2', '系统管理/JeeSite社区/问题反馈', '问题反馈', '1', 'https://gitee.com/thinkgem/jeesite4/issues', '_blank', '', '', null, '', '80', '1', 'default', 'core', '1', 'system', '2019-11-26 09:10:22', 'system', '2019-11-26 16:19:17', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133258175451136', '1199133257516945408', '0,1199133246846636032,1199133257516945408,', '60', '0000009000,0000000999,0000000060,', '1', '2', '系统管理/JeeSite社区/开源社区', '开源社区', '1', 'http://jeesite.net', '_blank', '', '', null, '', '80', '1', 'default', 'core', '1', 'system', '2019-11-26 09:10:22', 'system', '2019-11-26 16:19:12', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133258343223296', '0', '0,', '9060', '0000009060,', '0', '0', '我的工作', '我的工作', '1', '', '', 'icon-screen-desktop', '', null, '', '40', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:22', 'system', '2019-11-26 09:10:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133258485829632', '1199133258343223296', '0,1199133258343223296,', '500', '0000009060,0000000500,', '0', '1', '我的工作/文件管理', '文件管理', '1', '', '', 'icon-folder', '', null, '', '40', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:22', 'system', '2019-11-26 09:10:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133258657796096', '1199133258485829632', '0,1199133258343223296,1199133258485829632,', '30', '0000009060,0000000500,0000000030,', '1', '2', '我的工作/文件管理/文件管理', '文件管理', '1', '/filemanager/index', '', '', '', null, 'filemanager', '40', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:22', 'system', '2019-11-26 09:10:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133258821373952', '1199133258485829632', '0,1199133258343223296,1199133258485829632,', '50', '0000009060,0000000500,0000000050,', '1', '2', '我的工作/文件管理/文件分享', '文件分享', '1', '/filemanager/filemanagerShared/list', '', '', '', null, 'filemanager', '40', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:22', 'system', '2019-11-26 09:10:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133258984951808', '1199133258343223296', '0,1199133258343223296,', '600', '0000009060,0000000600,', '0', '1', '我的工作/站内消息', '站内消息', '1', '/msg/msgInner/list', '', 'icon-speech', '', null, '', '40', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:22', 'system', '2019-11-26 09:10:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133259156918272', '1199133258984951808', '0,1199133258343223296,1199133258984951808,', '30', '0000009060,0000000600,0000000030,', '1', '2', '我的工作/站内消息/查看', '查看', '2', '', '', '', '', null, 'msg:msgInner:view', '40', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:22', 'system', '2019-11-26 09:10:22', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133259341467648', '1199133258984951808', '0,1199133258343223296,1199133258984951808,', '40', '0000009060,0000000600,0000000040,', '1', '2', '我的工作/站内消息/编辑', '编辑', '2', '', '', '', '', null, 'msg:msgInner:edit', '40', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:23', 'system', '2019-11-26 09:10:23', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1199133259500851200', '1199133258984951808', '0,1199133258343223296,1199133258984951808,', '50', '0000009060,0000000600,0000000050,', '1', '2', '我的工作/站内消息/审核', '审核', '2', '', '', '', '', null, 'msg:msgInner:auth', '40', '1', 'default', 'core', '0', 'system', '2019-11-26 09:10:23', 'system', '2019-11-26 09:10:23', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for js_sys_module
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_module`;
CREATE TABLE `js_sys_module` (
  `module_code` varchar(64) NOT NULL COMMENT '模块编码',
  `module_name` varchar(100) NOT NULL COMMENT '模块名称',
  `description` varchar(500) DEFAULT NULL COMMENT '模块描述',
  `main_class_name` varchar(500) DEFAULT NULL COMMENT '主类全名',
  `current_version` varchar(50) DEFAULT NULL COMMENT '当前版本',
  `upgrade_info` varchar(300) DEFAULT NULL COMMENT '升级信息',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`module_code`),
  KEY `idx_sys_module_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模块表';

-- ----------------------------
-- Records of js_sys_module
-- ----------------------------
INSERT INTO `js_sys_module` VALUES ('cms', '内容管理', '网站、站点、栏目、文章、链接、评论、留言板', 'com.jeesite.modules.cms.web.CmsController', '4.0.0', null, '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_module` VALUES ('core', '核心模块', '用户、角色、组织、模块、菜单、字典、参数', 'com.jeesite.modules.sys.web.LoginController', '4.1.7', null, '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:10:16', null);
INSERT INTO `js_sys_module` VALUES ('filemanager', '文件管理', '公共文件柜、个人文件柜、文件分享', 'com.jeesite.modules.filemanager.web.FilemanagerController', '4.1.6', 'upgrade 2019-11-26 09:11:39 (4.1.5 -> 4.1.6)', '0', 'system', '2019-11-26 09:10:16', 'system', '2019-11-26 09:11:40', null);

-- ----------------------------
-- Table structure for js_sys_msg_inner
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_msg_inner`;
CREATE TABLE `js_sys_msg_inner` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `msg_title` varchar(200) NOT NULL COMMENT '消息标题',
  `content_level` char(1) NOT NULL COMMENT '内容级别（1普通 2一般 3紧急）',
  `content_type` char(1) DEFAULT NULL COMMENT '内容类型（1公告 2新闻 3会议 4其它）',
  `msg_content` text NOT NULL COMMENT '消息内容',
  `receive_type` char(1) NOT NULL COMMENT '接受者类型（0全部 1用户 2部门 3角色 4岗位）',
  `receive_codes` text COMMENT '接受者字符串',
  `receive_names` text COMMENT '接受者名称字符串',
  `send_user_code` varchar(64) DEFAULT NULL COMMENT '发送者用户编码',
  `send_user_name` varchar(100) DEFAULT NULL COMMENT '发送者用户姓名',
  `send_date` datetime DEFAULT NULL COMMENT '发送时间',
  `is_attac` char(1) DEFAULT NULL COMMENT '是否有附件',
  `notify_types` varchar(100) DEFAULT NULL COMMENT '通知类型（PC APP 短信 邮件 微信）多选',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1删除 4审核 5驳回 9草稿）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `idx_sys_msg_inner_cb` (`create_by`),
  KEY `idx_sys_msg_inner_status` (`status`),
  KEY `idx_sys_msg_inner_cl` (`content_level`),
  KEY `idx_sys_msg_inner_sc` (`send_user_code`),
  KEY `idx_sys_msg_inner_sd` (`send_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内部消息';

-- ----------------------------
-- Records of js_sys_msg_inner
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_msg_inner_record
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_msg_inner_record`;
CREATE TABLE `js_sys_msg_inner_record` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `msg_inner_id` varchar(64) NOT NULL COMMENT '所属消息',
  `receive_user_code` varchar(64) NOT NULL COMMENT '接受者用户编码',
  `receive_user_name` varchar(100) NOT NULL COMMENT '接受者用户姓名',
  `read_status` char(1) NOT NULL COMMENT '读取状态（0未送达 1已读 2未读）',
  `read_date` datetime DEFAULT NULL COMMENT '阅读时间',
  `is_star` char(1) DEFAULT NULL COMMENT '是否标星',
  PRIMARY KEY (`id`),
  KEY `idx_sys_msg_inner_r_mi` (`msg_inner_id`),
  KEY `idx_sys_msg_inner_r_ruc` (`receive_user_code`),
  KEY `idx_sys_msg_inner_r_status` (`read_status`),
  KEY `idx_sys_msg_inner_r_star` (`is_star`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内部消息发送记录表';

-- ----------------------------
-- Records of js_sys_msg_inner_record
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_msg_push
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_msg_push`;
CREATE TABLE `js_sys_msg_push` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `msg_type` varchar(16) NOT NULL COMMENT '消息类型（PC APP 短信 邮件 微信）',
  `msg_title` varchar(200) NOT NULL COMMENT '消息标题',
  `msg_content` text NOT NULL COMMENT '消息内容',
  `biz_key` varchar(64) DEFAULT NULL COMMENT '业务主键',
  `biz_type` varchar(64) DEFAULT NULL COMMENT '业务类型',
  `receive_code` varchar(64) NOT NULL COMMENT '接受者账号',
  `receive_user_code` varchar(64) NOT NULL COMMENT '接受者用户编码',
  `receive_user_name` varchar(100) NOT NULL COMMENT '接受者用户姓名',
  `send_user_code` varchar(64) NOT NULL COMMENT '发送者用户编码',
  `send_user_name` varchar(100) NOT NULL COMMENT '发送者用户姓名',
  `send_date` datetime NOT NULL COMMENT '发送时间',
  `is_merge_push` char(1) DEFAULT NULL COMMENT '是否合并推送',
  `plan_push_date` datetime DEFAULT NULL COMMENT '计划推送时间',
  `push_number` int(11) DEFAULT NULL COMMENT '推送尝试次数',
  `push_return_code` varchar(200) DEFAULT NULL COMMENT '推送返回结果码',
  `push_return_msg_id` varchar(200) DEFAULT NULL COMMENT '推送返回消息编号',
  `push_return_content` text COMMENT '推送返回的内容信息',
  `push_status` char(1) DEFAULT NULL COMMENT '推送状态（0未推送 1成功  2失败）',
  `push_date` datetime DEFAULT NULL COMMENT '推送时间',
  `read_status` char(1) DEFAULT NULL COMMENT '读取状态（0未送达 1已读 2未读）',
  `read_date` datetime DEFAULT NULL COMMENT '读取时间',
  PRIMARY KEY (`id`),
  KEY `idx_sys_msg_push_type` (`msg_type`),
  KEY `idx_sys_msg_push_rc` (`receive_code`),
  KEY `idx_sys_msg_push_uc` (`receive_user_code`),
  KEY `idx_sys_msg_push_suc` (`send_user_code`),
  KEY `idx_sys_msg_push_pd` (`plan_push_date`),
  KEY `idx_sys_msg_push_ps` (`push_status`),
  KEY `idx_sys_msg_push_rs` (`read_status`),
  KEY `idx_sys_msg_push_bk` (`biz_key`),
  KEY `idx_sys_msg_push_bt` (`biz_type`),
  KEY `idx_sys_msg_push_imp` (`is_merge_push`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息推送表';

-- ----------------------------
-- Records of js_sys_msg_push
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_msg_pushed
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_msg_pushed`;
CREATE TABLE `js_sys_msg_pushed` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `msg_type` varchar(16) NOT NULL COMMENT '消息类型（PC APP 短信 邮件 微信）',
  `msg_title` varchar(200) NOT NULL COMMENT '消息标题',
  `msg_content` text NOT NULL COMMENT '消息内容',
  `biz_key` varchar(64) DEFAULT NULL COMMENT '业务主键',
  `biz_type` varchar(64) DEFAULT NULL COMMENT '业务类型',
  `receive_code` varchar(64) NOT NULL COMMENT '接受者账号',
  `receive_user_code` varchar(64) NOT NULL COMMENT '接受者用户编码',
  `receive_user_name` varchar(100) NOT NULL COMMENT '接受者用户姓名',
  `send_user_code` varchar(64) NOT NULL COMMENT '发送者用户编码',
  `send_user_name` varchar(100) NOT NULL COMMENT '发送者用户姓名',
  `send_date` datetime NOT NULL COMMENT '发送时间',
  `is_merge_push` char(1) DEFAULT NULL COMMENT '是否合并推送',
  `plan_push_date` datetime DEFAULT NULL COMMENT '计划推送时间',
  `push_number` int(11) DEFAULT NULL COMMENT '推送尝试次数',
  `push_return_content` text COMMENT '推送返回的内容信息',
  `push_return_code` varchar(200) DEFAULT NULL COMMENT '推送返回结果码',
  `push_return_msg_id` varchar(200) DEFAULT NULL COMMENT '推送返回消息编号',
  `push_status` char(1) DEFAULT NULL COMMENT '推送状态（0未推送 1成功  2失败）',
  `push_date` datetime DEFAULT NULL COMMENT '推送时间',
  `read_status` char(1) DEFAULT NULL COMMENT '读取状态（0未送达 1已读 2未读）',
  `read_date` datetime DEFAULT NULL COMMENT '读取时间',
  PRIMARY KEY (`id`),
  KEY `idx_sys_msg_pushed_type` (`msg_type`),
  KEY `idx_sys_msg_pushed_rc` (`receive_code`),
  KEY `idx_sys_msg_pushed_uc` (`receive_user_code`),
  KEY `idx_sys_msg_pushed_suc` (`send_user_code`),
  KEY `idx_sys_msg_pushed_pd` (`plan_push_date`),
  KEY `idx_sys_msg_pushed_ps` (`push_status`),
  KEY `idx_sys_msg_pushed_rs` (`read_status`),
  KEY `idx_sys_msg_pushed_bk` (`biz_key`),
  KEY `idx_sys_msg_pushed_bt` (`biz_type`),
  KEY `idx_sys_msg_pushed_imp` (`is_merge_push`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息已推送表';

-- ----------------------------
-- Records of js_sys_msg_pushed
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_msg_template
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_msg_template`;
CREATE TABLE `js_sys_msg_template` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `module_code` varchar(64) DEFAULT NULL COMMENT '归属模块',
  `tpl_key` varchar(100) NOT NULL COMMENT '模板键值',
  `tpl_name` varchar(100) NOT NULL COMMENT '模板名称',
  `tpl_type` varchar(16) NOT NULL COMMENT '模板类型',
  `tpl_content` text NOT NULL COMMENT '模板内容',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `idx_sys_msg_tpl_key` (`tpl_key`),
  KEY `idx_sys_msg_tpl_type` (`tpl_type`),
  KEY `idx_sys_msg_tpl_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息模板';

-- ----------------------------
-- Records of js_sys_msg_template
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_office
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_office`;
CREATE TABLE `js_sys_office` (
  `office_code` varchar(64) NOT NULL COMMENT '机构编码',
  `parent_code` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(1000) NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10,0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1000) NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4,0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(1000) NOT NULL COMMENT '全节点名',
  `view_code` varchar(100) NOT NULL COMMENT '机构代码',
  `office_name` varchar(100) NOT NULL COMMENT '机构名称',
  `full_name` varchar(200) NOT NULL COMMENT '机构全称',
  `office_type` char(1) NOT NULL COMMENT '机构类型',
  `leader` varchar(100) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(100) DEFAULT NULL COMMENT '办公电话',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `email` varchar(300) DEFAULT NULL COMMENT '电子邮箱',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  `extend_s1` varchar(500) DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`office_code`),
  KEY `idx_sys_office_cc` (`corp_code`),
  KEY `idx_sys_office_pc` (`parent_code`),
  KEY `idx_sys_office_status` (`status`),
  KEY `idx_sys_office_ot` (`office_type`),
  KEY `idx_sys_office_vc` (`view_code`),
  KEY `idx_sys_office_ts` (`tree_sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构表';

-- ----------------------------
-- Records of js_sys_office
-- ----------------------------
INSERT INTO `js_sys_office` VALUES ('SD', '0', '0,', '40', '0000000040,', '0', '0', '山东公司', 'SD', '山东公司', '山东公司', '1', null, null, null, null, null, '0', 'system', '2019-11-26 09:10:23', 'system', '2019-11-26 09:10:23', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_office` VALUES ('SDJN', 'SD', '0,SD,', '30', '0000000040,0000000030,', '0', '1', '山东公司/济南公司', 'SDJN', '济南公司', '山东济南公司', '2', null, null, null, null, null, '0', 'system', '2019-11-26 09:10:23', 'system', '2019-11-26 09:10:23', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_office` VALUES ('SDJN01', 'SDJN', '0,SD,SDJN,', '30', '0000000040,0000000030,0000000030,', '1', '2', '山东公司/济南公司/企管部', 'SDJN01', '企管部', '山东济南企管部', '3', null, null, null, null, null, '0', 'system', '2019-11-26 09:10:23', 'system', '2019-11-26 09:10:23', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_office` VALUES ('SDJN02', 'SDJN', '0,SD,SDJN,', '40', '0000000040,0000000030,0000000040,', '1', '2', '山东公司/济南公司/财务部', 'SDJN02', '财务部', '山东济南财务部', '3', null, null, null, null, null, '0', 'system', '2019-11-26 09:10:23', 'system', '2019-11-26 09:10:23', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_office` VALUES ('SDJN03', 'SDJN', '0,SD,SDJN,', '50', '0000000040,0000000030,0000000050,', '1', '2', '山东公司/济南公司/研发部', 'SDJN03', '研发部', '山东济南研发部', '3', null, null, null, null, null, '0', 'system', '2019-11-26 09:10:23', 'system', '2019-11-26 09:10:23', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_office` VALUES ('SDQD', 'SD', '0,SD,', '40', '0000000040,0000000040,', '0', '1', '山东公司/青岛公司', 'SDQD', '青岛公司', '山东青岛公司', '2', null, null, null, null, null, '0', 'system', '2019-11-26 09:10:23', 'system', '2019-11-26 09:10:23', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_office` VALUES ('SDQD01', 'SDQD', '0,SD,SDQD,', '30', '0000000040,0000000040,0000000030,', '1', '2', '山东公司/青岛公司/企管部', 'SDQD01', '企管部', '山东青岛企管部', '3', null, null, null, null, null, '0', 'system', '2019-11-26 09:10:23', 'system', '2019-11-26 09:10:23', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_office` VALUES ('SDQD02', 'SDQD', '0,SD,SDQD,', '40', '0000000040,0000000040,0000000040,', '1', '2', '山东公司/青岛公司/财务部', 'SDQD02', '财务部', '山东青岛财务部', '3', null, null, null, null, null, '0', 'system', '2019-11-26 09:10:23', 'system', '2019-11-26 09:10:23', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_office` VALUES ('SDQD03', 'SDQD', '0,SD,SDQD,', '50', '0000000040,0000000040,0000000050,', '1', '2', '山东公司/青岛公司/研发部', 'SDQD03', '研发部', '山东青岛研发部', '3', null, null, null, null, null, '0', 'system', '2019-11-26 09:10:23', 'system', '2019-11-26 09:10:23', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for js_sys_post
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_post`;
CREATE TABLE `js_sys_post` (
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(100) NOT NULL COMMENT '岗位名称',
  `post_type` varchar(100) DEFAULT NULL COMMENT '岗位分类（高管、中层、基层）',
  `post_sort` decimal(10,0) DEFAULT NULL COMMENT '岗位排序（升序）',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  PRIMARY KEY (`post_code`),
  KEY `idx_sys_post_cc` (`corp_code`),
  KEY `idx_sys_post_status` (`status`),
  KEY `idx_sys_post_ps` (`post_sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工岗位表';

-- ----------------------------
-- Records of js_sys_post
-- ----------------------------
INSERT INTO `js_sys_post` VALUES ('ceo', '总经理', null, '1', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite');
INSERT INTO `js_sys_post` VALUES ('cfo', '财务经理', null, '2', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite');
INSERT INTO `js_sys_post` VALUES ('dept', '部门经理', null, '2', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite');
INSERT INTO `js_sys_post` VALUES ('hrm', '人力经理', null, '2', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite');
INSERT INTO `js_sys_post` VALUES ('user', '普通员工', null, '3', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite');

-- ----------------------------
-- Table structure for js_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_role`;
CREATE TABLE `js_sys_role` (
  `role_code` varchar(64) NOT NULL COMMENT '角色编码',
  `role_name` varchar(100) NOT NULL COMMENT '角色名称',
  `role_type` varchar(100) DEFAULT NULL COMMENT '角色分类（高管、中层、基层、其它）',
  `role_sort` decimal(10,0) DEFAULT NULL COMMENT '角色排序（升序）',
  `is_sys` char(1) DEFAULT NULL COMMENT '系统内置（1是 0否）',
  `user_type` varchar(16) DEFAULT NULL COMMENT '用户类型（employee员工 member会员）',
  `data_scope` char(1) DEFAULT NULL COMMENT '数据范围设置（0未设置  1全部数据 2自定义数据）',
  `biz_scope` varchar(255) DEFAULT NULL COMMENT '适应业务范围（不同的功能，不同的数据权限支持）',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  `extend_s1` varchar(500) DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`role_code`),
  KEY `idx_sys_role_cc` (`corp_code`),
  KEY `idx_sys_role_is` (`is_sys`),
  KEY `idx_sys_role_status` (`status`),
  KEY `idx_sys_role_rs` (`role_sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of js_sys_role
-- ----------------------------
INSERT INTO `js_sys_role` VALUES ('corpAdmin', '系统管理员', null, '200', '1', 'none', '0', null, '0', 'system', '2019-11-26 09:10:19', 'system', '2019-11-26 09:10:19', '客户方使用的管理员角色，客户方管理员，集团管理员', '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_role` VALUES ('default', '默认角色', null, '100', '1', 'none', '0', null, '0', 'system', '2019-11-26 09:10:19', 'system', '2019-11-26 09:10:19', '非管理员用户，共有的默认角色，在参数配置里指定', '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_role` VALUES ('dept', '部门经理', null, '40', '0', 'employee', '0', null, '0', 'system', '2019-11-26 09:10:19', 'system', '2019-11-26 09:10:19', '部门经理', '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_role` VALUES ('user', '普通员工', null, '50', '0', 'employee', '0', null, '0', 'system', '2019-11-26 09:10:19', 'system', '2019-11-26 09:10:19', '普通员工', '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for js_sys_role_data_scope
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_role_data_scope`;
CREATE TABLE `js_sys_role_data_scope` (
  `role_code` varchar(64) NOT NULL COMMENT '控制角色编码',
  `ctrl_type` varchar(20) NOT NULL COMMENT '控制类型',
  `ctrl_data` varchar(64) NOT NULL COMMENT '控制数据',
  `ctrl_permi` varchar(64) NOT NULL COMMENT '控制权限',
  PRIMARY KEY (`role_code`,`ctrl_type`,`ctrl_data`,`ctrl_permi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色数据权限表';

-- ----------------------------
-- Records of js_sys_role_data_scope
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_role_menu`;
CREATE TABLE `js_sys_role_menu` (
  `role_code` varchar(64) NOT NULL COMMENT '角色编码',
  `menu_code` varchar(64) NOT NULL COMMENT '菜单编码',
  PRIMARY KEY (`role_code`,`menu_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与菜单关联表';

-- ----------------------------
-- Records of js_sys_role_menu
-- ----------------------------
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133246846636032');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133247207346176');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133247370924032');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133247605805056');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133247794548736');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133247962320896');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133248134287360');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133248314642432');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133248515969024');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133248679546880');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133248859901952');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133249019285504');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133249187057664');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133249367412736');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133249535184896');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133249702957056');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133249879117824');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133250051084288');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133250235633664');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133250432765952');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133250592149504');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133250793476096');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133250978025472');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133251149991936');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133251313569792');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133251472953344');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133251653308416');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133251846246400');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133252005629952');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133252177596416');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133252399894528');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133252567666688');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133252739633152');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133252919988224');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133253079371776');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133253259726848');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133253423304704');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133253591076864');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133253788209152');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133253960175616');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133254127947776');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133254337662976');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133254488657920');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133254664818688');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133254840979456');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133255008751616');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133255189106688');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133255361073152');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133255528845312');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133255692423168');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133255847612416');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133256023773184');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133256187351040');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133256359317504');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133256522895360');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133256699056128');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133256879411200');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133257047183360');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133257210761216');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133257357561856');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133257516945408');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133257680523264');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133257848295424');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133258020261888');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133258175451136');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133258343223296');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133258485829632');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133258657796096');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133258821373952');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133258984951808');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133259156918272');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133259341467648');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1199133259500851200');

-- ----------------------------
-- Table structure for js_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_user`;
CREATE TABLE `js_sys_user` (
  `user_code` varchar(100) NOT NULL COMMENT '用户编码',
  `login_code` varchar(100) NOT NULL COMMENT '登录账号',
  `user_name` varchar(100) NOT NULL COMMENT '用户昵称',
  `password` varchar(100) NOT NULL COMMENT '登录密码',
  `email` varchar(255) DEFAULT NULL COMMENT '电子邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号码',
  `phone` varchar(100) DEFAULT NULL COMMENT '办公电话',
  `sex` char(1) DEFAULT NULL COMMENT '用户性别',
  `avatar` varchar(1000) DEFAULT NULL COMMENT '头像路径',
  `sign` varchar(200) DEFAULT NULL COMMENT '个性签名',
  `wx_openid` varchar(100) DEFAULT NULL COMMENT '绑定的微信号',
  `mobile_imei` varchar(100) DEFAULT NULL COMMENT '绑定的手机串号',
  `user_type` varchar(16) NOT NULL COMMENT '用户类型',
  `ref_code` varchar(64) DEFAULT NULL COMMENT '用户类型引用编号',
  `ref_name` varchar(100) DEFAULT NULL COMMENT '用户类型引用姓名',
  `mgr_type` char(1) NOT NULL COMMENT '管理员类型（0非管理员 1系统管理员  2二级管理员）',
  `pwd_security_level` decimal(1,0) DEFAULT NULL COMMENT '密码安全级别（0初始 1很弱 2弱 3安全 4很安全）',
  `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
  `pwd_update_record` varchar(1000) DEFAULT NULL COMMENT '密码修改记录',
  `pwd_question` varchar(200) DEFAULT NULL COMMENT '密保问题',
  `pwd_question_answer` varchar(200) DEFAULT NULL COMMENT '密保问题答案',
  `pwd_question_2` varchar(200) DEFAULT NULL COMMENT '密保问题2',
  `pwd_question_answer_2` varchar(200) DEFAULT NULL COMMENT '密保问题答案2',
  `pwd_question_3` varchar(200) DEFAULT NULL COMMENT '密保问题3',
  `pwd_question_answer_3` varchar(200) DEFAULT NULL COMMENT '密保问题答案3',
  `pwd_quest_update_date` datetime DEFAULT NULL COMMENT '密码问题修改时间',
  `last_login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `last_login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `freeze_date` datetime DEFAULT NULL COMMENT '冻结时间',
  `freeze_cause` varchar(200) DEFAULT NULL COMMENT '冻结原因',
  `user_weight` decimal(8,0) DEFAULT '0' COMMENT '用户权重（降序）',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1删除 2停用 3冻结）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  `extend_s1` varchar(500) DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`user_code`),
  KEY `idx_sys_user_lc` (`login_code`),
  KEY `idx_sys_user_email` (`email`),
  KEY `idx_sys_user_mobile` (`mobile`),
  KEY `idx_sys_user_wo` (`wx_openid`),
  KEY `idx_sys_user_imei` (`mobile_imei`),
  KEY `idx_sys_user_rt` (`user_type`),
  KEY `idx_sys_user_rc` (`ref_code`),
  KEY `idx_sys_user_mt` (`mgr_type`),
  KEY `idx_sys_user_us` (`user_weight`),
  KEY `idx_sys_user_ud` (`update_date`),
  KEY `idx_sys_user_status` (`status`),
  KEY `idx_sys_user_cc` (`corp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of js_sys_user
-- ----------------------------
INSERT INTO `js_sys_user` VALUES ('admin', 'admin', '系统管理员', '015faa37e3ad1d748763ff726bae85ed8b803fb8d4df6f3e5c1ba98e', null, null, null, null, null, null, null, null, 'none', null, null, '1', '1', '2019-11-26 09:10:23', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-11-26 09:10:23', 'system', '2019-11-26 09:10:23', '客户方使用的系统管理员，用于一些常用的基础数据配置。', '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('system', 'system', '超级管理员', 'a813c3657f002cd23cbe1bd158db26bff8feef56ea860beea6a9e60b', null, null, null, null, null, null, null, null, 'none', null, null, '0', '1', '2019-11-26 09:10:23', null, null, null, null, null, null, null, null, '220.160.111.118', '2019-11-26 19:15:06', null, null, '0', '0', 'system', '2019-11-26 09:10:23', 'system', '2019-11-26 09:10:23', '开发者使用的最高级别管理员，主要用于开发和调试。', '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user10_wmu8', 'user10', '用户10', '20dd83ebff0d6c78512fa61b49ba2c40e1f09700dab95e6ac17522f3', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user10_wmu8', '用户10', '0', '0', '2019-11-26 09:10:24', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user11_mvwx', 'user11', '用户11', '1f7cdc528298738e2012d089702dd041ff4642160e29a7336c7a4823', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user11_mvwx', '用户11', '0', '0', '2019-11-26 09:10:24', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user12_ay2a', 'user12', '用户12', 'dcd66f5868cfd7d8233a70211c0e110a15633b90565104dd0c82a40b', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user12_ay2a', '用户12', '0', '0', '2019-11-26 09:10:24', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user13_kniv', 'user13', '用户13', '0ac321d091cc01d341de0b6f3c559e2ecd9d61b04ee5c55681015b17', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user13_kniv', '用户13', '0', '0', '2019-11-26 09:10:24', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-11-26 09:10:25', 'system', '2019-11-26 09:10:25', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user14_1oit', 'user14', '用户14', '5daec783282ec42bdfa05655ecbe49a1ea4d80b035e566f2738902bb', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user14_1oit', '用户14', '0', '0', '2019-11-26 09:10:25', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-11-26 09:10:25', 'system', '2019-11-26 09:10:25', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user15_jxyf', 'user15', '用户15', '4924bc95de655b65706bb541dfad48cdf9b7f42d17d418259ebb302d', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user15_jxyf', '用户15', '0', '0', '2019-11-26 09:10:25', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-11-26 09:10:25', 'system', '2019-11-26 09:10:25', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user16_o68a', 'user16', '用户16', '8a0c181eed6facf8fabaa8a7629e9d061720923f9262ac757d695bd8', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user16_o68a', '用户16', '0', '0', '2019-11-26 09:10:25', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-11-26 09:10:25', 'system', '2019-11-26 09:10:25', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user17_dti3', 'user17', '用户17', 'ce9584dc09028c77df2c8ebd4748e35587926b0effeb0bf1846a3277', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user17_dti3', '用户17', '0', '0', '2019-11-26 09:10:25', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-11-26 09:10:25', 'system', '2019-11-26 09:10:25', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user18_o5js', 'user18', '用户18', 'dd77bb75881926caa9c21d5c42888b80562d2e7053f1ca67611e9a5c', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user18_o5js', '用户18', '0', '0', '2019-11-26 09:10:25', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-11-26 09:10:25', 'system', '2019-11-26 09:10:25', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user19_qdoy', 'user19', '用户19', '4fd009ce95ba079c9b3a8780a8da62f8efa4b614e0a126dbb54cb7fa', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user19_qdoy', '用户19', '0', '0', '2019-11-26 09:10:25', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-11-26 09:10:25', 'system', '2019-11-26 09:10:25', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user1_hciz', 'user1', '用户01', '34d87fb19d56b370f86d9c3ca8f63e555b6985f3ebcc4d597e1f9580', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user1_hciz', '用户01', '0', '0', '2019-11-26 09:10:24', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user20_yr6o', 'user20', '用户20', '7e1e2b3e274d71ffa8e964a33605eb6c623d6a0f0cf2fd4082b165d9', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user20_yr6o', '用户20', '0', '0', '2019-11-26 09:10:25', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-11-26 09:10:25', 'system', '2019-11-26 09:10:25', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user21_eolk', 'user21', '用户21', 'a4d358d0f8e5c94e0d79901822a4002d7f869b47ec41547a1b8ee881', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user21_eolk', '用户21', '0', '0', '2019-11-26 09:10:25', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-11-26 09:10:25', 'system', '2019-11-26 09:10:25', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user22_bbsa', 'user22', '用户22', '2c658620541a8c27ec33e41586a8b0d067b04222cbcf772d3c18eb0c', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user22_bbsa', '用户22', '0', '0', '2019-11-26 09:10:25', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-11-26 09:10:25', 'system', '2019-11-26 09:10:25', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user23_q1e5', 'user23', '用户23', '47d3ce10b5f0071792d91d67e5bb5928ebb4ed64e3183bde2f4bec34', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user23_q1e5', '用户23', '0', '0', '2019-11-26 09:10:25', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-11-26 09:10:25', 'system', '2019-11-26 09:10:25', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user2_yo3k', 'user2', '用户02', '05dafbe7d6f28fd86622cf43e9d14baf12b79d15ef8e96768ea94866', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user2_yo3k', '用户02', '0', '0', '2019-11-26 09:10:24', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user3_7b27', 'user3', '用户03', '417804c210ce25cf87421d77d5e9bcf73f7372dcc1d921046eb374cd', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user3_7b27', '用户03', '0', '0', '2019-11-26 09:10:24', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user4_4opy', 'user4', '用户04', 'eca8c7d7cbf22dd1977d00d8f060f8d8796e19c68c218fe30f7ecebd', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user4_4opy', '用户04', '0', '0', '2019-11-26 09:10:24', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user5_horq', 'user5', '用户05', '3ff888501d241a5296fe90b2b35ba8989aa3b63ce58ec874cc0b86a8', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user5_horq', '用户05', '0', '0', '2019-11-26 09:10:24', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user6_zxhu', 'user6', '用户06', '9014989f7a8c19a96976d4e582ab653436e4f9c4858119fada6a46b6', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user6_zxhu', '用户06', '0', '0', '2019-11-26 09:10:24', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user7_oqpw', 'user7', '用户07', '25a84812721eaf4fbef1908541f15601ebd3a8a1451c0fed25bf2390', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user7_oqpw', '用户07', '0', '0', '2019-11-26 09:10:24', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user8_tg06', 'user8', '用户08', '000a3713b7e788b86ecce12f6890071dde10e5d6533a53411def2c36', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user8_tg06', '用户08', '0', '0', '2019-11-26 09:10:24', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user9_pavg', 'user9', '用户09', '607f73d3565d32289bb30a26a6145a878353ab1eaee87774d2082359', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user9_pavg', '用户09', '0', '0', '2019-11-26 09:10:24', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-11-26 09:10:24', 'system', '2019-11-26 09:10:24', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for js_sys_user_data_scope
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_user_data_scope`;
CREATE TABLE `js_sys_user_data_scope` (
  `user_code` varchar(100) NOT NULL COMMENT '控制用户编码',
  `ctrl_type` varchar(20) NOT NULL COMMENT '控制类型',
  `ctrl_data` varchar(64) NOT NULL COMMENT '控制数据',
  `ctrl_permi` varchar(64) NOT NULL COMMENT '控制权限',
  PRIMARY KEY (`user_code`,`ctrl_type`,`ctrl_data`,`ctrl_permi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户数据权限表';

-- ----------------------------
-- Records of js_sys_user_data_scope
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_user_role`;
CREATE TABLE `js_sys_user_role` (
  `user_code` varchar(100) NOT NULL COMMENT '用户编码',
  `role_code` varchar(64) NOT NULL COMMENT '角色编码',
  PRIMARY KEY (`user_code`,`role_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色关联表';

-- ----------------------------
-- Records of js_sys_user_role
-- ----------------------------
INSERT INTO `js_sys_user_role` VALUES ('user10_wmu8', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user11_mvwx', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user12_ay2a', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user13_kniv', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user14_1oit', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user15_jxyf', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user16_o68a', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user17_dti3', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user18_o5js', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user19_qdoy', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user1_hciz', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user20_yr6o', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user21_eolk', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user22_bbsa', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user23_q1e5', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user2_yo3k', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user3_7b27', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user4_4opy', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user5_horq', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user6_zxhu', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user7_oqpw', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user8_tg06', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user9_pavg', 'user');

-- ----------------------------
-- Table structure for test_data
-- ----------------------------
DROP TABLE IF EXISTS `test_data`;
CREATE TABLE `test_data` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `test_input` varchar(200) DEFAULT NULL COMMENT '单行文本',
  `test_textarea` varchar(200) DEFAULT NULL COMMENT '多行文本',
  `test_select` varchar(10) DEFAULT NULL COMMENT '下拉框',
  `test_select_multiple` varchar(200) DEFAULT NULL COMMENT '下拉多选',
  `test_radio` varchar(10) DEFAULT NULL COMMENT '单选框',
  `test_checkbox` varchar(200) DEFAULT NULL COMMENT '复选框',
  `test_date` datetime DEFAULT NULL COMMENT '日期选择',
  `test_datetime` datetime DEFAULT NULL COMMENT '日期时间',
  `test_user_code` varchar(64) DEFAULT NULL COMMENT '用户选择',
  `test_office_code` varchar(64) DEFAULT NULL COMMENT '机构选择',
  `test_area_code` varchar(64) DEFAULT NULL COMMENT '区域选择',
  `test_area_name` varchar(100) DEFAULT NULL COMMENT '区域名称',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试数据';

-- ----------------------------
-- Records of test_data
-- ----------------------------

-- ----------------------------
-- Table structure for test_data_child
-- ----------------------------
DROP TABLE IF EXISTS `test_data_child`;
CREATE TABLE `test_data_child` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `test_sort` int(11) DEFAULT NULL COMMENT '排序号',
  `test_data_id` varchar(64) DEFAULT NULL COMMENT '父表主键',
  `test_input` varchar(200) DEFAULT NULL COMMENT '单行文本',
  `test_textarea` varchar(200) DEFAULT NULL COMMENT '多行文本',
  `test_select` varchar(10) DEFAULT NULL COMMENT '下拉框',
  `test_select_multiple` varchar(200) DEFAULT NULL COMMENT '下拉多选',
  `test_radio` varchar(10) DEFAULT NULL COMMENT '单选框',
  `test_checkbox` varchar(200) DEFAULT NULL COMMENT '复选框',
  `test_date` datetime DEFAULT NULL COMMENT '日期选择',
  `test_datetime` datetime DEFAULT NULL COMMENT '日期时间',
  `test_user_code` varchar(64) DEFAULT NULL COMMENT '用户选择',
  `test_office_code` varchar(64) DEFAULT NULL COMMENT '机构选择',
  `test_area_code` varchar(64) DEFAULT NULL COMMENT '区域选择',
  `test_area_name` varchar(100) DEFAULT NULL COMMENT '区域名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试数据子表';

-- ----------------------------
-- Records of test_data_child
-- ----------------------------

-- ----------------------------
-- Table structure for test_tree
-- ----------------------------
DROP TABLE IF EXISTS `test_tree`;
CREATE TABLE `test_tree` (
  `tree_code` varchar(64) NOT NULL COMMENT '节点编码',
  `parent_code` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(1000) NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10,0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1000) NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4,0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(1000) NOT NULL COMMENT '全节点名',
  `tree_name` varchar(200) NOT NULL COMMENT '节点名称',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`tree_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试树表';

-- ----------------------------
-- Records of test_tree
-- ----------------------------
