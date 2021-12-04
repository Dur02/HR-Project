/*
 Navicat Premium Data Transfer

 Source Server         : mydb
 Source Server Type    : MySQL
 Source Server Version : 50623
 Source Host           : localhost:3306
 Source Schema         : hrdb

 Target Server Type    : MySQL
 Target Server Version : 50623
 File Encoding         : 65001

 Date: 19/06/2021 08:55:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dremark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`did`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (1, '财务部', '无');
INSERT INTO `dept` VALUES (2, '学术部', '无');
INSERT INTO `dept` VALUES (3, '公关部', '无');
INSERT INTO `dept` VALUES (5, '技术部', '无');
INSERT INTO `dept` VALUES (6, '人事部', '优秀部门');
INSERT INTO `dept` VALUES (7, '行政部', '');
INSERT INTO `dept` VALUES (8, '123', '123');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `card_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `post_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qq_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` enum('1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `party` enum('党员','群众','共青团员') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birthday` datetime(0) NOT NULL,
  `race` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `education` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `speciality` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hobby` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_dept`(`dept_id`) USING BTREE,
  INDEX `FK_job`(`job_id`) USING BTREE,
  CONSTRAINT `FK_dept` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`did`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_job` FOREIGN KEY (`job_id`) REFERENCES `job` (`jid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, 1, 1, '段誉', '65335463222243553', '广东省深圳市龙华街道办2号', '513408', '33388876', '15919754435', '803543321', 'wuyingd@qq.com', '1', '党员', '2013-06-01 10:56:41', '汉族', '本科', '计算机', '打篮球', '无', '2019-09-22 10:59:34');
INSERT INTO `employee` VALUES (2, 2, 3, '黄老邪', '65335463222243553', '广东省深圳市龙华街道办2号', '513408', '33388876', '15919754433', '803543321', '121434@qq.com', '1', '群众', '2019-09-17 11:09:35', '汉族', '本科', '软工', '打羽毛球', '无', '2019-09-22 11:08:34');
INSERT INTO `employee` VALUES (3, 1, 2, '李建厚', '62311457845424566', '东莞理工学院莞华社区', '525129', '33495118', '15627280776', '1753506553', '1753506553@qq.com', '1', '党员', '1997-12-17 17:07:11', '蒙古族', '博士', '计算机', '街舞', '优秀员工', '2019-12-30 11:12:45');
INSERT INTO `employee` VALUES (4, 3, 2, '黄洁', '62122624522221555', '广东省广州市', '525211', '', '13433645785', '12121212', '12121212@qq.com', '2', '党员', '2019-12-30 08:39:15', '汉族', '本科', '机械工程', '街舞', '', '2019-12-30 08:39:58');
INSERT INTO `employee` VALUES (5, 1, 1, '李欣', '6212262010034758875', '广东省广州市广东工业大学', '525421', '2273351', '13544525478', '1202456685', '1202456685@qq.com', '2', '群众', '1994-04-06 20:31:19', '汉族', '本科', '建筑学', '跳舞', '无', '2019-12-31 20:32:13');
INSERT INTO `employee` VALUES (6, 2, 2, '杀生丸', '62122624522121255', '广东深圳', '756385', '1343365****', '', '522014789', 'sss@qq.com', '1', '党员', '1987-09-08 00:00:00', '汉族', '博士', '人力资源管理', '游泳', '', '2020-01-01 08:35:53');
INSERT INTO `employee` VALUES (7, 6, 3, '犬夜叉', '62122624342121868', '广东广州', '759660', '1343365****', '', '452014789', 'dfds@qq.com', '1', '党员', '1988-10-08 00:00:00', '汉族', '研究生', '软件工程', '散魂铁爪', '', '2019-05-08 03:35:00');
INSERT INTO `employee` VALUES (8, 5, 4, '风早翔太', '62122624522121350', '日本东京', '756345', '1343365****', '', '502089789', 'fffa@qq.com', '1', '群众', '1992-12-08 00:00:00', '汉族', '硕士', '经济学', '棒球', '', '2017-05-08 06:06:00');
INSERT INTO `employee` VALUES (9, 6, 7, '李小翠', '62122624522121868', '广东茂名', '756360', '1343365****', '', '502014789', 'ccca@qq.com', '1', '党员', '1995-10-23 00:00:00', '汉族', '研究生', '财政学', '飞盘', '', '2012-05-08 12:43:00');

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job`  (
  `jid` int(11) NOT NULL AUTO_INCREMENT,
  `jname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jremark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`jid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES (1, '工程师', '无');
INSERT INTO `job` VALUES (2, '会计师', '无');
INSERT INTO `job` VALUES (3, '普通职员', '无');
INSERT INTO `job` VALUES (4, 'java程序员', '无');
INSERT INTO `job` VALUES (6, '前端工程师', '');
INSERT INTO `job` VALUES (7, '董事长秘书', '小三');
INSERT INTO `job` VALUES (9, '安卓工程师', '工资不能低于10000');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_notice_userId`(`userId`) USING BTREE,
  CONSTRAINT `FK_notice_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, 100001, '今日头条', '习近平在中央政协工作会议上的讲话金句', '金句来了！习近平在中央政协工作会议暨庆祝中国人民政治协商会议成立70周年大会上的讲话金句​​​​ ', '无');
INSERT INTO `notice` VALUES (2, 100001, '今日头条', '携手奋进新时代', '新华社评论员：画出最大同心圆，携手奋进新时代——学习\r\n习近平总书记在中央政协工作会议暨庆祝中国人民政治协商会议成立70周年大会重要讲话​​​​ ', '无');
INSERT INTO `notice` VALUES (3, 100001, '习近平以“六稳”推动经济高质量发展', '联播+丨习近平以“六稳”推动经济高质量发展', '<p class=\"title\" style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.6rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; width: 745.104px; font-family: &quot;PingFang SC&quot;, &quot;PingFang TC&quot;, &quot;Microsoft YaHei&quot;, STHeiti, arial, helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">12月6日，习近平总书记主持中共中央政治局会议。会议分析研究2020年经济工作，强调全面做好“六稳”工作。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em; font-family: &quot;PingFang SC&quot;, &quot;PingFang TC&quot;, &quot;Microsoft YaHei&quot;, STHeiti, arial, helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">“六稳”，即“稳就业、稳金融、稳外贸、稳外资、稳投资、稳预期”。做好“六稳”工作对于保持经济运行在合理区间，确保全面建成小康社会和“十三五”规划圆满收官具有重要意义。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em; font-family: &quot;PingFang SC&quot;, &quot;PingFang TC&quot;, &quot;Microsoft YaHei&quot;, STHeiti, arial, helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">近年来，习近平在国内考察、重要会议、国际活动等多个场合，对如何扎实做好“六稳”工作进行了详细阐述。《联播+》与您一起学习。</p><p class=\"title\" style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 0.12rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; width: 745.104px; display: inline-block; background: url(&quot;//p1.img.cctvpic.com/photoAlbum/templet/common/DEPA1539311446672181/icon_bluexian_18313.png&quot;) 0% 0% / 0.36rem 0.36rem repeat; border: 1px solid rgb(33, 68, 140);\"><span class=\"text\" style=\"box-sizing: border-box; font-size: 0.36rem; line-height: 0.6rem; display: block; text-align: center; margin: -0.1rem 0px 0.1rem; transform: translate(-0.1rem, 0px); padding: 0.06rem 0.25rem; font-weight: bold; border: 1px solid rgb(33, 68, 140);\">稳就业</span></p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">要出台更多鼓励就业创业的措施，重点解决好高校毕业生、退役军人、下岗职工、农民工、返乡人员等重点人群的就业问题。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">——2019年9月18日，在河南考察时的讲话</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">要对就业困难人员及时提供就业指导和技能培训，确保他们就业有门路、生活有保障。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">——2019年5月22日，在江西考察时的讲话</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">要坚持就业优先战略，把解决人民群众就业问题放在更加突出的位置，努力创造更多就业岗位。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0px; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">——2019年2月1日，春节前夕在北京看望慰问基层干部群众时的讲话</p><p class=\"title\" style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 0.12rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; width: 745.104px; display: inline-block; background: url(&quot;//p1.img.cctvpic.com/photoAlbum/templet/common/DEPA1539311446672181/icon_bluexian_18313.png&quot;) 0% 0% / 0.36rem 0.36rem repeat; border: 1px solid rgb(33, 68, 140);\"><span class=\"text\" style=\"box-sizing: border-box; font-size: 0.36rem; line-height: 0.6rem; display: block; text-align: center; margin: -0.1rem 0px 0.1rem; transform: translate(-0.1rem, 0px); padding: 0.06rem 0.25rem; font-weight: bold; border: 1px solid rgb(33, 68, 140);\">稳金融</span></p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">面对未来全球系统性金融风险挑战，我们不但要确保金融安全网资源充足，也要让国际金融架构的代表性更加合理，更好反映世界经济现实格局。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">——2019年6月28日，在二十国集团领导人峰会上关于世界经济形势和贸易问题的讲话</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">要坚持靶向治疗、精确惩治，聚焦党的十八大以来着力查处的重点对象，紧盯事关发展全局和国家安全的重大工程、重点领域、关键岗位，加大金融领域反腐力度，对存在腐败问题的，发现一起坚决查处一起。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">——2019年1月11日，在十九届中央纪委三次全会上的讲话</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">希望国际货币基金组织继续在全球贸易议程中发挥积极作用，维护公平开放的全球金融市场，推动国际秩序朝着更加公正合理的方向发展。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0px; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">——2019年11月22日，会见国际货币基金组织总裁格奥尔基耶娃时的讲话</p><p class=\"title\" style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 0.12rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; width: 745.104px; display: inline-block; background: url(&quot;//p1.img.cctvpic.com/photoAlbum/templet/common/DEPA1539311446672181/icon_bluexian_18313.png&quot;) 0% 0% / 0.36rem 0.36rem repeat; border: 1px solid rgb(33, 68, 140);\"><span class=\"text\" style=\"box-sizing: border-box; font-size: 0.36rem; line-height: 0.6rem; display: block; text-align: center; margin: -0.1rem 0px 0.1rem; transform: translate(-0.1rem, 0px); padding: 0.06rem 0.25rem; font-weight: bold; border: 1px solid rgb(33, 68, 140);\">稳外贸</span></p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">我们应该坚持以开放求发展，深化交流合作，坚持“拉手”而不是“松手”，坚持“拆墙”而不是“筑墙”，坚决反对保护主义、单边主义，不断削减贸易壁垒，推动全球价值链、供应链更加完善，共同培育市场需求。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">——2019年11月5日，在第二届中国国际进口博览会开幕式上的主旨演讲</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">我们不刻意追求贸易顺差，愿意进口更多国外有竞争力的优质农产品、制成品和服务，促进贸易平衡发展。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">——2019年4月26日，在第二届“一带一路”国际合作高峰论坛开幕式上的主旨演讲</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">为此，我们必须坚持对外开放的基本国策，奉行互利共赢的开放战略，深化人文交流，完善对外开放区域布局、对外贸易布局、投资布局，形成对外开放新体制，发展更高层次的开放型经济，以扩大开放带动创新、推动改革、促进发展。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0px; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">——2015年10月29日，在党的十八届五中全会第二次全体会议上的讲话</p><p class=\"title\" style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0px; margin-bottom: 0.12rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; width: 745.104px; display: inline-block; background: url(&quot;//p1.img.cctvpic.com/photoAlbum/templet/common/DEPA1539311446672181/icon_bluexian_18313.png&quot;) 0% 0% / 0.36rem 0.36rem repeat; border: 1px solid rgb(33, 68, 140);\"><span class=\"text\" style=\"box-sizing: border-box; font-size: 0.36rem; line-height: 0.6rem; display: block; text-align: center; margin: -0.1rem 0px 0.1rem; transform: translate(-0.1rem, 0px); padding: 0.06rem 0.25rem; font-weight: bold; border: 1px solid rgb(33, 68, 140);\">稳外资</span></p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">中国将坚持扩大对外开放，增加商品和服务进口，扩大外资市场准入，加强知识产权保护，形成全方位、多层次、宽领域的全面开放新格局。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">——2019年11月14日，在金砖国家领导人巴西利亚会晤公开会议上的讲话</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">中国将不断完善市场化、法治化、国际化的营商环境，放宽外资市场准入，继续缩减负面清单，完善投资促进和保护、信息报告等制度。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">——2019年11月5日，在第二届中国国际进口博览会开幕式上的主旨演讲</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0.48rem; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">中国致力于促进更高水平对外开放，坚定支持多边贸易体制，将在更广领域扩大外资市场准入，积极打造一流营商环境。</p><p style=\"box-sizing: border-box; text-size-adjust: none; padding: 0px; margin-top: 0.48rem; margin-bottom: 0px; list-style: none; letter-spacing: 2px; color: rgb(51, 51, 51); font-size: 0.36rem; line-height: 0.6rem; text-align: justify; text-indent: 2em;\">——2019年5月28日，向2019年中国国际服务贸易交易会致贺信</p><p><br/></p>', NULL);
INSERT INTO `notice` VALUES (4, 100001, '习近平新时代中国特色社会主义', '【在习近平新时代中国特色社会主义思想指引下——新时代 新作为 新篇章】全国人大上海虹桥基层立法联系点探索全过程民主', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans; font-size: 18px; white-space: normal; background-color: rgb(255, 255, 255);\">央广网北京12月8日消息（记者马喆）据中央广播电视总台中国之声《新闻和报纸摘要》报道，今年11月2日，习近平总书记到上海虹桥街道考察基层立法联系点工作。他指出，虹桥这个基层立法联系点很有意义，立足社区实际、认真扎实地开展工作，做了很多接地气、聚民智的有益探索，并勉励街道要再接再厉，为发展中国特色社会主义民主继续作贡献。<a target=\"_blank\" href=\"http://china.cnr.cn/news//20191208/t20191208_524888505.shtml\" style=\"color: rgb(0, 0, 0); text-decoration-line: none;\"><span style=\"color:#0000ff;font-family:楷体_GB2312\"><strong style=\"color: rgb(0, 0, 0);\">2019-12-8 新闻和报纸摘要全文&gt;&gt;&gt;</strong></span></a></p><p><span class=\"vcp-timelabel\" style=\"display: inline-block; line-height: 3em; float: left; color: rgb(255, 255, 255); padding: 0px 9px; height: 3em; z-index: 1001; position: relative;\">00:15 / 04:53</span></p><p><span class=\"vcp-volume-icon\" style=\"background-image: url(&quot;data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiB2aWV3Qm94PSIwIDAgMzYgMzYiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayI+DQogICAgPHBhdGggZD0iTTEyLjM5LDE1LjU0IEwxMCwxNS41NCBMMTAsMjAuNDQgTDEyLjQsMjAuNDQgTDE3LDI1LjUwIEwxNywxMC40OCBMMTIuMzksMTUuNTQgWiIgb3BhY2l0eT0iMSIgZmlsbD0iI2ZmZiI+PC9wYXRoPg0KICAgIDxwYXRoIGQ9Ik0xMi4zOSwxNS41NCBMMTAsMTUuNTQgTDEwLDIwLjQ0IEwxMi40LDIwLjQ0IEwxNywyNS41MCBMMTcsMTAuNDggTDEyLjM5LDE1LjU0IFoiIG9wYWNpdHk9IjEiIGZpbGw9IiNmZmYiPjwvcGF0aD4NCiAgICA8cGF0aCBkPSJNMTkuNjMsMTUuOTIgTDIwLjY4LDE0LjkzIEwyMi44MSwxNi45NCBMMjQuOTQsMTQuOTMgTDI2LDE1LjkyIEwyMy44NiwxNy45MyBMMjYsMTkuOTMgTDI0Ljk0LDIwLjkyIEwyMi44MSwxOC45MiBMMjAuNjgsMjAuOTIgTDE5LjYzLDE5LjkzIEwyMS43NiwxNy45MyBMMTkuNjMsMTUuOTIgWiIgb3BhY2l0eT0iMSIgZmlsbD0iI2ZmZiI+PC9wYXRoPg0KICAgIDxwYXRoIGQ9Ik0xOS42MywxNS45MiBMMjAuNjgsMTQuOTMgTDIyLjgxLDE2Ljk0IEwyNC45NCwxNC45MyBMMjYsMTUuOTIgTDIzLjg2LDE3LjkzIEwyNiwxOS45MyBMMjQuOTQsMjAuOTIgTDIyLjgxLDE4LjkyIEwyMC42OCwyMC45MiBMMTkuNjMsMTkuOTMgTDIxLjc2LDE3LjkzIEwxOS42MywxNS45MiBaIiBvcGFjaXR5PSIxIiBmaWxsPSIjZmZmIj48L3BhdGg+DQo8L3N2Zz4=&quot;); display: inline-block; width: 3em; height: 3em; position: absolute; left: 0px; top: 0px;\"></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans; font-size: 18px; white-space: normal; background-color: rgb(255, 255, 255);\">　　自2015年起，全国人大常委会法工委在上海虹桥街道设立基层立法联系点。在这里，基层的立法建议可以直达全国人大常委会。四年多来，25条来自基层的建议被采纳，成为法律条文。基层立法联系点有力地彰显了新时代的民主立法、科学立法，也为全过程民主进行了有益探索。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans; font-size: 18px; white-space: normal; background-color: rgb(255, 255, 255);\">　　上海虹桥街道是全国人大常委会法工委在全国设立的四个基层立法联系点之一，也是唯一设在街道的立法联系点。基层立法联系点直通全国人大常委会，被百姓形象地称为“群众声音直通车，基层立法彩虹桥”。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Sans Serif&quot;, &quot;WenQuanYi Micro Hei&quot;, sans; font-size: 18px; white-space: normal; background-color: rgb(255, 255, 255);\">　　近日，全国人大常委会法工委就未成年人保护法修订草案和预防未成年人犯罪法修订草案在上海虹桥街道进行意见征询。征询的对象是街道辖区内的教师、家长和法律工作者等。全国人大常委会法工委社会法室主任郭林茂在征询会上表示，原汁原味的意见，有助于开拓立法思路。</p><p><br/></p>', NULL);
INSERT INTO `notice` VALUES (5, 100001, '美联邦调查局', '美联邦调查局确认美海军航空站枪击案凶手为沙特人', '<p style=\"margin-top: 10px; margin-bottom: 20px; padding: 0px; list-style: none; line-height: 30px; word-break: break-all; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Helvetica, &quot;Microsoft YaHei&quot;, simsun, sans-serif; white-space: normal; background-color: rgb(249, 249, 249);\">新华社华盛顿12月7日电（记者邓仙来 孙丁）美国联邦调查局7日在社交媒体上确认，6日发生在美国佛罗里达州一海军航空站的枪击事件凶手为沙特阿拉伯籍男子穆罕默德⋅阿尔沙姆拉尼。</p><p style=\"margin-top: 10px; margin-bottom: 20px; padding: 0px; list-style: none; line-height: 30px; word-break: break-all; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Helvetica, &quot;Microsoft YaHei&quot;, simsun, sans-serif; white-space: normal; background-color: rgb(249, 249, 249);\">美国联邦调查局当日表示，该局下设的打击恐怖活动联合工作组等部门正在参与相关调查。据美国媒体报道，凶手穆罕默德⋅阿尔沙姆拉尼现年21岁，服役于沙特阿拉伯皇家空军，当时在事发海军航空站接受飞行训练。</p><p style=\"margin-top: 10px; margin-bottom: 20px; padding: 0px; list-style: none; line-height: 30px; word-break: break-all; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Helvetica, &quot;Microsoft YaHei&quot;, simsun, sans-serif; white-space: normal; background-color: rgb(249, 249, 249);\">美国海军7日公布了枪击事件中3名遇难人员的姓名及身份，他们均是海军飞行学员，年龄在19岁至23岁之间，分别来自美国亚拉巴马州、佛罗里达州和佐治亚州。</p><p><br/></p>', NULL);
INSERT INTO `notice` VALUES (25, 100001, '百度资讯', '常程闪电加盟小米 “电磁炉”正式组合出道', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\"><span class=\"bjh-strong\" style=\"font-size: 18px; font-weight: 700;\">出品|凤凰网科技综合</span></span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">1月2日上午，雷军在新浪微博发布消息，原联想集团副总裁、ZUKCEO正式加入小米，将担任小米集团副总裁，负责手机产品规划。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">常程今日上午也在微信朋友圈表示，小米是最美的期待，2020年的拼搏从第一天开始。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">他在朋友圈里写到，”雷总有梦想“”Bin总有能力“有梦想/有能量/坚持不懈的10年，小米最美的期待。2020拼搏从第一天开始。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">2019年12月31日，联想中国区发布公告宣布联想手机掌门人常程离职。常程的工作将由联想集团副总裁、联想移动亚太新兴市场负责人赵允明代管。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">联想中国区给出的离职原因是”家庭因素“。联想中国区表示，常程因家庭聚少离多，基于个人身体健康和希望更多精力照顾家庭的原因，故近期提出离职。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">凤凰网科技从知情人士处了解到，常程从联想集团离职，并没有竞业条款，也没有拿竞业补偿。</span></p><p style=\"margin-top: 22px; margin-bottom: 0px; padding: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"bjh-p\">常程本人则在微博上称“19年成长在联想，感悟、感谢、感恩”。</span></p><p><br/></p>', '同花顺财经');
INSERT INTO `notice` VALUES (29, 100001, 'HTML5-语义化', '大前端', '<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; word-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp;&nbsp;&nbsp;&nbsp;距HTML5标准规范制定完成并公开发布已经有好些年了，面试时也少不了要问对HTML5语义化得理解。但是在实际运用时，真正使用HTML5标签来开发的似乎不是很多（ps：查看了几个巨头公司网站推论），可能一部分原因是仍有部分用户使用在使用低版本浏览器。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; word-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; 但是就我个人而言，因选取一些标签时会比较纠结，所以仍使用了div。（PS：正是因为这样，才有了这篇文章的，没错，以后要注意语义化了）</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; word-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; 什么是语义化？就是用合理、正确的标签来展示内容，比如h1~h6定义标题。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; word-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; 语义化优点：</p><ul style=\"box-sizing: border-box; margin-bottom: 20px; margin-left: 50px; padding: 0px; list-style-position: initial; list-style-image: initial; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\" class=\" list-paddingleft-2\"><li><p>易于用户阅读，样式丢失的时候能让页面呈现清晰的结构。</p></li><li><p>有利于SEO，搜索引擎根据标签来确定上下文和各个关键字的权重。</p></li><li><p>方便其他设备解析，如盲人阅读器根据语义渲染网页</p></li><li><p>有利于开发和维护，语义化更具可读性，代码更好维护，与CSS3关系更和谐。</p></li></ul><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; word-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; 今天先介绍主体结构标签，如图所示：</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; word-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><img class=\"aligncenter wp-image-6577\" src=\"http://www.daqianduan.com/wp-content/uploads/2018/03/html5.png\" alt=\"html5\" width=\"454\" height=\"300\"/></p><p><br/></p>', 'Made by Lcy');
INSERT INTO `notice` VALUES (32, 100001, '1', '1', '<p>1</p>', '1');
INSERT INTO `notice` VALUES (34, 100001, '1', '1', '<p class=\"ql-align-justify\" style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; text-align: justify; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2020年1月1日，一则话题上了热搜。</p><p class=\"ql-align-justify\" style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; text-align: justify; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">据媒体报道，2019年12月23日，安徽合肥，一女子和朋友前往海底捞吃饭。</p><p class=\"ql-align-justify\" style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; text-align: justify; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">朋友携带的导盲犬被海底捞工作人员拒绝入内。女子称导盲犬属于工作犬，且带有证件，相关规定可以进出公共场合，仍被拒绝。</p><p class=\"ql-align-center\" style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; text-align: center; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://5b0988e595225.cdn.sohucs.com/images/20200102/39a422e48c044a1f9bc98957483d4755.png\"/></p><p><br/></p>', '1');
INSERT INTO `notice` VALUES (35, 100001, '导盲犬进海底捞被拒 耐吉斯呼吁正确对待工作犬', '导盲犬进海底捞被拒 耐吉斯呼吁正确对待工作犬', '<p class=\"ql-align-justify\" style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; text-align: justify; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">020年1月1日，一则话题上了热搜。</p><p class=\"ql-align-justify\" style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; text-align: justify; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">据媒体报道，2019年12月23日，安徽合肥，一女子和朋友前往海底捞吃饭。</p><p class=\"ql-align-justify\" style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; text-align: justify; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">朋友携带的导盲犬被海底捞工作人员拒绝入内。女子称导盲犬属于工作犬，且带有证件，相关规定可以进出公共场合，仍被拒绝。</p><p class=\"ql-align-center\" style=\"border: 0px; margin-top: 0.63em; margin-bottom: 1.8em; padding: 0px; counter-reset: list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; text-align: center; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://5b0988e595225.cdn.sohucs.com/images/20200102/39a422e48c044a1f9bc98957483d4755.png\"/></p><p><br/></p>', '');
INSERT INTO `notice` VALUES (36, 100001, '地摊经济活了-', 'qqqq', '<p style=\"text-align: center;\"><span style=\"font-size: 36px; color: rgb(255, 0, 0);\">地摊经济活了-</span></p><p><br/></p>', '');
INSERT INTO `notice` VALUES (37, 100001, 'wqewqeq', 'eqweqeqwe', '<p>ewqeqweqweqwe</p>', '');
INSERT INTO `notice` VALUES (38, 100001, 'qwewrq', 'ewrwerwer', '<p>rwerwr</p>', '');
INSERT INTO `notice` VALUES (39, 100001, '123', '123', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0020.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/></p>', '');
INSERT INTO `notice` VALUES (40, 100001, 'wyc', 'wyc弟弟', '', '');
INSERT INTO `notice` VALUES (41, 100001, '无缘超弟弟', '弟弟', '', '');
INSERT INTO `notice` VALUES (42, 100001, '吴元超迟到', 'q', '', '');
INSERT INTO `notice` VALUES (43, 100001, '当你选择做这件事时，尽管不对，也要愚蠢往下走.', '1', '', '');
INSERT INTO `notice` VALUES (44, 100001, '幸子煮', '幸子煮', '', '幸子煮');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `rname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rremark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '普通员工', NULL);
INSERT INTO `role` VALUES (2, '管理员', NULL);
INSERT INTO `role` VALUES (3, '超级管理员', NULL);

-- ----------------------------
-- Table structure for uploadfile
-- ----------------------------
DROP TABLE IF EXISTS `uploadfile`;
CREATE TABLE `uploadfile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `fileName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uploadDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_uploadfile_userId`(`userId`) USING BTREE,
  CONSTRAINT `FK_uploadfile_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of uploadfile
-- ----------------------------
INSERT INTO `uploadfile` VALUES (6, 100001, 'lcy_20200102150844071_blue.jpg', '2020-01-02 15:08:44');
INSERT INTO `uploadfile` VALUES (18, 100001, 'maimai_20200103110337038_注意.txt', '2020-01-03 11:03:37');
INSERT INTO `uploadfile` VALUES (19, 100001, 'malirene_20200103154652949_导盲犬进海底捞.docx', '2020-01-03 15:46:52');
INSERT INTO `uploadfile` VALUES (20, 100001, 'malirene_20200103154653098_饥荒.txt', '2020-01-03 15:46:53');
INSERT INTO `uploadfile` VALUES (21, 100001, 'lcy_20200607151310530_验证码.docx', '2020-06-07 15:13:10');
INSERT INTO `uploadfile` VALUES (22, 100001, 'lcy_20210515091215071_Activity 跳转及传值返回.docx', '2021-05-15 09:12:15');
INSERT INTO `uploadfile` VALUES (23, 100001, 'lcy_20210515162300079_sqllite数据库.docx', '2021-05-15 16:23:00');
INSERT INTO `uploadfile` VALUES (24, 100001, 'lcy_20210522150239475_aa.jpg', '2021-05-22 15:02:39');
INSERT INTO `uploadfile` VALUES (25, 100001, 'lcy_20210531191618860_04-逆向工程.docx', '2021-05-31 19:16:18');
INSERT INTO `uploadfile` VALUES (26, 100001, 'lcy_20210614090705531_', '2021-06-14 09:07:05');
INSERT INTO `uploadfile` VALUES (27, 100001, 'lcy_20210614143518772_eclipse.exe', '2021-06-14 14:35:21');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdate` datetime(0) NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE,
  INDEX `FK_role`(`role_id`) USING BTREE,
  CONSTRAINT `FK_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`rid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 100017 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (100001, '123456', 3, '18802290129', '2021-06-01 18:20:51', '虚伪紧', '我是帅哥');
INSERT INTO `user` VALUES (100002, '123456', 1, '15945236654', '2021-06-04 17:05:59', '啊朱', NULL);
INSERT INTO `user` VALUES (100003, '123456', 1, '15265452235', '2021-06-07 17:09:42', '草地僧', NULL);
INSERT INTO `user` VALUES (100004, '888888', 1, '13433648882', '2020-01-15 21:52:00', '宝宝', '');
INSERT INTO `user` VALUES (100005, '123456', 1, '17025469281', '2020-01-02 21:38:02', 'holykill', 'M城霸主');
INSERT INTO `user` VALUES (100006, '123456', 2, '18065498213', '2020-01-02 21:38:40', 'hello', '');
INSERT INTO `user` VALUES (100007, '22222', 1, '13433642490', '2020-01-02 12:25:19', 'maimai323', '');
INSERT INTO `user` VALUES (100008, '123456', 3, '13310829193', '2020-01-02 12:27:15', 'malirene', 'p城城主');
INSERT INTO `user` VALUES (100009, '123456', 3, '13302570931', '2020-01-02 12:29:11', 'lcy', '总裁');
INSERT INTO `user` VALUES (100010, '123456', 2, '13452489561', '2020-01-02 21:39:23', 'jerry', '');
INSERT INTO `user` VALUES (100012, '666666', 1, '13458952464', '2020-01-02 21:42:47', 'milly', '');
INSERT INTO `user` VALUES (100013, '123456', 2, '18085694258', '2020-01-02 21:14:32', 'tryrate', '');
INSERT INTO `user` VALUES (100014, '123456', 2, '13785492513', '2020-01-02 21:13:49', 'linetiny', '');
INSERT INTO `user` VALUES (100015, '123456', 1, '18028103690', '2021-06-01 14:34:41', 'W', NULL);
INSERT INTO `user` VALUES (100016, '123456', 1, '18025133236', '2020-01-03 15:40:03', 'kakaa1', NULL);

SET FOREIGN_KEY_CHECKS = 1;
