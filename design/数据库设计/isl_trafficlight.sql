/*
 Navicat MySQL Data Transfer

 Source Server         : 智能信号灯
 Source Server Type    : MySQL
 Source Server Version : 80024
 Source Host           : 47.99.164.238:3306
 Source Schema         : isl_trafficlight

 Target Server Type    : MySQL
 Target Server Version : 80024
 File Encoding         : 65001

 Date: 18/04/2022 15:58:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_day_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_day_log`;
CREATE TABLE `sys_day_log`  (
  `log_time` date NOT NULL COMMENT '日志时间',
  `new_users` mediumint(0) NULL DEFAULT NULL COMMENT '新增用户\r\n',
  `request_num` int(0) NULL DEFAULT NULL COMMENT '请求次数',
  PRIMARY KEY (`log_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '运行日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_day_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `time` int(0) NULL DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 952 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_alarm
-- ----------------------------
DROP TABLE IF EXISTS `t_alarm`;
CREATE TABLE `t_alarm`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `time` datetime(0) NULL DEFAULT NULL COMMENT '发生时间',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '警报内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '告警信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_alarm
-- ----------------------------
INSERT INTO `t_alarm` VALUES (1, '2022-04-01 18:21:59', '汪汪队出动噜');
INSERT INTO `t_alarm` VALUES (2, '2022-04-01 18:22:28', '什么！？有人呼叫超级飞侠？包裹快递，我是乐迪，每时每刻，准时送达！');

-- ----------------------------
-- Table structure for t_history_light
-- ----------------------------
DROP TABLE IF EXISTS `t_history_light`;
CREATE TABLE `t_history_light`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `light_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信号灯id',
  `red_old` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `red_new` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `green_old` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `green_new` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` datetime(0) NULL DEFAULT NULL COMMENT '变更时间',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '信号灯变更记录表\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_history_light
-- ----------------------------
INSERT INTO `t_history_light` VALUES (1, 'A001E', '60', '30', '60', '30', '2022-04-16 03:42:12', '系统控制');
INSERT INTO `t_history_light` VALUES (2, 'A005W', '40', '45', '40', '45', '2022-04-16 03:43:00', '系统控制');
INSERT INTO `t_history_light` VALUES (3, 'A004E', '60', '35', '50', '30', '2022-04-16 03:43:30', '人工管控');

-- ----------------------------
-- Table structure for t_light
-- ----------------------------
DROP TABLE IF EXISTS `t_light`;
CREATE TABLE `t_light`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `l_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '灯id',
  `p_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '点id',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '点位位置',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '运行状态',
  `red` int(0) NULL DEFAULT NULL COMMENT '红灯时间',
  `green` int(0) NULL DEFAULT NULL COMMENT '绿灯时间',
  `avg` float NULL DEFAULT NULL COMMENT '平均等待时长',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '信号灯状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_light
-- ----------------------------
INSERT INTO `t_light` VALUES (1, 'A001E', 'P001', '学正街公交路口', '正常', 60, 30, 2.5);
INSERT INTO `t_light` VALUES (2, 'A001W', 'P001', '学正街公交路口', '正常', 60, 30, 2.5);
INSERT INTO `t_light` VALUES (3, 'A001N', 'P001', '学正街公交路口', '正常', 60, 30, 2.5);
INSERT INTO `t_light` VALUES (4, 'A001S', 'P001', '学正街公交路口', '正常', 60, 30, 2.5);
INSERT INTO `t_light` VALUES (5, 'A002E', 'P002', '二十七号路六号大街口', '正常', 60, 30, 2.5);
INSERT INTO `t_light` VALUES (6, 'A002W', 'P002', '二十七号路六号大街口', '正常', 60, 30, 2.5);
INSERT INTO `t_light` VALUES (7, 'A002N', 'P002', '二十七号路六号大街口', '正常', 60, 30, 2.5);
INSERT INTO `t_light` VALUES (8, 'A002S', 'P002', '二十七号路六号大街口', '正常', 60, 30, 2.5);
INSERT INTO `t_light` VALUES (9, 'A003E', 'P003', '十号大街二十七号路口', '正常', 50, 30, 2.5);
INSERT INTO `t_light` VALUES (10, 'A003W', 'P003', '十号大街二十七号路口', '正常', 50, 30, 2.5);
INSERT INTO `t_light` VALUES (11, 'A003N', 'P003', '十号大街二十七号路口', '正常', 50, 30, 2.5);
INSERT INTO `t_light` VALUES (12, 'A003S', 'P003', '十号大街二十七号路口', '正常', 50, 30, 2.5);
INSERT INTO `t_light` VALUES (13, 'A004E', 'P004', '二十五号路六号大街口', '正常', 30, 20, 2.5);
INSERT INTO `t_light` VALUES (14, 'A004W', 'P004', '二十五号路六号大街口', '正常', 30, 20, 2.5);
INSERT INTO `t_light` VALUES (15, 'A004N', 'P004', '二十五号路六号大街口', '正常', 30, 20, 2.5);
INSERT INTO `t_light` VALUES (16, 'A004S', 'P004', '二十五号路六号大街口', '正常', 30, 20, 2.5);
INSERT INTO `t_light` VALUES (17, 'A005W', 'P005', '六号大街二十五号路口', '正常', 30, 30, 2.5);
INSERT INTO `t_light` VALUES (18, 'A005N', 'P005', '六号大街二十五号路口', '正常', 30, 30, 2.5);
INSERT INTO `t_light` VALUES (19, 'A005E', 'P005', '六号大街二十五号路口', '正常', 30, 30, 2.5);
INSERT INTO `t_light` VALUES (20, 'A005S', 'P005', '六号大街二十五号路口', '正常', 30, 30, 2.5);
INSERT INTO `t_light` VALUES (21, 'A006E', 'P006', '六号大街二十三号路口', '正常', 60, 60, 2.5);
INSERT INTO `t_light` VALUES (22, 'A006W', 'P006', '六号大街二十三号路口', '正常', 60, 60, 2.5);
INSERT INTO `t_light` VALUES (23, 'A006N', 'P006', '六号大街二十三号路口', '正常', 60, 60, 2.5);
INSERT INTO `t_light` VALUES (24, 'A006S', 'P006', '六号大街二十三号路口', '正常', 60, 60, 2.5);
INSERT INTO `t_light` VALUES (25, 'A007E', 'P007', '六号大街十九号路口', '正常', 120, 60, 2.5);
INSERT INTO `t_light` VALUES (26, 'A007W', 'P007', '六号大街十九号路口', '正常', 120, 60, 2.5);
INSERT INTO `t_light` VALUES (27, 'A007N', 'P007', '六号大街十九号路口', '正常', 120, 60, 2.5);
INSERT INTO `t_light` VALUES (28, 'A007S', 'P007', '六号大街十九号路口', '正常', 120, 60, 2.5);
INSERT INTO `t_light` VALUES (29, 'A008E', 'P008', '六号大街十一号路口', '正常', 60, 50, 2.5);
INSERT INTO `t_light` VALUES (30, 'A008W', 'P008', '六号大街十一号路口', '正常', 60, 50, 2.5);
INSERT INTO `t_light` VALUES (31, 'A008N', 'P008', '六号大街十一号路口', '正常', 60, 50, 2.5);
INSERT INTO `t_light` VALUES (32, 'A008S', 'P008', '六号大街十一号路口', '正常', 60, 50, 2.5);
INSERT INTO `t_light` VALUES (33, 'A009E', 'P009', '九号路六号大街口', '正常', 60, 35, 2.5);
INSERT INTO `t_light` VALUES (34, 'A009W', 'P009', '九号路六号大街口', '正常', 60, 35, 2.5);
INSERT INTO `t_light` VALUES (35, 'A009N', 'P009', '九号路六号大街口', '正常', 60, 35, 2.5);
INSERT INTO `t_light` VALUES (36, 'A009S', 'P009', '九号路六号大街口', '正常', 60, 35, 2.5);
INSERT INTO `t_light` VALUES (37, 'A010E', 'P010', '四号大街九号路口', '正常', 30, 30, 2.5);
INSERT INTO `t_light` VALUES (38, 'A010W', 'P010', '四号大街九号路口', '正常', 30, 30, 2.5);
INSERT INTO `t_light` VALUES (39, 'A010N', 'P010', '四号大街九号路口', '正常', 30, 30, 2.5);
INSERT INTO `t_light` VALUES (40, 'A010S', 'P010', '四号大街九号路口', '正常', 30, 30, 2.5);
INSERT INTO `t_light` VALUES (41, 'A011E', 'P011', '四号大街五号路口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (42, 'A011W', 'P011', '四号大街五号路口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (43, 'A011N', 'P011', '四号大街五号路口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (44, 'A011S', 'P011', '四号大街五号路口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (45, 'A012E', 'P012', '文渊路二号大街口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (46, 'A012W', 'P012', '文渊路二号大街口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (47, 'A012N', 'P012', '文渊路二号大街口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (48, 'A012S', 'P012', '文渊路二号大街口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (49, 'A013E', 'P013', '高沙路学源街口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (50, 'A013W', 'P013', '高沙路学源街口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (51, 'A013N', 'P013', '高沙路学源街口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (52, 'A013S', 'P013', '高沙路学源街口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (53, 'A014E', 'P014', '学源街银沙路口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (54, 'A014W', 'P014', '学源街银沙路口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (55, 'A014N', 'P014', '学源街银沙路口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (56, 'A014S', 'P014', '学源街银沙路口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (57, 'A015E', 'P015', '学源街上沙路口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (58, 'A015W', 'P015', '学源街上沙路口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (59, 'A015N', 'P015', '学源街上沙路口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (60, 'A015S', 'P015', '学源街上沙路口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (61, 'A016E', 'P016', '学源街海达南路口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (62, 'A016W', 'P016', '学源街海达南路口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (63, 'A016N', 'P016', '学源街海达南路口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (64, 'A016S', 'P016', '学源街海达南路口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (65, 'A017E', 'P017', '学源街幸福南路口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (66, 'A017W', 'P017', '学源街幸福南路口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (67, 'A017N', 'P017', '学源街幸福南路口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (68, 'A017S', 'P017', '学源街幸福南路口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (69, 'A018E', 'P018', '幸福南路学源街口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (70, 'A018W', 'P018', '幸福南路学源街口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (71, 'A018N', 'P018', '幸福南路学源街口', '正常', 10, 10, 2.5);
INSERT INTO `t_light` VALUES (72, 'A018S', 'P018', '幸福南路学源街口', '正常', 10, 10, 2.5);

-- ----------------------------
-- Table structure for t_person
-- ----------------------------
DROP TABLE IF EXISTS `t_person`;
CREATE TABLE `t_person`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `identity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `household` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '户籍',
  `apartment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '照片',
  `passwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `time` datetime(0) NULL DEFAULT NULL COMMENT '注册日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '人员信息表\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_person
-- ----------------------------

-- ----------------------------
-- Table structure for t_phase
-- ----------------------------
DROP TABLE IF EXISTS `t_phase`;
CREATE TABLE `t_phase`  (
  `id` int(0) NOT NULL,
  `north` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '北信号灯相位',
  `south` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '南信号灯相位',
  `east` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '东信号灯相位',
  `west` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '西信号灯相位',
  `p_id` int(0) NULL DEFAULT NULL COMMENT '方案id',
  `step` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相位编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '相位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_phase
-- ----------------------------

-- ----------------------------
-- Table structure for t_point
-- ----------------------------
DROP TABLE IF EXISTS `t_point`;
CREATE TABLE `t_point`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `pid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '点位id',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '位置',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `manager` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路口类型',
  `light_num` int(0) NULL DEFAULT NULL COMMENT '信号灯数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '点位路口表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_point
-- ----------------------------

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `role_id` int(0) NOT NULL COMMENT '角色id',
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名',
  `role_sign` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标识',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `prefix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户id前缀',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `passwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `role_id` int(0) NOT NULL,
  `role_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `auth_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_video
-- ----------------------------
DROP TABLE IF EXISTS `t_video`;
CREATE TABLE `t_video`  (
  `id` int(0) NOT NULL,
  `video` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_video
-- ----------------------------

-- ----------------------------
-- Table structure for t_vio_idx
-- ----------------------------
DROP TABLE IF EXISTS `t_vio_idx`;
CREATE TABLE `t_vio_idx`  (
  `v_id` int(0) NOT NULL COMMENT '违规事件id',
  `t_id` varchar(0) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信号灯id',
  `p_id` varchar(0) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '点位id',
  PRIMARY KEY (`v_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '违规事件索引表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_vio_idx
-- ----------------------------

-- ----------------------------
-- Table structure for t_violation
-- ----------------------------
DROP TABLE IF EXISTS `t_violation`;
CREATE TABLE `t_violation`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `car_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '车牌号',
  `v_place` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '违规地点',
  `v_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '违规类型',
  `time` datetime(0) NULL DEFAULT NULL COMMENT '违规时间',
  `v_point` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '违规点位编号',
  `person_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '车主姓名',
  `person_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '车主身份证号',
  `car_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '车辆类型',
  `v_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '违规画面路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '违规记录表\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_violation
-- ----------------------------
INSERT INTO `t_violation` VALUES (1, '浙A12345', '杭州市白杨街道学林支路', '闯红灯', '2022-03-08 17:59:20', '2001', '张老三', '3310222000010100001', '小轿车', NULL);
INSERT INTO `t_violation` VALUES (2, '浙A77U77', '杭州市钱塘区学府街', '遮挡号牌', '2022-03-08 18:10:15', '2002', '李老四', '150802197404090390', '小轿车', NULL);
INSERT INTO `t_violation` VALUES (3, '浙A76SD4', '杭州市钱塘区学府街', '闯红灯', '2022-03-08 19:11:11', '2002', '孙厚权', '140123197209169433', '小轿车', NULL);
INSERT INTO `t_violation` VALUES (4, '浙ASD755', '杭州市白杨街道学林支路', '超速', '2022-03-08 19:20:12', '2001', '叶芃孛', '130629198111117836', '小轿车', NULL);
INSERT INTO `t_violation` VALUES (5, '浙BDS477', '杭州市钱塘区学府街', '超速', '2022-03-08 19:20:16', '2002', '赵径文', '350122198911297053', '小轿车', NULL);
INSERT INTO `t_violation` VALUES (6, '浙D72945', '杭州市钱塘区学府街', '套牌', '2022-03-09 14:41:11', '2003', '李嘉欣', '350122199911207053', '小轿车', NULL);

-- ----------------------------
-- Table structure for t_volume_light
-- ----------------------------
DROP TABLE IF EXISTS `t_volume_light`;
CREATE TABLE `t_volume_light`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `light_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  `m_volume` int(0) NULL DEFAULT NULL COMMENT '机动车流量',
  `n_volume` int(0) NULL DEFAULT NULL COMMENT '非机动车流量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '信号灯方向流量表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_volume_light
-- ----------------------------
INSERT INTO `t_volume_light` VALUES (1, 'A001E', '2022-04-16 04:00:00', 102, 15);
INSERT INTO `t_volume_light` VALUES (2, 'A001E', '2022-04-16 05:00:00', 150, 10);
INSERT INTO `t_volume_light` VALUES (3, 'A001E', '2022-04-16 06:00:00', 123, 40);
INSERT INTO `t_volume_light` VALUES (4, 'A001E', '2022-04-16 07:00:00', 264, 95);
INSERT INTO `t_volume_light` VALUES (5, 'A001E', '2022-04-16 08:00:00', 455, 153);
INSERT INTO `t_volume_light` VALUES (6, 'A001E', '2022-04-16 09:00:00', 615, 255);
INSERT INTO `t_volume_light` VALUES (7, 'A001E', '2022-04-16 10:00:00', 551, 177);

-- ----------------------------
-- Table structure for t_volume_point
-- ----------------------------
DROP TABLE IF EXISTS `t_volume_point`;
CREATE TABLE `t_volume_point`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `point_id` int(0) NULL DEFAULT NULL COMMENT '点位id',
  `m_volume` int(0) NULL DEFAULT NULL COMMENT '机动车流量',
  `time` datetime(0) NULL DEFAULT NULL COMMENT '时间',
  `n_volume` int(0) NULL DEFAULT NULL COMMENT '非机动车流量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '点位流量表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_volume_point
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
