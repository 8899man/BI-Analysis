/*
SQLyog Ultimate v11.27 (32 bit)
MySQL - 5.1.73-log : Database - dc2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dc2` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

USE `dc2`;

/*Table structure for table `Dm_Mobile` */

DROP TABLE IF EXISTS `Dm_Mobile`;

CREATE TABLE `Dm_Mobile` (
  `ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MobileNumber` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MobileArea` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MobileType` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `AreaCode` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PostCode` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `H_FamilyInfo` */

DROP TABLE IF EXISTS `H_FamilyInfo`;

CREATE TABLE `H_FamilyInfo` (
  `FamilyInfoGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `FamilyCode` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `FamilyGrade` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `CreateOn` datetime DEFAULT NULL,
  `BUGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`FamilyInfoGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `a_tmp_repair` */

DROP TABLE IF EXISTS `a_tmp_repair`;

CREATE TABLE `a_tmp_repair` (
  `repairId` int(11) NOT NULL AUTO_INCREMENT,
  `repairRy` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '维修人员',
  `repairCd` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '维修程度',
  `repairTime` datetime DEFAULT NULL,
  `repairXm` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '维修项目',
  `repairFy` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '维系费用',
  `repairSlr` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '受理人',
  `repairType` int(11) DEFAULT '0' COMMENT '类型',
  `roomId` int(11) DEFAULT NULL,
  `repairSlrLx` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`repairId`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `b_area_company` */

DROP TABLE IF EXISTS `b_area_company`;

CREATE TABLE `b_area_company` (
  `companyID` bigint(20) NOT NULL AUTO_INCREMENT,
  `companyGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `companyName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `companyFullName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `companyCode` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hierarchyCode` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parentGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `webSite` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `companyAddr` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `charter` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `corporationDeputy` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `createdBy` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifiedBy` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isEndCompany` int(11) DEFAULT NULL,
  `isCompany` int(10) DEFAULT '1',
  `level` int(11) DEFAULT NULL,
  `companyType` int(11) DEFAULT NULL,
  `projGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orderCode` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orderHierarchyCode` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `namePath` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isRoot` int(11) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0',
  `createTime` datetime DEFAULT NULL,
  `modifyTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`companyID`),
  KEY `index_companyGUID` (`companyGUID`),
  KEY `index_projguid` (`projGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=1308 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `b_attach_attr` */

DROP TABLE IF EXISTS `b_attach_attr`;

CREATE TABLE `b_attach_attr` (
  `attrGUID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID标识',
  `attachCode` varchar(16) COLLATE utf8_unicode_ci NOT NULL COMMENT '特征编号',
  `orgName` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '组织名称',
  `orgType` int(10) NOT NULL COMMENT '组织类型1=代理公司2=中介公司3=销售团队4=区域公司/事业部',
  `remark` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '简介',
  PRIMARY KEY (`attrGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `b_building` */

DROP TABLE IF EXISTS `b_building`;

CREATE TABLE `b_building` (
  `bldID` bigint(20) NOT NULL DEFAULT '0' COMMENT '序列号',
  `bldGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋GUID（明源）',
  `companyGUID` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司GUID',
  `projGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `bldCode` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋编码',
  `bldName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋名称',
  `parentCode` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '父级编码',
  `bldFullName` varchar(400) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋全称',
  `planUrl` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '平面图地址',
  `bldProPerty` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '建筑性质',
  `unitNum` int(11) DEFAULT NULL COMMENT '单元数',
  `floorNum` int(11) DEFAULT NULL COMMENT '楼层数',
  `floorList` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '楼层列表',
  `isBld` tinyint(4) DEFAULT NULL COMMENT '是否楼栋',
  `saleRentable` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '租售类型',
  `planBldArea` double DEFAULT NULL COMMENT '计划建筑面积',
  `factBldArea` double DEFAULT NULL COMMENT '实测建筑面积',
  `inUsed` tinyint(4) DEFAULT NULL COMMENT '使用者',
  `bldState` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋状态',
  `sourceApp` int(11) DEFAULT NULL COMMENT '业态来源',
  KEY `idx_building_bldGUID` (`bldGUID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `b_building_bak` */

DROP TABLE IF EXISTS `b_building_bak`;

CREATE TABLE `b_building_bak` (
  `bldID` bigint(20) NOT NULL DEFAULT '0' COMMENT '序列号',
  `bldGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋GUID（明源）',
  `companyGUID` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司GUID',
  `projGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `bldCode` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋编码',
  `bldName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋名称',
  `parentCode` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '父级编码',
  `bldFullName` varchar(400) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋全称',
  `planUrl` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '平面图地址',
  `bldProPerty` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '建筑性质',
  `unitNum` int(11) DEFAULT NULL COMMENT '单元数',
  `floorNum` int(11) DEFAULT NULL COMMENT '楼层数',
  `floorList` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '楼层列表',
  `isBld` tinyint(4) DEFAULT NULL COMMENT '是否楼栋',
  `saleRentable` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '租售类型',
  `planBldArea` double DEFAULT NULL COMMENT '计划建筑面积',
  `factBldArea` double DEFAULT NULL COMMENT '实测建筑面积',
  `inUsed` tinyint(4) DEFAULT NULL COMMENT '使用者',
  `bldState` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋状态',
  `sourceApp` int(11) DEFAULT NULL COMMENT '业态来源'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `b_building_copy` */

DROP TABLE IF EXISTS `b_building_copy`;

CREATE TABLE `b_building_copy` (
  `bldID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `bldGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋GUID（明源）',
  `companyGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司GUID',
  `projGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `bldCode` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋编码',
  `bldName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋名称',
  `parentCode` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '父级编码',
  `bldFullName` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋全称',
  `planUrl` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '平面图地址',
  `bldProPerty` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '建筑性质',
  `unitNum` int(11) DEFAULT NULL COMMENT '单元数',
  `floorNum` int(11) DEFAULT NULL COMMENT '楼层数',
  `floorList` mediumtext COLLATE utf8_unicode_ci COMMENT '楼层列表',
  `isBld` tinyint(4) DEFAULT NULL COMMENT '是否楼栋',
  `saleRentable` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '租售类型',
  `planBldArea` double DEFAULT NULL COMMENT '计划建筑面积',
  `factBldArea` double DEFAULT NULL COMMENT '实测建筑面积',
  `inUsed` tinyint(4) DEFAULT NULL COMMENT '使用者',
  `bldState` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋状态',
  `sourceApp` int(11) DEFAULT NULL COMMENT '业态来源',
  PRIMARY KEY (`bldID`),
  KEY `ix_BldGUID` (`bldGUID`),
  KEY `index_projguid` (`projGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=4516 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `b_building_test` */

DROP TABLE IF EXISTS `b_building_test`;

CREATE TABLE `b_building_test` (
  `bldID` bigint(20) NOT NULL DEFAULT '0' COMMENT '序列号',
  `bldGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋GUID（明源）',
  `companyGUID` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司GUID',
  `projGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `bldCode` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋编码',
  `bldName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋名称',
  `parentCode` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '父级编码',
  `bldFullName` varchar(400) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋全称',
  `planUrl` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '平面图地址',
  `bldProPerty` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '建筑性质',
  `unitNum` int(11) DEFAULT NULL COMMENT '单元数',
  `floorNum` int(11) DEFAULT NULL COMMENT '楼层数',
  `floorList` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '楼层列表',
  `isBld` tinyint(4) DEFAULT NULL COMMENT '是否楼栋',
  `saleRentable` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '租售类型',
  `planBldArea` double DEFAULT NULL COMMENT '计划建筑面积',
  `factBldArea` double DEFAULT NULL COMMENT '实测建筑面积',
  `inUsed` tinyint(4) DEFAULT NULL COMMENT '使用者',
  `bldState` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋状态',
  `sourceApp` int(11) DEFAULT NULL COMMENT '业态来源'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `b_building_test1` */

DROP TABLE IF EXISTS `b_building_test1`;

CREATE TABLE `b_building_test1` (
  `bldID` bigint(20) NOT NULL DEFAULT '0' COMMENT '序列号',
  `bldGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋GUID（明源）',
  `companyGUID` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司GUID',
  `projGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `bldCode` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋编码',
  `bldName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋名称',
  `parentCode` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '父级编码',
  `bldFullName` varchar(400) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋全称',
  `planUrl` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '平面图地址',
  `bldProPerty` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '建筑性质',
  `unitNum` int(11) DEFAULT NULL COMMENT '单元数',
  `floorNum` int(11) DEFAULT NULL COMMENT '楼层数',
  `floorList` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '楼层列表',
  `isBld` tinyint(4) DEFAULT NULL COMMENT '是否楼栋',
  `saleRentable` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '租售类型',
  `planBldArea` double DEFAULT NULL COMMENT '计划建筑面积',
  `factBldArea` double DEFAULT NULL COMMENT '实测建筑面积',
  `inUsed` tinyint(4) DEFAULT NULL COMMENT '使用者',
  `bldState` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋状态',
  `sourceApp` int(11) DEFAULT NULL COMMENT '业态来源'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `b_building_unit` */

DROP TABLE IF EXISTS `b_building_unit`;

CREATE TABLE `b_building_unit` (
  `unitGUID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '单元GUID',
  `oriUnitGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '数据源GUID',
  `bldGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '楼栋GUID',
  `seq` int(10) NOT NULL COMMENT '序号',
  `unitName` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '单元名称',
  `unitCode` varchar(80) COLLATE utf8_unicode_ci NOT NULL COMMENT '单元编码',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `simpleName` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '简称',
  `createBy` varchar(44) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `lastUpdateUser` varchar(44) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '最后修改人',
  `lastUpdateTime` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`unitGUID`),
  KEY `index_bldguid` (`bldGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `b_city` */

DROP TABLE IF EXISTS `b_city`;

CREATE TABLE `b_city` (
  `cityGUID` bigint(19) NOT NULL AUTO_INCREMENT,
  `cityCode` int(10) NOT NULL,
  `cityName` varchar(50) COLLATE utf8_bin NOT NULL,
  `status` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cityGUID`),
  KEY `idx_bcity_name` (`cityName`),
  KEY `idx_bcity_code` (`cityCode`)
) ENGINE=InnoDB AUTO_INCREMENT=3513 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `b_company_city` */

DROP TABLE IF EXISTS `b_company_city`;

CREATE TABLE `b_company_city` (
  `cityCode` int(11) NOT NULL COMMENT '城市ID',
  `companyGUID` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '公司GUID',
  `type` int(11) NOT NULL COMMENT '项目类型0:地产1:物业2:地产与物业交叉',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '统一名称',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `b_company_proj` */

DROP TABLE IF EXISTS `b_company_proj`;

CREATE TABLE `b_company_proj` (
  `projGUID` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '项目GUID',
  `companyGUID` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '公司GUID',
  `type` int(11) NOT NULL COMMENT '项目类型0:地产1:物业2:地产与物业交叉',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '统一名称',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `b_def_attach` */

DROP TABLE IF EXISTS `b_def_attach`;

CREATE TABLE `b_def_attach` (
  `attachGUID` int(10) NOT NULL AUTO_INCREMENT COMMENT '特征ID',
  `category` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '属于哪一类的特征定义，如身份定义、渠道定义、业态定义、途径定义等；10=渠道20=身份30=业态40=客户描摹50=机会描摹60=途径定义70=媒体活动定义',
  `attachCode` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '特征编号，全局唯一',
  `attachType` int(10) DEFAULT '0' COMMENT '类型根据分类不同分不同的值表示，如分类值是20,即身份，则type可取值为1=自然人2=机构',
  `attachName` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '中文名称',
  `level` int(10) NOT NULL COMMENT '特征级别1=全局系统级2=业态系统级4=项目组织级8=渠道应用级',
  `remark` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`attachGUID`),
  UNIQUE KEY `index_attach_code` (`attachCode`)
) ENGINE=InnoDB AUTO_INCREMENT=652 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `b_def_attach_values` */

DROP TABLE IF EXISTS `b_def_attach_values`;

CREATE TABLE `b_def_attach_values` (
  `attachCode` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `input` int(11) NOT NULL COMMENT '1=手动输入，默认\n2=单选\n3=多选',
  `attachKey` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `createTime` timestamp NULL DEFAULT NULL,
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `index_attachCode` (`attachCode`),
  KEY `index_attachKey` (`attachKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `b_industry` */

DROP TABLE IF EXISTS `b_industry`;

CREATE TABLE `b_industry` (
  `industryID` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '业态ID',
  `industryName` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业态名称',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`industryID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='业态表';

/*Table structure for table `b_industry_org` */

DROP TABLE IF EXISTS `b_industry_org`;

CREATE TABLE `b_industry_org` (
  `industryID` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '业态ID',
  `orgGUID` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '组织ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='业态组织表';

/*Table structure for table `b_org` */

DROP TABLE IF EXISTS `b_org`;

CREATE TABLE `b_org` (
  `orgGUID` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'ID标识',
  `parentGUID` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '父级组织,顶级组织则parent为0',
  `orgName` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '组织名称',
  `orgType` int(11) NOT NULL COMMENT '组织类型\n1=代理公司\n2=中介公司\n3=区域公司/事业部\n4=商场\n5=商铺\n6=门店',
  `subType` int(11) NOT NULL DEFAULT '0' COMMENT '子类型|orgType=3 时有效，默认为0    0  无效 1 集团 2  区域  3 区域公司 4 部门  5 业态',
  `sourceApp` int(11) DEFAULT NULL COMMENT '来源应用，关联sys_app表;同orgType，可以确定组织机构的来源',
  `isRoot` int(11) DEFAULT '0' COMMENT '是否根级节点，默认为0；主要针对多根组织架构设计\n1=是\n0=否',
  `status` int(11) DEFAULT '1' COMMENT '有效状态\r\n1=有效，默认值\r\n0=无效\r\n',
  `remark` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '简介',
  `path` longtext COLLATE utf8_bin COMMENT '路径',
  PRIMARY KEY (`orgGUID`),
  KEY `index_guid` (`orgGUID`),
  KEY `index_name` (`orgName`),
  KEY `index_type` (`orgType`),
  KEY `index_parent` (`parentGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `b_org_attr` */

DROP TABLE IF EXISTS `b_org_attr`;

CREATE TABLE `b_org_attr` (
  `orgGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '组织GUID',
  `paramName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '传入字段名',
  `paramValue` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '传入字段值',
  `remark` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  KEY `index_orgGUID` (`orgGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `b_org_bak` */

DROP TABLE IF EXISTS `b_org_bak`;

CREATE TABLE `b_org_bak` (
  `orgGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ID标识',
  `parentGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '父级组织',
  `orgName` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '组织名称',
  `orgType` int(10) NOT NULL COMMENT '组织类型1=代理公司2=中介公司3=销售团队4=区域公司/事业部',
  `subType` int(5) DEFAULT NULL COMMENT '子类型|orgType=4 时有效   0 无效 1 集团  2 区域  3 区域公司',
  `remark` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '简介',
  PRIMARY KEY (`orgGUID`),
  KEY `index_guid` (`orgGUID`),
  KEY `index_name` (`orgName`),
  KEY `index_type` (`orgType`),
  KEY `index_parent` (`parentGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `b_org_user` */

DROP TABLE IF EXISTS `b_org_user`;

CREATE TABLE `b_org_user` (
  `userGUID` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户GUID',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户ID',
  `cstName` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名称',
  `companyGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '销售团队ID',
  `attachCode` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `statusReason` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态原因',
  `createdBy` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modifiedBy` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `remark` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '说明',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `orgGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属组织机构'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `b_proj` */

DROP TABLE IF EXISTS `b_proj`;

CREATE TABLE `b_proj` (
  `projID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '项目ID',
  `projGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '源项目GUID',
  `projCode` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目全代码',
  `projName` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目名称',
  `companyGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司GUID',
  `bgnSaleDate` datetime DEFAULT NULL COMMENT '开盘日期',
  `endSaleDate` datetime DEFAULT NULL COMMENT '封盘日期',
  `projInfo` mediumtext COLLATE utf8_unicode_ci COMMENT '项目描述',
  `planUrl` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '平面图地址',
  `buildBeginDate` datetime DEFAULT NULL COMMENT '开工日期',
  `buildEndDate` datetime DEFAULT NULL COMMENT '竣工日期',
  `projStatus` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目状态',
  `principal` varchar(48) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '负责人',
  `contactPhone` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `projAddress` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目地址',
  `occupyArea` double DEFAULT NULL COMMENT '占地面积',
  `buildArea` double DEFAULT NULL COMMENT '建筑面积',
  `developUnitID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开发商id',
  `developUnitName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开发商',
  `buildUnitName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '施工单位',
  `inspectUnitName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '监理单位',
  `projIntro` mediumtext COLLATE utf8_unicode_ci COMMENT '项目简介',
  `projShortName` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目简称',
  `parentGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '父级代码',
  `parentCode` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` tinyint(4) DEFAULT NULL COMMENT '项目级数',
  `ifEnd` tinyint(4) DEFAULT NULL COMMENT '是否最末级项目',
  `projShortCode` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目代码',
  `innerArea` double DEFAULT NULL COMMENT '套内面积',
  `saleArea` double DEFAULT NULL COMMENT '可售面积',
  `saleNum` int(11) DEFAULT NULL COMMENT '可售套数',
  `salePrice` double DEFAULT NULL COMMENT '可售单价',
  `saleAmount` double DEFAULT NULL COMMENT '可售金额',
  `beginDate` datetime DEFAULT NULL COMMENT '项目开始日期',
  `endDate` datetime DEFAULT NULL COMMENT '项目截止日期',
  `isGT` tinyint(4) DEFAULT NULL COMMENT '是否公摊',
  `cityCode` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '城市编码',
  `lastModifyTime` datetime DEFAULT NULL COMMENT '最后修改时间',
  `status` int(10) DEFAULT '1' COMMENT '状态',
  `onlineTime` datetime DEFAULT NULL COMMENT '上下线时间',
  `onlineStatus` int(11) DEFAULT '0' COMMENT '状态，1上线0下线',
  `appType` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '应用类型，保留字段',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `ProjSaleStatus` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '出售状态',
  `projArea` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目区域',
  `sourceApp` int(11) DEFAULT NULL COMMENT '业态来源',
  PRIMARY KEY (`projID`),
  UNIQUE KEY `index_projGUID` (`projGUID`),
  KEY `index_projCode` (`projCode`),
  KEY `index_projName` (`projName`(255))
) ENGINE=InnoDB AUTO_INCREMENT=5666 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `b_proj-ori` */

DROP TABLE IF EXISTS `b_proj-ori`;

CREATE TABLE `b_proj-ori` (
  `projID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '项目ID',
  `projGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '源项目GUID',
  `projCode` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目全代码',
  `projName` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目名称',
  `companyGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司GUID',
  `bgnSaleDate` datetime DEFAULT NULL COMMENT '开盘日期',
  `endSaleDate` datetime DEFAULT NULL COMMENT '封盘日期',
  `projInfo` mediumtext COLLATE utf8_unicode_ci COMMENT '项目描述',
  `planUrl` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '平面图地址',
  `buildBeginDate` datetime DEFAULT NULL COMMENT '开工日期',
  `buildEndDate` datetime DEFAULT NULL COMMENT '竣工日期',
  `projStatus` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目状态',
  `principal` varchar(48) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '负责人',
  `contactPhone` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `projAddress` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目地址',
  `occupyArea` double DEFAULT NULL COMMENT '占地面积',
  `buildArea` double DEFAULT NULL COMMENT '建筑面积',
  `developUnitID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开发商id',
  `developUnitName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开发商',
  `buildUnitName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '施工单位',
  `inspectUnitName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '监理单位',
  `projIntro` mediumtext COLLATE utf8_unicode_ci COMMENT '项目简介',
  `projShortName` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目简称',
  `parentGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '父级代码',
  `parentCode` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` tinyint(4) DEFAULT NULL COMMENT '项目级数',
  `ifEnd` tinyint(4) DEFAULT NULL COMMENT '是否最末级项目',
  `projShortCode` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目代码',
  `innerArea` double DEFAULT NULL COMMENT '套内面积',
  `saleArea` double DEFAULT NULL COMMENT '可售面积',
  `saleNum` int(11) DEFAULT NULL COMMENT '可售套数',
  `salePrice` double DEFAULT NULL COMMENT '可售单价',
  `saleAmount` double DEFAULT NULL COMMENT '可售金额',
  `beginDate` datetime DEFAULT NULL COMMENT '项目开始日期',
  `endDate` datetime DEFAULT NULL COMMENT '项目截止日期',
  `isGT` tinyint(4) DEFAULT NULL COMMENT '是否公摊',
  `cityCode` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '城市编码',
  `lastModifyTime` datetime DEFAULT NULL COMMENT '最后修改时间',
  `status` int(10) DEFAULT '1' COMMENT '状态',
  `onlineTime` datetime DEFAULT NULL COMMENT '上下线时间',
  `onlineStatus` int(11) DEFAULT '0' COMMENT '状态，1上线0下线',
  `appType` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '应用类型，保留字段',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `ProjSaleStatus` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '出售状态',
  `projArea` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目区域',
  `sourceApp` int(11) DEFAULT NULL COMMENT '业态来源',
  PRIMARY KEY (`projID`),
  UNIQUE KEY `index_projGUID` (`projGUID`),
  KEY `index_projCode` (`projCode`),
  KEY `index_projName` (`projName`(255))
) ENGINE=InnoDB AUTO_INCREMENT=1194 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `b_proj_20151225` */

DROP TABLE IF EXISTS `b_proj_20151225`;

CREATE TABLE `b_proj_20151225` (
  `projID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '项目ID',
  `projGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '源项目GUID',
  `projCode` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目全代码',
  `projName` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目名称',
  `companyGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司GUID',
  `bgnSaleDate` datetime DEFAULT NULL COMMENT '开盘日期',
  `endSaleDate` datetime DEFAULT NULL COMMENT '封盘日期',
  `projInfo` mediumtext COLLATE utf8_unicode_ci COMMENT '项目描述',
  `planUrl` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '平面图地址',
  `buildBeginDate` datetime DEFAULT NULL COMMENT '开工日期',
  `buildEndDate` datetime DEFAULT NULL COMMENT '竣工日期',
  `projStatus` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目状态',
  `principal` varchar(48) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '负责人',
  `contactPhone` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `projAddress` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目地址',
  `occupyArea` double DEFAULT NULL COMMENT '占地面积',
  `buildArea` double DEFAULT NULL COMMENT '建筑面积',
  `developUnitID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开发商id',
  `developUnitName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开发商',
  `buildUnitName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '施工单位',
  `inspectUnitName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '监理单位',
  `projIntro` mediumtext COLLATE utf8_unicode_ci COMMENT '项目简介',
  `projShortName` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目简称',
  `parentGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '父级代码',
  `parentCode` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` tinyint(4) DEFAULT NULL COMMENT '项目级数',
  `ifEnd` tinyint(4) DEFAULT NULL COMMENT '是否最末级项目',
  `projShortCode` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目代码',
  `innerArea` double DEFAULT NULL COMMENT '套内面积',
  `saleArea` double DEFAULT NULL COMMENT '可售面积',
  `saleNum` int(11) DEFAULT NULL COMMENT '可售套数',
  `salePrice` double DEFAULT NULL COMMENT '可售单价',
  `saleAmount` double DEFAULT NULL COMMENT '可售金额',
  `beginDate` datetime DEFAULT NULL COMMENT '项目开始日期',
  `endDate` datetime DEFAULT NULL COMMENT '项目截止日期',
  `isGT` tinyint(4) DEFAULT NULL COMMENT '是否公摊',
  `cityCode` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '城市编码',
  `lastModifyTime` datetime DEFAULT NULL COMMENT '最后修改时间',
  `status` int(10) DEFAULT '1' COMMENT '状态',
  `onlineTime` datetime DEFAULT NULL COMMENT '上下线时间',
  `onlineStatus` int(11) DEFAULT '0' COMMENT '状态，1上线0下线',
  `appType` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '应用类型，保留字段',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `ProjSaleStatus` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '出售状态',
  `projArea` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目区域',
  `sourceApp` int(11) DEFAULT NULL COMMENT '业态来源',
  PRIMARY KEY (`projID`),
  UNIQUE KEY `index_projGUID` (`projGUID`),
  KEY `index_projCode` (`projCode`),
  KEY `index_projName` (`projName`(255))
) ENGINE=InnoDB AUTO_INCREMENT=696 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `b_proj_city` */

DROP TABLE IF EXISTS `b_proj_city`;

CREATE TABLE `b_proj_city` (
  `projGUID` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '项目GUID',
  `cityCode` int(11) NOT NULL COMMENT '城市',
  `type` int(11) NOT NULL COMMENT '项目类型0:地产1:物业2:地产与物业交叉',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '统一名称',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `b_proj_mapping` */

DROP TABLE IF EXISTS `b_proj_mapping`;

CREATE TABLE `b_proj_mapping` (
  `realProjCode` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '实际项目编号',
  `realProjName` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '实际项目名',
  `popularizeProjCode` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '推广项目编号',
  `popularizeProjName` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '推广项目名',
  `type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类型',
  `popularizeProjAlias` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '推广项目别名',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`realProjCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `b_proj_org` */

DROP TABLE IF EXISTS `b_proj_org`;

CREATE TABLE `b_proj_org` (
  `companyGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '销售团队',
  `orgGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '所属组织机构',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '名称',
  `projGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '项目',
  `createdBy` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modifiedBy` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `remark` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '说明',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `b_proj_setting` */

DROP TABLE IF EXISTS `b_proj_setting`;

CREATE TABLE `b_proj_setting` (
  `projGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '项目GUID',
  `attachCode` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '特征编号',
  `input` int(10) NOT NULL COMMENT '输入方式1=手动输入，默认2=单选3=多选',
  `attachKey` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '特征值，即某个特征对应的建值',
  `label` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特征名',
  `parentCode` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '父级特征项',
  `remark` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `b_room` */

DROP TABLE IF EXISTS `b_room`;

CREATE TABLE `b_room` (
  `roomID` bigint(20) NOT NULL AUTO_INCREMENT,
  `roomGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `companyGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `projGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '区域编号',
  `bldGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '区域名称',
  `mainRoomGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司编号',
  `cstGUIDList` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `floor` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `no` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `room` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roomCode` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `huXing` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `saleStatus` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bldArea` double DEFAULT NULL,
  `tnArea` double DEFAULT NULL,
  `blRhDate` datetime DEFAULT NULL,
  `YFBZ` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roomMemo` mediumtext COLLATE utf8_unicode_ci,
  `zxBz` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `tnPrice` double DEFAULT NULL,
  `zxPrice` double DEFAULT NULL,
  `zxTotal` double DEFAULT NULL,
  `bedeckKind` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isTempletRoom` tinyint(4) DEFAULT NULL,
  `west` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chooseRoom` tinyint(4) DEFAULT NULL,
  `chooseRoomDate` datetime DEFAULT NULL,
  `roomStru` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `absolutelyFloor` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `statusChgGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `saleRentable` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productTypeCode` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `htRoom` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dxsArea` double DEFAULT NULL,
  `carArea` double DEFAULT NULL,
  `ltArea` double DEFAULT NULL,
  `fpDate` datetime DEFAULT NULL,
  `zdFpDate` datetime DEFAULT NULL,
  `cqfzNum` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ysBldArea` double DEFAULT NULL,
  `scBldArea` double DEFAULT NULL,
  `scTnArea` double DEFAULT NULL,
  `ysTnArea` double DEFAULT NULL,
  `hyArea` double DEFAULT NULL,
  `flatArea` double DEFAULT NULL,
  `ytArea` double DEFAULT NULL,
  `rhhyArea` double DEFAULT NULL,
  `ysxkzDate` datetime DEFAULT NULL,
  `ysxkzNo` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cqfzGetDate` datetime DEFAULT NULL,
  `yyjfDate` datetime DEFAULT NULL,
  `isCannotSale` tinyint(4) DEFAULT NULL,
  `cannotSaleReason` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chooseRoomNo` int(11) DEFAULT NULL,
  `variety` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productAttribute` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `parkingType` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parkingCurrentHandleMethod` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parkingSaleType` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parkingHandleDate` datetime DEFAULT NULL,
  `isParkingCq` tinyint(4) DEFAULT NULL,
  `businessCqLife` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remarkHTML` mediumtext COLLATE utf8_unicode_ci,
  `businessManageFee` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `buysRoomNo` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parkingPattern` varchar(4128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chooseRoomCstGUID` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productFormCode` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productFormName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roomStatus` int(5) NOT NULL DEFAULT '0',
  `roomType` int(5) NOT NULL DEFAULT '0',
  `createTime` datetime NOT NULL,
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sourceApp` int(11) DEFAULT NULL COMMENT '业态来源',
  `house_address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wy_tmpID` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`roomID`),
  KEY `ix_BldGUID` (`bldGUID`),
  KEY `index_roomguid` (`roomGUID`),
  KEY `index_projGUID` (`projGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=599299 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `b_room_copy` */

DROP TABLE IF EXISTS `b_room_copy`;

CREATE TABLE `b_room_copy` (
  `roomID` bigint(20) NOT NULL AUTO_INCREMENT,
  `roomGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `companyGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `projGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '区域编号',
  `bldGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '区域名称',
  `mainRoomGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司编号',
  `cstGUIDList` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `floor` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `no` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `room` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roomCode` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `huXing` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `saleStatus` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bldArea` double DEFAULT NULL,
  `tnArea` double DEFAULT NULL,
  `blRhDate` datetime DEFAULT NULL,
  `YFBZ` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roomMemo` mediumtext COLLATE utf8_unicode_ci,
  `zxBz` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `tnPrice` double DEFAULT NULL,
  `zxPrice` double DEFAULT NULL,
  `zxTotal` double DEFAULT NULL,
  `bedeckKind` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isTempletRoom` tinyint(4) DEFAULT NULL,
  `west` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chooseRoom` tinyint(4) DEFAULT NULL,
  `chooseRoomDate` datetime DEFAULT NULL,
  `roomStru` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `absolutelyFloor` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `statusChgGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `saleRentable` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productTypeCode` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `htRoom` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dxsArea` double DEFAULT NULL,
  `carArea` double DEFAULT NULL,
  `ltArea` double DEFAULT NULL,
  `fpDate` datetime DEFAULT NULL,
  `zdFpDate` datetime DEFAULT NULL,
  `cqfzNum` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ysBldArea` double DEFAULT NULL,
  `scBldArea` double DEFAULT NULL,
  `scTnArea` double DEFAULT NULL,
  `ysTnArea` double DEFAULT NULL,
  `hyArea` double DEFAULT NULL,
  `flatArea` double DEFAULT NULL,
  `ytArea` double DEFAULT NULL,
  `rhhyArea` double DEFAULT NULL,
  `ysxkzDate` datetime DEFAULT NULL,
  `ysxkzNo` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cqfzGetDate` datetime DEFAULT NULL,
  `yyjfDate` datetime DEFAULT NULL,
  `isCannotSale` tinyint(4) DEFAULT NULL,
  `cannotSaleReason` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chooseRoomNo` int(11) DEFAULT NULL,
  `variety` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productAttribute` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `parkingType` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parkingCurrentHandleMethod` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parkingSaleType` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parkingHandleDate` datetime DEFAULT NULL,
  `isParkingCq` tinyint(4) DEFAULT NULL,
  `businessCqLife` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remarkHTML` mediumtext COLLATE utf8_unicode_ci,
  `businessManageFee` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `buysRoomNo` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parkingPattern` varchar(4128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chooseRoomCstGUID` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productFormCode` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productFormName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roomStatus` int(5) NOT NULL DEFAULT '0',
  `roomType` int(5) NOT NULL DEFAULT '0',
  `createTime` datetime NOT NULL,
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sourceApp` int(11) DEFAULT NULL COMMENT '业态来源',
  `house_address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`roomID`),
  KEY `ix_BldGUID` (`bldGUID`),
  KEY `index_roomguid` (`roomGUID`),
  KEY `index_projGUID` (`projGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=185835 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `cfg_ram_index` */

DROP TABLE IF EXISTS `cfg_ram_index`;

CREATE TABLE `cfg_ram_index` (
  `ram_item_ID` int(11) NOT NULL,
  `IndexName` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `IndexFlag` int(11) DEFAULT NULL,
  `IndexType` int(11) DEFAULT NULL,
  `IndexPos` int(11) DEFAULT NULL,
  `IndexLen` int(11) DEFAULT NULL,
  PRIMARY KEY (`ram_item_ID`,`IndexName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `cfg_ram_item` */

DROP TABLE IF EXISTS `cfg_ram_item`;

CREATE TABLE `cfg_ram_item` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `ItemName` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ItemFlag` int(11) DEFAULT NULL,
  `ItemRecordType` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ItemBlockNum` int(11) DEFAULT NULL,
  `SQL` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `cst_agent` */

DROP TABLE IF EXISTS `cst_agent`;

CREATE TABLE `cst_agent` (
  `agentGUID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '经纪人id',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '经纪人姓名',
  `mobile` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '手机号',
  `areaCode` int(10) NOT NULL COMMENT '所在城市ID',
  `agentClasses` int(10) NOT NULL COMMENT '经纪人类别1=代理公司2=中介公司3=万科业主4=万科员工5=万科合作方6=独立经纪人',
  `proxyCompanyId` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '经纪人为1时必须',
  `agencyCompanyId` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '经纪人为2时必须',
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '经济人状态',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户id',
  PRIMARY KEY (`agentGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `cst_attach` */

DROP TABLE IF EXISTS `cst_attach`;

CREATE TABLE `cst_attach` (
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `projGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID,无项目表示是客户基本描摹，有项目则表示是客户在项目上的描摹；同一特征项可按项目存在多条',
  `attachCode` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '特征编号',
  `attachName` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特征名',
  `values` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特征值',
  `remark` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `sourceChannel` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源渠道',
  `sourceApp` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源应用的APPID',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `userGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业务员',
  `reportTime` datetime DEFAULT NULL COMMENT '上报时间',
  `oriCstGUID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源GUID',
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_projguid` (`projGUID`),
  KEY `index_attachCode` (`attachCode`),
  KEY `index_values` (`values`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `cst_attach_0` */

DROP TABLE IF EXISTS `cst_attach_0`;

CREATE TABLE `cst_attach_0` (
  `cstGUID` bigint(20) NOT NULL COMMENT '客户ID',
  `projGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID,无项目表示是客户基本描摹，有项目则表示是客户在项目上的描摹；同一特征项可按项目存在多条',
  `attachCode` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '特征编号',
  `attachName` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特征名',
  `values` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特征值',
  `remark` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `sourceChannel` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源渠道',
  `sourceApp` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源应用的APPID',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `userGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业务员',
  `reportTime` datetime DEFAULT NULL COMMENT '上报时间',
  `oriCstGUID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源客户GUID',
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_projguid` (`projGUID`),
  KEY `index_attachCode` (`attachCode`),
  KEY `index_values` (`values`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `cst_attach_1` */

DROP TABLE IF EXISTS `cst_attach_1`;

CREATE TABLE `cst_attach_1` (
  `cstGUID` bigint(20) NOT NULL COMMENT '客户ID',
  `projGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID,无项目表示是客户基本描摹，有项目则表示是客户在项目上的描摹；同一特征项可按项目存在多条',
  `attachCode` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '特征编号',
  `attachName` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特征名',
  `values` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特征值',
  `remark` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `sourceChannel` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源渠道',
  `sourceApp` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源应用的APPID',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `userGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业务员',
  `reportTime` datetime DEFAULT NULL COMMENT '上报时间',
  `oriCstGUID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源客户GUID',
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_projguid` (`projGUID`),
  KEY `index_attachCode` (`attachCode`),
  KEY `index_values` (`values`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `cst_attach_2` */

DROP TABLE IF EXISTS `cst_attach_2`;

CREATE TABLE `cst_attach_2` (
  `cstGUID` bigint(20) NOT NULL COMMENT '客户ID',
  `projGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID,无项目表示是客户基本描摹，有项目则表示是客户在项目上的描摹；同一特征项可按项目存在多条',
  `attachCode` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '特征编号',
  `attachName` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特征名',
  `values` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特征值',
  `remark` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `sourceChannel` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源渠道',
  `sourceApp` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源应用的APPID',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `userGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业务员',
  `reportTime` datetime DEFAULT NULL COMMENT '上报时间',
  `oriCstGUID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源客户GUID',
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_projguid` (`projGUID`),
  KEY `index_attachCode` (`attachCode`),
  KEY `index_values` (`values`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `cst_attach_3` */

DROP TABLE IF EXISTS `cst_attach_3`;

CREATE TABLE `cst_attach_3` (
  `cstGUID` bigint(20) NOT NULL COMMENT '客户ID',
  `projGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID,无项目表示是客户基本描摹，有项目则表示是客户在项目上的描摹；同一特征项可按项目存在多条',
  `attachCode` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '特征编号',
  `attachName` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特征名',
  `values` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特征值',
  `remark` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `sourceChannel` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源渠道',
  `sourceApp` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源应用的APPID',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `userGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业务员',
  `reportTime` datetime DEFAULT NULL COMMENT '上报时间',
  `oriCstGUID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源客户GUID',
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_projguid` (`projGUID`),
  KEY `index_attachCode` (`attachCode`),
  KEY `index_values` (`values`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `cst_attach_4` */

DROP TABLE IF EXISTS `cst_attach_4`;

CREATE TABLE `cst_attach_4` (
  `cstGUID` bigint(20) NOT NULL COMMENT '客户ID',
  `projGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID,无项目表示是客户基本描摹，有项目则表示是客户在项目上的描摹；同一特征项可按项目存在多条',
  `attachCode` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '特征编号',
  `attachName` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特征名',
  `values` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特征值',
  `remark` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `sourceChannel` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源渠道',
  `sourceApp` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源应用的APPID',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `userGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业务员',
  `reportTime` datetime DEFAULT NULL COMMENT '上报时间',
  `oriCstGUID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源客户GUID',
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_projguid` (`projGUID`),
  KEY `index_attachCode` (`attachCode`),
  KEY `index_values` (`values`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `cst_attach_5` */

DROP TABLE IF EXISTS `cst_attach_5`;

CREATE TABLE `cst_attach_5` (
  `cstGUID` bigint(20) NOT NULL COMMENT '客户ID',
  `projGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID,无项目表示是客户基本描摹，有项目则表示是客户在项目上的描摹；同一特征项可按项目存在多条',
  `attachCode` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '特征编号',
  `attachName` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特征名',
  `values` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特征值',
  `remark` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `sourceChannel` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源渠道',
  `sourceApp` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源应用的APPID',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `userGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业务员',
  `reportTime` datetime DEFAULT NULL COMMENT '上报时间',
  `oriCstGUID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源客户GUID',
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_projguid` (`projGUID`),
  KEY `index_attachCode` (`attachCode`),
  KEY `index_values` (`values`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `cst_attach_6` */

DROP TABLE IF EXISTS `cst_attach_6`;

CREATE TABLE `cst_attach_6` (
  `cstGUID` bigint(20) NOT NULL COMMENT '客户ID',
  `projGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID,无项目表示是客户基本描摹，有项目则表示是客户在项目上的描摹；同一特征项可按项目存在多条',
  `attachCode` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '特征编号',
  `attachName` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特征名',
  `values` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特征值',
  `remark` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `sourceChannel` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源渠道',
  `sourceApp` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源应用的APPID',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `userGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业务员',
  `reportTime` datetime DEFAULT NULL COMMENT '上报时间',
  `oriCstGUID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源客户GUID',
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_projguid` (`projGUID`),
  KEY `index_attachCode` (`attachCode`),
  KEY `index_values` (`values`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `cst_attach_7` */

DROP TABLE IF EXISTS `cst_attach_7`;

CREATE TABLE `cst_attach_7` (
  `cstGUID` bigint(20) NOT NULL COMMENT '客户ID',
  `projGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID,无项目表示是客户基本描摹，有项目则表示是客户在项目上的描摹；同一特征项可按项目存在多条',
  `attachCode` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '特征编号',
  `attachName` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特征名',
  `values` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特征值',
  `remark` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `sourceChannel` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源渠道',
  `sourceApp` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源应用的APPID',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `userGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业务员',
  `reportTime` datetime DEFAULT NULL COMMENT '上报时间',
  `oriCstGUID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源客户GUID',
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_projguid` (`projGUID`),
  KEY `index_attachCode` (`attachCode`),
  KEY `index_values` (`values`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `cst_attach_8` */

DROP TABLE IF EXISTS `cst_attach_8`;

CREATE TABLE `cst_attach_8` (
  `cstGUID` bigint(20) NOT NULL COMMENT '客户ID',
  `projGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID,无项目表示是客户基本描摹，有项目则表示是客户在项目上的描摹；同一特征项可按项目存在多条',
  `attachCode` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '特征编号',
  `attachName` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特征名',
  `values` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特征值',
  `remark` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `sourceChannel` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源渠道',
  `sourceApp` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源应用的APPID',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `userGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业务员',
  `reportTime` datetime DEFAULT NULL COMMENT '上报时间',
  `oriCstGUID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源客户GUID',
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_projguid` (`projGUID`),
  KEY `index_attachCode` (`attachCode`),
  KEY `index_values` (`values`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `cst_attach_9` */

DROP TABLE IF EXISTS `cst_attach_9`;

CREATE TABLE `cst_attach_9` (
  `cstGUID` bigint(20) NOT NULL COMMENT '客户ID',
  `projGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID,无项目表示是客户基本描摹，有项目则表示是客户在项目上的描摹；同一特征项可按项目存在多条',
  `attachCode` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '特征编号',
  `attachName` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特征名',
  `values` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特征值',
  `remark` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `sourceChannel` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源渠道',
  `sourceApp` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源应用的APPID',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `userGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业务员',
  `reportTime` datetime DEFAULT NULL COMMENT '上报时间',
  `oriCstGUID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源客户GUID',
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_projguid` (`projGUID`),
  KEY `index_attachCode` (`attachCode`),
  KEY `index_values` (`values`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `cst_attach_bak` */

DROP TABLE IF EXISTS `cst_attach_bak`;

CREATE TABLE `cst_attach_bak` (
  `cstGUID` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '客户ID',
  `projGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID,无项目表示是客户基本描摹，有项目则表示是客户在项目上的描摹；同一特征项可按项目存在多条',
  `attachCode` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '特征编号',
  `attachName` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特征名',
  `values` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特征值',
  `remark` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `sourceChannel` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源渠道',
  `sourceApp` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源应用的APPID',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `userGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业务员',
  `reportTime` datetime DEFAULT NULL COMMENT '上报时间',
  `oriCstGUID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源GUID',
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_projguid` (`projGUID`),
  KEY `index_attachCode` (`attachCode`),
  KEY `index_values` (`values`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `cst_cardidmapping` */

DROP TABLE IF EXISTS `cst_cardidmapping`;

CREATE TABLE `cst_cardidmapping` (
  `cardId` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '证件号',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `cardType` int(10) NOT NULL COMMENT '证件类型',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  KEY `index_cardid` (`cardId`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_cardidmapping_0` */

DROP TABLE IF EXISTS `cst_cardidmapping_0`;

CREATE TABLE `cst_cardidmapping_0` (
  `cardId` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '证件号',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `cardType` int(10) NOT NULL COMMENT '证件类型',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  KEY `index_cardid` (`cardId`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_cardidmapping_1` */

DROP TABLE IF EXISTS `cst_cardidmapping_1`;

CREATE TABLE `cst_cardidmapping_1` (
  `cardId` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '证件号',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `cardType` int(10) NOT NULL COMMENT '证件类型',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  KEY `index_cardid` (`cardId`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_cardidmapping_2` */

DROP TABLE IF EXISTS `cst_cardidmapping_2`;

CREATE TABLE `cst_cardidmapping_2` (
  `cardId` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '证件号',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `cardType` int(10) NOT NULL COMMENT '证件类型',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  KEY `index_cardid` (`cardId`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_cardidmapping_3` */

DROP TABLE IF EXISTS `cst_cardidmapping_3`;

CREATE TABLE `cst_cardidmapping_3` (
  `cardId` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '证件号',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `cardType` int(10) NOT NULL COMMENT '证件类型',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  KEY `index_cardid` (`cardId`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_cardidmapping_4` */

DROP TABLE IF EXISTS `cst_cardidmapping_4`;

CREATE TABLE `cst_cardidmapping_4` (
  `cardId` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '证件号',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `cardType` int(10) NOT NULL COMMENT '证件类型',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  KEY `index_cardid` (`cardId`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_cardidmapping_5` */

DROP TABLE IF EXISTS `cst_cardidmapping_5`;

CREATE TABLE `cst_cardidmapping_5` (
  `cardId` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '证件号',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `cardType` int(10) NOT NULL COMMENT '证件类型',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  KEY `index_cardid` (`cardId`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_cardidmapping_6` */

DROP TABLE IF EXISTS `cst_cardidmapping_6`;

CREATE TABLE `cst_cardidmapping_6` (
  `cardId` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '证件号',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `cardType` int(10) NOT NULL COMMENT '证件类型',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  KEY `index_cardid` (`cardId`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_cardidmapping_7` */

DROP TABLE IF EXISTS `cst_cardidmapping_7`;

CREATE TABLE `cst_cardidmapping_7` (
  `cardId` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '证件号',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `cardType` int(10) NOT NULL COMMENT '证件类型',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  KEY `index_cardid` (`cardId`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_cardidmapping_8` */

DROP TABLE IF EXISTS `cst_cardidmapping_8`;

CREATE TABLE `cst_cardidmapping_8` (
  `cardId` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '证件号',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `cardType` int(10) NOT NULL COMMENT '证件类型',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  KEY `index_cardid` (`cardId`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_cardidmapping_9` */

DROP TABLE IF EXISTS `cst_cardidmapping_9`;

CREATE TABLE `cst_cardidmapping_9` (
  `cardId` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '证件号',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `cardType` int(10) NOT NULL COMMENT '证件类型',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  KEY `index_cardid` (`cardId`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_cardidmapping_x` */

DROP TABLE IF EXISTS `cst_cardidmapping_x`;

CREATE TABLE `cst_cardidmapping_x` (
  `cardId` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '证件号',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `cardType` int(10) NOT NULL COMMENT '证件类型',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  KEY `index_cardid` (`cardId`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_consultant` */

DROP TABLE IF EXISTS `cst_consultant`;

CREATE TABLE `cst_consultant` (
  `consultantGUID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '置业顾问guid',
  `projGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `proxyCompanyId` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '代理公司ID',
  `consultantId` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '置业顾问ID',
  `consultantName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '置业顾问姓名',
  `gender` int(10) DEFAULT NULL COMMENT '性别',
  `consultantMobile` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机',
  `eMail` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `consultantAccount` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '置业顾问账号',
  `enable` int(10) DEFAULT NULL COMMENT '有效标志',
  `statusReason` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态原因',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户id',
  `oriCstGUID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源客户ID',
  PRIMARY KEY (`consultantGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=13917 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `cst_customer` */

DROP TABLE IF EXISTS `cst_customer`;

CREATE TABLE `cst_customer` (
  `cstID` bigint(20) NOT NULL,
  `cstGUID` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '客户GUID',
  `cstName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户姓名',
  `gender` tinyint(4) DEFAULT NULL COMMENT '性别',
  `birthDate` datetime DEFAULT NULL COMMENT '生日',
  `cstType` tinyint(4) DEFAULT NULL COMMENT '客户类型1=个人2=公司',
  `cardType` int(11) DEFAULT NULL COMMENT '证件类型1=身份证2=军官证3=护照4=港澳通行证5=台湾通行证6=台湾身份证7=港澳身份证8=营业热照9=组织机构代码10=税务登记证号99=其它',
  `cardID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '证件号码',
  `mobileTel` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机',
  `officeTel` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '办公电话',
  `homeTel` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '家庭电话',
  `sourceApp` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源应用',
  `sourceBiz` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源业态；参见特征定义',
  `activitySource` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '媒体活动；参见特征定义',
  `isMerge` int(10) NOT NULL DEFAULT '0' COMMENT '是否合并0=无合并， 1=有合并',
  `isMaster` int(10) NOT NULL DEFAULT '0' COMMENT '是否主数据1是，0否，默认0',
  `contact` mediumtext COLLATE utf8_unicode_ci COMMENT '联系电话列表，存当前的',
  `myGUIDList` mediumtext COLLATE utf8_unicode_ci COMMENT '业态ID列表，存现有的',
  `address` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '家庭地址',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`cstID`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `cst_customer_0` */

DROP TABLE IF EXISTS `cst_customer_0`;

CREATE TABLE `cst_customer_0` (
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `cstName` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '客户姓名',
  `gender` tinyint(4) DEFAULT NULL COMMENT '性别',
  `birthDate` datetime DEFAULT NULL COMMENT '生日',
  `cstType` tinyint(4) DEFAULT NULL COMMENT '客户类型1=个人2=公司',
  `cardType` int(11) DEFAULT NULL COMMENT '证件类型1=身份证2=军官证3=护照4=港澳通行证5=台湾通行证6=台湾身份证7=港澳身份证8=营业热照9=组织机构代码10=税务登记证号99=其它',
  `cardID` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `mobileTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
  `officeTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '办公电话',
  `homeTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭电话',
  `sourceApp` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '来源应用',
  `sourceBiz` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '来源业态；参见特征定义',
  `activitySource` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '媒体活动；参见特征定义',
  `isMerge` int(10) NOT NULL DEFAULT '0' COMMENT '是否合并0=无合并， 1=有合并',
  `isMaster` int(10) NOT NULL DEFAULT '0' COMMENT '是否主数据1是，0否，默认0',
  `contact` mediumtext COLLATE utf8_bin COMMENT '联系电话列表，存当前的',
  `myGUIDList` mediumtext COLLATE utf8_bin COMMENT '业态ID列表，存现有的',
  `address` varchar(400) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭地址',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`cstGUID`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_customer_1` */

DROP TABLE IF EXISTS `cst_customer_1`;

CREATE TABLE `cst_customer_1` (
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `cstName` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '客户姓名',
  `gender` tinyint(4) DEFAULT NULL COMMENT '性别',
  `birthDate` datetime DEFAULT NULL COMMENT '生日',
  `cstType` tinyint(4) DEFAULT NULL COMMENT '客户类型1=个人2=公司',
  `cardType` int(11) DEFAULT NULL COMMENT '证件类型1=身份证2=军官证3=护照4=港澳通行证5=台湾通行证6=台湾身份证7=港澳身份证8=营业热照9=组织机构代码10=税务登记证号99=其它',
  `cardID` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `mobileTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
  `officeTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '办公电话',
  `homeTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭电话',
  `sourceApp` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '来源应用',
  `sourceBiz` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '来源业态；参见特征定义',
  `activitySource` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '媒体活动；参见特征定义',
  `isMerge` int(10) NOT NULL DEFAULT '0' COMMENT '是否合并0=无合并， 1=有合并',
  `isMaster` int(10) NOT NULL DEFAULT '0' COMMENT '是否主数据1是，0否，默认0',
  `contact` mediumtext COLLATE utf8_bin COMMENT '联系电话列表，存当前的',
  `myGUIDList` mediumtext COLLATE utf8_bin COMMENT '业态ID列表，存现有的',
  `address` varchar(400) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭地址',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`cstGUID`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_customer_2` */

DROP TABLE IF EXISTS `cst_customer_2`;

CREATE TABLE `cst_customer_2` (
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `cstName` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '客户姓名',
  `gender` tinyint(4) DEFAULT NULL COMMENT '性别',
  `birthDate` datetime DEFAULT NULL COMMENT '生日',
  `cstType` tinyint(4) DEFAULT NULL COMMENT '客户类型1=个人2=公司',
  `cardType` int(11) DEFAULT NULL COMMENT '证件类型1=身份证2=军官证3=护照4=港澳通行证5=台湾通行证6=台湾身份证7=港澳身份证8=营业热照9=组织机构代码10=税务登记证号99=其它',
  `cardID` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `mobileTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
  `officeTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '办公电话',
  `homeTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭电话',
  `sourceApp` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '来源应用',
  `sourceBiz` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '来源业态；参见特征定义',
  `activitySource` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '媒体活动；参见特征定义',
  `isMerge` int(10) NOT NULL DEFAULT '0' COMMENT '是否合并0=无合并， 1=有合并',
  `isMaster` int(10) NOT NULL DEFAULT '0' COMMENT '是否主数据1是，0否，默认0',
  `contact` mediumtext COLLATE utf8_bin COMMENT '联系电话列表，存当前的',
  `myGUIDList` mediumtext COLLATE utf8_bin COMMENT '业态ID列表，存现有的',
  `address` varchar(400) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭地址',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`cstGUID`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_customer_3` */

DROP TABLE IF EXISTS `cst_customer_3`;

CREATE TABLE `cst_customer_3` (
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `cstName` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '客户姓名',
  `gender` tinyint(4) DEFAULT NULL COMMENT '性别',
  `birthDate` datetime DEFAULT NULL COMMENT '生日',
  `cstType` tinyint(4) DEFAULT NULL COMMENT '客户类型1=个人2=公司',
  `cardType` int(11) DEFAULT NULL COMMENT '证件类型1=身份证2=军官证3=护照4=港澳通行证5=台湾通行证6=台湾身份证7=港澳身份证8=营业热照9=组织机构代码10=税务登记证号99=其它',
  `cardID` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `mobileTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
  `officeTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '办公电话',
  `homeTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭电话',
  `sourceApp` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '来源应用',
  `sourceBiz` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '来源业态；参见特征定义',
  `activitySource` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '媒体活动；参见特征定义',
  `isMerge` int(10) NOT NULL DEFAULT '0' COMMENT '是否合并0=无合并， 1=有合并',
  `isMaster` int(10) NOT NULL DEFAULT '0' COMMENT '是否主数据1是，0否，默认0',
  `contact` mediumtext COLLATE utf8_bin COMMENT '联系电话列表，存当前的',
  `myGUIDList` mediumtext COLLATE utf8_bin COMMENT '业态ID列表，存现有的',
  `address` varchar(400) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭地址',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`cstGUID`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_customer_4` */

DROP TABLE IF EXISTS `cst_customer_4`;

CREATE TABLE `cst_customer_4` (
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `cstName` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '客户姓名',
  `gender` tinyint(4) DEFAULT NULL COMMENT '性别',
  `birthDate` datetime DEFAULT NULL COMMENT '生日',
  `cstType` tinyint(4) DEFAULT NULL COMMENT '客户类型1=个人2=公司',
  `cardType` int(11) DEFAULT NULL COMMENT '证件类型1=身份证2=军官证3=护照4=港澳通行证5=台湾通行证6=台湾身份证7=港澳身份证8=营业热照9=组织机构代码10=税务登记证号99=其它',
  `cardID` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `mobileTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
  `officeTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '办公电话',
  `homeTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭电话',
  `sourceApp` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '来源应用',
  `sourceBiz` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '来源业态；参见特征定义',
  `activitySource` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '媒体活动；参见特征定义',
  `isMerge` int(10) NOT NULL DEFAULT '0' COMMENT '是否合并0=无合并， 1=有合并',
  `isMaster` int(10) NOT NULL DEFAULT '0' COMMENT '是否主数据1是，0否，默认0',
  `contact` mediumtext COLLATE utf8_bin COMMENT '联系电话列表，存当前的',
  `myGUIDList` mediumtext COLLATE utf8_bin COMMENT '业态ID列表，存现有的',
  `address` varchar(400) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭地址',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`cstGUID`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_customer_5` */

DROP TABLE IF EXISTS `cst_customer_5`;

CREATE TABLE `cst_customer_5` (
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `cstName` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '客户姓名',
  `gender` tinyint(4) DEFAULT NULL COMMENT '性别',
  `birthDate` datetime DEFAULT NULL COMMENT '生日',
  `cstType` tinyint(4) DEFAULT NULL COMMENT '客户类型1=个人2=公司',
  `cardType` int(11) DEFAULT NULL COMMENT '证件类型1=身份证2=军官证3=护照4=港澳通行证5=台湾通行证6=台湾身份证7=港澳身份证8=营业热照9=组织机构代码10=税务登记证号99=其它',
  `cardID` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `mobileTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
  `officeTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '办公电话',
  `homeTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭电话',
  `sourceApp` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '来源应用',
  `sourceBiz` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '来源业态；参见特征定义',
  `activitySource` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '媒体活动；参见特征定义',
  `isMerge` int(10) NOT NULL DEFAULT '0' COMMENT '是否合并0=无合并， 1=有合并',
  `isMaster` int(10) NOT NULL DEFAULT '0' COMMENT '是否主数据1是，0否，默认0',
  `contact` mediumtext COLLATE utf8_bin COMMENT '联系电话列表，存当前的',
  `myGUIDList` mediumtext COLLATE utf8_bin COMMENT '业态ID列表，存现有的',
  `address` varchar(400) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭地址',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`cstGUID`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_customer_6` */

DROP TABLE IF EXISTS `cst_customer_6`;

CREATE TABLE `cst_customer_6` (
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `cstName` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '客户姓名',
  `gender` tinyint(4) DEFAULT NULL COMMENT '性别',
  `birthDate` datetime DEFAULT NULL COMMENT '生日',
  `cstType` tinyint(4) DEFAULT NULL COMMENT '客户类型1=个人2=公司',
  `cardType` int(11) DEFAULT NULL COMMENT '证件类型1=身份证2=军官证3=护照4=港澳通行证5=台湾通行证6=台湾身份证7=港澳身份证8=营业热照9=组织机构代码10=税务登记证号99=其它',
  `cardID` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `mobileTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
  `officeTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '办公电话',
  `homeTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭电话',
  `sourceApp` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '来源应用',
  `sourceBiz` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '来源业态；参见特征定义',
  `activitySource` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '媒体活动；参见特征定义',
  `isMerge` int(10) NOT NULL DEFAULT '0' COMMENT '是否合并0=无合并， 1=有合并',
  `isMaster` int(10) NOT NULL DEFAULT '0' COMMENT '是否主数据1是，0否，默认0',
  `contact` mediumtext COLLATE utf8_bin COMMENT '联系电话列表，存当前的',
  `myGUIDList` mediumtext COLLATE utf8_bin COMMENT '业态ID列表，存现有的',
  `address` varchar(400) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭地址',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`cstGUID`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_customer_7` */

DROP TABLE IF EXISTS `cst_customer_7`;

CREATE TABLE `cst_customer_7` (
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `cstName` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '客户姓名',
  `gender` tinyint(4) DEFAULT NULL COMMENT '性别',
  `birthDate` datetime DEFAULT NULL COMMENT '生日',
  `cstType` tinyint(4) DEFAULT NULL COMMENT '客户类型1=个人2=公司',
  `cardType` int(11) DEFAULT NULL COMMENT '证件类型1=身份证2=军官证3=护照4=港澳通行证5=台湾通行证6=台湾身份证7=港澳身份证8=营业热照9=组织机构代码10=税务登记证号99=其它',
  `cardID` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `mobileTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
  `officeTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '办公电话',
  `homeTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭电话',
  `sourceApp` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '来源应用',
  `sourceBiz` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '来源业态；参见特征定义',
  `activitySource` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '媒体活动；参见特征定义',
  `isMerge` int(10) NOT NULL DEFAULT '0' COMMENT '是否合并0=无合并， 1=有合并',
  `isMaster` int(10) NOT NULL DEFAULT '0' COMMENT '是否主数据1是，0否，默认0',
  `contact` mediumtext COLLATE utf8_bin COMMENT '联系电话列表，存当前的',
  `myGUIDList` mediumtext COLLATE utf8_bin COMMENT '业态ID列表，存现有的',
  `address` varchar(400) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭地址',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`cstGUID`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_customer_8` */

DROP TABLE IF EXISTS `cst_customer_8`;

CREATE TABLE `cst_customer_8` (
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `cstName` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '客户姓名',
  `gender` tinyint(4) DEFAULT NULL COMMENT '性别',
  `birthDate` datetime DEFAULT NULL COMMENT '生日',
  `cstType` tinyint(4) DEFAULT NULL COMMENT '客户类型1=个人2=公司',
  `cardType` int(11) DEFAULT NULL COMMENT '证件类型1=身份证2=军官证3=护照4=港澳通行证5=台湾通行证6=台湾身份证7=港澳身份证8=营业热照9=组织机构代码10=税务登记证号99=其它',
  `cardID` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `mobileTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
  `officeTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '办公电话',
  `homeTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭电话',
  `sourceApp` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '来源应用',
  `sourceBiz` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '来源业态；参见特征定义',
  `activitySource` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '媒体活动；参见特征定义',
  `isMerge` int(10) NOT NULL DEFAULT '0' COMMENT '是否合并0=无合并， 1=有合并',
  `isMaster` int(10) NOT NULL DEFAULT '0' COMMENT '是否主数据1是，0否，默认0',
  `contact` mediumtext COLLATE utf8_bin COMMENT '联系电话列表，存当前的',
  `myGUIDList` mediumtext COLLATE utf8_bin COMMENT '业态ID列表，存现有的',
  `address` varchar(400) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭地址',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`cstGUID`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_customer_9` */

DROP TABLE IF EXISTS `cst_customer_9`;

CREATE TABLE `cst_customer_9` (
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `cstName` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '客户姓名',
  `gender` tinyint(4) DEFAULT NULL COMMENT '性别',
  `birthDate` datetime DEFAULT NULL COMMENT '生日',
  `cstType` tinyint(4) DEFAULT NULL COMMENT '客户类型1=个人2=公司',
  `cardType` int(11) DEFAULT NULL COMMENT '证件类型1=身份证2=军官证3=护照4=港澳通行证5=台湾通行证6=台湾身份证7=港澳身份证8=营业热照9=组织机构代码10=税务登记证号99=其它',
  `cardID` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `mobileTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
  `officeTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '办公电话',
  `homeTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭电话',
  `sourceApp` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '来源应用',
  `sourceBiz` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '来源业态；参见特征定义',
  `activitySource` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '媒体活动；参见特征定义',
  `isMerge` int(10) NOT NULL DEFAULT '0' COMMENT '是否合并0=无合并， 1=有合并',
  `isMaster` int(10) NOT NULL DEFAULT '0' COMMENT '是否主数据1是，0否，默认0',
  `contact` mediumtext COLLATE utf8_bin COMMENT '联系电话列表，存当前的',
  `myGUIDList` mediumtext COLLATE utf8_bin COMMENT '业态ID列表，存现有的',
  `address` varchar(400) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭地址',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`cstGUID`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_customer_copy` */

DROP TABLE IF EXISTS `cst_customer_copy`;

CREATE TABLE `cst_customer_copy` (
  `cstID` bigint(20) NOT NULL,
  `cstGUID` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '客户GUID',
  `cstName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户姓名',
  `gender` tinyint(4) DEFAULT NULL COMMENT '性别',
  `birthDate` datetime DEFAULT NULL COMMENT '生日',
  `cstType` tinyint(4) DEFAULT NULL COMMENT '客户类型1=个人2=公司',
  `cardType` int(11) DEFAULT NULL COMMENT '证件类型1=身份证2=军官证3=护照4=港澳通行证5=台湾通行证6=台湾身份证7=港澳身份证8=营业热照9=组织机构代码10=税务登记证号99=其它',
  `cardID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '证件号码',
  `mobileTel` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机',
  `officeTel` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '办公电话',
  `homeTel` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '家庭电话',
  `sourceApp` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源应用',
  `sourceBiz` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源业态；参见特征定义',
  `activitySource` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '媒体活动；参见特征定义',
  `isMerge` int(10) NOT NULL DEFAULT '0' COMMENT '是否合并0=无合并， 1=有合并',
  `isMaster` int(10) NOT NULL DEFAULT '0' COMMENT '是否主数据1是，0否，默认0',
  `contact` mediumtext COLLATE utf8_unicode_ci COMMENT '联系电话列表，存当前的',
  `myGUIDList` mediumtext COLLATE utf8_unicode_ci COMMENT '业态ID列表，存现有的',
  `address` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '家庭地址',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`cstID`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `cst_feature_storage` */

DROP TABLE IF EXISTS `cst_feature_storage`;

CREATE TABLE `cst_feature_storage` (
  `cst_feature_id` int(11) NOT NULL AUTO_INCREMENT,
  `cst_id` int(11) DEFAULT NULL,
  `proj_guid` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `featureType` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `featrueName` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `featureValue` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL,
  `templateguid` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`cst_feature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_guidmapping` */

DROP TABLE IF EXISTS `cst_guidmapping`;

CREATE TABLE `cst_guidmapping` (
  `myGUID` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '明源GUID',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceBiz` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '来源业态，来自哪个业态系统，对应引用业态定义表',
  `subSource` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '业态子项，来源于业态的哪个子态，如业态是地产，则子态表示是哪个项目',
  `createTime` datetime NOT NULL,
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_myguid` (`myGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_guidmapping_0` */

DROP TABLE IF EXISTS `cst_guidmapping_0`;

CREATE TABLE `cst_guidmapping_0` (
  `myGUID` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '明源GUID',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceBiz` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '来源业态，来自哪个业态系统，对应引用业态定义表',
  `subSource` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '业态子项，来源于业态的哪个子态，如业态是地产，则子态表示是哪个项目',
  `createTime` datetime NOT NULL,
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_myguid` (`myGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_guidmapping_1` */

DROP TABLE IF EXISTS `cst_guidmapping_1`;

CREATE TABLE `cst_guidmapping_1` (
  `myGUID` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '明源GUID',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceBiz` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '来源业态，来自哪个业态系统，对应引用业态定义表',
  `subSource` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '业态子项，来源于业态的哪个子态，如业态是地产，则子态表示是哪个项目',
  `createTime` datetime NOT NULL,
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_myguid` (`myGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_guidmapping_2` */

DROP TABLE IF EXISTS `cst_guidmapping_2`;

CREATE TABLE `cst_guidmapping_2` (
  `myGUID` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '明源GUID',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceBiz` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '来源业态，来自哪个业态系统，对应引用业态定义表',
  `subSource` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '业态子项，来源于业态的哪个子态，如业态是地产，则子态表示是哪个项目',
  `createTime` datetime NOT NULL,
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_myguid` (`myGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_guidmapping_3` */

DROP TABLE IF EXISTS `cst_guidmapping_3`;

CREATE TABLE `cst_guidmapping_3` (
  `myGUID` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '明源GUID',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceBiz` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '来源业态，来自哪个业态系统，对应引用业态定义表',
  `subSource` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '业态子项，来源于业态的哪个子态，如业态是地产，则子态表示是哪个项目',
  `createTime` datetime NOT NULL,
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_myguid` (`myGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_guidmapping_4` */

DROP TABLE IF EXISTS `cst_guidmapping_4`;

CREATE TABLE `cst_guidmapping_4` (
  `myGUID` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '明源GUID',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceBiz` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '来源业态，来自哪个业态系统，对应引用业态定义表',
  `subSource` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '业态子项，来源于业态的哪个子态，如业态是地产，则子态表示是哪个项目',
  `createTime` datetime NOT NULL,
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_myguid` (`myGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_guidmapping_5` */

DROP TABLE IF EXISTS `cst_guidmapping_5`;

CREATE TABLE `cst_guidmapping_5` (
  `myGUID` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '明源GUID',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceBiz` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '来源业态，来自哪个业态系统，对应引用业态定义表',
  `subSource` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '业态子项，来源于业态的哪个子态，如业态是地产，则子态表示是哪个项目',
  `createTime` datetime NOT NULL,
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_myguid` (`myGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_guidmapping_6` */

DROP TABLE IF EXISTS `cst_guidmapping_6`;

CREATE TABLE `cst_guidmapping_6` (
  `myGUID` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '明源GUID',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceBiz` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '来源业态，来自哪个业态系统，对应引用业态定义表',
  `subSource` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '业态子项，来源于业态的哪个子态，如业态是地产，则子态表示是哪个项目',
  `createTime` datetime NOT NULL,
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_myguid` (`myGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_guidmapping_7` */

DROP TABLE IF EXISTS `cst_guidmapping_7`;

CREATE TABLE `cst_guidmapping_7` (
  `myGUID` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '明源GUID',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceBiz` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '来源业态，来自哪个业态系统，对应引用业态定义表',
  `subSource` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '业态子项，来源于业态的哪个子态，如业态是地产，则子态表示是哪个项目',
  `createTime` datetime NOT NULL,
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_myguid` (`myGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_guidmapping_8` */

DROP TABLE IF EXISTS `cst_guidmapping_8`;

CREATE TABLE `cst_guidmapping_8` (
  `myGUID` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '明源GUID',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceBiz` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '来源业态，来自哪个业态系统，对应引用业态定义表',
  `subSource` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '业态子项，来源于业态的哪个子态，如业态是地产，则子态表示是哪个项目',
  `createTime` datetime NOT NULL,
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_myguid` (`myGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_guidmapping_9` */

DROP TABLE IF EXISTS `cst_guidmapping_9`;

CREATE TABLE `cst_guidmapping_9` (
  `myGUID` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '明源GUID',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceBiz` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '来源业态，来自哪个业态系统，对应引用业态定义表',
  `subSource` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '业态子项，来源于业态的哪个子态，如业态是地产，则子态表示是哪个项目',
  `createTime` datetime NOT NULL,
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_myguid` (`myGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_guidmapping_a` */

DROP TABLE IF EXISTS `cst_guidmapping_a`;

CREATE TABLE `cst_guidmapping_a` (
  `myGUID` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '明源GUID',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceBiz` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '来源业态，来自哪个业态系统，对应引用业态定义表',
  `subSource` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '业态子项，来源于业态的哪个子态，如业态是地产，则子态表示是哪个项目',
  `createTime` datetime NOT NULL,
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_myguid` (`myGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_guidmapping_b` */

DROP TABLE IF EXISTS `cst_guidmapping_b`;

CREATE TABLE `cst_guidmapping_b` (
  `myGUID` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '明源GUID',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceBiz` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '来源业态，来自哪个业态系统，对应引用业态定义表',
  `subSource` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '业态子项，来源于业态的哪个子态，如业态是地产，则子态表示是哪个项目',
  `createTime` datetime NOT NULL,
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_myguid` (`myGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_guidmapping_c` */

DROP TABLE IF EXISTS `cst_guidmapping_c`;

CREATE TABLE `cst_guidmapping_c` (
  `myGUID` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '明源GUID',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceBiz` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '来源业态，来自哪个业态系统，对应引用业态定义表',
  `subSource` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '业态子项，来源于业态的哪个子态，如业态是地产，则子态表示是哪个项目',
  `createTime` datetime NOT NULL,
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_myguid` (`myGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_guidmapping_d` */

DROP TABLE IF EXISTS `cst_guidmapping_d`;

CREATE TABLE `cst_guidmapping_d` (
  `myGUID` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '明源GUID',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceBiz` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '来源业态，来自哪个业态系统，对应引用业态定义表',
  `subSource` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '业态子项，来源于业态的哪个子态，如业态是地产，则子态表示是哪个项目',
  `createTime` datetime NOT NULL,
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_myguid` (`myGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_guidmapping_e` */

DROP TABLE IF EXISTS `cst_guidmapping_e`;

CREATE TABLE `cst_guidmapping_e` (
  `myGUID` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '明源GUID',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceBiz` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '来源业态，来自哪个业态系统，对应引用业态定义表',
  `subSource` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '业态子项，来源于业态的哪个子态，如业态是地产，则子态表示是哪个项目',
  `createTime` datetime NOT NULL,
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_myguid` (`myGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_guidmapping_f` */

DROP TABLE IF EXISTS `cst_guidmapping_f`;

CREATE TABLE `cst_guidmapping_f` (
  `myGUID` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '明源GUID',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceBiz` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '来源业态，来自哪个业态系统，对应引用业态定义表',
  `subSource` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '业态子项，来源于业态的哪个子态，如业态是地产，则子态表示是哪个项目',
  `createTime` datetime NOT NULL,
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_myguid` (`myGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_identity` */

DROP TABLE IF EXISTS `cst_identity`;

CREATE TABLE `cst_identity` (
  `cstGUID` bigint(20) NOT NULL COMMENT '客户ID',
  `attachCode` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '身份标识',
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_identity` (`attachCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `cst_impress_define` */

DROP TABLE IF EXISTS `cst_impress_define`;

CREATE TABLE `cst_impress_define` (
  `impressId` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '描摹ID',
  `impressName` varchar(50) DEFAULT NULL COMMENT '名称',
  `orderNum` int(11) DEFAULT NULL COMMENT '排序',
  `category` int(11) DEFAULT NULL COMMENT '特征分类 | 1 基础特征  2  机会特征',
  `isCheck` tinyint(1) DEFAULT NULL COMMENT '是否多选',
  `levels` int(5) DEFAULT NULL COMMENT '层级',
  `type` int(11) DEFAULT NULL COMMENT '类别| 1 系统内置 2 项目级',
  `projectId` bigint(11) DEFAULT NULL COMMENT '项目',
  PRIMARY KEY (`impressId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户描摹定义表';

/*Table structure for table `cst_map` */

DROP TABLE IF EXISTS `cst_map`;

CREATE TABLE `cst_map` (
  `cstGUID` bigint(20) unsigned NOT NULL COMMENT '客户ID',
  `uniGUID` bigint(20) NOT NULL COMMENT '当前ID',
  `sourceApp` varchar(4) COLLATE utf8_unicode_ci NOT NULL COMMENT '客户ID来源',
  PRIMARY KEY (`cstGUID`),
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_uniguid` (`uniGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `cst_master_customer` */

DROP TABLE IF EXISTS `cst_master_customer`;

CREATE TABLE `cst_master_customer` (
  `uniGUID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户UniGUID',
  `cstName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户姓名',
  `gender` tinyint(4) DEFAULT NULL COMMENT '性别',
  `birthDate` datetime DEFAULT NULL COMMENT '生日',
  `cstType` tinyint(4) DEFAULT NULL COMMENT '客户类型',
  `cardType` int(10) DEFAULT NULL COMMENT '证件类型',
  `cardID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '证件号码',
  `mobileTel` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机',
  `officeTel` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '办公电话',
  `homeTel` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '家庭电话',
  `sourceApp` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源应用',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `contact` mediumtext COLLATE utf8_unicode_ci COMMENT '联系电话',
  `oriGUIDList` mediumtext COLLATE utf8_unicode_ci COMMENT '明源GUID列表',
  PRIMARY KEY (`uniGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `cst_member` */

DROP TABLE IF EXISTS `cst_member`;

CREATE TABLE `cst_member` (
  `memGUID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '会员GUID',
  `oriMemGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '明源会员GUID',
  `cstGUID` bigint(20) NOT NULL COMMENT '数据中心客户ID',
  `oriCstGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '明源客户GUID',
  `buGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '单位GUID',
  `memCode` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '会员卡号',
  `logpwd` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '查询密码',
  `memStation` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '会员身份',
  `specialType` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特殊人士类别',
  `joinPath` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '入会途径',
  `joinDate` datetime DEFAULT NULL COMMENT '入会日期',
  `isSendJoinNote` tinyint(4) DEFAULT NULL COMMENT '是否发送入会通知',
  `ljPoint` double DEFAULT NULL COMMENT '累计积分',
  `applyDate` datetime DEFAULT NULL COMMENT '申请日期',
  `shr` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '入会审核人',
  `shDate` datetime DEFAULT NULL COMMENT '入会审核日期',
  `cardStatus` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '制卡状态',
  `makeCardReason` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '制卡原因',
  `postCardDate` datetime DEFAULT NULL COMMENT '寄卡日期',
  `tjr` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '推荐人',
  `tjrMemCode` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '推荐人会员卡号',
  `tjrRelation` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '推荐人与会员关系',
  `tjRemark` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '推荐信息备注',
  `projName` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目名称',
  `xckID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '携程卡号',
  `xckPwd` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '携程密码',
  `saler` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售代表',
  `getMemLevelWay` varchar(48) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '获得级别方式',
  `holdLevelBeginDate` datetime DEFAULT NULL COMMENT '级别权益起始日期',
  `holdLevelEndDate` datetime DEFAULT NULL COMMENT '级别权益截止日期',
  `oldMemCode` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '原系统会员卡号',
  `makeCardDate` datetime DEFAULT NULL COMMENT '制卡日期',
  `memLevel` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '当前会员级别',
  `maxMemLevel` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '历史最高会员级别',
  `memStatus` int(10) DEFAULT NULL COMMENT '会员状态',
  `oriMemStatus` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源会员状态',
  `statusDate` datetime DEFAULT NULL COMMENT '状态日期',
  `statusReason` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态原因',
  `statusHr` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态人力资源',
  `oldStatus` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '旧状态',
  `telList` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话列表',
  PRIMARY KEY (`memGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=184656 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `cst_member_11` */

DROP TABLE IF EXISTS `cst_member_11`;

CREATE TABLE `cst_member_11` (
  `memGUID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '会员GUID',
  `oriMemGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '明源会员GUID',
  `cstGUID` bigint(20) NOT NULL COMMENT '数据中心客户ID',
  `oriCstGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '明源客户GUID',
  `buGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '单位GUID',
  `memCode` varchar(24) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '会员卡号',
  `logpwd` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '查询密码',
  `memStation` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '会员身份',
  `specialType` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特殊人士类别',
  `joinPath` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '入会途径',
  `joinDate` datetime DEFAULT NULL COMMENT '入会日期',
  `isSendJoinNote` tinyint(4) DEFAULT NULL COMMENT '是否发送入会通知',
  `ljPoint` double DEFAULT NULL COMMENT '累计积分',
  `applyDate` datetime DEFAULT NULL COMMENT '申请日期',
  `shr` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '入会审核人',
  `shDate` datetime DEFAULT NULL COMMENT '入会审核日期',
  `cardStatus` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '制卡状态',
  `makeCardReason` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '制卡原因',
  `postCardDate` datetime DEFAULT NULL COMMENT '寄卡日期',
  `tjr` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '推荐人',
  `tjrMemCode` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '推荐人会员卡号',
  `tjrRelation` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '推荐人与会员关系',
  `tjRemark` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '推荐信息备注',
  `projName` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目名称',
  `xckID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '携程卡号',
  `xckPwd` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '携程密码',
  `saler` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售代表',
  `getMemLevelWay` varchar(48) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '获得级别方式',
  `holdLevelBeginDate` datetime DEFAULT NULL COMMENT '级别权益起始日期',
  `holdLevelEndDate` datetime DEFAULT NULL COMMENT '级别权益截止日期',
  `oldMemCode` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '原系统会员卡号',
  `makeCardDate` datetime DEFAULT NULL COMMENT '制卡日期',
  `memLevel` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '当前会员级别',
  `maxMemLevel` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '历史最高会员级别',
  `memStatus` int(10) DEFAULT NULL COMMENT '会员状态',
  `oriMemStatus` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源会员状态',
  `statusDate` datetime DEFAULT NULL COMMENT '状态日期',
  `statusReason` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态原因',
  `statusHr` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态人力资源',
  `oldStatus` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '旧状态',
  `telList` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话列表',
  PRIMARY KEY (`memGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `cst_member_delete` */

DROP TABLE IF EXISTS `cst_member_delete`;

CREATE TABLE `cst_member_delete` (
  `memGUID` varchar(10) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_member_temp` */

DROP TABLE IF EXISTS `cst_member_temp`;

CREATE TABLE `cst_member_temp` (
  `memGUID` bigint(20) NOT NULL DEFAULT '0' COMMENT '会员GUID',
  `oriMemGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '明源会员GUID',
  `cstGUID` bigint(20) NOT NULL COMMENT '数据中心客户ID',
  `oriCstGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '明源客户GUID',
  `buGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '单位GUID',
  `memCode` varchar(24) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '会员卡号',
  `logpwd` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '查询密码',
  `memStation` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '会员身份',
  `specialType` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特殊人士类别',
  `joinPath` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '入会途径',
  `joinDate` datetime DEFAULT NULL COMMENT '入会日期',
  `isSendJoinNote` tinyint(4) DEFAULT NULL COMMENT '是否发送入会通知',
  `ljPoint` double DEFAULT NULL COMMENT '累计积分',
  `applyDate` datetime DEFAULT NULL COMMENT '申请日期',
  `shr` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '入会审核人',
  `shDate` datetime DEFAULT NULL COMMENT '入会审核日期',
  `cardStatus` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '制卡状态',
  `makeCardReason` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '制卡原因',
  `postCardDate` datetime DEFAULT NULL COMMENT '寄卡日期',
  `tjr` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '推荐人',
  `tjrMemCode` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '推荐人会员卡号',
  `tjrRelation` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '推荐人与会员关系',
  `tjRemark` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '推荐信息备注',
  `projName` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目名称',
  `xckID` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '携程卡号',
  `xckPwd` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '携程密码',
  `saler` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售代表',
  `getMemLevelWay` varchar(48) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '获得级别方式',
  `holdLevelBeginDate` datetime DEFAULT NULL COMMENT '级别权益起始日期',
  `holdLevelEndDate` datetime DEFAULT NULL COMMENT '级别权益截止日期',
  `oldMemCode` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '原系统会员卡号',
  `makeCardDate` datetime DEFAULT NULL COMMENT '制卡日期',
  `memLevel` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '当前会员级别',
  `maxMemLevel` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '历史最高会员级别',
  `memStatus` int(10) DEFAULT NULL COMMENT '会员状态',
  `oriMemStatus` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源会员状态',
  `statusDate` datetime DEFAULT NULL COMMENT '状态日期',
  `statusReason` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态原因',
  `statusHr` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态人力资源',
  `oldStatus` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '旧状态',
  `telList` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话列表'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_mobilemapping` */

DROP TABLE IF EXISTS `cst_mobilemapping`;

CREATE TABLE `cst_mobilemapping` (
  `mobile` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '手机号码',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceApp` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '客户ID来源',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  KEY `index_mobile` (`mobile`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_mobilemapping_0` */

DROP TABLE IF EXISTS `cst_mobilemapping_0`;

CREATE TABLE `cst_mobilemapping_0` (
  `mobile` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '手机号码',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceApp` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '客户ID来源',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  KEY `index_mobile` (`mobile`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_mobilemapping_1` */

DROP TABLE IF EXISTS `cst_mobilemapping_1`;

CREATE TABLE `cst_mobilemapping_1` (
  `mobile` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '手机号码',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceApp` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '客户ID来源',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  KEY `index_mobile` (`mobile`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_mobilemapping_2` */

DROP TABLE IF EXISTS `cst_mobilemapping_2`;

CREATE TABLE `cst_mobilemapping_2` (
  `mobile` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '手机号码',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceApp` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '客户ID来源',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  KEY `index_mobile` (`mobile`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_mobilemapping_3` */

DROP TABLE IF EXISTS `cst_mobilemapping_3`;

CREATE TABLE `cst_mobilemapping_3` (
  `mobile` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '手机号码',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceApp` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '客户ID来源',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  KEY `index_mobile` (`mobile`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_mobilemapping_4` */

DROP TABLE IF EXISTS `cst_mobilemapping_4`;

CREATE TABLE `cst_mobilemapping_4` (
  `mobile` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '手机号码',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceApp` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '客户ID来源',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  KEY `index_mobile` (`mobile`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_mobilemapping_5` */

DROP TABLE IF EXISTS `cst_mobilemapping_5`;

CREATE TABLE `cst_mobilemapping_5` (
  `mobile` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '手机号码',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceApp` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '客户ID来源',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  KEY `index_mobile` (`mobile`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_mobilemapping_6` */

DROP TABLE IF EXISTS `cst_mobilemapping_6`;

CREATE TABLE `cst_mobilemapping_6` (
  `mobile` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '手机号码',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceApp` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '客户ID来源',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  KEY `index_mobile` (`mobile`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_mobilemapping_7` */

DROP TABLE IF EXISTS `cst_mobilemapping_7`;

CREATE TABLE `cst_mobilemapping_7` (
  `mobile` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '手机号码',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceApp` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '客户ID来源',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  KEY `index_mobile` (`mobile`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_mobilemapping_8` */

DROP TABLE IF EXISTS `cst_mobilemapping_8`;

CREATE TABLE `cst_mobilemapping_8` (
  `mobile` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '手机号码',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceApp` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '客户ID来源',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  KEY `index_mobile` (`mobile`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_mobilemapping_9` */

DROP TABLE IF EXISTS `cst_mobilemapping_9`;

CREATE TABLE `cst_mobilemapping_9` (
  `mobile` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '手机号码',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `sourceApp` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '客户ID来源',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  KEY `index_mobile` (`mobile`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `cst_project_balck_list` */

DROP TABLE IF EXISTS `cst_project_balck_list`;

CREATE TABLE `cst_project_balck_list` (
  `blackGUID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '黑名单GUID',
  `mobile` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '手机号码',
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户GUID',
  `projCode` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目编码',
  `COMMENT` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `appID` int(10) DEFAULT NULL COMMENT '业务应用APPID',
  `TYPE` int(10) NOT NULL COMMENT '黑名单类型:0表示项目新增，1表示同步冲突',
  `blackStatus` int(10) NOT NULL COMMENT '黑名单状态:1表示黑名单状态；0表示解除，即不再是黑名单',
  PRIMARY KEY (`blackGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `cst_room_attach` */

DROP TABLE IF EXISTS `cst_room_attach`;

CREATE TABLE `cst_room_attach` (
  `cstGuid` varchar(18) COLLATE utf8_bin NOT NULL,
  `cstfohose` int(10) DEFAULT NULL COMMENT '0:买，1租，2卖，3出售',
  `ProjGuid` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RoomGuid` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TradeGuid` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CompanyGuid` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `bldGuid` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `bldarea` float DEFAULT NULL,
  `RoomStru` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `houseKind` int(10) DEFAULT NULL COMMENT '0:未知,1别墅,2普通多层,3小高层,4商业,5洋房,6车位,7高层,8超高',
  `totalPrice` float DEFAULT NULL,
  `PayType` int(10) DEFAULT NULL COMMENT '0:一次付清 1:商业  2:公积金 3:组合	',
  `gjjTotal` float DEFAULT NULL,
  `gjjYear` int(10) DEFAULT NULL,
  `ajtotal` float DEFAULT NULL,
  `ajyear` int(10) DEFAULT NULL,
  `yearpay` float DEFAULT NULL,
  `modifyTime` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `area` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `city` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  KEY `idx_room_attach_roomid` (`RoomGuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `d_cst_backup` */

DROP TABLE IF EXISTS `d_cst_backup`;

CREATE TABLE `d_cst_backup` (
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户GUID',
  `cstName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户姓名',
  `gender` tinyint(4) DEFAULT NULL COMMENT '性别',
  `birthDate` datetime DEFAULT NULL COMMENT '生日',
  `cstType` tinyint(4) DEFAULT NULL COMMENT '客户类型',
  `cardType` int(11) DEFAULT NULL COMMENT '证件类型',
  `cardID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '证件号码',
  `mobileTel` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机',
  `officeTel` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '办公电话',
  `homeTel` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '家庭电话',
  `sourceApp` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源应用',
  `createTime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `level` tinyint(4) DEFAULT NULL COMMENT '级别',
  `contact` mediumtext COLLATE utf8_unicode_ci COMMENT '联系电话',
  `myGUIDList` mediumtext CHARACTER SET ujis COMMENT '明源GUID列表',
  `retain` int(11) DEFAULT NULL COMMENT '保留',
  `mergeTime` datetime DEFAULT NULL COMMENT '合并时间',
  `batchNo` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '批次号',
  `handleStatus` int(11) DEFAULT NULL COMMENT '处理状态',
  `uniGUID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `d_cst_conflic` */

DROP TABLE IF EXISTS `d_cst_conflic`;

CREATE TABLE `d_cst_conflic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `cstFrom` bigint(20) NOT NULL,
  `cstFromName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstFromCardID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstFromProjGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstFromProjName` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstTo` bigint(20) DEFAULT NULL,
  `cstToName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstToCardID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hasRecommConflic` int(11) NOT NULL,
  `handleStatus` int(11) NOT NULL,
  `createTime` datetime NOT NULL,
  `comment` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `d_mapping_backup` */

DROP TABLE IF EXISTS `d_mapping_backup`;

CREATE TABLE `d_mapping_backup` (
  `identity` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `CstGUID` bigint(20) DEFAULT NULL,
  `batch_no` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `index_mapping_batch_no` (`batch_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `etl_info` */

DROP TABLE IF EXISTS `etl_info`;

CREATE TABLE `etl_info` (
  `extTableName` varchar(50) COLLATE utf8_bin NOT NULL,
  `exeAction` varchar(50) COLLATE utf8_bin NOT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime DEFAULT NULL,
  `result` tinyint(1) DEFAULT NULL,
  `description` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`extTableName`,`exeAction`,`startTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `h_Activity` */

DROP TABLE IF EXISTS `h_Activity`;

CREATE TABLE `h_Activity` (
  `ActGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `BUGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `Topic` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `ActType` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `Status` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `ActDate` datetime DEFAULT NULL,
  `Organizer` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `Location` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `Purpose` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `Yqrs` int(11) DEFAULT NULL,
  `Tzrs` int(11) DEFAULT NULL,
  `Cyrs` int(11) DEFAULT NULL,
  `Remark` longtext COLLATE utf8_bin,
  `Effect` longtext COLLATE utf8_bin,
  `Ysfy` decimal(19,4) DEFAULT NULL,
  `Sjfy` decimal(19,4) DEFAULT NULL,
  PRIMARY KEY (`ActGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `h_ChgApply` */

DROP TABLE IF EXISTS `h_ChgApply`;

CREATE TABLE `h_ChgApply` (
  `ChgApplyGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `MemGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `OldBUGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `NewBUGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `RoomGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `RoomInfo` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `ApplyContent` longtext COLLATE utf8_bin,
  `CreatedBy` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `SHGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `SHDate` datetime DEFAULT NULL,
  `SHState` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ChgApplyGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `h_Family` */

DROP TABLE IF EXISTS `h_Family`;

CREATE TABLE `h_Family` (
  `FamilyGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `FamilyInfo` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `FamilyName` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `CardID` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `CstName` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`FamilyGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `h_Family2Cst` */

DROP TABLE IF EXISTS `h_Family2Cst`;

CREATE TABLE `h_Family2Cst` (
  `FamilyGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `CstGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `MemGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `IsFamilyCy` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `HYGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `h_Family2Cst_history` */

DROP TABLE IF EXISTS `h_Family2Cst_history`;

CREATE TABLE `h_Family2Cst_history` (
  `FamilyGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `CstGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `MemGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `roomGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `IsFamilyCy` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `HYGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `h_Family_History` */

DROP TABLE IF EXISTS `h_Family_History`;

CREATE TABLE `h_Family_History` (
  `FamilyGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `FamilyInfo` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `FamilyName` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `CardID` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `CstName` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `roomGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `h_MemLevel_Tz` */

DROP TABLE IF EXISTS `h_MemLevel_Tz`;

CREATE TABLE `h_MemLevel_Tz` (
  `MemLevelTzGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `MemGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `OldMemLevel` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `NewMemLevel` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `TzReason` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `Creator` varchar(250) COLLATE utf8_bin NOT NULL,
  `CreateOn` datetime NOT NULL,
  `CzSource` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `h_MemberBackUp` */

DROP TABLE IF EXISTS `h_MemberBackUp`;

CREATE TABLE `h_MemberBackUp` (
  `Topic` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `BackUpDate` datetime DEFAULT NULL,
  `Recorder` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `BackUpGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `CstGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`BackUpGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `h_Org` */

DROP TABLE IF EXISTS `h_Org`;

CREATE TABLE `h_Org` (
  `OrgGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `OrgName` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `Creater` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`OrgGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `h_OrgMember` */

DROP TABLE IF EXISTS `h_OrgMember`;

CREATE TABLE `h_OrgMember` (
  `OrgMemberGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `CstGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `OrgGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `MemCode` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `OrgMemberName` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `OrgMemberID` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `Sex` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `CardType` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `CardID` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `OfficeTel` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `HomeTel` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `Email` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `MobileTel` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `PostCode` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `PostAdd` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `Gender` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `Fax` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `WorkAddr` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `InSchool` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `InClass` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `FatherName` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `MotherName` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `Preferred` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `Holder` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `HolderTel` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `BuyHouseInfo` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `WorkArea` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `HomeArea` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `Marriage` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `SpouseName` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `EduLevel` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `Earning` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `Family` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `Work` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `Xqah` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `JoinPath` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `QuestDate` datetime DEFAULT NULL,
  `ApplyDate` datetime DEFAULT NULL,
  `MemStation` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `SpecialType` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `BirthDate` datetime DEFAULT NULL,
  `Nationality` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `CreatedBy` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `CreatedOn` datetime DEFAULT NULL,
  `ModifyBy` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ModifyOn` datetime DEFAULT NULL,
  `IsSh` char(1) COLLATE utf8_bin DEFAULT NULL,
  `SQBy` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `Fcxz` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `HkArea` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `Memo` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `SlBy` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `ShBy` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `HomeAdd` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `RcHolder` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `RcTel` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `RcMobileTel` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `ISSMS` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `OtherTel` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `PhotoName` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `BuyHouseGuid` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `TcDate` datetime DEFAULT NULL,
  PRIMARY KEY (`OrgMemberGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `h_Partner` */

DROP TABLE IF EXISTS `h_Partner`;

CREATE TABLE `h_Partner` (
  `PartnerGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `BUGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `PartnerName` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ApplyDate` datetime DEFAULT NULL,
  `Status` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `CorpSort` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `Industry` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `Regional` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `Jyfw` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `Address` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `PostCode` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `Qygm` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `WebSiteUrl` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `Level` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `JoinDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `Hzyx` longtext COLLATE utf8_bin,
  `Yhtk` longtext COLLATE utf8_bin,
  `Gspj` longtext COLLATE utf8_bin,
  PRIMARY KEY (`PartnerGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `h_Point` */

DROP TABLE IF EXISTS `h_Point`;

CREATE TABLE `h_Point` (
  `PointGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `MemGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `PlanGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `BUGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `PointItem` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `PointDate` datetime DEFAULT NULL,
  `Point` decimal(19,4) DEFAULT NULL,
  `EffectDate` datetime DEFAULT NULL,
  `PubName` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `BookNum` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `ArtName` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `TradeGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `TradeInfo` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `RmbHtTotal` decimal(19,4) DEFAULT NULL,
  `Tjr` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `Content` longtext COLLATE utf8_bin,
  `Remark` longtext COLLATE utf8_bin,
  `Attestor` longtext COLLATE utf8_bin,
  `CreateOn` datetime DEFAULT NULL,
  `Shr` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `IsSendJfqrNote` smallint(6) NOT NULL,
  `IsSendJfNullNote` smallint(6) NOT NULL,
  `JzDate` datetime DEFAULT NULL,
  `Templet` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `CreateBy` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `ActGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `SjPoint` decimal(19,4) DEFAULT NULL,
  `PointType` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`PointGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `h_Premember` */

DROP TABLE IF EXISTS `h_Premember`;

CREATE TABLE `h_Premember` (
  `MemGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `CstGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `BUGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `MemName` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `CardType` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `CardID` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `OfficeTel` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `HomeTel` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `Email` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `MobileTel` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `PostCode` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `Address` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `Gender` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `Fax` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `WorkAddr` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `Country` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `Province` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `City` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `Regional` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `Road` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `AddrNO` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `Preferred` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `RefuseInfo` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `WorkArea` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `HomeArea` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `Marriage` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `SpouseName` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `EduLevel` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `Earning` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `Family` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `Work` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `Xqah` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `JoinPath` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `InfoStatus` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `ApplyDate` datetime DEFAULT NULL,
  `NullReason` longtext COLLATE utf8_bin,
  `IsSendNullNote` smallint(6) NOT NULL,
  `MemStation` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `SpecialType` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `BirthDate` datetime DEFAULT NULL,
  `Nationality` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `MarriageDate` datetime DEFAULT NULL,
  `NowState` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `Vehicle` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `BuyHouse` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `PhotoName` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `RhRoomInfo` varchar(232) COLLATE utf8_bin DEFAULT NULL,
  `RhRoomGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `Rhxz` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `CreatMan` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `HangYe` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ISSMS` smallint(6) DEFAULT NULL,
  `IsFromZz` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `OrgMemberGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `IsFamilyCy` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `RhCardRelation` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `FamilyInfoGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `CardID15` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `JoinTag` smallint(6) DEFAULT NULL,
  `ImprotDate` datetime DEFAULT NULL,
  PRIMARY KEY (`MemGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `h_Prize` */

DROP TABLE IF EXISTS `h_Prize`;

CREATE TABLE `h_Prize` (
  `MemGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `PlanGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `BUGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `PrizeName` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `PrizeQty` decimal(19,4) DEFAULT NULL,
  `Price` decimal(19,4) DEFAULT NULL,
  `PayDate` datetime DEFAULT NULL,
  `Remark` longtext COLLATE utf8_bin,
  `IsSendLjNote` smallint(6) NOT NULL,
  `PrizeGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `isAuto` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `ActGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `PointType` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `Point` decimal(19,4) DEFAULT NULL,
  `Tax` decimal(19,4) DEFAULT NULL,
  `NoTaxAmount` decimal(19,4) DEFAULT NULL,
  `Source` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `SendDate` datetime DEFAULT NULL,
  `ChgType` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`PrizeGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `k_CstTouch` */

DROP TABLE IF EXISTS `k_CstTouch`;

CREATE TABLE `k_CstTouch` (
  `LxGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `TaskGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `IsApprove` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `LxrGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `LxDate` datetime DEFAULT NULL,
  `CstReason` longtext COLLATE utf8_bin,
  `TouMemo` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `Wxqr` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`LxGUID`),
  KEY `TaskGUID` (`TaskGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `k_KeyMan` */

DROP TABLE IF EXISTS `k_KeyMan`;

CREATE TABLE `k_KeyMan` (
  `ComplaintGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `KeyManGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `Name` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `Sex` varchar(3) COLLATE utf8_bin DEFAULT NULL,
  `Age` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `Sort` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `Organization` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `Work` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `Department` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `Business` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `MyFunctionary` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `ZyYxShBj` longtext COLLATE utf8_bin,
  `Telephone` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `NowReflect` longtext COLLATE utf8_bin,
  `remark` longtext COLLATE utf8_bin,
  PRIMARY KEY (`KeyManGUID`),
  KEY `ComplaintGUID` (`ComplaintGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `k_KeyManTalk` */

DROP TABLE IF EXISTS `k_KeyManTalk`;

CREATE TABLE `k_KeyManTalk` (
  `KeyManGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `TalkDate` datetime DEFAULT NULL,
  `TalkMan` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `OperationMan` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `TalkAim` longtext COLLATE utf8_bin,
  `PostureBefor` longtext COLLATE utf8_bin,
  `TalkCourse` longtext COLLATE utf8_bin,
  `TalkEffect` longtext COLLATE utf8_bin,
  `Question` longtext COLLATE utf8_bin,
  `PostureBack` longtext COLLATE utf8_bin,
  `Remark` longtext COLLATE utf8_bin,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  KEY `KeyManGUID` (`KeyManGUID`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `k_Pay` */

DROP TABLE IF EXISTS `k_Pay`;

CREATE TABLE `k_Pay` (
  `PayGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `TaskGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `BUGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `ProjGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `BldGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `Room` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `RoomGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `Topic` longtext COLLATE utf8_bin,
  `CardID` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `Spr` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `PayDate` datetime DEFAULT NULL,
  `PayAmount` decimal(19,4) DEFAULT NULL,
  `Worker` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `PayStatus` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `PayMode` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `zrdw` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `PfMan` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `HbrGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `HbDate` datetime DEFAULT NULL,
  `GbrGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `GbDate` datetime DEFAULT NULL,
  `CstGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `Unit` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `TaskCode` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `Shr` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ShDate` datetime DEFAULT NULL,
  `SjPayAmount` decimal(19,4) DEFAULT NULL,
  `SjPayDate` datetime DEFAULT NULL,
  `PayBUName` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `Hbrer` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`PayGUID`),
  KEY `TaskGUID` (`TaskGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `k_Problem` */

DROP TABLE IF EXISTS `k_Problem`;

CREATE TABLE `k_Problem` (
  `ProblemGUID` varchar(250) NOT NULL,
  `TaskGUID` varchar(250) DEFAULT NULL,
  `ReceiveGUID` varchar(250) DEFAULT NULL,
  `State` varchar(16) DEFAULT NULL,
  `IsEffect` smallint(6) DEFAULT NULL,
  `ClsType` varchar(12) DEFAULT NULL,
  `ClsMemo` longtext,
  `ProblemSource` varchar(16) DEFAULT NULL,
  `Type` varchar(32) DEFAULT NULL,
  `ClassGUID` varchar(250) DEFAULT NULL,
  `ClassName` varchar(64) DEFAULT NULL,
  `ProDetail` longtext,
  `ProviderGUID` varchar(250) DEFAULT NULL,
  `Place` longtext,
  `TsProjGUID` varchar(250) DEFAULT NULL,
  `TsBldGUID` varchar(250) DEFAULT NULL,
  `TsRoom` varchar(20) DEFAULT NULL,
  `TsUnit` varchar(10) DEFAULT NULL,
  `TsRoomGUID` varchar(250) DEFAULT NULL,
  `Yfjh` varchar(24) DEFAULT NULL,
  `Yfr` varchar(50) DEFAULT NULL,
  `YfDate` datetime DEFAULT NULL,
  `GdwcDate` datetime DEFAULT NULL,
  `Xgyw` varchar(256) DEFAULT NULL,
  `PlaceMemo` longtext,
  `Clfs` varchar(256) DEFAULT NULL,
  `IfLock` smallint(6) DEFAULT NULL,
  `LockTime` datetime DEFAULT NULL,
  `KHQM` varchar(32) DEFAULT NULL,
  `QrDate` datetime DEFAULT NULL,
  `ClsUser` varchar(20) DEFAULT NULL,
  `ClsDate` datetime DEFAULT NULL,
  `WorkGUID` varchar(250) DEFAULT NULL,
  `VTaskCode` varchar(64) DEFAULT NULL,
  `State2Close` varchar(16) DEFAULT NULL,
  `CsReason` varchar(200) DEFAULT NULL,
  `FgBs` smallint(6) DEFAULT NULL,
  `FgCount` int(11) DEFAULT NULL,
  `ProblemType` varchar(10) DEFAULT NULL,
  `TaskJadGUID` varchar(250) DEFAULT NULL,
  `Num` int(11) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ProblemGUID`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=453503 DEFAULT CHARSET=utf8;

/*Table structure for table `k_ProblemClassMx` */

DROP TABLE IF EXISTS `k_ProblemClassMx`;

CREATE TABLE `k_ProblemClassMx` (
  `DetailGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `ClassGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `Num` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `Detail` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `IsSys` smallint(6) DEFAULT NULL,
  `DealTimeLimit` int(11) DEFAULT NULL,
  PRIMARY KEY (`DetailGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `k_ProblemDetail` */

DROP TABLE IF EXISTS `k_ProblemDetail`;

CREATE TABLE `k_ProblemDetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProblemGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `ClassGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `DetailGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `Detail` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `Memo` longtext COLLATE utf8_bin,
  `PlaceMx` longtext COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `k_ProblemFg` */

DROP TABLE IF EXISTS `k_ProblemFg`;

CREATE TABLE `k_ProblemFg` (
  `ProblemFgGUID` varchar(250) NOT NULL,
  `ProblemGUID` varchar(250) DEFAULT NULL,
  `JbrGUID` varchar(250) DEFAULT NULL,
  `Jbr` varchar(50) DEFAULT NULL,
  `Content` varchar(500) DEFAULT NULL,
  `JbDate` datetime DEFAULT NULL,
  `IfFg` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ProblemFgGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `k_ProblemSubInfo` */

DROP TABLE IF EXISTS `k_ProblemSubInfo`;

CREATE TABLE `k_ProblemSubInfo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ProblemGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `InfoName` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `InfoValue` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ProblemGUID` (`ProblemGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `k_ProviderProject` */

DROP TABLE IF EXISTS `k_ProviderProject`;

CREATE TABLE `k_ProviderProject` (
  `ProviderProjectGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `ProjGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `ProviderGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `LinkMan` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `Tel` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `ContractName` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `CompleteDate` datetime DEFAULT NULL,
  `ContractMoney` decimal(19,4) DEFAULT NULL,
  `LeavingMoney` decimal(19,4) DEFAULT NULL,
  `ContractNO` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `ConstructUnit` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `ProjectLinkPhone` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ConProperty` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `ConKind` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `BalanceAmount` decimal(19,4) DEFAULT NULL,
  PRIMARY KEY (`ProviderProjectGUID`),
  KEY `ProviderGUID` (`ProviderGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `k_ProviderProjectConstru` */

DROP TABLE IF EXISTS `k_ProviderProjectConstru`;

CREATE TABLE `k_ProviderProjectConstru` (
  `ProviderProjectConstruGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `ProjGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `ProviderGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `ClassGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `BldGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `RoomGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `Unit` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `Room` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ProviderProjectConstruGUID`),
  KEY `ClassGUID` (`ClassGUID`),
  KEY `ProviderGUID` (`ProviderGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `k_RcSMSHistory` */

DROP TABLE IF EXISTS `k_RcSMSHistory`;

CREATE TABLE `k_RcSMSHistory` (
  `RcSMSGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `TaskGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `Zrdw` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `ZrdwTel` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `Gjr` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `GjrTel` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `Csr` varchar(8000) COLLATE utf8_bin DEFAULT NULL,
  `CsrTel` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `YzInfo` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `TsFcInfo` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `Content` longtext COLLATE utf8_bin,
  `RwclSx` datetime DEFAULT NULL,
  `CreateBy` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `CreateOn` datetime DEFAULT NULL,
  PRIMARY KEY (`RcSMSGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `k_Receive` */

DROP TABLE IF EXISTS `k_Receive`;

CREATE TABLE `k_Receive` (
  `ReceiveGUID` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `ReceiveCode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FjStatus` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IsEffect` smallint(6) DEFAULT NULL,
  `NoEffect` longtext COLLATE utf8_unicode_ci,
  `IsGz` smallint(6) DEFAULT NULL,
  `Topic` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Content` longtext COLLATE utf8_unicode_ci,
  `ReceiveSource` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WebUrl` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ProjGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BldGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Room` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Unit` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RoomGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TsProjGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TsBldGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TsRoom` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TsUnit` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TsRoomGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CstGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RequestMan` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tel` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MobileTel` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ReceiveMan` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ReceiveDate` datetime DEFAULT NULL,
  `CreateBy` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreateOn` datetime DEFAULT NULL,
  `MessageBoard` longtext COLLATE utf8_unicode_ci,
  `BUGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Rhqk` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ZXBDH` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FeedBack` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ZfMan` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ZfDate` datetime DEFAULT NULL,
  `TsLevel` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TsType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Contact` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qqrIdentity` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ReceiveType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ReceiveManGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isKeepYc` smallint(6) DEFAULT NULL,
  `Status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Fcinfo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FcProjGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CstName` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `InhName` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `InhGUID` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `InhMobileTel` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `InhTel` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TsFcinfo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ReceiveBy` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ReceiveByGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CyTime` datetime DEFAULT NULL,
  `CstTime` datetime DEFAULT NULL,
  `ReceiveCloseDate` datetime DEFAULT NULL,
  `ZsjfDate` datetime DEFAULT NULL,
  `Accompany` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ReceiveRange` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VisitStatus` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LastVisitGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ZXLX` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MidifyDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ReceiveGUID`),
  KEY `idx_kreceive_RGUID` (`ReceiveGUID`),
  KEY `idx_kreceive_ProjGUID` (`ProjGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `k_ReportProgress` */

DROP TABLE IF EXISTS `k_ReportProgress`;

CREATE TABLE `k_ReportProgress` (
  `ReportGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `TaskGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `Jzzk` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `Jzsm` longtext COLLATE utf8_bin,
  `HbDate` datetime DEFAULT NULL,
  `Hbr` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `IsImport` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ReportGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `k_Task` */

DROP TABLE IF EXISTS `k_Task`;

CREATE TABLE `k_Task` (
  `TaskGUID` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `TaskType` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SecretLevel` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Topic` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ProjGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BldGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Unit` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Room` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TsProjGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TsBldGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TsUnit` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TsRoom` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TsRoomGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RequestMan` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Relation2Receive` smallint(6) DEFAULT NULL,
  `Content` longtext COLLATE utf8_unicode_ci,
  `BUGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SlDate` datetime DEFAULT NULL,
  `RwwcSj` datetime DEFAULT NULL,
  `HfZrrGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ZrrHfSj` datetime DEFAULT NULL,
  `TalkContent` longtext COLLATE utf8_unicode_ci,
  `ZcJjfa` longtext COLLATE utf8_unicode_ci,
  `ZzJjfa` longtext COLLATE utf8_unicode_ci,
  `FaQdrGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FaQdSj` datetime DEFAULT NULL,
  `DfkhSj` datetime DEFAULT NULL,
  `DfrGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GbDate` datetime DEFAULT NULL,
  `IsZbcl` smallint(6) DEFAULT NULL,
  `ZbclReason` longtext COLLATE utf8_unicode_ci,
  `ZbclRemark` longtext COLLATE utf8_unicode_ci,
  `CreateBy` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreateOn` datetime DEFAULT NULL,
  `TaskLevel` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IsImportant` smallint(6) DEFAULT NULL,
  `ZrrHfSx` datetime DEFAULT NULL,
  `DfkhSx` datetime DEFAULT NULL,
  `RwclSx` datetime DEFAULT NULL,
  `TaskSource` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ClStatus` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TaskCode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RoomGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CstGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SlrGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IsEffect` smallint(6) DEFAULT NULL,
  `Relation2CstName` smallint(6) NOT NULL,
  `Relation2Room` smallint(6) NOT NULL,
  `ForeStatus` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Status2Close` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KfContent` longtext COLLATE utf8_unicode_ci,
  `OtherContent` longtext COLLATE utf8_unicode_ci,
  `TsType` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Yjclsx` datetime DEFAULT NULL,
  `Zrdw` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ZrdwGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gjrGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VisitGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `YfDate` datetime DEFAULT NULL,
  `YfType` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BeforeVisitTaskStatus` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ReceiveGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Slr` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Hxclr` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HxclrGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DsfGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Cnwcsj` datetime DEFAULT NULL,
  `CreateByGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ModifyBy` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ModifyByGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ModifyOn` datetime DEFAULT NULL,
  `ForeTaskStatus` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PgDate` datetime DEFAULT NULL,
  `GwName` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CsName` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dsf` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TaskRange` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ExamPlan` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ExamDate` datetime DEFAULT NULL,
  `ExamMan` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Fcinfo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CstName` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TsFcinfo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rpt_ProblemClass` varchar(8000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FirstPrintDate` datetime DEFAULT NULL,
  `RepairSchemeGUID` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`TaskGUID`),
  KEY `idx_task_ReceiveGUID` (`ReceiveGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `k_Visit` */

DROP TABLE IF EXISTS `k_Visit`;

CREATE TABLE `k_Visit` (
  `VisitGUID` varchar(250) NOT NULL,
  `ReceiveGUID` varchar(250) DEFAULT NULL,
  `VisitDate` datetime DEFAULT NULL,
  `VisiterName` varchar(60) DEFAULT NULL,
  `VisitMemo` longtext,
  `VisitStatus` varchar(16) DEFAULT NULL,
  `CstName` varchar(60) DEFAULT NULL,
  `CstTel` varchar(60) DEFAULT NULL,
  `NoVisitReason` varchar(60) DEFAULT NULL,
  `VisitEndTime` datetime DEFAULT NULL,
  `NextVisitTime` datetime DEFAULT NULL,
  `VisitStyle` varchar(50) DEFAULT NULL,
  `VisitSatisf` varchar(50) DEFAULT NULL,
  `VisitType` varchar(10) DEFAULT NULL,
  `RoomGUID` varchar(250) DEFAULT NULL,
  `VisitMyd` varchar(50) DEFAULT NULL,
  `VisitRange` varchar(16) DEFAULT NULL,
  `VisitCondition` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`VisitGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `k_Work` */

DROP TABLE IF EXISTS `k_Work`;

CREATE TABLE `k_Work` (
  `WorkGUID` varchar(250) NOT NULL,
  `TaskGUID` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ToDw` varchar(64) DEFAULT NULL,
  `ZrDw` varchar(64) DEFAULT NULL,
  `WorkContent` longtext,
  `PdrGUID` varchar(250) DEFAULT NULL,
  `PdDate` datetime DEFAULT NULL,
  `Jdr` varchar(20) DEFAULT NULL,
  `GdwcDate` datetime DEFAULT NULL,
  `BdsxDate` datetime DEFAULT NULL,
  `YqdfDate` datetime DEFAULT NULL,
  `Fxdd` varchar(100) DEFAULT NULL,
  `DisposeResult` varchar(100) DEFAULT NULL,
  `Jzzk` varchar(10) DEFAULT NULL,
  `Clfa` longtext,
  `CheckPlace` varchar(64) DEFAULT NULL,
  `HandSet` varchar(20) DEFAULT NULL,
  `IsSendNote` smallint(6) DEFAULT NULL,
  `WorkCode` varchar(50) DEFAULT NULL,
  `NoteContent` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`WorkGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `k_Worker` */

DROP TABLE IF EXISTS `k_Worker`;

CREATE TABLE `k_Worker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TaskGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `UserGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `Station` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `IsCs` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_taskid` (`TaskGUID`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=111179 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `labellocal_details` */

DROP TABLE IF EXISTS `labellocal_details`;

CREATE TABLE `labellocal_details` (
  `labelLocal_details_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序列',
  `rootid` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '树根节点',
  `rootValue` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `lableKey` tinyint(4) DEFAULT NULL COMMENT '示表是全网还是本地的',
  `lableValue` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '签标名称中文',
  `rootTitle` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '标签大类名称',
  `supTitle` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '标签小类名称',
  `showSupTitle` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '是否显示标签(true,false)',
  `hasSubs` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '是否显示标签分类(ture,false)',
  `model` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '标签分类(标签编号)',
  `title` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '标签分类名称',
  `optionsName` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '标签key',
  `optionsValue` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '标签value',
  `subsName` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '标签区域key',
  `subsValue` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '标签区域value',
  `rootGUID` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `pGUID` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '父节点',
  `isroot` int(11) DEFAULT NULL,
  `isleaf` int(11) DEFAULT NULL,
  `tableName` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '数据来源表明',
  `labelExpress` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '特征值表达式',
  PRIMARY KEY (`labelLocal_details_id`,`tableName`)
) ENGINE=MyISAM AUTO_INCREMENT=1092 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='签标模板表';

/*Table structure for table `labellocal_storage` */

DROP TABLE IF EXISTS `labellocal_storage`;

CREATE TABLE `labellocal_storage` (
  `labelLocal_storage_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '列序',
  `lableKey` tinyint(4) DEFAULT NULL COMMENT '示标是全网还是本地',
  `id` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '标签id',
  `labelType` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '否是时效',
  `labelAttr` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '签标名称',
  `persons` int(11) DEFAULT NULL COMMENT '取提人数',
  `updateTime` datetime DEFAULT NULL COMMENT '新更时间',
  `info` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '签标描述',
  `sortTitle` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '选已条件key',
  `optionName` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '选已条件Value',
  `createTime` datetime DEFAULT NULL COMMENT '建创时间',
  `model` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `optionvalue` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `sys_user_id` int(11) DEFAULT NULL COMMENT '创建者GUID， 关联SYSUSER',
  `tableName` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '数据查询来源表，克隆于labelLocal_details的tableName字段',
  `labelExpress` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '特征表达式，克隆于labelLocal_details的labelExpress',
  `templateId` int(11) DEFAULT NULL COMMENT 'labellocal_details 表中的labelLocal_details_id 字段',
  PRIMARY KEY (`labelLocal_storage_id`)
) ENGINE=MyISAM AUTO_INCREMENT=296 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='标签存储表';

/*Table structure for table `labellocal_storage_copy` */

DROP TABLE IF EXISTS `labellocal_storage_copy`;

CREATE TABLE `labellocal_storage_copy` (
  `labelLocal_storage_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '列序',
  `lableKey` tinyint(4) DEFAULT NULL COMMENT '示标是全网还是本地',
  `id` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '标签id',
  `labelType` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '否是时效',
  `labelAttr` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '签标名称',
  `persons` int(11) DEFAULT NULL COMMENT '取提人数',
  `updateTime` datetime DEFAULT NULL COMMENT '新更时间',
  `info` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '签标描述',
  `sortTitle` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '选已条件key',
  `optionName` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '选已条件Value',
  `createTime` datetime DEFAULT NULL COMMENT '建创时间',
  `model` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `optionvalue` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `sys_user_id` int(11) DEFAULT NULL COMMENT '创建者GUID， 关联SYSUSER',
  `tableName` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '数据查询来源表，克隆于labelLocal_details的tableName字段',
  `labelExpress` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '特征表达式，克隆于labelLocal_details的labelExpress',
  `templateId` int(11) DEFAULT NULL COMMENT 'labellocal_details 表中的labelLocal_details_id 字段',
  PRIMARY KEY (`labelLocal_storage_id`)
) ENGINE=MyISAM AUTO_INCREMENT=296 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='标签存储表';

/*Table structure for table `mybusinessunit` */

DROP TABLE IF EXISTS `mybusinessunit`;

CREATE TABLE `mybusinessunit` (
  `BUGUID` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `BUName` varchar(50) DEFAULT NULL,
  `BUFullName` varchar(100) DEFAULT NULL,
  `BUCode` varchar(50) DEFAULT NULL,
  `HierarchyCode` varchar(500) DEFAULT NULL,
  `ParentGUID` varchar(250) DEFAULT NULL,
  `WebSite` varchar(50) DEFAULT NULL,
  `Fax` varchar(20) DEFAULT NULL,
  `CompanyAddr` varchar(100) DEFAULT NULL,
  `Charter` varchar(50) DEFAULT NULL,
  `CorporationDeputy` varchar(20) DEFAULT NULL,
  `CreatedOn` datetime DEFAULT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `CreatedBy` varchar(250) DEFAULT NULL,
  `Comments` varchar(500) DEFAULT NULL,
  `ModifiedBy` varchar(250) DEFAULT NULL,
  `IsEndCompany` smallint(6) DEFAULT NULL,
  `IsCompany` smallint(6) DEFAULT NULL,
  `Level` int(11) DEFAULT NULL,
  `BUType` smallint(6) DEFAULT NULL,
  `ProjGUID` varchar(250) DEFAULT NULL,
  `OrderCode` varchar(20) DEFAULT NULL,
  `OrderHierarchyCode` varchar(500) DEFAULT NULL,
  `CompanyGUID` varchar(250) DEFAULT NULL,
  `NamePath` varchar(1000) DEFAULT NULL,
  `xmname` varchar(50) DEFAULT NULL,
  `FyStationGUID` varchar(250) DEFAULT NULL,
  `RefStationName` varchar(1000) DEFAULT NULL,
  `signguid` varchar(40) DEFAULT NULL,
  `IsFc` smallint(6) DEFAULT NULL,
  `MainBuGUID` varchar(250) DEFAULT NULL,
  `ParentReportGUID` varchar(250) DEFAULT NULL,
  `PrincipalGUID` varchar(250) DEFAULT NULL,
  `BUPersonInCharge` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`BUGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `p_Customer` */

DROP TABLE IF EXISTS `p_Customer`;

CREATE TABLE `p_Customer` (
  `CstGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `CstName` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `CardID` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `OfficeTel` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `HomeTel` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `MobileTel` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `Email` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `PostCode` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `Address` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `CstType` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `Gender` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `CardType` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `Fax` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `WorkAddr` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `Country` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `Province` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `City` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `Regional` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `Road` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `AddrNO` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `Description` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `CreatedOn` datetime DEFAULT NULL,
  `CreatedBy` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `BizLicence` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `Corporation` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `ModifyOn` datetime DEFAULT NULL,
  `ModifyBy` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `BirthDate` datetime DEFAULT NULL,
  `CstCode` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `Nationality` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `Preferred` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `RefuseInfo` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `FirstContact` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `CompanyPhone` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `CreditEvaluate` longtext COLLATE utf8_bin,
  `cardRelation` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `CreatedByGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `IsCreatorUse` smallint(6) DEFAULT NULL,
  `IsReceiveSMS` smallint(6) DEFAULT NULL,
  `NativePlace` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `CardID15` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `FirstName` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `LastName` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `IsYz` smallint(6) DEFAULT NULL,
  `CstSort` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `LeaderName` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `LeaderPhone` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `CarNum` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `Drink` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `Fruit` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `Cigarette` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `Magazine` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `Topic` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `Remark` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `RelationLeaderGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `MobileTel2` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `omssignguid` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `CarBrands` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `CardAddress` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `scrm_timestamp_data` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`CstGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `p_room` */

DROP TABLE IF EXISTS `p_room`;

CREATE TABLE `p_room` (
  `RoomGUID` varchar(250) NOT NULL,
  `BUGUID` varchar(250) DEFAULT NULL,
  `ProjGUID` varchar(250) DEFAULT NULL,
  `BldGUID` varchar(250) DEFAULT NULL,
  `MainRoomGUID` varchar(250) DEFAULT NULL,
  `Unit` varchar(10) DEFAULT NULL,
  `Floor` varchar(10) DEFAULT NULL,
  `No` varchar(10) DEFAULT NULL,
  `Room` varchar(20) DEFAULT NULL,
  `RoomCode` varchar(200) DEFAULT NULL,
  `HuXing` varchar(20) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `IsVirtualRoom` smallint(6) DEFAULT NULL,
  `BldArea` decimal(19,4) DEFAULT NULL,
  `TnArea` decimal(19,4) DEFAULT NULL,
  `BlRhDate` datetime DEFAULT NULL,
  `RHBLZT` varchar(16) DEFAULT NULL,
  `YFBZ` varchar(40) DEFAULT NULL,
  `RoomMemo` longtext,
  `XPos` int(11) DEFAULT NULL,
  `YPos` int(11) DEFAULT NULL,
  `ZxBz` varchar(30) DEFAULT NULL,
  `Price` decimal(19,4) DEFAULT NULL,
  `TnPrice` decimal(19,4) DEFAULT NULL,
  `Total` decimal(19,4) DEFAULT NULL,
  `ZxPrice` decimal(19,4) DEFAULT NULL,
  `ZxTotal` decimal(19,4) DEFAULT NULL,
  `IsTempletRoom` smallint(6) DEFAULT NULL,
  `Locker` varchar(16) DEFAULT NULL,
  `LockTime` datetime DEFAULT NULL,
  `TfDate` datetime DEFAULT NULL,
  `DjArea` varchar(10) DEFAULT NULL,
  `IsAreaModify` smallint(6) DEFAULT NULL,
  `VirtualStatus` varchar(10) DEFAULT NULL,
  `RHDate` datetime DEFAULT NULL,
  `JFRQ` datetime DEFAULT NULL,
  `JFMemo` longtext,
  `XkRow` varchar(2) DEFAULT NULL,
  `XkCol` varchar(2) DEFAULT NULL,
  `AreaStatus` varchar(50) DEFAULT NULL,
  `West` varchar(20) DEFAULT NULL,
  `AreaChangingGUID` varchar(250) DEFAULT NULL,
  `ImportDate` datetime DEFAULT NULL,
  `ChooseRoom` smallint(6) DEFAULT NULL,
  `CstName` varchar(1000) DEFAULT NULL,
  `CstGUIDList` varchar(4000) DEFAULT NULL,
  `ChooseRoomCstName` varchar(60) DEFAULT NULL,
  `ChooseRoomDate` datetime DEFAULT NULL,
  `Jbr` varchar(30) DEFAULT NULL,
  `isAnnexe` smallint(6) DEFAULT NULL,
  `Sight` varchar(30) DEFAULT NULL,
  `RoomStru` varchar(30) DEFAULT NULL,
  `AbsolutelyFloor` varchar(10) DEFAULT NULL,
  `StatusChgGUID` varchar(250) DEFAULT NULL,
  `SaleRentable` varchar(10) DEFAULT NULL,
  `RentPrice` decimal(19,4) DEFAULT NULL,
  `CalcRentMode` varchar(20) DEFAULT NULL,
  `RentUnit` varchar(10) DEFAULT NULL,
  `Bz` varchar(10) DEFAULT NULL,
  `RentStatus` varchar(10) DEFAULT NULL,
  `ContinueRentStatus` varchar(10) DEFAULT NULL,
  `NextRentStatus` varchar(10) DEFAULT NULL,
  `RentName` varchar(1000) DEFAULT NULL,
  `RentGUIDList` varchar(4000) DEFAULT NULL,
  `RentStatusChgGUID` varchar(250) DEFAULT NULL,
  `RentLocker` varchar(16) DEFAULT NULL,
  `RentLockTime` datetime DEFAULT NULL,
  `RentAmount` decimal(19,4) DEFAULT NULL,
  `BProductTypeCode` varchar(100) DEFAULT NULL,
  `ProportionArea` decimal(19,4) DEFAULT NULL,
  `RealArchitectureArea` decimal(19,4) DEFAULT NULL,
  `RealInsideArea` decimal(19,4) DEFAULT NULL,
  `RealPublicProportionArea` decimal(19,4) DEFAULT NULL,
  `TopGardenArea` decimal(19,4) DEFAULT NULL,
  `BasementArea` decimal(19,4) DEFAULT NULL,
  `Loftarea` decimal(19,4) DEFAULT NULL,
  `CarArea` decimal(19,4) DEFAULT NULL,
  `PriceArea` decimal(19,4) DEFAULT NULL,
  `YcBldarea` decimal(19,4) DEFAULT NULL,
  `YcInarea` decimal(19,4) DEFAULT NULL,
  `SpLock` smallint(6) DEFAULT NULL,
  `YsBldArea` decimal(19,4) DEFAULT NULL,
  `YsTnArea` decimal(19,4) DEFAULT NULL,
  `YsProportionArea` decimal(19,4) DEFAULT NULL,
  `IsLock` varchar(10) DEFAULT NULL,
  `UnitNo` int(11) DEFAULT NULL,
  `SLControlDate` datetime DEFAULT NULL,
  `FloorNo` int(11) DEFAULT NULL,
  `HyFamilyGUID` varchar(250) DEFAULT NULL,
  `SpResult` varchar(200) DEFAULT NULL,
  `IsRefusedVisit` smallint(6) DEFAULT NULL,
  `ScBldArea` decimal(19,4) DEFAULT NULL,
  `ScTnArea` decimal(19,4) DEFAULT NULL,
  `ChooseRoomNo` int(11) DEFAULT NULL,
  `ImportData_SP5` varchar(100) DEFAULT NULL,
  `IsHfLock` smallint(6) DEFAULT NULL,
  `PriceDj` decimal(19,4) DEFAULT NULL,
  `TnPriceDj` decimal(19,4) DEFAULT NULL,
  `TotalDj` decimal(19,4) DEFAULT NULL,
  `IsDj2AreaLock` smallint(6) DEFAULT NULL,
  `IsBzj2AreaLock` smallint(6) DEFAULT NULL,
  `IsDjTf` smallint(6) DEFAULT NULL,
  `IsBzjTf` smallint(6) DEFAULT NULL,
  `IsDjAreaModify` smallint(6) DEFAULT NULL,
  `ChooseRoomBookingGUID` varchar(250) DEFAULT NULL,
  `ZXLB` varchar(20) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `YsFirstDate` datetime DEFAULT NULL,
  `YsLastDate` datetime DEFAULT NULL,
  `YsLastUserGUID` varchar(250) DEFAULT NULL,
  `ScFirstDate` datetime DEFAULT NULL,
  `ScLastDate` datetime DEFAULT NULL,
  `ScLastUserGUID` varchar(250) DEFAULT NULL,
  `iPadReserveStatus` smallint(6) DEFAULT NULL,
  `omssignguid` varchar(40) DEFAULT NULL,
  `IsPreControl` smallint(6) DEFAULT NULL,
  `PreControlBy` varchar(250) DEFAULT NULL,
  `PreControlOn` datetime DEFAULT NULL,
  `ProjBatchGUID` varchar(250) DEFAULT NULL,
  `ChooseRoomCstGUID` varchar(400) DEFAULT NULL,
  `BookingGUID` varchar(250) DEFAULT NULL,
  `scrm_timestamp_data` varchar(100) DEFAULT NULL,
  `NewCstName` varchar(1000) DEFAULT NULL,
  `NewTel1` varchar(1000) DEFAULT NULL,
  `NewTel2` varchar(1000) DEFAULT NULL,
  `NewCardType` varchar(100) DEFAULT NULL,
  `NewCardID` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`RoomGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `prj_commpany_area_1` */

DROP TABLE IF EXISTS `prj_commpany_area_1`;

CREATE TABLE `prj_commpany_area_1` (
  `projGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '源项目GUID',
  `ProjName` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目名称',
  `companyGUID` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司GUID',
  `hierarchyCode` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `area_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `cityName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `area_id` bigint(20) DEFAULT NULL,
  `cityCode` bigint(20) DEFAULT NULL,
  KEY `companyGUID11` (`companyGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `prm_user` */

DROP TABLE IF EXISTS `prm_user`;

CREATE TABLE `prm_user` (
  `userGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户GUID',
  `userCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户代码',
  `userName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名称',
  `companyGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属公司',
  `photoUrl` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '照片网址',
  `jobTitle` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '职位',
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电子邮件',
  `officePhone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '办公电话',
  `mobilePhone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机',
  `homePhone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '家庭电话',
  `aDAccount` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '域登录帐号',
  `createdOn` datetime DEFAULT NULL COMMENT '创建时间',
  `modifiedOn` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改时间',
  `createdBy` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modifiedBy` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `isDisabeld` tinyint(4) DEFAULT NULL COMMENT '是否禁用',
  `disabledReason` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '禁用原因',
  `remarks` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '说明',
  `parentGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所属单位',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登录密码',
  `isAdmin` tinyint(4) DEFAULT NULL COMMENT '是否超级用户',
  `isSaler` tinyint(4) DEFAULT NULL COMMENT '是否销售员',
  `jobNumber` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '工作数',
  `userProject` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户项目',
  `departmentGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mysoftGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isQyWw` tinyint(4) DEFAULT NULL,
  `userKind` tinyint(4) DEFAULT NULL,
  `pSWModifyTime` datetime DEFAULT NULL,
  `isUserChangePWD` tinyint(4) DEFAULT NULL,
  `isLocked` tinyint(4) DEFAULT NULL,
  `excludeBUGUID` varchar(4096) COLLATE utf8_unicode_ci DEFAULT NULL,
  `excludeBUName` varchar(4096) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createTime` datetime DEFAULT NULL COMMENT '记录创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录修改时间',
  PRIMARY KEY (`userGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `report_basic_area_enum` */

DROP TABLE IF EXISTS `report_basic_area_enum`;

CREATE TABLE `report_basic_area_enum` (
  `attachGUID` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachCode` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachKey` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `enumValue` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`attachGUID`),
  KEY `idx_bae_enumValue` (`enumValue`(255)),
  KEY `idx_bae_attachKey` (`attachKey`)
) ENGINE=InnoDB AUTO_INCREMENT=3563 DEFAULT CHARSET=utf8;

/*Table structure for table `report_basic_room_enum` */

DROP TABLE IF EXISTS `report_basic_room_enum`;

CREATE TABLE `report_basic_room_enum` (
  `attachGUID` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachCode` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachKey` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `enumValue` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`attachGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=3577 DEFAULT CHARSET=utf8;

/*Table structure for table `report_cst_customer` */

DROP TABLE IF EXISTS `report_cst_customer`;

CREATE TABLE `report_cst_customer` (
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `cstName` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '客户姓名',
  `gender` tinyint(4) DEFAULT NULL COMMENT '性别',
  `birthDate` datetime DEFAULT NULL COMMENT '生日',
  `cstType` tinyint(4) DEFAULT NULL COMMENT '客户类型1=个人2=公司',
  `cardType` int(11) DEFAULT NULL COMMENT '证件类型1=身份证2=军官证3=护照4=港澳通行证5=台湾通行证6=台湾身份证7=港澳身份证8=营业热照9=组织机构代码10=税务登记证号99=其它',
  `cardID` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `mobileTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
  `officeTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '办公电话',
  `homeTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭电话',
  `sourceApp` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '来源应用',
  `sourceBiz` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '来源业态；参见特征定义',
  `activitySource` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '媒体活动；参见特征定义',
  `isMerge` int(10) NOT NULL DEFAULT '0' COMMENT '是否合并0=无合并， 1=有合并',
  `isMaster` int(10) NOT NULL DEFAULT '0' COMMENT '是否主数据1是，0否，默认0',
  `contact` mediumtext COLLATE utf8_bin COMMENT '联系电话列表，存当前的',
  `myGUIDList` mediumtext COLLATE utf8_bin COMMENT '业态ID列表，存现有的',
  `address` varchar(400) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭地址',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` datetime NOT NULL COMMENT '修改时间',
  KEY `idx_rpt_cst_cstID` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `report_cst_deal_analyse` */

DROP TABLE IF EXISTS `report_cst_deal_analyse`;

CREATE TABLE `report_cst_deal_analyse` (
  `children_num` varchar(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '子女个数',
  `age_segment` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '年龄段',
  `proj_house_type` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '项目户型',
  `live_format` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '居住业态',
  `room_acreage` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '面积',
  `cst_num` int(11) DEFAULT NULL COMMENT '客户数量',
  `owner_num` int(11) DEFAULT NULL COMMENT '业主数量',
  `sale_acreage` decimal(10,2) DEFAULT NULL COMMENT '销售面积总数',
  `sale_amount` decimal(10,2) DEFAULT NULL COMMENT '销售总金额',
  `work_area` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `live_area` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `deal_date` date DEFAULT NULL,
  `big_area` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `prject_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `city_name` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `birth_day` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `report_cst_deal_mid_bak2` */

DROP TABLE IF EXISTS `report_cst_deal_mid_bak2`;

CREATE TABLE `report_cst_deal_mid_bak2` (
  `children_num` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '子女个数',
  `age_segment` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '年龄段',
  `proj_house_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目户型(户型)',
  `live_format` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '居住业态',
  `room_acreage` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '面积',
  `cst_num` int(11) DEFAULT NULL COMMENT '客户数量',
  `owner_num` int(11) DEFAULT NULL COMMENT '业主数量',
  `sale_acreage` decimal(20,2) DEFAULT NULL COMMENT '销售面积总数',
  `sale_amount` decimal(20,2) DEFAULT NULL COMMENT '销售总金额',
  `work_area` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `live_area` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `deal_date` date DEFAULT NULL,
  `big_area` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `prject_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `roomGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `bldGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstGUID` bigint(20) DEFAULT NULL,
  `birth_day` date DEFAULT NULL,
  `projGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目编号',
  `companyGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司编号',
  `live_format_orig` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `proj_house_type_orig` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `work_area_orig` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `live_area_orig` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `children_num_orig` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cardID` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '身份证号码',
  `subType` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '10.001=房产',
  `cstType` tinyint(4) DEFAULT NULL COMMENT '客户类型1=个人 2=公司',
  `cardType` int(11) DEFAULT NULL COMMENT '1=身份证2=军官证3=护照4=港澳通行证5=台湾通行证6=台湾身份证7=港澳身份证8=营业热照9=组织机构代码10=税务登记证号99=其它',
  `room_acre_segment` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `tradeGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `jfdate` datetime DEFAULT NULL,
  `big_code` varchar(64) DEFAULT NULL,
  `city_code` varchar(64) DEFAULT NULL,
  `big_name` varchar(100) DEFAULT NULL,
  KEY `idx_rpt_cst_tradeGUID` (`tradeGUID`),
  KEY `idx_rpt_cst_roomGUID` (`roomGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `report_cst_deal_mid_own` */

DROP TABLE IF EXISTS `report_cst_deal_mid_own`;

CREATE TABLE `report_cst_deal_mid_own` (
  `children_num` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '子女个数',
  `age_segment` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '年龄段',
  `proj_house_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目户型(户型)',
  `live_format` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '居住业态',
  `room_acreage` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '面积',
  `cst_num` int(11) DEFAULT NULL COMMENT '客户数量',
  `owner_num` int(11) DEFAULT NULL COMMENT '业主数量',
  `sale_acreage` decimal(20,2) DEFAULT NULL COMMENT '销售面积总数',
  `sale_amount` decimal(20,2) DEFAULT NULL COMMENT '销售总金额',
  `work_area` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `live_area` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deal_date` date DEFAULT NULL,
  `big_area` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prject_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roomGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bldGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstGUID` bigint(20) DEFAULT NULL,
  `birth_day` date DEFAULT NULL,
  `projGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目编号',
  `companyGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司编号',
  `live_format_orig` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `proj_house_type_orig` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `work_area_orig` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `live_area_orig` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `children_num_orig` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cardID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '身份证号码',
  `subType` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '10.001=房产',
  `cstType` tinyint(4) DEFAULT NULL COMMENT '客户类型1=个人 2=公司',
  `cardType` int(11) DEFAULT NULL COMMENT '1=身份证2=军官证3=护照4=港澳通行证5=台湾通行证6=台湾身份证7=港澳身份证8=营业热照9=组织机构代码10=税务登记证号99=其它',
  `room_acre_segment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstNum` int(11) DEFAULT NULL,
  `propertyRate` double(11,3) DEFAULT NULL,
  `tradeGUID` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstOriginPlace` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstIndustry` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstCurYl` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jFDate` datetime DEFAULT NULL,
  `ID` bigint(30) NOT NULL AUTO_INCREMENT,
  `ylcode` int(11) DEFAULT NULL COMMENT '年龄序号',
  `mjcode` int(11) DEFAULT NULL COMMENT '面积序号',
  `area_id` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `citycode` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_type_orig` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sfamount` double(11,3) DEFAULT NULL,
  `big_code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `big_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `curr_house_amount` double(12,3) DEFAULT NULL,
  `curr_amount_id` double(12,3) DEFAULT NULL,
  `household_city_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `work_city_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `house_address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `household_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '户籍编码',
  `household_city_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `household_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `work_city_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `work_sheng_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `work_sheng_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `dx_deal_date` (`deal_date`) USING BTREE,
  KEY `dx_rptown_jfdate` (`jFDate`),
  KEY `idx_rcdmo_cstGUID` (`cstGUID`),
  KEY `indx_rptown_tradeguid` (`tradeGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=201904 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='客户房产明细归类表';

/*Table structure for table `report_cst_deal_mid_own_02` */

DROP TABLE IF EXISTS `report_cst_deal_mid_own_02`;

CREATE TABLE `report_cst_deal_mid_own_02` (
  `children_num` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '子女个数',
  `age_segment` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '年龄段',
  `proj_house_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目户型(户型)',
  `live_format` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '居住业态',
  `room_acreage` float DEFAULT NULL COMMENT '面积',
  `cst_num` int(11) DEFAULT NULL COMMENT '客户数量',
  `owner_num` int(11) DEFAULT NULL COMMENT '业主数量',
  `sale_acreage` decimal(20,2) DEFAULT NULL COMMENT '销售面积总数',
  `sale_amount` decimal(20,2) DEFAULT NULL COMMENT '销售总金额',
  `work_area` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `live_area` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `deal_date` date DEFAULT NULL,
  `big_area` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `prject_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `roomGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `bldGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstGUID` bigint(20) DEFAULT NULL,
  `birth_day` date DEFAULT NULL,
  `projGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目编号',
  `companyGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司编号',
  `live_format_orig` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `proj_house_type_orig` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `work_area_orig` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `live_area_orig` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `children_num_orig` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cardID` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '身份证号码',
  `subType` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '10.001=房产',
  `cstType` tinyint(4) DEFAULT NULL COMMENT '客户类型1=个人 2=公司',
  `cardType` int(11) DEFAULT NULL COMMENT '1=身份证2=军官证3=护照4=港澳通行证5=台湾通行证6=台湾身份证7=港澳身份证8=营业热照9=组织机构代码10=税务登记证号99=其它',
  `room_acre_segment` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstNum` int(11) DEFAULT NULL,
  `propertyRate` double(11,3) DEFAULT NULL,
  `tradeGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstOriginPlace` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstIndustry` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstCurYl` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `jFDate` datetime DEFAULT NULL,
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ylcode` int(11) DEFAULT NULL,
  `mjcode` int(11) DEFAULT NULL,
  `area_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `citycode` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_type_orig` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `SFAMOUNT` double(11,3) DEFAULT NULL COMMENT '首付金额',
  `big_code` varchar(64) DEFAULT NULL,
  `big_name` varchar(64) DEFAULT NULL,
  `city_code` varchar(64) DEFAULT NULL,
  `curr_house_amount` double(12,3) DEFAULT NULL COMMENT '当年房产估值',
  PRIMARY KEY (`ID`),
  KEY `idx_cstown2_cstGUID` (`cstGUID`),
  KEY `idx_cstown02_roomGUID` (`roomGUID`),
  KEY `idx_cstown02_dealDate` (`deal_date`),
  KEY `idx_cstown02_tradeguid` (`tradeGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=262141 DEFAULT CHARSET=utf8;

/*Table structure for table `report_cst_deal_mid_own_02_tmp` */

DROP TABLE IF EXISTS `report_cst_deal_mid_own_02_tmp`;

CREATE TABLE `report_cst_deal_mid_own_02_tmp` (
  `projGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目编号',
  `cstGUID` bigint(20) DEFAULT NULL,
  `deal_date` date DEFAULT NULL,
  KEY `idx_own_02_tmp` (`projGUID`,`cstGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `report_rpt_run_time` */

DROP TABLE IF EXISTS `report_rpt_run_time`;

CREATE TABLE `report_rpt_run_time` (
  `programname` varchar(50) DEFAULT NULL,
  `begindate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `runstatus` varchar(1) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Table structure for table `report_s_product_order` */

DROP TABLE IF EXISTS `report_s_product_order`;

CREATE TABLE `report_s_product_order` (
  `productCode` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '产品编码',
  `cstGUID` varchar(341) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstGUID_All` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_num` int(11) NOT NULL DEFAULT '0',
  KEY `idx_report_s_product_order` (`productCode`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `report_t_proj_tzk_info` */

DROP TABLE IF EXISTS `report_t_proj_tzk_info`;

CREATE TABLE `report_t_proj_tzk_info` (
  `projGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目编号',
  `cstGUID` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_area_city_proj_1218` */

DROP TABLE IF EXISTS `rpt_area_city_proj_1218`;

CREATE TABLE `rpt_area_city_proj_1218` (
  `projGUID` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `projName` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `area_id` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `area_name` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `citycode` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `cityName` varchar(64) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_b_proj_sum` */

DROP TABLE IF EXISTS `rpt_b_proj_sum`;

CREATE TABLE `rpt_b_proj_sum` (
  `proj_sum_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `proj_guid` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '项目GUID',
  `proj_name` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目名称',
  `big_code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '区域id',
  `city_Code` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '城市ID',
  `sale_sum` int(11) DEFAULT NULL COMMENT '总成交套数',
  `saleamountsum` double DEFAULT NULL COMMENT '总成交金额',
  `sale_scale` double DEFAULT NULL COMMENT '已销比例',
  `trade_sum` int(11) DEFAULT NULL COMMENT '总投诉单数',
  `repairs_sum` int(11) DEFAULT NULL COMMENT '总报修单数',
  `family_sum` int(11) DEFAULT NULL COMMENT '总户数',
  `status` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态',
  `create_time` datetime NOT NULL COMMENT '统计时间',
  `subsc_sum` int(11) DEFAULT NULL COMMENT '认购',
  `Xs_Sold_house_num` int(11) DEFAULT NULL,
  `Xs_Sale_house_num` int(11) DEFAULT NULL,
  `Wy_cst_service_num` int(11) DEFAULT NULL,
  `Wy_property_num` int(11) DEFAULT NULL,
  `zy_House_source_num` int(11) DEFAULT NULL,
  `zy_sold_num` int(11) DEFAULT NULL,
  `zy_lease` int(11) DEFAULT NULL,
  `big_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cityName1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `curr_status` varchar(10) COLLATE utf8_unicode_ci DEFAULT '0',
  `total_set` int(11) DEFAULT NULL,
  `sp_set` int(11) DEFAULT NULL,
  `format_id` varchar(10) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '业态类型（1住宅，2商业，0 其它）',
  PRIMARY KEY (`proj_sum_id`),
  KEY `idx_b_proj_sum_guid` (`proj_guid`)
) ENGINE=MyISAM AUTO_INCREMENT=32744 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='项目汇总表';

/*Table structure for table `rpt_b_proj_sum_bak` */

DROP TABLE IF EXISTS `rpt_b_proj_sum_bak`;

CREATE TABLE `rpt_b_proj_sum_bak` (
  `proj_sum_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '序列号',
  `proj_guid` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '项目GUID',
  `proj_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目名称',
  `big_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '区域id',
  `city_Code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '城市ID',
  `sale_sum` int(11) DEFAULT NULL COMMENT '总成交套数',
  `saleamountsum` double DEFAULT NULL COMMENT '总成交金额',
  `sale_scale` double DEFAULT NULL COMMENT '已销比例',
  `trade_sum` int(11) DEFAULT NULL COMMENT '总投诉单数',
  `repairs_sum` int(11) DEFAULT NULL COMMENT '总报修单数',
  `family_sum` int(11) DEFAULT NULL COMMENT '总户数',
  `status` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态',
  `create_time` datetime NOT NULL COMMENT '统计时间',
  `subsc_sum` int(11) DEFAULT NULL COMMENT '认购',
  `Xs_Sold_house_num` int(11) DEFAULT NULL,
  `Xs_Sale_house_num` int(11) DEFAULT NULL,
  `Wy_cst_service_num` int(11) DEFAULT NULL,
  `Wy_property_num` int(11) DEFAULT NULL,
  `zy_House_source_num` int(11) DEFAULT NULL,
  `zy_sold_num` int(11) DEFAULT NULL,
  `zy_lease` int(11) DEFAULT NULL,
  `big_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cityName1` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `curr_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `total_set` int(11) DEFAULT NULL,
  `sp_set` int(11) DEFAULT NULL,
  `format_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '业态类型（1住宅，2商业，0 其它）'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_b_room` */

DROP TABLE IF EXISTS `rpt_b_room`;

CREATE TABLE `rpt_b_room` (
  `roomID` bigint(20) NOT NULL,
  `roomGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `companyGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `projGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '区域编号',
  `bldGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '区域名称',
  `mainRoomGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司编号',
  `cstGUIDList` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `floor` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `no` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `room` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roomCode` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `huXing` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `saleStatus` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bldArea` double DEFAULT NULL,
  `tnArea` double DEFAULT NULL,
  `blRhDate` datetime DEFAULT NULL,
  `YFBZ` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roomMemo` mediumtext COLLATE utf8_unicode_ci,
  `zxBz` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `tnPrice` double DEFAULT NULL,
  `zxPrice` double DEFAULT NULL,
  `zxTotal` double DEFAULT NULL,
  `bedeckKind` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isTempletRoom` tinyint(4) DEFAULT NULL,
  `west` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chooseRoom` tinyint(4) DEFAULT NULL,
  `chooseRoomDate` datetime DEFAULT NULL,
  `roomStru` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `absolutelyFloor` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `statusChgGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `saleRentable` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productTypeCode` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `htRoom` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dxsArea` double DEFAULT NULL,
  `carArea` double DEFAULT NULL,
  `ltArea` double DEFAULT NULL,
  `fpDate` datetime DEFAULT NULL,
  `zdFpDate` datetime DEFAULT NULL,
  `cqfzNum` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ysBldArea` double DEFAULT NULL,
  `scBldArea` double DEFAULT NULL,
  `scTnArea` double DEFAULT NULL,
  `ysTnArea` double DEFAULT NULL,
  `hyArea` double DEFAULT NULL,
  `flatArea` double DEFAULT NULL,
  `ytArea` double DEFAULT NULL,
  `rhhyArea` double DEFAULT NULL,
  `ysxkzDate` datetime DEFAULT NULL,
  `ysxkzNo` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cqfzGetDate` datetime DEFAULT NULL,
  `yyjfDate` datetime DEFAULT NULL,
  `isCannotSale` tinyint(4) DEFAULT NULL,
  `cannotSaleReason` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chooseRoomNo` int(11) DEFAULT NULL,
  `variety` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productAttribute` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `parkingType` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parkingCurrentHandleMethod` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parkingSaleType` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parkingHandleDate` datetime DEFAULT NULL,
  `isParkingCq` tinyint(4) DEFAULT NULL,
  `businessCqLife` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remarkHTML` mediumtext COLLATE utf8_unicode_ci,
  `businessManageFee` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `buysRoomNo` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parkingPattern` varchar(4128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chooseRoomCstGUID` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productFormCode` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productFormName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roomStatus` int(5) NOT NULL DEFAULT '0',
  `roomType` int(5) NOT NULL DEFAULT '0',
  `createTime` datetime NOT NULL,
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sourceApp` int(11) DEFAULT NULL COMMENT '业态来源',
  `house_address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wy_tmpID` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `house_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`roomID`),
  KEY `ix_BldGUID` (`bldGUID`),
  KEY `index_roomguid` (`roomGUID`),
  KEY `index_projGUID` (`projGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `rpt_base_index` */

DROP TABLE IF EXISTS `rpt_base_index`;

CREATE TABLE `rpt_base_index` (
  `contract_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序列',
  `type_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '指标类型',
  `index_code` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '指标编号',
  `index_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '指标名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_book_cst_mid` */

DROP TABLE IF EXISTS `rpt_book_cst_mid`;

CREATE TABLE `rpt_book_cst_mid` (
  `projGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `bgnDate` date DEFAULT NULL,
  `companyGUID` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  KEY `idx_rpt_bookcstmid_all` (`projGUID`,`cstGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_calendar` */

DROP TABLE IF EXISTS `rpt_calendar`;

CREATE TABLE `rpt_calendar` (
  `cdate` date DEFAULT NULL COMMENT '日期表，只供报表需要整月日期的使用',
  KEY `idx_rpt_calen_date` (`cdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_city_distributed` */

DROP TABLE IF EXISTS `rpt_city_distributed`;

CREATE TABLE `rpt_city_distributed` (
  `cityId` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '城市公司id',
  `cityName` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '城市公司名称（如深圳公司，值应为深圳）',
  `areaId` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '区域id',
  `areaName` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '区域名称',
  `amount` int(11) NOT NULL COMMENT '客户数量',
  `sortIf` int(4) NOT NULL COMMENT '1、排行前十；2、排行后十',
  `sort` int(11) NOT NULL COMMENT '序号'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='城市客户分布排行';

/*Table structure for table `rpt_classification` */

DROP TABLE IF EXISTS `rpt_classification`;

CREATE TABLE `rpt_classification` (
  `title` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '再购客户、会员、业主、租客、企业客户',
  `finished` int(11) DEFAULT NULL COMMENT '统计值',
  `proportion` double(11,2) DEFAULT NULL COMMENT '未统计的值',
  `csttype` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `allTotal` int(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='分类客户占比表';

/*Table structure for table `rpt_contract` */

DROP TABLE IF EXISTS `rpt_contract`;

CREATE TABLE `rpt_contract` (
  `contract_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序列',
  `type_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '指标类型',
  `index_code` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '指标编号',
  `index_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '指标名称',
  `index_value` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '指标值',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `dimension` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '维度',
  `dime_value` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '维度值',
  `big_code` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `city_code` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`contract_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4446 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='成交客户特征表';

/*Table structure for table `rpt_cst_attach` */

DROP TABLE IF EXISTS `rpt_cst_attach`;

CREATE TABLE `rpt_cst_attach` (
  `cstGUID` bigint(20) NOT NULL COMMENT '客户ID',
  `projGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID,无项目表示是客户基本描摹，有项目则表示是客户在项目上的描摹；同一特征项可按项目存在多条',
  `attachCode` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '特征编号',
  `attachName` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特征名',
  `values` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '特征值',
  `remark` varchar(2000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `sourceChannel` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源渠道',
  `sourceApp` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源应用的APPID',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `userGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业务员',
  `reportTime` datetime DEFAULT NULL COMMENT '上报时间',
  `oriCstGUID` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源客户GUID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_cst_curr_opp_first_mid` */

DROP TABLE IF EXISTS `rpt_cst_curr_opp_first_mid`;

CREATE TABLE `rpt_cst_curr_opp_first_mid` (
  `projGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `firstVistTime` datetime DEFAULT NULL,
  `path` longtext COLLATE utf8_bin,
  `city_code` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  KEY `idx_cst_opp_firts_projcst` (`projGUID`,`cstGUID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_cst_customer_basic` */

DROP TABLE IF EXISTS `rpt_cst_customer_basic`;

CREATE TABLE `rpt_cst_customer_basic` (
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `cstName` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `gender` int(11) DEFAULT NULL COMMENT '性别',
  `mobileTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '联系电话',
  `cardID` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `ageGroup` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '年龄段',
  `childNum` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '子女个数',
  `familyStructure` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭结构',
  `degree` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '文化程度',
  `sourceChannel` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '来源渠道',
  `workArea` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '工作区域',
  `lifeArea` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '居住区域 ',
  `companyType` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '从事行业',
  `projectIntent` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '意向项目',
  `areaID` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '所属区域 ',
  `cityID` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '所属城市',
  `projGUID` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '所属项目',
  `formats` int(11) DEFAULT NULL COMMENT '所属业态',
  `userGUID` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '置业顾问',
  `firstVistTime` datetime DEFAULT NULL COMMENT '到访时间',
  `bookingDate` datetime DEFAULT NULL COMMENT '认筹时间',
  `orderDate` datetime DEFAULT NULL COMMENT '认购时间',
  `contractDate` datetime DEFAULT NULL COMMENT '签约时间',
  `rentDate` datetime DEFAULT NULL COMMENT '租赁时间',
  `status` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '客户状态',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `createMan` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  KEY `idx_rptcst_cstGUID` (`cstGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='客户基本信息表';

/*Table structure for table `rpt_cst_lable_count` */

DROP TABLE IF EXISTS `rpt_cst_lable_count`;

CREATE TABLE `rpt_cst_lable_count` (
  `lable_Code` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '标签编号',
  `lable_Name` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '标签名称',
  `lable_cst_num` bigint(20) NOT NULL COMMENT '标签客户人数',
  `lable_num` bigint(20) NOT NULL COMMENT '客户总人数',
  `lable_cst_rate` bigint(20) NOT NULL COMMENT '标签客户占比'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_cst_number` */

DROP TABLE IF EXISTS `rpt_cst_number`;

CREATE TABLE `rpt_cst_number` (
  `cstType` int(11) NOT NULL COMMENT '客户类型，1、住宅客户，2、置业客户，4、商业客户（如果以后增加客户类型，添加8、16.....）',
  `title` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '类型名称',
  `yesterdayAdded` int(11) NOT NULL COMMENT '昨日新增数量',
  `monthAdded` int(11) NOT NULL COMMENT '本月新增',
  `totalAmount` int(11) NOT NULL COMMENT '累计总量',
  `proportion` double(11,2) NOT NULL COMMENT '百分值',
  `createTime` datetime DEFAULT NULL,
  `city_code` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `dimension` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `path` longtext COLLATE utf8_bin
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='客户数表';

/*Table structure for table `rpt_cst_opp_first_mid` */

DROP TABLE IF EXISTS `rpt_cst_opp_first_mid`;

CREATE TABLE `rpt_cst_opp_first_mid` (
  `projGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `firstVistTime` datetime DEFAULT NULL,
  `isbuy` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `idx_cst_opp_firts_projcst` (`projGUID`,`cstGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_cst_opp_mid` */

DROP TABLE IF EXISTS `rpt_cst_opp_mid`;

CREATE TABLE `rpt_cst_opp_mid` (
  `projGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `createTime` datetime DEFAULT NULL,
  `firstVistTime` datetime DEFAULT NULL,
  KEY `idx_rpt_cst_opp_mid` (`projGUID`,`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_cst_opp_mid_all` */

DROP TABLE IF EXISTS `rpt_cst_opp_mid_all`;

CREATE TABLE `rpt_cst_opp_mid_all` (
  `projGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `createTime` datetime DEFAULT NULL,
  `firstVistTime` datetime DEFAULT NULL,
  `area_id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `citycode` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `cstType` int(11) DEFAULT NULL,
  `isMerge` int(11) DEFAULT NULL,
  `area_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `cityName` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ProjName` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `modifyTime` datetime DEFAULT NULL COMMENT '源数据不支持，暂用此字段代替',
  `city_name1` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  KEY `ind_opp_all_projguid` (`projGUID`),
  KEY `ind_opp_all_cstguid` (`cstGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_cst_opp_mid_tmp` */

DROP TABLE IF EXISTS `rpt_cst_opp_mid_tmp`;

CREATE TABLE `rpt_cst_opp_mid_tmp` (
  `projGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `createTime` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_cst_repeat_buy_detail` */

DROP TABLE IF EXISTS `rpt_cst_repeat_buy_detail`;

CREATE TABLE `rpt_cst_repeat_buy_detail` (
  `children_num` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '子女个数',
  `age_segment` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '年龄段',
  `proj_house_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目户型(户型)',
  `live_format` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '居住业态',
  `room_acreage` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '面积',
  `cst_num` int(11) DEFAULT NULL COMMENT '客户数量',
  `owner_num` int(11) DEFAULT NULL COMMENT '业主数量',
  `sale_acreage` decimal(20,2) DEFAULT NULL COMMENT '销售面积总数',
  `sale_amount` decimal(20,2) DEFAULT NULL COMMENT '销售总金额',
  `work_area` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `live_area` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deal_date` date DEFAULT NULL,
  `big_area` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prject_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roomGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bldGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstGUID` bigint(20) DEFAULT NULL,
  `birth_day` date DEFAULT NULL,
  `projGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目编号',
  `companyGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司编号',
  `live_format_orig` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `proj_house_type_orig` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `work_area_orig` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `live_area_orig` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `children_num_orig` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cardID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '身份证号码',
  `subType` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '10.001=房产',
  `cstType` tinyint(4) DEFAULT NULL COMMENT '客户类型1=个人 2=公司',
  `cardType` int(11) DEFAULT NULL COMMENT '1=身份证2=军官证3=护照4=港澳通行证5=台湾通行证6=台湾身份证7=港澳身份证8=营业热照9=组织机构代码10=税务登记证号99=其它',
  `room_acre_segment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstNum` int(11) DEFAULT NULL,
  `propertyRate` double(11,3) DEFAULT NULL,
  `tradeGUID` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstOriginPlace` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstIndustry` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstCurYl` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jFDate` datetime DEFAULT NULL,
  `ID` bigint(30) NOT NULL AUTO_INCREMENT,
  `ylcode` int(11) DEFAULT NULL COMMENT '年龄序号',
  `mjcode` int(11) DEFAULT NULL COMMENT '面积序号',
  `big_code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `house_id` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '户型ID',
  `product_id` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品ID',
  `product_type_id` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品类别ID',
  `curr_amount_id` double(12,3) DEFAULT NULL,
  `curr_house_amount` double(12,3) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `dx_deal_date` (`deal_date`) USING BTREE,
  KEY `dx_rptown_jfdate` (`jFDate`),
  KEY `idx_rcdmo_cstGUID` (`cstGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=794611 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='客户房产明细归类表';

/*Table structure for table `rpt_customer_attach_count` */

DROP TABLE IF EXISTS `rpt_customer_attach_count`;

CREATE TABLE `rpt_customer_attach_count` (
  `customer_attach_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `proj_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目编号',
  `index_format_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业态类型\r\n            1=销售\r\n            2=服务\r\n            3=物业\r\n            4=置业',
  `customer_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户类型\r\n            1=已购客户\r\n            2=意向客户',
  `customer_age_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户年龄段\r\n            1=20岁以下\r\n            2=20-34岁\r\n            3=35-44岁\r\n            4=44-55岁\r\n            5=56-64岁\r\n            6=65岁以上',
  `customer_age_sum` int(11) DEFAULT NULL COMMENT '客户年龄段人数',
  `create_time` datetime NOT NULL COMMENT '统计时间',
  PRIMARY KEY (`customer_attach_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7299 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='客户特征统计表';

/*Table structure for table `rpt_customer_bought_count` */

DROP TABLE IF EXISTS `rpt_customer_bought_count`;

CREATE TABLE `rpt_customer_bought_count` (
  `customer_bought_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `proj_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目编号',
  `index_format_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业态类型\r\n            1=销售\r\n            2=服务\r\n            3=物业\r\n            4=置业',
  `customer_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户类型\r\n            1=已购客户\r\n            2=意向客户',
  `customer_invest_sum` int(11) DEFAULT NULL COMMENT '总投资客户数',
  `customer_self_sum` int(11) DEFAULT NULL COMMENT '总自住客户数',
  `customer_forward_sum` int(11) DEFAULT NULL COMMENT '总期房客户数',
  `customer_change_sum` int(11) DEFAULT NULL COMMENT '总更改业主客户数',
  `customer_follow_sum` int(11) DEFAULT NULL COMMENT '总跟进客户数',
  `customer_expect_sum` int(11) DEFAULT NULL COMMENT '总已预期客户数',
  `customer_away_sum` int(11) DEFAULT NULL COMMENT '总已流失客户数',
  `create_time` datetime NOT NULL COMMENT '统计时间',
  PRIMARY KEY (`customer_bought_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3991 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='客户分类信息统计表';

/*Table structure for table `rpt_customer_count_main` */

DROP TABLE IF EXISTS `rpt_customer_count_main`;

CREATE TABLE `rpt_customer_count_main` (
  `customer_count_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `proj_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目编号',
  `index_format_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业态类型\r\n            1=销售\r\n            2=服务\r\n            3=物业\r\n            4=置业',
  `customer_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户类型\r\n            1=已购客户\r\n            2=意向客户',
  `customer_bought_sum` int(11) DEFAULT NULL COMMENT '已购客户数',
  `customer_intention_sum` int(11) DEFAULT NULL COMMENT '意向客户数',
  `create_time` datetime NOT NULL COMMENT '统计时间',
  PRIMARY KEY (`customer_count_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4957 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='客户分类统计主表';

/*Table structure for table `rpt_data_extract_log` */

DROP TABLE IF EXISTS `rpt_data_extract_log`;

CREATE TABLE `rpt_data_extract_log` (
  `extract_user` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `extract_date` date DEFAULT NULL,
  `extract_num` bigint(20) DEFAULT NULL,
  `extract_type` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `proj_guid` varchar(64) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_data_priviles` */

DROP TABLE IF EXISTS `rpt_data_priviles`;

CREATE TABLE `rpt_data_priviles` (
  `subType` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `filedsName` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `isVaild` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '0无效，1有效'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_feature_template` */

DROP TABLE IF EXISTS `rpt_feature_template`;

CREATE TABLE `rpt_feature_template` (
  `fea_template_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序列',
  `fea_template_guid` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '树根节点',
  `rootTitle` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '标签大类名称(特征类别)',
  `rootValue` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '特征类型值',
  `supTitle` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '标签小类名称',
  `lableKey` tinyint(4) DEFAULT NULL COMMENT '示表是全网还是本地的',
  `fea_template_Value` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '签标名称中文',
  `showSupTitle` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '是否显示标签(true,false)',
  `hasSubs` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '是否显示标签分类(ture,false)',
  `model` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '标签分类(标签编号)',
  `title` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '标签分类名称',
  `optionsName` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '标签key',
  `optionsValue` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '标签value',
  `subsName` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '标签区域key',
  `subsValue` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '标签区域value',
  `parentGUID` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '父节点',
  `isroot` int(11) DEFAULT NULL,
  `isleaf` int(11) DEFAULT NULL,
  `tableName` varchar(40) COLLATE utf8_bin DEFAULT '' COMMENT '数据来源表明',
  `featureExpress` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT 'Where sql表达式',
  `comment` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `sourceChannel` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `sourceApp` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`fea_template_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1092 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='签标模板表';

/*Table structure for table `rpt_format_convert` */

DROP TABLE IF EXISTS `rpt_format_convert`;

CREATE TABLE `rpt_format_convert` (
  `format_convert_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `proj_guid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目编码',
  `index_format_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业态类型\r\n            1=销售\r\n            2=服务\r\n            3=物业\r\n            4=置业',
  `incoming_visit_sum` double DEFAULT NULL COMMENT '来电转到访数',
  `visit_confess_sum` double DEFAULT NULL COMMENT '到访转认筹数',
  `visti_subscribe_sum` double DEFAULT NULL COMMENT '到访转认购数',
  `confess_subscribe_sum` double DEFAULT NULL COMMENT '认筹转认购数',
  `subscribe_contract_sum` double DEFAULT NULL COMMENT '认购转签约数',
  `contract_returned_sum` double DEFAULT NULL COMMENT '签约转回款数',
  `create_time` datetime NOT NULL COMMENT '统计时间',
  `incoming_tele_sum` double DEFAULT NULL COMMENT '来电客户数',
  `visit_cst_num` double DEFAULT NULL COMMENT '到访客户数',
  `confess_cst_num` double DEFAULT NULL COMMENT '认筹客户数',
  `subscribe_cst_num` double DEFAULT NULL COMMENT '认购客户数',
  `contract_cst_num` double DEFAULT NULL COMMENT '签约客户数 ',
  PRIMARY KEY (`format_convert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3486 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='转化率分析表\r\n';

/*Table structure for table `rpt_format_sale_analyse` */

DROP TABLE IF EXISTS `rpt_format_sale_analyse`;

CREATE TABLE `rpt_format_sale_analyse` (
  `city_name` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `receivedate` datetime DEFAULT NULL,
  `ReceiveGUID` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `RwwcSj` datetime DEFAULT NULL,
  `RwclSx` datetime DEFAULT NULL,
  `comp_prom_num` int(11) DEFAULT NULL,
  `timeo_finished_num` int(11) DEFAULT NULL,
  `wait_deal_promble` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `big_code` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `big_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `city_code` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `path` longtext COLLATE utf8_bin
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_index_base` */

DROP TABLE IF EXISTS `rpt_index_base`;

CREATE TABLE `rpt_index_base` (
  `index_base_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `proj_guid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `index_format_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业态类型\r\n            1=销售\r\n            2=服务\r\n            3=物业\r\n            4=置业\r\n            ',
  `follow_customer_sum` int(11) DEFAULT NULL COMMENT '跟进客户数',
  `new_visitors_sum` int(11) DEFAULT NULL COMMENT '新客到访数',
  `old_visitors_sum` int(11) DEFAULT NULL COMMENT '老客到访数',
  `confess_customer_sum` int(11) DEFAULT NULL COMMENT '认筹客户数',
  `confess_cycle_sum` int(11) DEFAULT NULL COMMENT '认筹套数',
  `confess_amount_sum` double DEFAULT NULL COMMENT '认筹金额',
  `subscribe_customer_sum` int(11) DEFAULT NULL COMMENT '认购客户数',
  `subscribe_cycle_sum` int(11) DEFAULT NULL COMMENT '认购套数',
  `subscribe_amount_sum` double DEFAULT NULL COMMENT '认购金额',
  `contract_customer_sum` int(11) DEFAULT NULL COMMENT '签约客户数',
  `contract_cycle_sum` int(11) DEFAULT NULL COMMENT '签约套数',
  `contract_amount_sum` double DEFAULT NULL COMMENT '签约金额',
  `returned_customer_sum` int(11) DEFAULT NULL COMMENT '回款客户数',
  `returned_cycle_sum` int(11) DEFAULT NULL COMMENT '回款套数',
  `returned_amount_sum` double DEFAULT NULL COMMENT '回款金额',
  `create_time` datetime NOT NULL COMMENT '统计时间',
  `big_code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`index_base_id`),
  KEY `idx_index_time_project` (`proj_guid`,`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=137320 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='关键指标表';

/*Table structure for table `rpt_index_base_bak` */

DROP TABLE IF EXISTS `rpt_index_base_bak`;

CREATE TABLE `rpt_index_base_bak` (
  `index_base_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '序列号',
  `proj_guid` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `index_format_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业态类型\r\n            1=销售\r\n            2=服务\r\n            3=物业\r\n            4=置业\r\n            ',
  `follow_customer_sum` int(11) DEFAULT NULL COMMENT '跟进客户数',
  `new_visitors_sum` int(11) DEFAULT NULL COMMENT '新客到访数',
  `old_visitors_sum` int(11) DEFAULT NULL COMMENT '老客到访数',
  `confess_customer_sum` int(11) DEFAULT NULL COMMENT '认筹客户数',
  `confess_cycle_sum` int(11) DEFAULT NULL COMMENT '认筹套数',
  `confess_amount_sum` double DEFAULT NULL COMMENT '认筹金额',
  `subscribe_customer_sum` int(11) DEFAULT NULL COMMENT '认购客户数',
  `subscribe_cycle_sum` int(11) DEFAULT NULL COMMENT '认购套数',
  `subscribe_amount_sum` double DEFAULT NULL COMMENT '认购金额',
  `contract_customer_sum` int(11) DEFAULT NULL COMMENT '签约客户数',
  `contract_cycle_sum` int(11) DEFAULT NULL COMMENT '签约套数',
  `contract_amount_sum` double DEFAULT NULL COMMENT '签约金额',
  `returned_customer_sum` int(11) DEFAULT NULL COMMENT '回款客户数',
  `returned_cycle_sum` int(11) DEFAULT NULL COMMENT '回款套数',
  `returned_amount_sum` double DEFAULT NULL COMMENT '回款金额',
  `create_time` datetime NOT NULL COMMENT '统计时间',
  `big_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_index_flow` */

DROP TABLE IF EXISTS `rpt_index_flow`;

CREATE TABLE `rpt_index_flow` (
  `index_flow_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `proj_guid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目编号',
  `index_format_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业态类型\r\n            1=销售\r\n            2=服务\r\n            3=物业\r\n            4=置业',
  `visit_days` int(11) DEFAULT NULL COMMENT '到访天数',
  `average_baseline_days` int(11) DEFAULT NULL COMMENT '平均基线天数',
  `overstep_days` int(11) DEFAULT NULL COMMENT '超出天数',
  `confess_days` int(11) DEFAULT NULL COMMENT '认购天数',
  `average_order_baseline_days` int(11) DEFAULT NULL COMMENT '认购基线天数',
  `createtime` datetime NOT NULL COMMENT '统计汇总时间',
  `confess_overstep_days` int(11) DEFAULT NULL COMMENT '认购超出天数)',
  `projSaleStatus` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目状态',
  `big_code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_code` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`index_flow_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2129 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='关键流程分析表';

/*Table structure for table `rpt_kf_format_index` */

DROP TABLE IF EXISTS `rpt_kf_format_index`;

CREATE TABLE `rpt_kf_format_index` (
  `data_seq_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `proj_guid` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `devel_member_num` int(11) DEFAULT NULL,
  `cst_num` int(11) DEFAULT NULL,
  `repair_satisfy_num` int(11) DEFAULT NULL,
  `repair_num` int(11) DEFAULT NULL,
  `complain_satisfy_num` int(11) DEFAULT NULL,
  `complain_num` int(11) DEFAULT NULL,
  `createtime` date DEFAULT NULL,
  PRIMARY KEY (`data_seq_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1863 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_kf_index_flow` */

DROP TABLE IF EXISTS `rpt_kf_index_flow`;

CREATE TABLE `rpt_kf_index_flow` (
  `index_flow_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `proj_guid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目编号',
  `index_format_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业态类型\r\n            1=销售\r\n            2=服务\r\n            3=物业\r\n            4=置业',
  `repair_days` int(11) DEFAULT NULL COMMENT '到访天数',
  `repair_average_days` int(11) DEFAULT NULL COMMENT '平均基线天数',
  `repair_overstep_days` int(11) DEFAULT NULL COMMENT '超出天数',
  `complaint_days` int(11) DEFAULT NULL COMMENT '认购天数',
  `complaint_average_days` int(11) DEFAULT NULL COMMENT '认购基线天数',
  `complaint_overstep_days` int(11) DEFAULT NULL COMMENT '统计汇总时间',
  `createtime` datetime DEFAULT NULL COMMENT '认购超出天数)',
  `projSaleStatus` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目状态',
  `payment_days` int(11) DEFAULT NULL,
  `payment_average_days` int(11) DEFAULT NULL,
  `payment_overstep_days` int(11) DEFAULT NULL,
  PRIMARY KEY (`index_flow_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1331 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='关键流程分析表';

/*Table structure for table `rpt_kf_key_index` */

DROP TABLE IF EXISTS `rpt_kf_key_index`;

CREATE TABLE `rpt_kf_key_index` (
  `Data_seq_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `proj_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `curr_member_num` int(11) DEFAULT NULL,
  `add_member_num` int(11) DEFAULT NULL,
  `exit_member_num` int(11) DEFAULT NULL,
  `reception_record_num` int(11) DEFAULT NULL,
  `pay_reception_num` int(11) DEFAULT NULL,
  `visit_reception_num` int(10) DEFAULT NULL,
  `tele_reception_num` int(11) DEFAULT NULL,
  `repair_apply_num` int(11) DEFAULT NULL,
  `guar_handle_num` int(10) DEFAULT NULL,
  `guar_finished_num` int(11) DEFAULT NULL,
  `repair_hs` int(11) DEFAULT NULL,
  `complaint_num` int(10) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `visit_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`Data_seq_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7183 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_l_cst_label_storage` */

DROP TABLE IF EXISTS `rpt_l_cst_label_storage`;

CREATE TABLE `rpt_l_cst_label_storage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `cstGUID` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `cstName` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `labelGUID` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `labelName` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `cst_mobile` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `cst_email` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `cst_address` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=542383 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_l_cst_label_storage_tmp` */

DROP TABLE IF EXISTS `rpt_l_cst_label_storage_tmp`;

CREATE TABLE `rpt_l_cst_label_storage_tmp` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `cstGUID` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `cstName` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `labelGUID` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `labelName` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `cst_mobile` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `cst_email` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `cst_address` varchar(100) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_l_cst_stand_label_storage` */

DROP TABLE IF EXISTS `rpt_l_cst_stand_label_storage`;

CREATE TABLE `rpt_l_cst_stand_label_storage` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `cstGUID` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `cstName` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `labeltype` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `labelGUID` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `labelName` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `cst_mobile` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `cst_email` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `cst_address` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  KEY `idx_rptl_s_lable_s` (`cstGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_l_feature_storage` */

DROP TABLE IF EXISTS `rpt_l_feature_storage`;

CREATE TABLE `rpt_l_feature_storage` (
  `storage_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '列序',
  `featureType` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '示标是全网还是本地',
  `labelguid` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '标签id',
  `labelType` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '否是时效',
  `labelName` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '签标名称',
  `labelInfo` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '签标描述',
  `featureTitle` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '选已条件key',
  `optionName` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '选已条件Value',
  `optionvalue` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `createTime` datetime DEFAULT NULL COMMENT '建创时间',
  `updateTime` datetime DEFAULT NULL COMMENT '新更时间',
  `model` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tableName` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '数据查询来源表，克隆于labelLocal_details的tableName字段',
  `featureExpress` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '特征表达式，克隆于labelLocal_details的labelExpress',
  `templateguid` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'labellocal_details 表中的labelLocal_details_id 字段',
  `sys_user_id` int(11) DEFAULT NULL COMMENT '创建者GUID， 关联SYSUSER',
  `sourceChannel` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `sourceApp` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`storage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=805 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='标签存储表';

/*Table structure for table `rpt_l_feature_template` */

DROP TABLE IF EXISTS `rpt_l_feature_template`;

CREATE TABLE `rpt_l_feature_template` (
  `fea_template_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序列',
  `fea_template_guid` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '树根节点',
  `rootTitle` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '标签大类名称(特征类别)',
  `rootValue` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '特征类型值',
  `supTitle` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '标签小类名称',
  `lableKey` tinyint(4) DEFAULT NULL COMMENT '示表是全网还是本地的',
  `fea_template_Value` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '签标名称中文',
  `showSupTitle` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '是否显示标签(true,false)',
  `hasSubs` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '是否显示标签分类(ture,false)',
  `model` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '标签分类(标签编号)',
  `title` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '标签分类名称',
  `optionsName` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '标签key',
  `optionsValue` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '标签value',
  `subsName` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '标签区域key',
  `subsValue` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '标签区域value',
  `parentGUID` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '父节点',
  `isroot` int(11) DEFAULT NULL,
  `isleaf` int(11) DEFAULT NULL,
  `t_tableName` varchar(40) COLLATE utf8_bin DEFAULT '' COMMENT '数据来源表明',
  `t_featureExpress` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'Where sql表达式',
  `t_sourceChannel` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `t_sourceApp` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `isdel` int(2) DEFAULT NULL,
  `isdisabled` int(2) DEFAULT NULL,
  `tableType` int(2) DEFAULT NULL COMMENT '1表示行表，2表示竖表（键值表）',
  PRIMARY KEY (`fea_template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1117 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='签标模板表';

/*Table structure for table `rpt_l_label_storge` */

DROP TABLE IF EXISTS `rpt_l_label_storge`;

CREATE TABLE `rpt_l_label_storge` (
  `label_id` int(11) NOT NULL AUTO_INCREMENT,
  `label_guid` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `label_name` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `label_info` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `querySql` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `execTime` datetime DEFAULT NULL,
  `creatorguid` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `label_type` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '是否时效',
  `isNet` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '是否全网',
  `label_cst_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`label_id`)
) ENGINE=InnoDB AUTO_INCREMENT=438 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Table structure for table `rpt_month_sale_trend` */

DROP TABLE IF EXISTS `rpt_month_sale_trend`;

CREATE TABLE `rpt_month_sale_trend` (
  `big_code` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '大区ID',
  `big_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '大区名称',
  `city_code` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '分公司ID',
  `city_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '分公司名称',
  `new_vist_num` bigint(20) DEFAULT NULL COMMENT '新增到访人数',
  `deal_amount` double(20,3) DEFAULT NULL COMMENT '签约金额',
  `deal_set` bigint(20) DEFAULT NULL COMMENT '签约套数',
  `order_set` bigint(20) DEFAULT NULL COMMENT '认购套数',
  `order_amount` double(20,3) DEFAULT NULL COMMENT '认购金额',
  `count_month` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '统计月份',
  `createtime` datetime DEFAULT NULL COMMENT '统计时间',
  `data_date` date DEFAULT NULL,
  `path` longtext COLLATE utf8_bin
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_month_sale_trend_bak20160123` */

DROP TABLE IF EXISTS `rpt_month_sale_trend_bak20160123`;

CREATE TABLE `rpt_month_sale_trend_bak20160123` (
  `big_code` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '大区ID',
  `big_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '大区名称',
  `city_code` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '分公司ID',
  `city_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '分公司名称',
  `new_vist_num` bigint(20) DEFAULT NULL COMMENT '新增到访人数',
  `deal_amount` double(20,3) DEFAULT NULL COMMENT '签约金额',
  `deal_set` bigint(20) DEFAULT NULL COMMENT '签约套数',
  `order_set` bigint(20) DEFAULT NULL COMMENT '认购套数',
  `order_amount` double(20,3) DEFAULT NULL COMMENT '认购金额',
  `count_month` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '统计月份',
  `createtime` datetime DEFAULT NULL COMMENT '统计时间',
  `data_date` date DEFAULT NULL,
  `path` longtext COLLATE utf8_bin
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_mutiple_formats` */

DROP TABLE IF EXISTS `rpt_mutiple_formats`;

CREATE TABLE `rpt_mutiple_formats` (
  `cstType` int(11) NOT NULL COMMENT '客户类型，1、住宅客户，2、置业客户，4、商业客户，存的值是3、5、6、7（如果以后增加客户类型，添加8、16.....）',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '名称',
  `number` int(11) NOT NULL COMMENT '总量',
  `allTotal` int(11) NOT NULL COMMENT '全部累计总量',
  `proportion` double(11,2) NOT NULL COMMENT '百分值',
  `createTime` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='多业态客户表';

/*Table structure for table `rpt_order_cst_fisrt_mid` */

DROP TABLE IF EXISTS `rpt_order_cst_fisrt_mid`;

CREATE TABLE `rpt_order_cst_fisrt_mid` (
  `projGUID` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `qsDate` date DEFAULT NULL,
  `companyGUID` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  KEY `idx_rptocfm_projcst` (`projGUID`,`cstGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_order_cst_mid` */

DROP TABLE IF EXISTS `rpt_order_cst_mid`;

CREATE TABLE `rpt_order_cst_mid` (
  `projGUID` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `qsDate` date DEFAULT NULL,
  `roomGUID` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `proj_house_type` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `roomTotal` float DEFAULT NULL,
  `companyGUID` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  KEY `idx_rptodercst_all` (`projGUID`,`cstGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_order_day_mid_tmp` */

DROP TABLE IF EXISTS `rpt_order_day_mid_tmp`;

CREATE TABLE `rpt_order_day_mid_tmp` (
  `ProjGUID` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `qsDate` date DEFAULT NULL,
  `subscribe_customer_sum` bigint(21) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_owner_buynum_analyse` */

DROP TABLE IF EXISTS `rpt_owner_buynum_analyse`;

CREATE TABLE `rpt_owner_buynum_analyse` (
  `Owner_type` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `Owner_num` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `buy_num` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `city_code` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `dimension` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `path` longtext COLLATE utf8_bin
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_owner_feature_analyse` */

DROP TABLE IF EXISTS `rpt_owner_feature_analyse`;

CREATE TABLE `rpt_owner_feature_analyse` (
  `Owner_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Owner_num` int(11) DEFAULT NULL,
  `sex` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstCurYl` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `live_area` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `Area_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cityCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `big_area` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Product_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_code` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `dimension` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `path` longtext COLLATE utf8_bin,
  `big_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `big_code` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  KEY `idx_rpt_ofa_citycode` (`city_code`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_proj_area_city_name` */

DROP TABLE IF EXISTS `rpt_proj_area_city_name`;

CREATE TABLE `rpt_proj_area_city_name` (
  `projGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '源项目GUID',
  `ProjName` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目名称',
  `companyGUID` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司GUID',
  `city_code` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `city_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `big_code` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `big_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `city_code1` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '国标编号名称',
  `city_name1` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '国标编号名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_proj_business` */

DROP TABLE IF EXISTS `rpt_proj_business`;

CREATE TABLE `rpt_proj_business` (
  `proj_business_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����',
  `proj_abuilding` int(11) DEFAULT NULL COMMENT '�ڽ���Ŀ',
  `proj_abuilding_set` int(11) DEFAULT NULL COMMENT '�ڽ�����',
  `proj_presell` int(11) DEFAULT NULL COMMENT 'Ԥ����Ŀ',
  `proj_presell_set` int(11) DEFAULT NULL COMMENT 'Ԥ������',
  `proj_onsell` int(11) DEFAULT NULL COMMENT '��/����Ŀ',
  `proj_onsell_set` int(11) DEFAULT NULL COMMENT '��/������',
  `proj_presell_counts` int(11) DEFAULT NULL COMMENT 'Ԥ',
  `proj_onsell_counts` int(11) DEFAULT NULL,
  `proj_deal01` int(11) DEFAULT NULL COMMENT '���ճɽ�',
  `proj_deal02` int(11) DEFAULT NULL COMMENT '���³ɽ�',
  `proj_deal03` int(11) DEFAULT NULL COMMENT '�����ɽ�',
  `proj_deal04` int(11) DEFAULT NULL COMMENT '����ɽ�',
  `proj_set01` int(11) DEFAULT NULL COMMENT '��������',
  `proj_set02` int(11) DEFAULT NULL COMMENT '�������',
  `proj_rate` double DEFAULT NULL COMMENT '��ȥ����',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `proj_number` int(5) DEFAULT '0' COMMENT '项目个数',
  `big_code` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `city_code` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`proj_business_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商业项目汇总表';

/*Table structure for table `rpt_proj_complete` */

DROP TABLE IF EXISTS `rpt_proj_complete`;

CREATE TABLE `rpt_proj_complete` (
  `proj_complete_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����',
  `yesterday_deal` double(20,3) DEFAULT NULL,
  `month_deal` double(20,3) DEFAULT NULL,
  `quarter_deal` double(20,3) DEFAULT NULL,
  `year_deal` double(20,3) DEFAULT NULL,
  `onsell_deal` double(20,3) DEFAULT NULL,
  `complete_deal` double(20,3) DEFAULT NULL COMMENT 'ȫ',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `big_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `big_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `city_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `path` longtext COLLATE utf8_bin,
  PRIMARY KEY (`proj_complete_id`)
) ENGINE=MyISAM AUTO_INCREMENT=584 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='项目多业态汇总表';

/*Table structure for table `rpt_proj_cst_area` */

DROP TABLE IF EXISTS `rpt_proj_cst_area`;

CREATE TABLE `rpt_proj_cst_area` (
  `cst_area_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `proj_id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `area_id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `cst_num` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`cst_area_id`)
) ENGINE=MyISAM AUTO_INCREMENT=42105 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='籍贯区域表';

/*Table structure for table `rpt_proj_cst_industry` */

DROP TABLE IF EXISTS `rpt_proj_cst_industry`;

CREATE TABLE `rpt_proj_cst_industry` (
  `cst_industry_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `proj_id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `industry_id` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `cst_num` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`cst_industry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=275 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='从事行业表';

/*Table structure for table `rpt_proj_house` */

DROP TABLE IF EXISTS `rpt_proj_house`;

CREATE TABLE `rpt_proj_house` (
  `proj_house_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����',
  `proj_abuilding` int(11) DEFAULT '0',
  `proj_abuilding_set` int(11) DEFAULT '0',
  `proj_presell` int(11) DEFAULT '0' COMMENT 'Ԥ',
  `proj_presell_set` int(11) DEFAULT '0' COMMENT 'Ԥ',
  `proj_onsell` int(11) DEFAULT '0',
  `proj_onsell_set` int(11) DEFAULT '0',
  `proj_sold` int(11) DEFAULT '0',
  `proj_sold_set` int(11) DEFAULT '0',
  `proj_deal01` double(20,2) DEFAULT '0.00',
  `proj_deal02` double(20,2) DEFAULT '0.00',
  `proj_deal03` double(20,2) DEFAULT '0.00',
  `proj_deal04` double(20,2) DEFAULT '0.00',
  `proj_set01` int(11) DEFAULT '0',
  `proj_set02` int(11) DEFAULT '0',
  `proj_rate` double DEFAULT NULL COMMENT '��ȥ����',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `proj_deal01_set` int(11) DEFAULT '0',
  `proj_deal02_set` int(11) DEFAULT '0',
  `proj_deal03_set` int(11) DEFAULT '0',
  `proj_deal04_set` int(11) DEFAULT '0',
  `big_code` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `big_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `city_code` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `city_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `path` longtext COLLATE utf8_bin,
  PRIMARY KEY (`proj_house_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1208 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='住宅项目汇总表';

/*Table structure for table `rpt_proj_properties` */

DROP TABLE IF EXISTS `rpt_proj_properties`;

CREATE TABLE `rpt_proj_properties` (
  `proj_properties_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����',
  `proj_abuilding` int(11) DEFAULT NULL COMMENT '�ڽ���Ŀ',
  `proj_abuilding_set` int(11) DEFAULT NULL COMMENT '�ڽ�����',
  `proj_presell` int(11) DEFAULT NULL COMMENT '�ڽ�Ԥ����Ŀ',
  `proj_presell_set` int(11) DEFAULT NULL COMMENT '�ڽ�Ԥ������',
  `proj_onsell` int(11) DEFAULT NULL COMMENT '������Ŀ',
  `proj_onsell_set` int(11) DEFAULT NULL COMMENT '��������',
  `proj_sold` int(11) DEFAULT NULL COMMENT '����������Ŀ',
  `proj_sold_set` int(11) DEFAULT NULL COMMENT '������������',
  `proj_deal01` double(11,0) DEFAULT NULL,
  `proj_deal02` double(11,0) DEFAULT NULL,
  `proj_deal03` double(11,0) DEFAULT NULL,
  `proj_deal04` double(11,0) DEFAULT NULL,
  `proj_deal05` double(11,0) DEFAULT NULL,
  `proj_deal06` double(11,0) DEFAULT NULL,
  `proj_deal07` double(11,0) DEFAULT NULL,
  `proj_deal08` double(11,0) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `big_code` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `city_code` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`proj_properties_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='置业项目汇总表';

/*Table structure for table `rpt_proj_vist_rank` */

DROP TABLE IF EXISTS `rpt_proj_vist_rank`;

CREATE TABLE `rpt_proj_vist_rank` (
  `big_code` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '大区ID',
  `big_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '大区ID',
  `city_code` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '分公司ID',
  `city_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '分公司名称',
  `proj_guid` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '项目ID',
  `proj_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '项目名称',
  `vist_num` bigint(20) DEFAULT NULL COMMENT '到访人数',
  `deal_amount` double(20,3) DEFAULT NULL COMMENT '成交金额',
  `deal_set` bigint(20) DEFAULT NULL COMMENT '成交套数',
  `count_month` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '统计月份',
  `createtime` datetime DEFAULT NULL COMMENT '统计时间',
  `add_vist_num` bigint(20) DEFAULT NULL,
  `path` longtext COLLATE utf8_bin,
  `curr_status` varchar(10) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_residential_sale` */

DROP TABLE IF EXISTS `rpt_residential_sale`;

CREATE TABLE `rpt_residential_sale` (
  `residential_sale_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����',
  `visit_number` int(11) DEFAULT '0',
  `recognition_number` int(11) DEFAULT '0',
  `recognition_counts` int(11) DEFAULT '0',
  `subscribe_number` int(11) DEFAULT '0',
  `subscribe_counts` int(11) DEFAULT '0',
  `contract_numner` int(11) DEFAULT '0' COMMENT 'ǩԼ',
  `contract_counts` int(11) DEFAULT '0' COMMENT 'ǩԼ',
  `visit_cst_num` int(11) DEFAULT '0',
  `confess_cst_num` int(11) DEFAULT '0',
  `subscribe_cst_num` int(11) DEFAULT '0',
  `contract_cst_num` int(11) DEFAULT '0' COMMENT 'ǩԼ',
  `visit_days` int(11) DEFAULT '0',
  `recognition_days` int(11) DEFAULT '0',
  `subscribe_days` int(11) DEFAULT '0',
  `contract_days` int(11) DEFAULT '0',
  `visit_contract_days` int(11) DEFAULT '0',
  `create_time` datetime DEFAULT NULL COMMENT '��������',
  `recognition_subs_num` int(11) DEFAULT '0',
  `visit_subscribe_num` int(11) DEFAULT '0',
  `subs_contract_num` int(11) DEFAULT '0',
  `visit_contract_num` int(11) DEFAULT '0',
  `visit_reco_num` int(11) DEFAULT '0',
  `big_code` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `city_code` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `dimension` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`residential_sale_id`)
) ENGINE=MyISAM AUTO_INCREMENT=312 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='住宅销售分析表';

/*Table structure for table `rpt_sale_service_tmp` */

DROP TABLE IF EXISTS `rpt_sale_service_tmp`;

CREATE TABLE `rpt_sale_service_tmp` (
  `projGUID` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `prject_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `bldGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `bldName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼栋名称',
  `bgndate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_xs_format_index` */

DROP TABLE IF EXISTS `rpt_xs_format_index`;

CREATE TABLE `rpt_xs_format_index` (
  `Data_seq_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `proj_id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `Deal_money` float DEFAULT NULL,
  `esti_Deal_money` float DEFAULT NULL,
  `Deal_house_num` int(11) DEFAULT NULL,
  `house_all_num` int(11) DEFAULT NULL,
  `Deal_acreage` double(20,2) DEFAULT NULL,
  `House_all_acreage` float DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `rg_num` int(11) DEFAULT NULL,
  `qs_num` int(11) DEFAULT NULL,
  `zs_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`Data_seq_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1043 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_ybp_kf_month_analyse` */

DROP TABLE IF EXISTS `rpt_ybp_kf_month_analyse`;

CREATE TABLE `rpt_ybp_kf_month_analyse` (
  `repair_num` int(11) DEFAULT NULL,
  `complain_num` int(11) DEFAULT NULL,
  `data_date` date DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  `count_month` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `big_code` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `big_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `city_code` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `city_name` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `path` longtext COLLATE utf8_bin,
  KEY `idx_ybp_kf_count_month` (`count_month`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_ybp_kf_month_ruhuo` */

DROP TABLE IF EXISTS `rpt_ybp_kf_month_ruhuo`;

CREATE TABLE `rpt_ybp_kf_month_ruhuo` (
  `curr_seq` int(11) DEFAULT NULL,
  `projguid` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `projname` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ruhuo_date` date DEFAULT NULL,
  `ruhuo_month` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkin_range` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `household_num` int(11) DEFAULT NULL,
  `big_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `big_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` longtext COLLATE utf8_bin
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_ybp_kf_wy_analyse` */

DROP TABLE IF EXISTS `rpt_ybp_kf_wy_analyse`;

CREATE TABLE `rpt_ybp_kf_wy_analyse` (
  `own_yest_add` bigint(20) DEFAULT NULL,
  `own_month_add` bigint(20) DEFAULT NULL,
  `own_total` bigint(20) DEFAULT NULL,
  `complain_yest_add` bigint(20) DEFAULT NULL,
  `complain_no_solve` bigint(20) DEFAULT NULL,
  `complain_comp_cycle` bigint(20) DEFAULT NULL,
  `repair_yest_add` bigint(20) DEFAULT NULL,
  `repair_no_solve` bigint(20) DEFAULT NULL,
  `repair_comp_cycle` bigint(20) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  `city_code` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `path` longtext COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_ybp_proj_sale_info` */

DROP TABLE IF EXISTS `rpt_ybp_proj_sale_info`;

CREATE TABLE `rpt_ybp_proj_sale_info` (
  `proj_GUID` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `proj_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `deal_amount` double(20,3) DEFAULT NULL,
  `deal_set` bigint(20) DEFAULT NULL,
  `count_month` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `trade_type` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `createtime` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_ybp_translate_analyse` */

DROP TABLE IF EXISTS `rpt_ybp_translate_analyse`;

CREATE TABLE `rpt_ybp_translate_analyse` (
  `rent_rate` int(11) DEFAULT NULL,
  `rent_week` int(11) DEFAULT NULL,
  `sale_deal_rate` int(11) DEFAULT NULL,
  `sale_deal_week` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `sale_cst_num` int(11) DEFAULT NULL,
  `rent_cst_num` int(11) DEFAULT NULL,
  `sold_cst_num` int(11) DEFAULT NULL,
  `rend_cst_num` int(11) DEFAULT NULL,
  `dime_type` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `big_code` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `city_code` varchar(64) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_ybp_zy_build_info` */

DROP TABLE IF EXISTS `rpt_ybp_zy_build_info`;

CREATE TABLE `rpt_ybp_zy_build_info` (
  `rent_week_add` bigint(20) DEFAULT NULL,
  `rent_num` bigint(20) DEFAULT NULL,
  `Sale_week_add` bigint(20) DEFAULT NULL,
  `Sale_num` bigint(20) DEFAULT NULL,
  `Week_code` date DEFAULT NULL,
  `Create_time` date DEFAULT NULL,
  `path` longtext COLLATE utf8_bin
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_ybp_zy_cst_info` */

DROP TABLE IF EXISTS `rpt_ybp_zy_cst_info`;

CREATE TABLE `rpt_ybp_zy_cst_info` (
  `rent_week_add` int(11) DEFAULT NULL,
  `rent_cst_num` int(11) DEFAULT NULL,
  `sale_week_add` int(11) DEFAULT NULL,
  `sale_cst_num` int(11) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  `week_code` date DEFAULT NULL,
  `path` longtext COLLATE utf8_bin
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_ybp_zy_m_sale_income` */

DROP TABLE IF EXISTS `rpt_ybp_zy_m_sale_income`;

CREATE TABLE `rpt_ybp_zy_m_sale_income` (
  `sale_num` int(11) DEFAULT NULL,
  `rent_num` int(11) DEFAULT NULL,
  `sale_amount` double(20,3) DEFAULT NULL,
  `rent_amount` double(20,3) DEFAULT NULL,
  `data_date` date DEFAULT NULL,
  `count_month` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `path` longtext COLLATE utf8_bin
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_yx_cst_model` */

DROP TABLE IF EXISTS `rpt_yx_cst_model`;

CREATE TABLE `rpt_yx_cst_model` (
  `data_seq_id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `big_code` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `city_code` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `proj_guid` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `cstguid` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `mobile_tel` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  `cst_email` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `cst_address` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cst_type` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `cstname` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `deal_date` datetime DEFAULT NULL,
  `household_city_name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `household_city_code` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `household_name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `household_code` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `work_city_code` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `work_city_name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `work_sheng_code` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `work_sheng_name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `house_city_code` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `house_city_name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `house_sheng_code` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `house_sheng_name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  KEY `idx_yxmodel_cstguid` (`cstguid`),
  KEY `idx_yxmodel_bigcode` (`big_code`,`city_code`,`proj_guid`) USING BTREE,
  KEY `idx_yxmodel_projguid` (`proj_guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_zy_format_convert` */

DROP TABLE IF EXISTS `rpt_zy_format_convert`;

CREATE TABLE `rpt_zy_format_convert` (
  `index_flow_id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `proj_id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `index_format_type` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `buy_cst_num` int(11) DEFAULT NULL,
  `buy_cst_deal_num` int(11) DEFAULT NULL,
  `rent_cst_num` int(11) DEFAULT NULL,
  `rent_cst_deal_num` int(11) DEFAULT NULL,
  `tj_cst_num` int(11) DEFAULT NULL,
  `tj_cst_deal_num` int(11) DEFAULT NULL,
  `dk_cst_num` int(11) DEFAULT NULL,
  `dk_cst_deal_num` int(11) DEFAULT NULL,
  `Tj_rent_cst_num` int(11) DEFAULT NULL,
  `Tj_rent_cst_deal_num` int(11) DEFAULT NULL,
  `dk_rent_cst_num` int(11) DEFAULT NULL,
  `dk_rent_cst_deal_num` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_zy_format_index` */

DROP TABLE IF EXISTS `rpt_zy_format_index`;

CREATE TABLE `rpt_zy_format_index` (
  `data_id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `proj_id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `Plan_rent_set` bigint(20) DEFAULT NULL,
  `Fini_Rent_set` bigint(20) DEFAULT NULL,
  `Plan_rent_money` float DEFAULT NULL,
  `Fini_rent_money` float DEFAULT NULL,
  `Plan_deal_set` bigint(20) DEFAULT NULL,
  `Fini_deal_set` bigint(20) DEFAULT NULL,
  `Plan_deal_money` float DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `Fini_deal_money` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_zy_index_flow` */

DROP TABLE IF EXISTS `rpt_zy_index_flow`;

CREATE TABLE `rpt_zy_index_flow` (
  `index_flow_id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `proj_id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `index_format_type` int(11) DEFAULT NULL,
  `house_deal_day` int(11) DEFAULT NULL,
  `house_deal_aveg_day` int(11) DEFAULT NULL,
  `House_deal_over` int(11) DEFAULT NULL,
  `house_rent_day` int(11) DEFAULT NULL,
  `house_rent_aveg_day` int(11) DEFAULT NULL,
  `House_rent_over` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_zy_key_index` */

DROP TABLE IF EXISTS `rpt_zy_key_index`;

CREATE TABLE `rpt_zy_key_index` (
  `Data_seq_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `proj_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Add_lease_cst` int(11) DEFAULT NULL,
  `Add_Sale_cst` int(11) DEFAULT NULL,
  `Add_lease_house` int(11) DEFAULT NULL,
  `Add_Sale_house` int(11) DEFAULT NULL,
  `Lease_follow_num` int(11) DEFAULT NULL,
  `Sale_follow_num` int(11) DEFAULT NULL,
  `House_lease_num` int(11) DEFAULT NULL,
  `House_sale_num` int(11) DEFAULT NULL,
  `Lease_deal_money` double DEFAULT NULL,
  `Sale_deal_money` double DEFAULT NULL,
  `create_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_zy_proj_rent_sale` */

DROP TABLE IF EXISTS `rpt_zy_proj_rent_sale`;

CREATE TABLE `rpt_zy_proj_rent_sale` (
  `sale_proj_num` bigint(20) DEFAULT NULL,
  `sale_total_set` bigint(20) DEFAULT NULL,
  `sold_set` bigint(20) DEFAULT NULL,
  `sale_invalid_set` bigint(20) DEFAULT NULL,
  `sale_yest_deal` double(20,3) DEFAULT NULL COMMENT '出售昨日',
  `sale_month_deal` double(20,3) DEFAULT NULL COMMENT '出售本月',
  `sale_season_deal` double(20,3) DEFAULT NULL COMMENT '出售本季',
  `sale_year_deal` double(20,3) DEFAULT NULL COMMENT '出售本年',
  `rent_proj_num` bigint(20) DEFAULT NULL,
  `rent_total_set` bigint(20) DEFAULT NULL,
  `rent_set` bigint(20) DEFAULT NULL,
  `rent_invalid_set` bigint(20) DEFAULT NULL,
  `rent_yest_deal` double(20,3) DEFAULT NULL COMMENT '出租昨日',
  `rent_month_deal` double(20,3) DEFAULT NULL COMMENT '出租本月',
  `rent_season_deal` double(20,3) DEFAULT NULL COMMENT '出租本季',
  `rent_year_deal` double(20,3) DEFAULT NULL COMMENT '出租本年',
  `create_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `rpt_zy_store_rank` */

DROP TABLE IF EXISTS `rpt_zy_store_rank`;

CREATE TABLE `rpt_zy_store_rank` (
  `store_code` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `store_name` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `store_deal_amount` double(20,3) DEFAULT NULL,
  `count_year` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `s_CstReceive` */

DROP TABLE IF EXISTS `s_CstReceive`;

CREATE TABLE `s_CstReceive` (
  `OppGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `Description` longtext COLLATE utf8_bin,
  `ReceiveType` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ReceiveDate` datetime DEFAULT NULL,
  `UserGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `MyGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `CstGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `BuGUID` varchar(250) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `s_agent_recommend` */

DROP TABLE IF EXISTS `s_agent_recommend`;

CREATE TABLE `s_agent_recommend` (
  `recommendID` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ID',
  `projGUID` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '项目GUID',
  `recommendTime` datetime NOT NULL COMMENT '推荐时间',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `cstMobile` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户手机',
  `cstName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户姓名',
  `agentGUID` bigint(20) NOT NULL COMMENT '经纪人GUID',
  `appointTime` datetime DEFAULT NULL COMMENT '预约上门时间',
  `expireTime` datetime DEFAULT NULL COMMENT '预约过期时间',
  `consultantId` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分配置业顾问id',
  `productType` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品品类',
  `proxyCompanyId` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '代理公司ID',
  `prizeRule` mediumtext COLLATE utf8_unicode_ci COMMENT '结佣规则描述',
  `isAccompany` int(11) DEFAULT NULL COMMENT '是否陪同上门',
  `enable` int(11) DEFAULT NULL COMMENT '无效有效',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `srcType` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '来源类型',
  `leadID` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '线索ID',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`recommendID`),
  KEY `index_leadID` (`leadID`),
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_mobile` (`cstMobile`),
  KEY `index_projguid` (`projGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `s_appoint` */

DROP TABLE IF EXISTS `s_appoint`;

CREATE TABLE `s_appoint` (
  `appointGUID` bigint(20) NOT NULL AUTO_INCREMENT,
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户guid',
  `mobile` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `cstName` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `appointTime` datetime NOT NULL,
  `projGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `userGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '置业顾问ID',
  `sourceApp` int(11) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `appintType` int(10) NOT NULL COMMENT '预约类型',
  `apointStatus` int(10) NOT NULL COMMENT '预状态',
  `appointCode` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '预约号,预约号只有在存在取消预约时可用，即一次预约和一次取消预约的预约号应是同一个',
  `leadID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '线索ID',
  `cancelTime` datetime DEFAULT NULL COMMENT '取消时间',
  `cancelReason` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '取消原因',
  `remark` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '备注说明',
  PRIMARY KEY (`appointGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `s_cst_opp` */

DROP TABLE IF EXISTS `s_cst_opp`;

CREATE TABLE `s_cst_opp` (
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `oppGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '机会',
  `priority` int(10) DEFAULT NULL COMMENT '优先顺序0最高，步长为10；即',
  `oriCstGUID` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '业态客户ID',
  KEY `idx_cstGUID` (`cstGUID`),
  KEY `idx_cstopp_oppGUID` (`oppGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `s_cst_opp-bak` */

DROP TABLE IF EXISTS `s_cst_opp-bak`;

CREATE TABLE `s_cst_opp-bak` (
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `oppGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '机会',
  `priority` int(10) DEFAULT NULL COMMENT '优先顺序0最高，步长为10；即',
  `oriCstGUID` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '业态客户ID',
  KEY `idx_cstGUID` (`cstGUID`),
  KEY `idx_cstopp_oppGUID` (`oppGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `s_cst_opp_tmp` */

DROP TABLE IF EXISTS `s_cst_opp_tmp`;

CREATE TABLE `s_cst_opp_tmp` (
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `oppGUID` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '机会',
  `priority` int(10) DEFAULT NULL COMMENT '优先顺序0最高，步长为10；即',
  `oriCstGUID` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '业态客户ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `s_followrecord` */

DROP TABLE IF EXISTS `s_followrecord`;

CREATE TABLE `s_followrecord` (
  `followRecordID` bigint(40) NOT NULL AUTO_INCREMENT COMMENT '主键uuid',
  `salesLeadGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售线索GUID',
  `oppGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售机会GUID',
  `type` int(10) NOT NULL COMMENT '类型1=线索跟进2=机会跟进',
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `followDate` datetime DEFAULT NULL COMMENT '跟进时间',
  `userGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '置业顾问GUID',
  `oriCstGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户明源GUID',
  `companyGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司GUID',
  `sequence` int(11) DEFAULT NULL COMMENT '序列号',
  `followType` int(11) DEFAULT NULL COMMENT '跟进类型',
  `subType` int(10) DEFAULT NULL COMMENT '子类型',
  `followContent` mediumtext COLLATE utf8_unicode_ci COMMENT '跟进内容',
  `srouceApp` varchar(65) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '跟进来源',
  `projGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `parentProjGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '一级项目GUID',
  `myGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联GUID',
  `tradeGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '成交状态时的交易ID',
  `nextFollowTime` datetime DEFAULT NULL COMMENT '下次跟进时间',
  `nextFollowContent` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '下次跟进内容',
  `cognizePath` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '认知途径',
  `activitySource` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '媒体活动',
  `rate` int(10) NOT NULL DEFAULT '0' COMMENT '成交几率1=A级2=B级3=C级4=D级',
  `remark` mediumtext COLLATE utf8_unicode_ci COMMENT '备注',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `oriRate` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '明源跟进情况,对应成交几率',
  `roomName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '房产名称',
  `roomGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '房产ID',
  `principal` varchar(48) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '负责人',
  `contactPhone` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `money` double DEFAULT NULL COMMENT '金额',
  `contractNO` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '合同编号',
  PRIMARY KEY (`followRecordID`,`oriRate`),
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_followtype` (`followType`),
  KEY `index_projguid` (`projGUID`),
  KEY `index_myguid` (`myGUID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1795654 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `s_followrecord_0` */

DROP TABLE IF EXISTS `s_followrecord_0`;

CREATE TABLE `s_followrecord_0` (
  `followRecordID` bigint(40) NOT NULL AUTO_INCREMENT COMMENT '主键uuid',
  `salesLeadGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售线索GUID',
  `oppGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售机会GUID',
  `type` int(10) NOT NULL COMMENT '类型1=线索跟进2=机会跟进',
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `followDate` datetime DEFAULT NULL COMMENT '跟进时间',
  `userGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '置业顾问GUID',
  `oriCstGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户明源GUID',
  `companyGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司GUID',
  `sequence` int(11) DEFAULT NULL COMMENT '序列号',
  `followType` int(11) DEFAULT NULL COMMENT '跟进类型',
  `subType` int(10) DEFAULT NULL COMMENT '子类型',
  `followContent` mediumtext COLLATE utf8_unicode_ci COMMENT '跟进内容',
  `srouceApp` varchar(65) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '跟进来源',
  `projGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `parentProjGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '一级项目GUID',
  `myGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联GUID',
  `tradeGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '成交状态时的交易ID',
  `nextFollowTime` datetime DEFAULT NULL COMMENT '下次跟进时间',
  `nextFollowContent` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '下次跟进内容',
  `cognizePath` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '认知途径',
  `activitySource` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '媒体活动',
  `rate` int(10) NOT NULL DEFAULT '0' COMMENT '成交几率1=A级2=B级3=C级4=D级',
  `remark` mediumtext COLLATE utf8_unicode_ci COMMENT '备注',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `oriRate` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源跟进情况,对应成交几率',
  PRIMARY KEY (`followRecordID`),
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_followtype` (`followType`),
  KEY `index_projguid` (`projGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=131520 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `s_followrecord_01` */

DROP TABLE IF EXISTS `s_followrecord_01`;

CREATE TABLE `s_followrecord_01` (
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `s_followrecord_1` */

DROP TABLE IF EXISTS `s_followrecord_1`;

CREATE TABLE `s_followrecord_1` (
  `followRecordID` bigint(40) NOT NULL AUTO_INCREMENT COMMENT '主键uuid',
  `salesLeadGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售线索GUID',
  `oppGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售机会GUID',
  `type` int(10) NOT NULL COMMENT '类型1=线索跟进2=机会跟进',
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `followDate` datetime DEFAULT NULL COMMENT '跟进时间',
  `userGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '置业顾问GUID',
  `oriCstGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户明源GUID',
  `companyGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司GUID',
  `sequence` int(11) DEFAULT NULL COMMENT '序列号',
  `followType` int(11) DEFAULT NULL COMMENT '跟进类型',
  `subType` int(10) DEFAULT NULL COMMENT '子类型',
  `followContent` mediumtext COLLATE utf8_unicode_ci COMMENT '跟进内容',
  `srouceApp` varchar(65) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '跟进来源',
  `projGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `parentProjGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '一级项目GUID',
  `myGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联GUID',
  `tradeGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '成交状态时的交易ID',
  `nextFollowTime` datetime DEFAULT NULL COMMENT '下次跟进时间',
  `nextFollowContent` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '下次跟进内容',
  `cognizePath` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '认知途径',
  `activitySource` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '媒体活动',
  `rate` int(10) NOT NULL DEFAULT '0' COMMENT '成交几率1=A级2=B级3=C级4=D级',
  `remark` mediumtext COLLATE utf8_unicode_ci COMMENT '备注',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `oriRate` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源跟进情况,对应成交几率',
  PRIMARY KEY (`followRecordID`),
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_followtype` (`followType`),
  KEY `index_projguid` (`projGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=132808 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `s_followrecord_2` */

DROP TABLE IF EXISTS `s_followrecord_2`;

CREATE TABLE `s_followrecord_2` (
  `followRecordID` bigint(40) NOT NULL AUTO_INCREMENT COMMENT '主键uuid',
  `salesLeadGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售线索GUID',
  `oppGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售机会GUID',
  `type` int(10) NOT NULL COMMENT '类型1=线索跟进2=机会跟进',
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `followDate` datetime DEFAULT NULL COMMENT '跟进时间',
  `userGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '置业顾问GUID',
  `oriCstGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户明源GUID',
  `companyGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司GUID',
  `sequence` int(11) DEFAULT NULL COMMENT '序列号',
  `followType` int(11) DEFAULT NULL COMMENT '跟进类型',
  `subType` int(10) DEFAULT NULL COMMENT '子类型',
  `followContent` mediumtext COLLATE utf8_unicode_ci COMMENT '跟进内容',
  `srouceApp` varchar(65) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '跟进来源',
  `projGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `parentProjGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '一级项目GUID',
  `myGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联GUID',
  `tradeGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '成交状态时的交易ID',
  `nextFollowTime` datetime DEFAULT NULL COMMENT '下次跟进时间',
  `nextFollowContent` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '下次跟进内容',
  `cognizePath` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '认知途径',
  `activitySource` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '媒体活动',
  `rate` int(10) NOT NULL DEFAULT '0' COMMENT '成交几率1=A级2=B级3=C级4=D级',
  `remark` mediumtext COLLATE utf8_unicode_ci COMMENT '备注',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `oriRate` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源跟进情况,对应成交几率',
  PRIMARY KEY (`followRecordID`),
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_followtype` (`followType`),
  KEY `index_projguid` (`projGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=131691 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `s_followrecord_3` */

DROP TABLE IF EXISTS `s_followrecord_3`;

CREATE TABLE `s_followrecord_3` (
  `followRecordID` bigint(40) NOT NULL AUTO_INCREMENT COMMENT '主键uuid',
  `salesLeadGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售线索GUID',
  `oppGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售机会GUID',
  `type` int(10) NOT NULL COMMENT '类型1=线索跟进2=机会跟进',
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `followDate` datetime DEFAULT NULL COMMENT '跟进时间',
  `userGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '置业顾问GUID',
  `oriCstGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户明源GUID',
  `companyGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司GUID',
  `sequence` int(11) DEFAULT NULL COMMENT '序列号',
  `followType` int(11) DEFAULT NULL COMMENT '跟进类型',
  `subType` int(10) DEFAULT NULL COMMENT '子类型',
  `followContent` mediumtext COLLATE utf8_unicode_ci COMMENT '跟进内容',
  `srouceApp` varchar(65) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '跟进来源',
  `projGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `parentProjGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '一级项目GUID',
  `myGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联GUID',
  `tradeGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '成交状态时的交易ID',
  `nextFollowTime` datetime DEFAULT NULL COMMENT '下次跟进时间',
  `nextFollowContent` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '下次跟进内容',
  `cognizePath` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '认知途径',
  `activitySource` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '媒体活动',
  `rate` int(10) NOT NULL DEFAULT '0' COMMENT '成交几率1=A级2=B级3=C级4=D级',
  `remark` mediumtext COLLATE utf8_unicode_ci COMMENT '备注',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `oriRate` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源跟进情况,对应成交几率',
  PRIMARY KEY (`followRecordID`),
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_followtype` (`followType`),
  KEY `index_projguid` (`projGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=130686 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `s_followrecord_4` */

DROP TABLE IF EXISTS `s_followrecord_4`;

CREATE TABLE `s_followrecord_4` (
  `followRecordID` bigint(40) NOT NULL AUTO_INCREMENT COMMENT '主键uuid',
  `salesLeadGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售线索GUID',
  `oppGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售机会GUID',
  `type` int(10) NOT NULL COMMENT '类型1=线索跟进2=机会跟进',
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `followDate` datetime DEFAULT NULL COMMENT '跟进时间',
  `userGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '置业顾问GUID',
  `oriCstGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户明源GUID',
  `companyGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司GUID',
  `sequence` int(11) DEFAULT NULL COMMENT '序列号',
  `followType` int(11) DEFAULT NULL COMMENT '跟进类型',
  `subType` int(10) DEFAULT NULL COMMENT '子类型',
  `followContent` mediumtext COLLATE utf8_unicode_ci COMMENT '跟进内容',
  `srouceApp` varchar(65) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '跟进来源',
  `projGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `parentProjGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '一级项目GUID',
  `myGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联GUID',
  `tradeGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '成交状态时的交易ID',
  `nextFollowTime` datetime DEFAULT NULL COMMENT '下次跟进时间',
  `nextFollowContent` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '下次跟进内容',
  `cognizePath` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '认知途径',
  `activitySource` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '媒体活动',
  `rate` int(10) NOT NULL DEFAULT '0' COMMENT '成交几率1=A级2=B级3=C级4=D级',
  `remark` mediumtext COLLATE utf8_unicode_ci COMMENT '备注',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `oriRate` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源跟进情况,对应成交几率',
  PRIMARY KEY (`followRecordID`),
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_followtype` (`followType`),
  KEY `index_projguid` (`projGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=133777 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `s_followrecord_5` */

DROP TABLE IF EXISTS `s_followrecord_5`;

CREATE TABLE `s_followrecord_5` (
  `followRecordID` bigint(40) NOT NULL AUTO_INCREMENT COMMENT '主键uuid',
  `salesLeadGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售线索GUID',
  `oppGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售机会GUID',
  `type` int(10) NOT NULL COMMENT '类型1=线索跟进2=机会跟进',
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `followDate` datetime DEFAULT NULL COMMENT '跟进时间',
  `userGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '置业顾问GUID',
  `oriCstGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户明源GUID',
  `companyGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司GUID',
  `sequence` int(11) DEFAULT NULL COMMENT '序列号',
  `followType` int(11) DEFAULT NULL COMMENT '跟进类型',
  `subType` int(10) DEFAULT NULL COMMENT '子类型',
  `followContent` mediumtext COLLATE utf8_unicode_ci COMMENT '跟进内容',
  `srouceApp` varchar(65) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '跟进来源',
  `projGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `parentProjGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '一级项目GUID',
  `myGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联GUID',
  `tradeGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '成交状态时的交易ID',
  `nextFollowTime` datetime DEFAULT NULL COMMENT '下次跟进时间',
  `nextFollowContent` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '下次跟进内容',
  `cognizePath` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '认知途径',
  `activitySource` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '媒体活动',
  `rate` int(10) NOT NULL DEFAULT '0' COMMENT '成交几率1=A级2=B级3=C级4=D级',
  `remark` mediumtext COLLATE utf8_unicode_ci COMMENT '备注',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `oriRate` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源跟进情况,对应成交几率',
  PRIMARY KEY (`followRecordID`),
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_followtype` (`followType`),
  KEY `index_projguid` (`projGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=132311 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `s_followrecord_6` */

DROP TABLE IF EXISTS `s_followrecord_6`;

CREATE TABLE `s_followrecord_6` (
  `followRecordID` bigint(40) NOT NULL AUTO_INCREMENT COMMENT '主键uuid',
  `salesLeadGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售线索GUID',
  `oppGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售机会GUID',
  `type` int(10) NOT NULL COMMENT '类型1=线索跟进2=机会跟进',
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `followDate` datetime DEFAULT NULL COMMENT '跟进时间',
  `userGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '置业顾问GUID',
  `oriCstGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户明源GUID',
  `companyGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司GUID',
  `sequence` int(11) DEFAULT NULL COMMENT '序列号',
  `followType` int(11) DEFAULT NULL COMMENT '跟进类型',
  `subType` int(10) DEFAULT NULL COMMENT '子类型',
  `followContent` mediumtext COLLATE utf8_unicode_ci COMMENT '跟进内容',
  `srouceApp` varchar(65) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '跟进来源',
  `projGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `parentProjGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '一级项目GUID',
  `myGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联GUID',
  `tradeGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '成交状态时的交易ID',
  `nextFollowTime` datetime DEFAULT NULL COMMENT '下次跟进时间',
  `nextFollowContent` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '下次跟进内容',
  `cognizePath` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '认知途径',
  `activitySource` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '媒体活动',
  `rate` int(10) NOT NULL DEFAULT '0' COMMENT '成交几率1=A级2=B级3=C级4=D级',
  `remark` mediumtext COLLATE utf8_unicode_ci COMMENT '备注',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `oriRate` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源跟进情况,对应成交几率',
  PRIMARY KEY (`followRecordID`),
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_followtype` (`followType`),
  KEY `index_projguid` (`projGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=132728 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `s_followrecord_7` */

DROP TABLE IF EXISTS `s_followrecord_7`;

CREATE TABLE `s_followrecord_7` (
  `followRecordID` bigint(40) NOT NULL AUTO_INCREMENT COMMENT '主键uuid',
  `salesLeadGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售线索GUID',
  `oppGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售机会GUID',
  `type` int(10) NOT NULL COMMENT '类型1=线索跟进2=机会跟进',
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `followDate` datetime DEFAULT NULL COMMENT '跟进时间',
  `userGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '置业顾问GUID',
  `oriCstGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户明源GUID',
  `companyGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司GUID',
  `sequence` int(11) DEFAULT NULL COMMENT '序列号',
  `followType` int(11) DEFAULT NULL COMMENT '跟进类型',
  `subType` int(10) DEFAULT NULL COMMENT '子类型',
  `followContent` mediumtext COLLATE utf8_unicode_ci COMMENT '跟进内容',
  `srouceApp` varchar(65) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '跟进来源',
  `projGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `parentProjGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '一级项目GUID',
  `myGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联GUID',
  `tradeGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '成交状态时的交易ID',
  `nextFollowTime` datetime DEFAULT NULL COMMENT '下次跟进时间',
  `nextFollowContent` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '下次跟进内容',
  `cognizePath` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '认知途径',
  `activitySource` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '媒体活动',
  `rate` int(10) NOT NULL DEFAULT '0' COMMENT '成交几率1=A级2=B级3=C级4=D级',
  `remark` mediumtext COLLATE utf8_unicode_ci COMMENT '备注',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `oriRate` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源跟进情况,对应成交几率',
  PRIMARY KEY (`followRecordID`),
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_followtype` (`followType`),
  KEY `index_projguid` (`projGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=131309 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `s_followrecord_8` */

DROP TABLE IF EXISTS `s_followrecord_8`;

CREATE TABLE `s_followrecord_8` (
  `followRecordID` bigint(40) NOT NULL AUTO_INCREMENT COMMENT '主键uuid',
  `salesLeadGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售线索GUID',
  `oppGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售机会GUID',
  `type` int(10) NOT NULL COMMENT '类型1=线索跟进2=机会跟进',
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `followDate` datetime DEFAULT NULL COMMENT '跟进时间',
  `userGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '置业顾问GUID',
  `oriCstGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户明源GUID',
  `companyGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司GUID',
  `sequence` int(11) DEFAULT NULL COMMENT '序列号',
  `followType` int(11) DEFAULT NULL COMMENT '跟进类型',
  `subType` int(10) DEFAULT NULL COMMENT '子类型',
  `followContent` mediumtext COLLATE utf8_unicode_ci COMMENT '跟进内容',
  `srouceApp` varchar(65) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '跟进来源',
  `projGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `parentProjGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '一级项目GUID',
  `myGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联GUID',
  `tradeGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '成交状态时的交易ID',
  `nextFollowTime` datetime DEFAULT NULL COMMENT '下次跟进时间',
  `nextFollowContent` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '下次跟进内容',
  `cognizePath` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '认知途径',
  `activitySource` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '媒体活动',
  `rate` int(10) NOT NULL DEFAULT '0' COMMENT '成交几率1=A级2=B级3=C级4=D级',
  `remark` mediumtext COLLATE utf8_unicode_ci COMMENT '备注',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `oriRate` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源跟进情况,对应成交几率',
  PRIMARY KEY (`followRecordID`),
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_followtype` (`followType`),
  KEY `index_projguid` (`projGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=135545 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `s_followrecord_9` */

DROP TABLE IF EXISTS `s_followrecord_9`;

CREATE TABLE `s_followrecord_9` (
  `followRecordID` bigint(40) NOT NULL AUTO_INCREMENT COMMENT '主键uuid',
  `salesLeadGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售线索GUID',
  `oppGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售机会GUID',
  `type` int(10) NOT NULL COMMENT '类型1=线索跟进2=机会跟进',
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `followDate` datetime DEFAULT NULL COMMENT '跟进时间',
  `userGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '置业顾问GUID',
  `oriCstGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户明源GUID',
  `companyGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司GUID',
  `sequence` int(11) DEFAULT NULL COMMENT '序列号',
  `followType` int(11) DEFAULT NULL COMMENT '跟进类型',
  `subType` int(10) DEFAULT NULL COMMENT '子类型',
  `followContent` mediumtext COLLATE utf8_unicode_ci COMMENT '跟进内容',
  `srouceApp` varchar(65) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '跟进来源',
  `projGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `parentProjGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '一级项目GUID',
  `myGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联GUID',
  `tradeGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '成交状态时的交易ID',
  `nextFollowTime` datetime DEFAULT NULL COMMENT '下次跟进时间',
  `nextFollowContent` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '下次跟进内容',
  `cognizePath` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '认知途径',
  `activitySource` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '媒体活动',
  `rate` int(10) NOT NULL DEFAULT '0' COMMENT '成交几率1=A级2=B级3=C级4=D级',
  `remark` mediumtext COLLATE utf8_unicode_ci COMMENT '备注',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `oriRate` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源跟进情况,对应成交几率',
  PRIMARY KEY (`followRecordID`),
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_followtype` (`followType`),
  KEY `index_projguid` (`projGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=134840 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `s_followrecord_bak` */

DROP TABLE IF EXISTS `s_followrecord_bak`;

CREATE TABLE `s_followrecord_bak` (
  `followRecordID` bigint(40) NOT NULL AUTO_INCREMENT COMMENT '主键uuid',
  `salesLeadGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售线索GUID',
  `oppGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售机会GUID',
  `type` int(10) NOT NULL COMMENT '类型1=线索跟进2=机会跟进',
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `followDate` datetime DEFAULT NULL COMMENT '跟进时间',
  `userGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '置业顾问GUID',
  `oriCstGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户明源GUID',
  `companyGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司GUID',
  `sequence` int(11) DEFAULT NULL COMMENT '序列号',
  `followType` int(11) DEFAULT NULL COMMENT '跟进类型',
  `subType` int(10) DEFAULT NULL COMMENT '子类型',
  `followContent` mediumtext COLLATE utf8_unicode_ci COMMENT '跟进内容',
  `srouceApp` varchar(65) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '跟进来源',
  `projGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `parentProjGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '一级项目GUID',
  `myGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联GUID',
  `tradeGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '成交状态时的交易ID',
  `nextFollowTime` datetime DEFAULT NULL COMMENT '下次跟进时间',
  `nextFollowContent` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '下次跟进内容',
  `cognizePath` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '认知途径',
  `activitySource` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '媒体活动',
  `rate` int(10) NOT NULL DEFAULT '0' COMMENT '成交几率1=A级2=B级3=C级4=D级',
  `remark` mediumtext COLLATE utf8_unicode_ci COMMENT '备注',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `oriRate` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源跟进情况,对应成交几率',
  PRIMARY KEY (`followRecordID`),
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_followtype` (`followType`),
  KEY `index_projguid` (`projGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=2459295 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `s_followrecord_copy_2` */

DROP TABLE IF EXISTS `s_followrecord_copy_2`;

CREATE TABLE `s_followrecord_copy_2` (
  `followRecordID` bigint(40) NOT NULL AUTO_INCREMENT COMMENT '主键uuid',
  `salesLeadGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售线索GUID',
  `oppGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售机会GUID',
  `type` int(10) NOT NULL COMMENT '类型1=线索跟进2=机会跟进',
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `followDate` datetime DEFAULT NULL COMMENT '跟进时间',
  `userGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '置业顾问GUID',
  `oriCstGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户明源GUID',
  `companyGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司GUID',
  `sequence` int(11) DEFAULT NULL COMMENT '序列号',
  `followType` int(11) DEFAULT NULL COMMENT '跟进类型',
  `subType` int(10) DEFAULT NULL COMMENT '子类型',
  `followContent` mediumtext COLLATE utf8_unicode_ci COMMENT '跟进内容',
  `srouceApp` varchar(65) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '跟进来源',
  `projGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `parentProjGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '一级项目GUID',
  `myGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联GUID',
  `tradeGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '成交状态时的交易ID',
  `nextFollowTime` datetime DEFAULT NULL COMMENT '下次跟进时间',
  `nextFollowContent` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '下次跟进内容',
  `cognizePath` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '认知途径',
  `activitySource` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '媒体活动',
  `rate` int(10) NOT NULL DEFAULT '0' COMMENT '成交几率1=A级2=B级3=C级4=D级',
  `remark` mediumtext COLLATE utf8_unicode_ci COMMENT '备注',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `oriRate` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源跟进情况,对应成交几率',
  PRIMARY KEY (`followRecordID`),
  KEY `index_cstguid` (`cstGUID`),
  KEY `index_followtype` (`followType`),
  KEY `index_projguid` (`projGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=12100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `s_followrecord_t1` */

DROP TABLE IF EXISTS `s_followrecord_t1`;

CREATE TABLE `s_followrecord_t1` (
  `followrecordID` bigint(40) NOT NULL DEFAULT '0' COMMENT '主键uuid',
  `taskGUID` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  KEY `index_taskGUID` (`taskGUID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `s_followrecord_temp0` */

DROP TABLE IF EXISTS `s_followrecord_temp0`;

CREATE TABLE `s_followrecord_temp0` (
  `myGUID` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联GUID',
  `content` varchar(296) COLLATE utf8_bin DEFAULT NULL,
  `roomGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `room` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `RmbAmount` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `s_followrecord_temp1` */

DROP TABLE IF EXISTS `s_followrecord_temp1`;

CREATE TABLE `s_followrecord_temp1` (
  `myGUID` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联GUID',
  `content` varchar(296) COLLATE utf8_bin DEFAULT NULL,
  `roomGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `room` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `RmbAmount` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `s_followrecord_temp2` */

DROP TABLE IF EXISTS `s_followrecord_temp2`;

CREATE TABLE `s_followrecord_temp2` (
  `myGUID` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联GUID',
  `content` varchar(296) COLLATE utf8_bin DEFAULT NULL,
  `roomGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `room` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `RmbAmount` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `s_followrecord_temp3` */

DROP TABLE IF EXISTS `s_followrecord_temp3`;

CREATE TABLE `s_followrecord_temp3` (
  `myGUID` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联GUID',
  `content` varchar(296) COLLATE utf8_bin DEFAULT NULL,
  `roomGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `room` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `RmbAmount` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `s_followrecord_temp4` */

DROP TABLE IF EXISTS `s_followrecord_temp4`;

CREATE TABLE `s_followrecord_temp4` (
  `myGUID` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联GUID',
  `content` varchar(296) COLLATE utf8_bin DEFAULT NULL,
  `roomGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `room` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `RmbAmount` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `s_followrecord_temp5` */

DROP TABLE IF EXISTS `s_followrecord_temp5`;

CREATE TABLE `s_followrecord_temp5` (
  `myGUID` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联GUID',
  `content` varchar(296) COLLATE utf8_bin DEFAULT NULL,
  `roomGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `room` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `RmbAmount` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `s_followrecord_temp6` */

DROP TABLE IF EXISTS `s_followrecord_temp6`;

CREATE TABLE `s_followrecord_temp6` (
  `myGUID` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联GUID',
  `content` varchar(296) COLLATE utf8_bin DEFAULT NULL,
  `roomGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `room` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `RmbAmount` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `s_followrecord_temp7` */

DROP TABLE IF EXISTS `s_followrecord_temp7`;

CREATE TABLE `s_followrecord_temp7` (
  `myGUID` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联GUID',
  `content` varchar(296) COLLATE utf8_bin DEFAULT NULL,
  `roomGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `room` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `RmbAmount` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `s_followrecord_temp8` */

DROP TABLE IF EXISTS `s_followrecord_temp8`;

CREATE TABLE `s_followrecord_temp8` (
  `myGUID` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联GUID',
  `content` varchar(296) COLLATE utf8_bin DEFAULT NULL,
  `roomGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `room` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `RmbAmount` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `s_followrecord_temp9` */

DROP TABLE IF EXISTS `s_followrecord_temp9`;

CREATE TABLE `s_followrecord_temp9` (
  `myGUID` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关联GUID',
  `content` varchar(296) COLLATE utf8_bin DEFAULT NULL,
  `roomGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `room` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `RmbAmount` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `s_followrecord_test` */

DROP TABLE IF EXISTS `s_followrecord_test`;

CREATE TABLE `s_followrecord_test` (
  `followRecordID` bigint(19) NOT NULL AUTO_INCREMENT,
  `salesLeadGUID` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `oppGUID` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `type` int(10) NOT NULL,
  `cstGUID` bigint(19) DEFAULT NULL,
  `followDate` datetime DEFAULT NULL,
  `userGUID` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `oriCstGUID` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `companyGUID` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `sequence` int(10) DEFAULT NULL,
  `followType` int(10) DEFAULT NULL,
  `subType` int(10) DEFAULT NULL,
  `followContent` mediumtext COLLATE utf8_bin,
  `srouceApp` varchar(65) COLLATE utf8_bin DEFAULT NULL,
  `projGUID` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `parentProjGUID` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `myGUID` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `tradeGUID` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `nextFollowTime` datetime DEFAULT NULL,
  `nextFollowContent` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `cognizePath` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `activitySource` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `rate` int(10) NOT NULL DEFAULT '0',
  `remark` mediumtext COLLATE utf8_bin,
  `createTime` datetime NOT NULL,
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `oriRate` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`followRecordID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `s_opp` */

DROP TABLE IF EXISTS `s_opp`;

CREATE TABLE `s_opp` (
  `oppID` bigint(32) NOT NULL AUTO_INCREMENT,
  `oppGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `companyGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `projGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `parentGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '一级项目GUID',
  `leadGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oppSource` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cognizePath` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '认识途径',
  `process` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `myGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estRevenue` double DEFAULT NULL,
  `probability` int(11) DEFAULT NULL,
  `estCloseDate` datetime DEFAULT NULL,
  `followLevel` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visitStatus` int(10) NOT NULL DEFAULT '0' COMMENT '到访状态0=未到访1=已到访',
  `tradeStatus` int(10) NOT NULL DEFAULT '0' COMMENT '成交状态3=已到访4=已认筹5=已认购6=已签约7=回款完成20=退筹21=认购退房22=认购撤消23=认购作废24=签约退房25=签约撤消26=签约作废30=已交楼31=产权出证32=已入伙',
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0',
  `statusReason` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `statusTime` datetime DEFAULT NULL,
  `statusType` tinyint(4) DEFAULT '0' COMMENT '状态修改方式，0(默认新增)，1自动修改，2人工修改',
  `userGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人guid',
  `competitor` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realTotal` double(20,0) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `roomGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `partnerGUIDList` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assignTime` datetime DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `modifyTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `firstVistTime` datetime NOT NULL COMMENT '首次会面时间',
  PRIMARY KEY (`oppID`),
  KEY `idx_s_opp_oppguid` (`oppGUID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1403485 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `s_opp_assign` */

DROP TABLE IF EXISTS `s_opp_assign`;

CREATE TABLE `s_opp_assign` (
  `assignGUID` bigint(20) NOT NULL AUTO_INCREMENT,
  `cstGUID` bigint(20) NOT NULL,
  `oppGUID` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `projGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `userGUID` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '置业顾问',
  `userType` int(10) NOT NULL COMMENT '置业顾问类型1=自然人，即置为顾问2=机构，即代理公司',
  `assignTime` datetime NOT NULL,
  `assignType` int(10) NOT NULL COMMENT '分配方式1=自动轮巡2=手动分配3=自主抢客4=转交',
  `remark` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`assignGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `s_process` */

DROP TABLE IF EXISTS `s_process`;

CREATE TABLE `s_process` (
  `praentId` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '合同',
  `isToPayLateFee` tinyint(4) DEFAULT NULL COMMENT '是否计算滞纳金',
  `lateFeeComputeDate` datetime DEFAULT NULL COMMENT '计算滞纳金日期',
  `lateFeeEndDate` datetime DEFAULT NULL COMMENT '计算滞纳金截至日期',
  `finishDeadline` datetime DEFAULT NULL COMMENT '应完成时间',
  `processName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '进程名称',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `toPayAmount` double DEFAULT NULL COMMENT '应交金额',
  `currencyId` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '币别',
  `payedAmount` double DEFAULT NULL COMMENT '已交金额',
  `payLeftAmount` double DEFAULT NULL COMMENT '未交金额',
  `decideLateFee` double DEFAULT NULL COMMENT '已定滞纳金',
  `toPayLateFee` double DEFAULT NULL COMMENT '滞纳金应交',
  `payedLateFee` double DEFAULT NULL COMMENT '滞纳金已交',
  `payLeftLateFee` double DEFAULT NULL COMMENT '滞纳金欠交',
  `finishDate` datetime DEFAULT NULL COMMENT '实际完成时间',
  `isCompleted` int(10) DEFAULT NULL COMMENT '完成标志状态',
  `systemOperate` int(10) DEFAULT NULL COMMENT '系统操作点',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `seq` int(10) DEFAULT NULL COMMENT '单据分录序列号',
  `processId` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '主键id',
  `saleStatus` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '房间销售状态',
  `paymentTypeId` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '款项类型',
  `paymentSubTypeId` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '款项子类型',
  `perfixProcess` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '前置进程',
  `elseAmount` int(10) DEFAULT NULL COMMENT '金额另属于',
  `templateTypeEntryId` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '付款方案明细',
  `createId` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人id',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `lastUpdateUserId` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '最后修改人',
  `lastUpdateTime` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`processId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `s_product_order` */

DROP TABLE IF EXISTS `s_product_order`;

CREATE TABLE `s_product_order` (
  `pOrderGUID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订购GUID',
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `oriCstGUID` varchar(64) COLLATE utf8_bin NOT NULL,
  `cstName` varchar(48) COLLATE utf8_bin DEFAULT NULL COMMENT '客户名称',
  `type` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '产品类型',
  `subType` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '产品子类',
  `productCode` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '产品编码',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `orderChangeTime` datetime DEFAULT NULL COMMENT '变更时间',
  `remark` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '订购关系说明',
  `startTime` datetime DEFAULT NULL COMMENT '有效开始时间',
  `endTime` datetime DEFAULT NULL COMMENT '有效结束时间',
  `count` int(10) DEFAULT NULL COMMENT '订购数量',
  `price` double DEFAULT NULL COMMENT '单价',
  `totalMoney` double DEFAULT NULL COMMENT '总价',
  `discount` double DEFAULT NULL COMMENT '折扣',
  `orderSrc` int(10) NOT NULL COMMENT '订购关系来源',
  `tradeGUID` varchar(64) COLLATE utf8_bin NOT NULL,
  `createTime` datetime NOT NULL COMMENT '记录创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录修改时间',
  `cstNum` int(11) DEFAULT NULL,
  `propertyRate` double(11,3) DEFAULT NULL,
  PRIMARY KEY (`pOrderGUID`),
  KEY `pOrderGUID` (`pOrderGUID`) USING BTREE,
  KEY `index_cstguid` (`cstGUID`) USING BTREE,
  KEY `index_productCode` (`productCode`) USING BTREE,
  KEY `index_oriCstGUID` (`oriCstGUID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=402570 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `s_product_order_attr` */

DROP TABLE IF EXISTS `s_product_order_attr`;

CREATE TABLE `s_product_order_attr` (
  `pOrderGUID` bigint(20) NOT NULL COMMENT '订购GUID',
  `attrName` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '属性名',
  `attrLabel` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '属性标签',
  `attrValue` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '属性值'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `s_product_sale_control` */

DROP TABLE IF EXISTS `s_product_sale_control`;

CREATE TABLE `s_product_sale_control` (
  `productCode` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '产品编码',
  `saleStatus` int(11) NOT NULL DEFAULT '0' COMMENT '销控状态0=待售，默认状态1=预留2=已售',
  `statusReason` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态原因',
  `controlUser` bigint(20) DEFAULT NULL COMMENT '销控人',
  `targetCst` bigint(20) DEFAULT NULL COMMENT '关系人',
  `createTime` datetime NOT NULL COMMENT '记录创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录修改时间',
  `remark` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Table structure for table `s_saleService` */

DROP TABLE IF EXISTS `s_saleService`;

CREATE TABLE `s_saleService` (
  `ProjGUID` varchar(64) DEFAULT NULL,
  `ServiceItem` varchar(100) DEFAULT NULL,
  `BgnDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `ServiceProc` varchar(100) DEFAULT NULL,
  `msrepl_tran_version` varchar(100) DEFAULT NULL,
  `IsFull` int(2) DEFAULT NULL,
  `SaleServiceGUID` varchar(100) DEFAULT NULL,
  `ContractGUID` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `CompleteDate` varchar(100) DEFAULT NULL,
  `IsRh` int(2) DEFAULT NULL,
  `carrylogID` varchar(100) DEFAULT NULL,
  `ExpressNo` varchar(100) DEFAULT NULL,
  `ServiceMemo` varchar(100) DEFAULT NULL,
  `LzDate` datetime DEFAULT NULL,
  `NotRcvFile` varchar(500) DEFAULT NULL,
  KEY `idx_sales_ContractGUID` (`ContractGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `s_sales_lead` */

DROP TABLE IF EXISTS `s_sales_lead`;

CREATE TABLE `s_sales_lead` (
  `leadID` bigint(20) NOT NULL AUTO_INCREMENT,
  `leadGUID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `projGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `topic` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstType` int(11) DEFAULT NULL,
  `cstName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contactName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nickname` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `followStatus` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `officeTel` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `homeTel` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postCode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `statusTime` datetime DEFAULT NULL,
  `statusReason` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `leadOffer` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstGUID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`leadID`),
  KEY `index_leadguid` (`leadGUID`),
  KEY `index_cstGUID` (`cstID`)
) ENGINE=InnoDB AUTO_INCREMENT=694 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `sx_cdm_region` */

DROP TABLE IF EXISTS `sx_cdm_region`;

CREATE TABLE `sx_cdm_region` (
  `RegionCode` int(11) NOT NULL,
  `RegionName` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`RegionCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sxdt_laifang` */

DROP TABLE IF EXISTS `sxdt_laifang`;

CREATE TABLE `sxdt_laifang` (
  `oppGUID` varchar(64) COLLATE utf8_bin NOT NULL,
  `cstGUID` bigint(20) DEFAULT NULL,
  `projGUID` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `roomGUID` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `firstVistTime` datetime NOT NULL,
  `createTime` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `sxdt_qianyue` */

DROP TABLE IF EXISTS `sxdt_qianyue`;

CREATE TABLE `sxdt_qianyue` (
  `cstGUID` bigint(20) NOT NULL,
  `tradeGUID` varchar(64) COLLATE utf8_bin NOT NULL,
  `roomGUID` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `projGUID` varchar(64) COLLATE utf8_bin NOT NULL,
  `qSDate` datetime DEFAULT NULL,
  `jFDate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `sxdt_qianyueguid` */

DROP TABLE IF EXISTS `sxdt_qianyueguid`;

CREATE TABLE `sxdt_qianyueguid` (
  `cstGUID` bigint(20) NOT NULL,
  `tradeGUID` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `sxdt_qianyuewuche` */

DROP TABLE IF EXISTS `sxdt_qianyuewuche`;

CREATE TABLE `sxdt_qianyuewuche` (
  `tradeGUID` varchar(64) COLLATE utf8_bin NOT NULL,
  `projGUID` varchar(64) COLLATE utf8_bin NOT NULL,
  `roomGUID` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `qSDate` datetime DEFAULT NULL,
  `jFDate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `syn_attach_relation` */

DROP TABLE IF EXISTS `syn_attach_relation`;

CREATE TABLE `syn_attach_relation` (
  `ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `AppSource` varchar(20) NOT NULL,
  `SrcTableName` varchar(50) NOT NULL,
  `SrcFieldName` varchar(50) NOT NULL,
  `AttachCode` varchar(50) NOT NULL,
  `AttachName` varchar(100) NOT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `ModifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `syn_bizform` */

DROP TABLE IF EXISTS `syn_bizform`;

CREATE TABLE `syn_bizform` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BizName` varchar(50) COLLATE utf8_bin NOT NULL,
  `ParamType` int(11) NOT NULL,
  `ParamSubType` int(5) NOT NULL,
  `ParamHost` varchar(50) COLLATE utf8_bin NOT NULL,
  `ParamPort` int(11) NOT NULL,
  `ParamUser` varchar(50) COLLATE utf8_bin NOT NULL,
  `ParamPwd` varchar(50) COLLATE utf8_bin NOT NULL,
  `ParamInstance` varchar(50) COLLATE utf8_bin NOT NULL,
  `CreateTime` datetime NOT NULL,
  `ModifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `syn_convert_keyword` */

DROP TABLE IF EXISTS `syn_convert_keyword`;

CREATE TABLE `syn_convert_keyword` (
  `ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `KeyWord` varchar(50) NOT NULL COMMENT '字段转换的关键字',
  `Value` int(5) NOT NULL DEFAULT '0' COMMENT '转化后的字段值',
  `Module` varchar(50) NOT NULL COMMENT '模块，以字段名或函数名位命名',
  `SrcTable` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `syn_fieldinfo` */

DROP TABLE IF EXISTS `syn_fieldinfo`;

CREATE TABLE `syn_fieldinfo` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FieldName` varchar(1000) NOT NULL COMMENT '字段名',
  `DstFieldName` varchar(50) NOT NULL,
  `ItfFieldName` varchar(50) NOT NULL COMMENT '字段在接口中的名词',
  `TableName` varchar(50) NOT NULL COMMENT '表名',
  `FieldType` int(5) NOT NULL COMMENT '字段类型,1:int,2:string',
  `FieldLen` int(5) NOT NULL COMMENT '字段长度',
  `RelTableName` varchar(50) NOT NULL,
  `RelFieldName` varchar(50) NOT NULL,
  `IsCheckSum` int(5) NOT NULL COMMENT '是否关键字段，用于校验和计算',
  `IsRelation` int(5) NOT NULL COMMENT '是否需要关联,0:不关联,1:关联',
  `IsUse` int(5) NOT NULL,
  `IsNull` int(5) NOT NULL COMMENT '接口是否需要这个字段，但为空',
  `IsConvert` int(5) NOT NULL DEFAULT '0' COMMENT '是否进行数据转换',
  `DefaultValue` varchar(50) NOT NULL,
  `FieldFeature` int(5) NOT NULL DEFAULT '0' COMMENT '字段存储特征（1：作为特征值字段；2：作为公共字段；3：作为来源字段。该字段只在表级配置表StorgeFormat为竖表时有效）',
  `IsTs` int(5) NOT NULL DEFAULT '0' COMMENT '是否作为增量同步用的时间戳',
  `CreateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `ModifyTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=111121368 DEFAULT CHARSET=utf8;

/*Table structure for table `syn_relationinfo` */

DROP TABLE IF EXISTS `syn_relationinfo`;

CREATE TABLE `syn_relationinfo` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FieldName` varchar(50) NOT NULL COMMENT '字段名',
  `TableName` varchar(50) NOT NULL COMMENT '表名',
  `GetFieldName` varchar(50) NOT NULL COMMENT '获取字段名',
  `DstFieldName` varchar(50) NOT NULL COMMENT '在接口显示的字段名称',
  `ItfFieldName` varchar(50) NOT NULL COMMENT '字段在接口中的名词',
  `GetFieldType` int(5) NOT NULL COMMENT '获取字段类型,1:int,2:string',
  `RelTableName` varchar(50) NOT NULL COMMENT '关联表名',
  `RelFieldName` varchar(50) NOT NULL,
  `IsCheckSum` int(5) NOT NULL COMMENT '是否关键字段，用于校验和计算',
  `IsRelation` int(5) NOT NULL COMMENT '是否需要进行数据关联',
  `IsUse` int(5) NOT NULL,
  `IsConvert` int(5) NOT NULL DEFAULT '0' COMMENT '是否进行数据转换',
  `FieldFeature` int(5) NOT NULL DEFAULT '0' COMMENT '字段存储特征（1：作为特征值字段；2：作为公共字段；3：作为来源字段。该字段只在表级配置表StorgeFormat为竖表时有效）',
  `DataSrc` int(5) NOT NULL DEFAULT '1' COMMENT '数据源在哪里，1：源端，2：DC',
  `TimeStampName` varchar(100) NOT NULL,
  `CreateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `ModifyTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `DefaultValue` varchar(10) DEFAULT NULL,
  `bizname` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Table structure for table `syn_tableinfo` */

DROP TABLE IF EXISTS `syn_tableinfo`;

CREATE TABLE `syn_tableinfo` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SortNo` int(5) NOT NULL COMMENT '排序，用于加载及同步的先后顺序',
  `TableName` varchar(50) NOT NULL COMMENT '表名',
  `InsertItf` varchar(50) DEFAULT NULL COMMENT '接口名,用于thrift接口,插入接口',
  `UpdateItf` varchar(50) DEFAULT NULL COMMENT '更新接口名',
  `DstTableName` varchar(50) NOT NULL COMMENT 'DC对应的表名',
  `SyncCycle` int(5) NOT NULL COMMENT '同步周期，单位为小时',
  `SyncMode` int(5) NOT NULL COMMENT '同步模式，1:全量,2:增量',
  `InterfaceType` int(5) DEFAULT '1' COMMENT '接口类型（1：thrift，2：DB，3：thrift批量）',
  `IsRelation` int(5) NOT NULL COMMENT '同步时是否需要关联，0:不关联,1:关联',
  `SrcCondition` varchar(1000) NOT NULL COMMENT '该表的过滤条件',
  `StorgeFormat` int(5) NOT NULL,
  `Forbidden` int(5) NOT NULL COMMENT '该表是否被禁止（0：有效，1：禁止）',
  `CreateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `ModifyTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `bizName` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `IsSnapShot` int(5) NOT NULL DEFAULT '0' COMMENT '是否需要快照 0:否 1:是',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Table structure for table `syn_timestamp` */

DROP TABLE IF EXISTS `syn_timestamp`;

CREATE TABLE `syn_timestamp` (
  `TableName` varchar(128) NOT NULL,
  `LastTimeStampSql` varchar(512) NOT NULL,
  `IsOpen` int(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sys_ad_org` */

DROP TABLE IF EXISTS `sys_ad_org`;

CREATE TABLE `sys_ad_org` (
  `ad_guid` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'ID标识',
  `parent_guid` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '父级组织',
  `org_guid` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '映射组织GUID',
  `org_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '组织名称',
  `state` int(5) DEFAULT '2' COMMENT '状态| 1 正常  2 冻结',
  `check_state` int(5) DEFAULT '0' COMMENT '审批状态| 0 待批 1 已审批',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `dsStr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `objectclass` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `distinguishedname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `objectcategory` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `path` longtext COLLATE utf8_bin COMMENT '路径',
  PRIMARY KEY (`ad_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Ad组织表';

/*Table structure for table `sys_api` */

DROP TABLE IF EXISTS `sys_api`;

CREATE TABLE `sys_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `api_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '编码',
  `api_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `api_type` int(5) DEFAULT NULL COMMENT '类别| 1 app',
  `implement` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '实现类',
  `use_type` int(11) NOT NULL COMMENT '使用方式| 1.提供者  2.使用者',
  `description` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `state` int(5) DEFAULT NULL COMMENT '状态| 1 启用 2 冻结',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '使用时间',
  PRIMARY KEY (`api_id`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='接口表';

/*Table structure for table `sys_app` */

DROP TABLE IF EXISTS `sys_app`;

CREATE TABLE `sys_app` (
  `app_id` varchar(11) COLLATE utf8_bin NOT NULL COMMENT 'appid | 应用唯一标识',
  `app_key` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'appkey | 是各子系统间交互时的验证密钥',
  `app_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '应用名称| 最多64个单字符或32个汉字',
  `token` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '授权码|可动态修改',
  `app_type` tinyint(4) DEFAULT NULL COMMENT '应用类型',
  `entry_url` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '入口url| 地址可以web应用的入口地址 | 也可以是其它类型应用的官方地址',
  `level` tinyint(4) DEFAULT NULL COMMENT '应用级别| 保留字段',
  `description` mediumtext COLLATE utf8_bin COMMENT '应用描述',
  `responsibility` varchar(48) COLLATE utf8_bin DEFAULT NULL COMMENT '负责人',
  `mobile` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号码',
  `email` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '邮件',
  `tel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  `state` tinyint(4) DEFAULT NULL COMMENT '状态| 1 启用 2 冻结',
  `notify_expire` int(11) DEFAULT NULL COMMENT '过期时间|单位：分钟',
  `proj_isolation` tinyint(4) DEFAULT '0' COMMENT '项目隔离| 0:不隔离 1:启用隔离',
  `format` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '应用业态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`app_id`),
  UNIQUE KEY `unique_key` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='应用表';

/*Table structure for table `sys_app_api` */

DROP TABLE IF EXISTS `sys_app_api`;

CREATE TABLE `sys_app_api` (
  `api_id` int(11) NOT NULL COMMENT '接口ID',
  `app_id` varchar(11) COLLATE utf8_bin NOT NULL COMMENT '应用ID',
  `state` int(4) DEFAULT '1' COMMENT '1.启用 2.冻结',
  KEY `FK_sys_app_api` (`api_id`),
  KEY `FK_sys_app_api2` (`app_id`),
  CONSTRAINT `FK_sys_app_api` FOREIGN KEY (`api_id`) REFERENCES `sys_api` (`api_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sys_app_api2` FOREIGN KEY (`app_id`) REFERENCES `sys_app` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='应用接口表';

/*Table structure for table `sys_app_flow` */

DROP TABLE IF EXISTS `sys_app_flow`;

CREATE TABLE `sys_app_flow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `api_id` int(11) NOT NULL COMMENT '接口id',
  `app_id` varchar(11) COLLATE utf8_bin NOT NULL COMMENT '应用id',
  `max_daily_up_size` bigint(20) NOT NULL COMMENT '最大上传量/天',
  `max_daily_down_size` bigint(20) NOT NULL COMMENT '最大下载量/天',
  `max_month_up_size` bigint(20) NOT NULL COMMENT '最大上传量/月',
  `max_month_down_size` bigint(20) NOT NULL COMMENT '最大下载量/月',
  `max_daily_times` bigint(20) NOT NULL COMMENT '最大次数/天',
  `max_month_times` bigint(20) NOT NULL COMMENT '最大次数/月',
  PRIMARY KEY (`id`),
  KEY `FK_sys_app_flow` (`api_id`),
  KEY `FK_sys_app_flow2` (`app_id`),
  CONSTRAINT `FK_sys_app_flow` FOREIGN KEY (`api_id`) REFERENCES `sys_api` (`api_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sys_app_flow2` FOREIGN KEY (`app_id`) REFERENCES `sys_app` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='应用流量表';

/*Table structure for table `sys_app_proj` */

DROP TABLE IF EXISTS `sys_app_proj`;

CREATE TABLE `sys_app_proj` (
  `app_id` varchar(11) COLLATE utf8_bin NOT NULL COMMENT '应用id',
  `proj_guid` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '项目guid',
  KEY `FK_sys_app_proj` (`app_id`),
  CONSTRAINT `FK_sys_app_proj` FOREIGN KEY (`app_id`) REFERENCES `sys_app` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='应用项目表';

/*Table structure for table `sys_attach_priority` */

DROP TABLE IF EXISTS `sys_attach_priority`;

CREATE TABLE `sys_attach_priority` (
  `app` int(11) NOT NULL COMMENT '业态应用ID',
  `attachCode` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '特征编号',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `createTime` datetime DEFAULT NULL,
  `modifyTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `index_app` (`app`),
  KEY `index_attachCode` (`attachCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `sys_cst_customer` */

DROP TABLE IF EXISTS `sys_cst_customer`;

CREATE TABLE `sys_cst_customer` (
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `cstName` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '客户姓名',
  `gender` tinyint(4) DEFAULT NULL COMMENT '性别',
  `birthDate` datetime DEFAULT NULL COMMENT '生日',
  `cstType` tinyint(4) DEFAULT NULL COMMENT '客户类型1=个人2=公司',
  `cardType` int(11) DEFAULT NULL COMMENT '证件类型1=身份证2=军官证3=护照4=港澳通行证5=台湾通行证6=台湾身份证7=港澳身份证8=营业热照9=组织机构代码10=税务登记证号99=其它',
  `cardID` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `mobileTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
  `officeTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '办公电话',
  `homeTel` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭电话',
  `sourceApp` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '来源应用',
  `sourceBiz` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '来源业态；参见特征定义',
  `activitySource` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '媒体活动；参见特征定义',
  `isMerge` int(10) NOT NULL DEFAULT '0' COMMENT '是否合并0=无合并， 1=有合并',
  `isMaster` int(10) NOT NULL DEFAULT '0' COMMENT '是否主数据1是，0否，默认0',
  `contact` mediumtext COLLATE utf8_bin COMMENT '联系电话列表，存当前的',
  `myGUIDList` mediumtext COLLATE utf8_bin COMMENT '业态ID列表，存现有的',
  `address` varchar(400) COLLATE utf8_bin DEFAULT NULL COMMENT '家庭地址',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`cstGUID`),
  KEY `index_cstguid` (`cstGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `itemId` bigint(20) NOT NULL,
  `category` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='字典表';

/*Table structure for table `sys_export` */

DROP TABLE IF EXISTS `sys_export`;

CREATE TABLE `sys_export` (
  `export_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '导出 ID | nolist noinput',
  `export_code` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '导出编码',
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '导出名称',
  PRIMARY KEY (`export_id`),
  UNIQUE KEY `export_code_unique` (`export_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='导出配置表';

/*Table structure for table `sys_export_column` */

DROP TABLE IF EXISTS `sys_export_column`;

CREATE TABLE `sys_export_column` (
  `column_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '值ID | nolist noinput',
  `export_id` int(10) DEFAULT NULL COMMENT '导出 ID | nolist noinput',
  `export_code` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '导出编码',
  `column_value` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '字段值',
  `column_name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '字段名',
  `column_type` int(10) DEFAULT NULL COMMENT '字段类别|1 常规, 2 通过map转换  3 时间',
  `map_key` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'map的key',
  `date_format` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '时间格式',
  `order_num` int(10) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`column_id`),
  KEY `FK_sys_export_column` (`export_id`),
  CONSTRAINT `FK_sys_export_column` FOREIGN KEY (`export_id`) REFERENCES `sys_export` (`export_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='导出字段表';

/*Table structure for table `sys_export_column_copy` */

DROP TABLE IF EXISTS `sys_export_column_copy`;

CREATE TABLE `sys_export_column_copy` (
  `column_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '值ID | nolist noinput',
  `export_id` int(10) DEFAULT NULL COMMENT '导出 ID | nolist noinput',
  `export_code` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '导出编码',
  `column_value` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '字段值',
  `column_name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '字段名',
  `column_type` int(10) DEFAULT NULL COMMENT '字段类别|1 常规, 2 通过map转换  3 时间',
  `map_key` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'map的key',
  `date_format` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '时间格式',
  `order_num` int(10) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`column_id`),
  KEY `FK_sys_export_column` (`export_id`),
  CONSTRAINT `sys_export_column_copy_ibfk_1` FOREIGN KEY (`export_id`) REFERENCES `sys_export` (`export_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='导出字段表';

/*Table structure for table `sys_export_copy` */

DROP TABLE IF EXISTS `sys_export_copy`;

CREATE TABLE `sys_export_copy` (
  `export_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '导出 ID | nolist noinput',
  `export_code` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '导出编码',
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '导出名称',
  PRIMARY KEY (`export_id`),
  UNIQUE KEY `export_code_unique` (`export_code`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='导出表';

/*Table structure for table `sys_function` */

DROP TABLE IF EXISTS `sys_function`;

CREATE TABLE `sys_function` (
  `function_id` int(11) NOT NULL COMMENT '功能ID',
  `function_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '功能名称',
  `function_code` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '功能编码',
  `function_level` int(11) DEFAULT NULL COMMENT '功能级别',
  `parent_id` int(11) DEFAULT NULL COMMENT '父功能',
  `sort` int(5) DEFAULT NULL COMMENT '排序',
  `type` int(5) DEFAULT '1' COMMENT '类别| 1 管理台系统功能  2 案场用户功能',
  `state` int(5) DEFAULT '1' COMMENT '状态| 1 启用 0 未启用',
  PRIMARY KEY (`function_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='功能表';

/*Table structure for table `sys_function_bak20160125` */

DROP TABLE IF EXISTS `sys_function_bak20160125`;

CREATE TABLE `sys_function_bak20160125` (
  `function_id` int(11) NOT NULL COMMENT '功能ID',
  `function_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '功能名称',
  `function_code` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '功能编码',
  `function_level` int(11) DEFAULT NULL COMMENT '功能级别',
  `parent_id` int(11) DEFAULT NULL COMMENT '父功能',
  `sort` int(5) DEFAULT NULL COMMENT '排序',
  `type` int(5) DEFAULT '1' COMMENT '类别| 1 管理台系统功能  2 案场用户功能',
  `state` int(5) DEFAULT '1' COMMENT '状态| 1 启用 0 未启用',
  PRIMARY KEY (`function_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='功能表';

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  `function_id` int(11) DEFAULT NULL COMMENT '功能ID',
  `menu_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单名称',
  `navigation` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '导航信息',
  `action` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单地址',
  `menu_level` int(11) DEFAULT NULL COMMENT '菜单层级',
  `menu_class` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单样式',
  `module_id` int(11) DEFAULT NULL COMMENT '模块ID|只有启用模块的时候才有用',
  `parent_id` int(11) DEFAULT NULL COMMENT '父菜单',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `target` int(5) DEFAULT '1' COMMENT '目标| 1 本地  2 嵌入 3 外链',
  PRIMARY KEY (`menu_id`),
  KEY `FK_sys_menu` (`function_id`),
  KEY `FK_sys_menu2` (`module_id`),
  CONSTRAINT `FK_sys_menu` FOREIGN KEY (`function_id`) REFERENCES `sys_function` (`function_id`) ON DELETE SET NULL,
  CONSTRAINT `FK_sys_menu2` FOREIGN KEY (`module_id`) REFERENCES `sys_module` (`module_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='菜单表';

/*Table structure for table `sys_menu_bak20160125` */

DROP TABLE IF EXISTS `sys_menu_bak20160125`;

CREATE TABLE `sys_menu_bak20160125` (
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  `function_id` int(11) DEFAULT NULL COMMENT '功能ID',
  `menu_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单名称',
  `navigation` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '导航信息',
  `action` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单地址',
  `menu_level` int(11) DEFAULT NULL COMMENT '菜单层级',
  `menu_class` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单样式',
  `module_id` int(11) DEFAULT NULL COMMENT '模块ID|只有启用模块的时候才有用',
  `parent_id` int(11) DEFAULT NULL COMMENT '父菜单',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `target` int(5) DEFAULT '1' COMMENT '目标| 1 本地  2 嵌入 3 外链',
  PRIMARY KEY (`menu_id`),
  KEY `FK_sys_menu` (`function_id`),
  KEY `FK_sys_menu2` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='菜单表';

/*Table structure for table `sys_module` */

DROP TABLE IF EXISTS `sys_module`;

CREATE TABLE `sys_module` (
  `module_id` int(11) NOT NULL COMMENT '模块ID',
  `module_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '模块名称',
  `module_code` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '模块编码',
  `open_target` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '目标区域',
  `sort` int(5) DEFAULT NULL COMMENT '排序',
  `state` int(5) DEFAULT '1' COMMENT '状态| 1 启用 0 未启用',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='模块表(暂未使用)';

/*Table structure for table `sys_params` */

DROP TABLE IF EXISTS `sys_params`;

CREATE TABLE `sys_params` (
  `params_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `params_key` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '参数key',
  `params_value` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '参数值',
  `params_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '参数名',
  `params_desc` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`params_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='参数表';

/*Table structure for table `sys_proj` */

DROP TABLE IF EXISTS `sys_proj`;

CREATE TABLE `sys_proj` (
  `projGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '源项目GUID',
  `projName` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目名称',
  `companyGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司GUID',
  `parentGUID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '父级代码',
  `ifEnd` tinyint(4) DEFAULT NULL COMMENT '是否最末级项目',
  PRIMARY KEY (`projGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `role_type` int(5) DEFAULT '1' COMMENT '角色类别| 1.集团 2.区域 3 分公司',
  `role_flag` int(11) DEFAULT NULL COMMENT '标识| 1.系统内置  2.用户添加',
  `description` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `org_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属组织',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='角色表';

/*Table structure for table `sys_role_function` */

DROP TABLE IF EXISTS `sys_role_function`;

CREATE TABLE `sys_role_function` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `function_id` int(11) NOT NULL COMMENT '功能ID',
  KEY `FK_sys_role_function` (`function_id`),
  KEY `FK_sys_role_function2` (`role_id`),
  CONSTRAINT `FK_sys_role_function` FOREIGN KEY (`function_id`) REFERENCES `sys_function` (`function_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sys_role_function2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='角色功能权限表';

/*Table structure for table `sys_role_project` */

DROP TABLE IF EXISTS `sys_role_project`;

CREATE TABLE `sys_role_project` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `project_guid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '项目ID',
  `role_level` int(11) NOT NULL COMMENT '角色层次',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  KEY `FK_sys_role_project` (`role_id`),
  CONSTRAINT `FK_sys_role_project` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='角色项目表(暂未使用)';

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_guid` varchar(123) COLLATE utf8_bin DEFAULT NULL,
  `user_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '登陆账号',
  `password` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '登陆密码',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '联系电话',
  `logo` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '头像',
  `mail` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '电子邮件',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `post` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '职务',
  `org_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '组织ID',
  `org_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '组织名称',
  `ad_org_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'AD组织ID',
  `ad_org_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'AD组织名称',
  `user_type` int(11) DEFAULT '4' COMMENT '用户类别| 1.集团管理员 2.区域管理员 3 分公司管理员 4 普通用户',
  `state` int(2) DEFAULT '1' COMMENT '用户状态| 1 正常  2 冻结 3 删除',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '最后修改时间',
  `ad_title` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14419 DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户表';

/*Table structure for table `sys_user_idata` */

DROP TABLE IF EXISTS `sys_user_idata`;

CREATE TABLE `sys_user_idata` (
  `tokenid` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(128) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`tokenid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Table structure for table `sys_user_industry` */

DROP TABLE IF EXISTS `sys_user_industry`;

CREATE TABLE `sys_user_industry` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `industry_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '业态ID',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户业态权限表';

/*Table structure for table `sys_user_org` */

DROP TABLE IF EXISTS `sys_user_org`;

CREATE TABLE `sys_user_org` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `orgGUID` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '组织GUID',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户组织权限表';

/*Table structure for table `sys_user_project` */

DROP TABLE IF EXISTS `sys_user_project`;

CREATE TABLE `sys_user_project` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `project_guid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '项目GUID',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户数据权限表';

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  KEY `FK_sys_user_role` (`role_id`),
  KEY `FK_sys_user_role2` (`user_id`),
  CONSTRAINT `FK_sys_user_role` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_sys_user_role2` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户角色表';

/*Table structure for table `t_bd_org` */

DROP TABLE IF EXISTS `t_bd_org`;

CREATE TABLE `t_bd_org` (
  `FID` varchar(44) NOT NULL,
  `FNAME` varchar(80) DEFAULT NULL,
  `FSIMPLEPINYIN` varchar(200) DEFAULT NULL,
  `FNUMBER` varchar(80) DEFAULT NULL,
  `FDESCRIPTION` text,
  `FCREATETIME` datetime DEFAULT NULL,
  `FKCREATORID` varchar(44) DEFAULT NULL,
  `FLASTUPDATETIME` datetime DEFAULT NULL,
  `FKUPDATORID` varchar(44) DEFAULT NULL,
  `FKCONTROLUNITID` varchar(44) DEFAULT NULL,
  `FKORGID` varchar(44) DEFAULT NULL,
  `FKPARENTID` varchar(44) DEFAULT NULL,
  `FLONGNUMBER` varchar(44) DEFAULT NULL,
  `FLEVEL` decimal(11,0) DEFAULT NULL,
  `FLEAF` decimal(11,0) DEFAULT NULL,
  `FDISPLAYNAME` text,
  `FEFFECTIVEDATE` datetime DEFAULT NULL,
  `FDISABLEDDATE` datetime DEFAULT NULL,
  `FSTATUS` varchar(15) DEFAULT NULL,
  `FCU` decimal(1,0) DEFAULT NULL,
  `FJOBS` text,
  `FORGTYPE` varchar(20) DEFAULT NULL,
  `FBUSINESSTYPES` text,
  `FFULLPINYIN` varchar(200) DEFAULT NULL COMMENT '全拼',
  `soft_version` varchar(50) DEFAULT NULL,
  `FBUSINESSTYPESNAME` varchar(2000) DEFAULT NULL,
  `fkgeographyAreaId` varchar(44) DEFAULT NULL,
  `FKBUSINESSAREAID` varchar(44) DEFAULT NULL,
  `fipaddress` varchar(100) DEFAULT NULL,
  `fkgeographyAreaName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`FID`),
  UNIQUE KEY `PK_T_BD_ORG` (`FID`) USING BTREE,
  KEY `IDX_FLONGNUMBER` (`FLONGNUMBER`) USING BTREE,
  KEY `IDX_T_BD_ORG_FNAME` (`FNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t_bk_customer` */

DROP TABLE IF EXISTS `t_bk_customer`;

CREATE TABLE `t_bk_customer` (
  `FID` varchar(50) NOT NULL,
  `FNAME` varchar(50) DEFAULT NULL COMMENT '客户名称',
  `FNUMBER` varchar(50) DEFAULT NULL COMMENT '客户编号',
  `FSIMPLEPINYIN` varchar(50) DEFAULT NULL COMMENT '客户简拼',
  `FDESCRIPTION` varchar(50) DEFAULT NULL COMMENT '客户描述',
  `FCREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `FKCREATORID` varchar(44) DEFAULT NULL COMMENT '创建人',
  `FLASTUPDATETIME` datetime DEFAULT NULL COMMENT '最后修改时间',
  `FKUPDATORID` varchar(44) DEFAULT NULL COMMENT '最后修改人',
  `FKCONTROLUNITID` varchar(44) DEFAULT NULL,
  `FKORGID` varchar(44) DEFAULT NULL COMMENT '创建人组织',
  `FPUBLICLEVEL` varchar(50) DEFAULT NULL COMMENT '客户级别',
  `FTYPE` varchar(50) DEFAULT NULL COMMENT '客户类型',
  `FAREAFROM` decimal(15,2) DEFAULT NULL COMMENT '意向面积起',
  `FAREATO` decimal(15,2) DEFAULT NULL COMMENT '意向面积始',
  `FLAYOUTS` varchar(50) DEFAULT NULL COMMENT '意向户型',
  `FDECORATIONS` varchar(50) DEFAULT NULL COMMENT '意向装修',
  `FTOTALPRICEFROM` decimal(15,2) DEFAULT NULL COMMENT '意向总价（售或者租）起',
  `FTOTALPRICETO` decimal(15,2) DEFAULT NULL COMMENT '意向总价（售或者租）始',
  `FDIRECTIONS` varchar(50) DEFAULT NULL COMMENT '意向朝向',
  `FFLOORFROM` decimal(11,0) DEFAULT NULL COMMENT '意向楼层起',
  `FFLOORTO` decimal(11,0) DEFAULT NULL COMMENT '意向楼层始',
  `FROOMAGEFROM` decimal(11,0) DEFAULT NULL COMMENT '意向房龄起',
  `FROOMAGETO` decimal(11,0) DEFAULT NULL COMMENT '意向房龄始',
  `FFACILITY` varchar(50) DEFAULT NULL COMMENT '意向配套设施(交通配套)',
  `FCUSTOMERSOURCE` varchar(50) DEFAULT NULL COMMENT '客户来源',
  `FINTENTIONTYPE` varchar(50) DEFAULT NULL COMMENT '意向类型  买  租  联动',
  `FINTENTIONDESCRIPTION` text COMMENT '意向描述',
  `FPRICEFROM` decimal(15,2) DEFAULT NULL COMMENT '单价起',
  `FPRICETO` decimal(15,2) DEFAULT NULL COMMENT '单价始',
  `FCUSTOMERPURPOSE` varchar(50) DEFAULT NULL COMMENT '客户用途(投资/自住)',
  `FNEED` text COMMENT '客户要求',
  `FINTENTIONAREA` text COMMENT '意向区域',
  `FINTENTIONREGION` text COMMENT '意向片区',
  `FHOUSESNAME` text COMMENT '意向楼盘',
  `FCUSTOMERIMPORTTYPE` varchar(50) DEFAULT NULL,
  `FCONTACTPERSONNAME` varchar(50) DEFAULT NULL COMMENT '联系人名字',
  `FCOOPERATIONTYPE` varchar(50) DEFAULT NULL,
  `FFOLLOWDATE` datetime DEFAULT NULL COMMENT '最后跟进日期',
  `FTOPUBLICDESC` text COMMENT '转公备注',
  `FPROPERTYTYPE` varchar(50) DEFAULT NULL COMMENT '物业类型(用途)',
  `FINTENTIONAREATYPE` varchar(100) DEFAULT NULL COMMENT '意向位置类型：\r\n按片区\r\n按商圈\r\n按地铁\r\n按公交',
  `FDISTANCENUMBER` decimal(11,0) DEFAULT NULL COMMENT '距离 数字',
  `FINTENTIONCITY` text COMMENT '意向城市',
  `FHOUSESID` text COMMENT '客户意向楼盘ID串',
  `FKFASTSALECUSTOMERID` varchar(44) DEFAULT NULL COMMENT '快消客ID',
  `FCUSTOMERDEALNUM` decimal(65,30) DEFAULT NULL COMMENT '成交次数',
  `FCUSTOMERTEL` text COMMENT '客户的电话号码',
  `FKWEBCUSID` varchar(44) DEFAULT NULL,
  `fkcreateOrgid` varchar(50) DEFAULT NULL,
  `FDR` int(11) DEFAULT NULL,
  `family` varchar(10) DEFAULT NULL,
  `Fnum` varchar(10) DEFAULT NULL,
  `fworkAddres` varchar(100) DEFAULT NULL,
  `fworkArea` varchar(20) DEFAULT NULL,
  `FBuyType` varchar(20) DEFAULT NULL,
  `fbelongPersonNum` varchar(20) DEFAULT NULL,
  `finfoType` varchar(20) DEFAULT NULL,
  `fcompanyName` varchar(40) DEFAULT NULL,
  `fbusinessLicence` varchar(60) DEFAULT NULL,
  `fcustomerState` varchar(60) DEFAULT NULL,
  `oldFKCREATORID` varchar(44) DEFAULT NULL,
  `oldFKORGID` varchar(44) DEFAULT NULL,
  PRIMARY KEY (`FID`),
  UNIQUE KEY `PK_T_BK_CUSTOMER` (`FID`) USING BTREE,
  KEY `IDX_T_BK_CUSTOMER_FTYPE` (`FTYPE`) USING BTREE,
  KEY `IDX_T_BK_CUSTOMER_FINTENTIONTYPE` (`FINTENTIONTYPE`) USING BTREE,
  KEY `IDX_T_BK_CUSTOMER_FNUMBER` (`FNUMBER`) USING BTREE,
  KEY `IDX_fcustomerSource` (`FCUSTOMERSOURCE`) USING BTREE,
  KEY `IDX_FINTENTIONTYPE` (`FINTENTIONTYPE`) USING BTREE,
  KEY `IDX_FKORGID` (`FKORGID`) USING BTREE,
  KEY `IDX_FDR` (`FDR`) USING BTREE,
  KEY `IDX_FPROPERTYTYPE` (`FPROPERTYTYPE`) USING BTREE,
  KEY `idx_fcustomerState` (`fcustomerState`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t_bk_customer_dec` */

DROP TABLE IF EXISTS `t_bk_customer_dec`;

CREATE TABLE `t_bk_customer_dec` (
  `FID` varchar(50) NOT NULL,
  `FNAME` varchar(50) DEFAULT NULL COMMENT '客户名称',
  `FNUMBER` varchar(50) DEFAULT NULL COMMENT '客户编号',
  `FSIMPLEPINYIN` varchar(50) DEFAULT NULL COMMENT '客户简拼',
  `FDESCRIPTION` varchar(50) DEFAULT NULL COMMENT '客户描述',
  `FCREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `FKCREATORID` varchar(44) DEFAULT NULL COMMENT '创建人',
  `FLASTUPDATETIME` datetime DEFAULT NULL COMMENT '最后修改时间',
  `FKUPDATORID` varchar(44) DEFAULT NULL COMMENT '最后修改人',
  `FKCONTROLUNITID` varchar(44) DEFAULT NULL,
  `FKORGID` varchar(44) DEFAULT NULL COMMENT '创建人组织',
  `FPUBLICLEVEL` varchar(50) DEFAULT NULL COMMENT '客户级别',
  `FTYPE` varchar(50) DEFAULT NULL COMMENT '客户类型',
  `FAREAFROM` decimal(15,2) DEFAULT NULL COMMENT '意向面积起',
  `FAREATO` decimal(15,2) DEFAULT NULL COMMENT '意向面积始',
  `FLAYOUTS` varchar(50) DEFAULT NULL COMMENT '意向户型',
  `FDECORATIONS` varchar(50) DEFAULT NULL COMMENT '意向装修',
  `FTOTALPRICEFROM` decimal(15,2) DEFAULT NULL COMMENT '意向总价（售或者租）起',
  `FTOTALPRICETO` decimal(15,2) DEFAULT NULL COMMENT '意向总价（售或者租）始',
  `FDIRECTIONS` varchar(50) DEFAULT NULL COMMENT '意向朝向',
  `FFLOORFROM` decimal(11,0) DEFAULT NULL COMMENT '意向楼层起',
  `FFLOORTO` decimal(11,0) DEFAULT NULL COMMENT '意向楼层始',
  `FROOMAGEFROM` decimal(11,0) DEFAULT NULL COMMENT '意向房龄起',
  `FROOMAGETO` decimal(11,0) DEFAULT NULL COMMENT '意向房龄始',
  `FFACILITY` varchar(50) DEFAULT NULL COMMENT '意向配套设施(交通配套)',
  `FCUSTOMERSOURCE` varchar(50) DEFAULT NULL COMMENT '客户来源',
  `FINTENTIONTYPE` varchar(50) DEFAULT NULL COMMENT '意向类型  买  租  联动',
  `FINTENTIONDESCRIPTION` text COMMENT '意向描述',
  `FPRICEFROM` decimal(15,2) DEFAULT NULL COMMENT '单价起',
  `FPRICETO` decimal(15,2) DEFAULT NULL COMMENT '单价始',
  `FCUSTOMERPURPOSE` varchar(50) DEFAULT NULL COMMENT '客户用途(投资/自住)',
  `FNEED` text COMMENT '客户要求',
  `FINTENTIONAREA` text COMMENT '意向区域',
  `FINTENTIONREGION` text COMMENT '意向片区',
  `FHOUSESNAME` text COMMENT '意向楼盘',
  `FCUSTOMERIMPORTTYPE` varchar(50) DEFAULT NULL,
  `FCONTACTPERSONNAME` varchar(50) DEFAULT NULL COMMENT '联系人名字',
  `FCOOPERATIONTYPE` varchar(50) DEFAULT NULL,
  `FFOLLOWDATE` datetime DEFAULT NULL COMMENT '最后跟进日期',
  `FTOPUBLICDESC` text COMMENT '转公备注',
  `FPROPERTYTYPE` varchar(50) DEFAULT NULL COMMENT '物业类型(用途)',
  `FINTENTIONAREATYPE` varchar(100) DEFAULT NULL COMMENT '意向位置类型：\r\n按片区\r\n按商圈\r\n按地铁\r\n按公交',
  `FDISTANCENUMBER` decimal(11,0) DEFAULT NULL COMMENT '距离 数字',
  `FINTENTIONCITY` text COMMENT '意向城市',
  `FHOUSESID` text COMMENT '客户意向楼盘ID串',
  `FKFASTSALECUSTOMERID` varchar(44) DEFAULT NULL COMMENT '快消客ID',
  `FCUSTOMERDEALNUM` decimal(65,30) DEFAULT NULL COMMENT '成交次数',
  `FCUSTOMERTEL` text COMMENT '客户的电话号码',
  `FKWEBCUSID` varchar(44) DEFAULT NULL,
  `fkcreateOrgid` varchar(50) DEFAULT NULL,
  `FDR` int(11) DEFAULT NULL,
  `family` varchar(10) DEFAULT NULL,
  `Fnum` varchar(10) DEFAULT NULL,
  `fworkAddres` varchar(100) DEFAULT NULL,
  `fworkArea` varchar(20) DEFAULT NULL,
  `FBuyType` varchar(20) DEFAULT NULL,
  `fbelongPersonNum` varchar(20) DEFAULT NULL,
  `finfoType` varchar(20) DEFAULT NULL,
  `fcompanyName` varchar(40) DEFAULT NULL,
  `fbusinessLicence` varchar(60) DEFAULT NULL,
  `fcustomerState` varchar(60) DEFAULT NULL,
  `oldFKCREATORID` varchar(44) DEFAULT NULL,
  `oldFKORGID` varchar(44) DEFAULT NULL,
  `moblie` text COMMENT '解密后的电话号码',
  PRIMARY KEY (`FID`),
  UNIQUE KEY `PK_T_BK_CUSTOMER` (`FID`) USING BTREE,
  KEY `IDX_T_BK_CUSTOMER_FTYPE` (`FTYPE`) USING BTREE,
  KEY `IDX_T_BK_CUSTOMER_FINTENTIONTYPE` (`FINTENTIONTYPE`) USING BTREE,
  KEY `IDX_T_BK_CUSTOMER_FNUMBER` (`FNUMBER`) USING BTREE,
  KEY `IDX_fcustomerSource` (`FCUSTOMERSOURCE`) USING BTREE,
  KEY `IDX_FINTENTIONTYPE` (`FINTENTIONTYPE`) USING BTREE,
  KEY `IDX_FKORGID` (`FKORGID`) USING BTREE,
  KEY `IDX_FDR` (`FDR`) USING BTREE,
  KEY `IDX_FPROPERTYTYPE` (`FPROPERTYTYPE`) USING BTREE,
  KEY `idx_fcustomerState` (`fcustomerState`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t_bk_customerfollow` */

DROP TABLE IF EXISTS `t_bk_customerfollow`;

CREATE TABLE `t_bk_customerfollow` (
  `FID` varchar(50) NOT NULL,
  `FNAME` varchar(50) DEFAULT NULL,
  `FNUMBER` varchar(50) DEFAULT NULL,
  `FSIMPLEPINYIN` varchar(50) DEFAULT NULL,
  `FDESCRIPTION` varchar(50) DEFAULT NULL,
  `FCREATETIME` datetime DEFAULT NULL,
  `FKCREATORID` varchar(44) DEFAULT NULL,
  `FLASTUPDATETIME` datetime DEFAULT NULL,
  `FKUPDATORID` varchar(44) DEFAULT NULL,
  `FKCONTROLUNITID` varchar(44) DEFAULT NULL,
  `FKORGID` varchar(44) DEFAULT NULL,
  `FKCUSTOMERID` varchar(44) DEFAULT NULL,
  `FMOBILE` varchar(50) DEFAULT NULL,
  `FCUSTOMERFOLLOWTYPE` varchar(50) DEFAULT NULL,
  `FCUSTOMERNAME` varchar(50) DEFAULT NULL,
  `FCONTENT` text COMMENT '跟进内容',
  `FFAILLUREMODE` varchar(50) DEFAULT NULL,
  `FCUSTOMERFOLLOWSORTTYPE` varchar(50) DEFAULT NULL,
  `FKCONTACTPERSONID` varchar(50) DEFAULT NULL,
  `FKPERSONID` varchar(44) DEFAULT NULL,
  `FKROOMLISTINGID` varchar(44) DEFAULT NULL COMMENT '关联盘ID',
  `FKGARDENSID` varchar(44) DEFAULT NULL COMMENT '楼盘ID',
  `FKROOMID` varchar(44) DEFAULT NULL,
  `FHOUSESID` text,
  `FDR` int(11) DEFAULT NULL,
  PRIMARY KEY (`FID`),
  KEY `fk_customer_index` (`FKCUSTOMERID`) USING BTREE,
  KEY `fkorgid_index` (`FKORGID`) USING BTREE,
  KEY `fkpersonid_index` (`FKPERSONID`) USING BTREE,
  KEY `fcreatetime_index` (`FCREATETIME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t_booking` */

DROP TABLE IF EXISTS `t_booking`;

CREATE TABLE `t_booking` (
  `bookingID` bigint(20) NOT NULL AUTO_INCREMENT,
  `bookingGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `companyGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `projGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `roomGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oppID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bgnDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `projNum` int(11) DEFAULT NULL,
  `roomNum` int(11) DEFAULT NULL,
  `bz` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total` double DEFAULT '0',
  `userGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` mediumtext COLLATE utf8_unicode_ci,
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `closeDate` datetime DEFAULT NULL,
  `reason` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `closeYy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sourceGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `yyPrefix` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mysoftGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oldid` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oldflowid` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ywbh_from` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roomGUID2` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roomGUID3` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sincereDegree` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roomHx` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupRuleGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupPrefix` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupNum` int(11) DEFAULT NULL,
  `bookingNumCode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preSelectedRoomGUID` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `lastMender` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modiDate` datetime DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `modifyTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`bookingID`),
  KEY `idx_t_book_roomGUID` (`roomGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=13573 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `t_broker_roomfollow` */

DROP TABLE IF EXISTS `t_broker_roomfollow`;

CREATE TABLE `t_broker_roomfollow` (
  `FID` varchar(50) NOT NULL,
  `FNAME` varchar(50) DEFAULT NULL,
  `FNUMBER` varchar(50) DEFAULT NULL,
  `FSIMPLEPINYIN` varchar(50) DEFAULT NULL,
  `FDESCRIPTION` text,
  `FCREATETIME` datetime DEFAULT NULL,
  `FKCREATORID` varchar(44) DEFAULT NULL,
  `FLASTUPDATETIME` datetime DEFAULT NULL,
  `FKUPDATORID` varchar(44) DEFAULT NULL,
  `FKCONTROLUNITID` varchar(44) DEFAULT NULL,
  `FKORGID` varchar(44) DEFAULT NULL,
  `FKROOMLISTINGID` varchar(44) DEFAULT NULL,
  `FKROOMID` varchar(44) DEFAULT NULL,
  `FKOWNERID` varchar(44) DEFAULT NULL,
  `FTELNUMBER` varchar(50) DEFAULT NULL,
  `FKFOLLOWPERSONID` varchar(44) DEFAULT NULL,
  `FKFOLLOWORGID` varchar(44) DEFAULT NULL,
  `FCLIENTID` varchar(50) DEFAULT NULL,
  `FFOLLOWTYPE` varchar(50) DEFAULT NULL,
  `FFOLLOWRESULT` varchar(50) DEFAULT NULL,
  `FFOLLOWSORT` varchar(45) DEFAULT NULL,
  `FKEYFOLLOW` int(11) DEFAULT NULL,
  `FORGNAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FID`),
  KEY `room_index` (`FKROOMLISTINGID`) USING BTREE,
  KEY `createtime_index` (`FCREATETIME`) USING BTREE,
  KEY `fkcreatorid_index` (`FKCREATORID`) USING BTREE,
  KEY `fkorgid_index` (`FKORGID`) USING BTREE,
  KEY `ffollowsort_index` (`FFOLLOWSORT`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t_contract` */

DROP TABLE IF EXISTS `t_contract`;

CREATE TABLE `t_contract` (
  `contractID` bigint(20) NOT NULL AUTO_INCREMENT,
  `contractGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `companyGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `projGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `tradeGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `roomGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastSaleGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastSaleType` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contractNO` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qSDate` datetime DEFAULT NULL,
  `bldArea` float DEFAULT NULL,
  `tnArea` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `tnPrice` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `calMode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payformName` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discntValue` float DEFAULT NULL,
  `discntRemark` mediumtext COLLATE utf8_unicode_ci,
  `bldCjPrice` float DEFAULT NULL,
  `tnCjPrice` float DEFAULT NULL,
  `roomTotal` float DEFAULT NULL,
  `zxBz` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zxPrice` float DEFAULT NULL,
  `zxTotal` float DEFAULT NULL,
  `isZxkbrht` tinyint(4) DEFAULT NULL,
  `fsTotal` float DEFAULT NULL,
  `rmbHtTotal` float DEFAULT NULL,
  `bz` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exRate` float DEFAULT NULL,
  `htTotal` double DEFAULT '0',
  `ajBank` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ajTotal` float DEFAULT NULL,
  `ajYear` int(11) DEFAULT NULL,
  `gjjBank` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gjjTotal` float DEFAULT NULL,
  `gjjYear` int(11) DEFAULT NULL,
  `jFDate` datetime DEFAULT NULL,
  `bcFa` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ywy` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orderRemark` mediumtext COLLATE utf8_unicode_ci,
  `createdOn` datetime DEFAULT NULL,
  `createdBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastMender` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modiDate` datetime DEFAULT NULL,
  `auditBy` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auditingDate` datetime DEFAULT NULL,
  `roomBcTotal` float DEFAULT NULL,
  `fsRoomBcTotal` float DEFAULT NULL,
  `sjBcTotal` float DEFAULT NULL,
  `bcShr` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bcShDate` datetime DEFAULT NULL,
  `bcJbr` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bcJbDate` datetime DEFAULT NULL,
  `closeDate` datetime DEFAULT NULL,
  `ywblDate` datetime DEFAULT NULL,
  `closeReason` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isValid` tinyint(4) DEFAULT NULL,
  `earnest` float DEFAULT NULL,
  `baDate` datetime DEFAULT NULL,
  `cstCircs` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `yjQyDate` datetime DEFAULT NULL,
  `baSjDate` datetime DEFAULT NULL,
  `htLqMemo` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `htLqDate` datetime DEFAULT NULL,
  `isYdBbc` tinyint(4) DEFAULT NULL,
  `baJbr` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zCdiscntvalue` float DEFAULT NULL,
  `mysoftGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rhhtTotal` float DEFAULT NULL,
  `bankHzDate` datetime DEFAULT NULL,
  `ssdj` float DEFAULT NULL,
  `ydFkDate` datetime DEFAULT NULL,
  `ycFkDate` datetime DEFAULT NULL,
  `cxQyr` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cxQyDate` datetime DEFAULT NULL,
  `payformType` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bcBlJbr` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bcSjDate` datetime DEFAULT NULL,
  `bcBlQk` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isRequireBc` int(11) DEFAULT NULL,
  `noRequireBcRemark` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cxqyFl` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cxqyMemo` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employCardID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `htQsState` tinyint(4) DEFAULT NULL,
  `isJtChosen` tinyint(4) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `modifyTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`contractID`),
  KEY `index_status` (`status`),
  KEY `index_tradeguid` (`tradeGUID`),
  KEY `idx_tcntract_roomGUIDS` (`roomGUID`,`status`),
  KEY `idx_tcntract_contractGUID` (`contractGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=165152 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `t_contract_transfer` */

DROP TABLE IF EXISTS `t_contract_transfer`;

CREATE TABLE `t_contract_transfer` (
  `contractID` bigint(20) NOT NULL AUTO_INCREMENT,
  `contractGUID` varchar(70) NOT NULL COMMENT '源交易GUID',
  `projGUID` varchar(70) DEFAULT NULL COMMENT '项目GUID',
  `bldGUID` varchar(70) DEFAULT NULL COMMENT '楼栋GUID',
  `roomGUID` varchar(70) DEFAULT NULL COMMENT '房间GUID',
  `ownerGUID` varchar(70) DEFAULT NULL COMMENT '主业主GUID',
  `cstGUID` varchar(70) DEFAULT NULL COMMENT '主客户GUID',
  `userGUID` varchar(70) DEFAULT NULL COMMENT '业务员GUID',
  `companyGUID` varchar(70) DEFAULT NULL COMMENT '代理公司GUID',
  `propertyNumber` varchar(50) DEFAULT NULL COMMENT '房产证编号',
  `tradeStatus` varchar(20) DEFAULT NULL COMMENT '成交状态',
  `fauditStatus` varchar(20) DEFAULT NULL COMMENT '审批状态',
  `ftransferStatus` varchar(20) DEFAULT NULL COMMENT '过户状态',
  `fcalcStatus` varchar(20) DEFAULT NULL COMMENT '结算状态',
  `fchargecommStatus` varchar(20) DEFAULT NULL COMMENT '收佣状态',
  `standardCommiss` double DEFAULT NULL COMMENT '标准佣金',
  `receivedCommiss` double DEFAULT NULL COMMENT '已收佣金',
  `ownerCommiss` double DEFAULT NULL COMMENT '业主佣金',
  `cstCommiss` double DEFAULT NULL COMMENT '客户佣金',
  `fcusmargin` double DEFAULT NULL COMMENT '客户保证金',
  `contractDate` datetime DEFAULT NULL COMMENT '签约日期',
  `dealDate` datetime DEFAULT NULL COMMENT '成交日期',
  `transferDate` datetime DEFAULT NULL COMMENT '过户日期',
  `ajBank` varchar(30) DEFAULT NULL COMMENT '按揭银行',
  `ajTotal` double DEFAULT NULL COMMENT '按揭贷款额',
  `ajYear` int(11) DEFAULT NULL COMMENT '按揭年限',
  `gjjBank` varchar(30) DEFAULT NULL COMMENT '公积金银行',
  `gjjTotal` double DEFAULT NULL COMMENT '公积金贷款额',
  `gjjYear` int(11) DEFAULT NULL COMMENT '公积金年限',
  `intentionPrice` double DEFAULT NULL COMMENT '客户意向价格',
  `dealTotalPrice` double DEFAULT NULL COMMENT '实际成交价格',
  `ftaxes` double DEFAULT NULL COMMENT '税费',
  `bz` varchar(10) DEFAULT NULL COMMENT '交易币种',
  `ownerName` varchar(30) DEFAULT NULL COMMENT '主业主姓名',
  `ownerMobile` varchar(20) DEFAULT NULL COMMENT '主业主手机号',
  `ownerAddr` varchar(200) DEFAULT NULL COMMENT '主主业地址',
  `cstName` varchar(30) DEFAULT NULL COMMENT '主客户姓名',
  `cstMobile` varchar(20) DEFAULT NULL COMMENT '主客户手机号',
  `cstAddr` varchar(200) DEFAULT NULL COMMENT '主客户地址',
  `roomType` varchar(20) DEFAULT NULL COMMENT '房屋类型',
  `roomLayout` varchar(20) DEFAULT NULL COMMENT '房屋户型',
  `roomSize` double DEFAULT NULL COMMENT '房屋面积',
  `roomArea` varchar(20) DEFAULT NULL COMMENT '房屋区域',
  `roomCha` varchar(200) DEFAULT NULL COMMENT '房屋特色',
  `roomOrientation` varchar(20) DEFAULT NULL COMMENT '房屋朝向',
  `projName` varchar(20) DEFAULT NULL COMMENT '项目名称',
  `projArea` varchar(50) DEFAULT NULL COMMENT '项目区域',
  `isChange` tinyint(4) DEFAULT NULL COMMENT '是否变更中',
  `isChechan` tinyint(4) DEFAULT NULL COMMENT '是否撤单中',
  `sourceApp` int(11) DEFAULT NULL COMMENT '数据来源',
  `createdBy` varchar(70) DEFAULT NULL COMMENT '创建人GUID',
  `createdOn` datetime NOT NULL COMMENT '创建时间',
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`contractID`)
) ENGINE=InnoDB AUTO_INCREMENT=25658 DEFAULT CHARSET=utf8;

/*Table structure for table `t_cst_booking` */

DROP TABLE IF EXISTS `t_cst_booking`;

CREATE TABLE `t_cst_booking` (
  `BookingGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `oriCstGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `CstNum` smallint(6) DEFAULT NULL,
  `Booking2CstGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `cstGUID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`Booking2CstGUID`),
  KEY `idx_cst_book_BooGUID` (`BookingGUID`),
  KEY `idx_oriCstGUID` (`oriCstGUID`),
  KEY `idx_cstGUID` (`cstGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `t_cst_booking_copy` */

DROP TABLE IF EXISTS `t_cst_booking_copy`;

CREATE TABLE `t_cst_booking_copy` (
  `BookingGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `CstGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  `CstNum` smallint(6) DEFAULT NULL,
  `Booking2CstGUID` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Booking2CstGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `t_cst_trade` */

DROP TABLE IF EXISTS `t_cst_trade`;

CREATE TABLE `t_cst_trade` (
  `tradeGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '交易ID',
  `cstID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `oppGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '机会ID',
  `roomGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '房间ID',
  `projGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目GUID',
  `status` int(10) DEFAULT NULL COMMENT '状态',
  `statusTime` datetime NOT NULL COMMENT '状态时间',
  `statusReason` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态原因',
  `oriCstGUID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '明源客户ID',
  `cstGUID` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `cstNum` int(10) DEFAULT '0' COMMENT '联名时的客户序号',
  `propertyRate` double DEFAULT '0' COMMENT '联名占比',
  KEY `index_tradeGUID` (`tradeGUID`),
  KEY `index_cstGUID` (`cstID`),
  KEY `index_oppGUID` (`oppGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `t_getin` */

DROP TABLE IF EXISTS `t_getin`;

CREATE TABLE `t_getin` (
  `getinGUID` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `vouchGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `saleGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `saleType` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `getDate` datetime DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `itemType` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemName` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double DEFAULT '0',
  `bz` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exRate` float DEFAULT NULL,
  `rmbAmount` float DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preGetinGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fsettlCode` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fsettleNo` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `getForm` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `beforeYe` float DEFAULT NULL,
  `beforeRmbYe` float DEFAULT NULL,
  `afterYe` float DEFAULT NULL,
  `afterRmbYe` float DEFAULT NULL,
  `remark` mediumtext COLLATE utf8_unicode_ci,
  `inSequence` int(11) DEFAULT NULL,
  `zzdSequence` int(11) DEFAULT NULL,
  `roomGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `posGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outDate` datetime DEFAULT NULL,
  `posTerminal` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `holdBank` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `posCode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `yhPayform` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `posAmount` float DEFAULT NULL,
  `layOffFeeGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fgroup` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pzno` int(11) DEFAULT NULL,
  `rzBank` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flagInfo` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mysoftGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oldId` varchar(54) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oldRoomid` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inRoomid` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `saveStatus` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ssrmbamount` float DEFAULT NULL,
  `roomConfirmGuid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tKAmount` float DEFAULT NULL,
  `posRefCode` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `posOrder` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tkDate` datetime DEFAULT NULL,
  `posStatus` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `posTradeTime` datetime DEFAULT NULL,
  `isLock` int(11) DEFAULT NULL,
  `cwztGUID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bankNo` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `posBankNo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `modifyTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`getinGUID`),
  KEY `index_sale_guid` (`saleGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `orderID` bigint(20) NOT NULL AUTO_INCREMENT,
  `orderGUID` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `companyGUID` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `projGUID` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `tradeGUID` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `roomGUID` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `lastSaleGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastSaleType` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `potocolNO` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qsDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `bldArea` double DEFAULT NULL,
  `tnArea` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `tnPrice` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `calMode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payformName` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discntValue` double DEFAULT NULL,
  `discntRemark` mediumtext COLLATE utf8_unicode_ci,
  `bldCjPrice` double DEFAULT NULL,
  `tnCjPrice` double DEFAULT NULL,
  `roomTotal` double DEFAULT NULL,
  `zxBz` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zxPrice` double DEFAULT NULL,
  `zxTotal` double DEFAULT NULL,
  `isZxkbrht` tinyint(4) DEFAULT NULL,
  `fsTotal` double DEFAULT NULL,
  `rmbCjTotal` double DEFAULT NULL,
  `bz` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exRate` double DEFAULT NULL,
  `cjTotal` double DEFAULT NULL,
  `earnest` double DEFAULT NULL,
  `ajBank` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ajTotal` double DEFAULT NULL,
  `ajYear` int(11) DEFAULT NULL,
  `gjjBank` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gjjTotal` double DEFAULT NULL,
  `gjjYear` int(11) DEFAULT NULL,
  `orderType` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ywy` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cstGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orderRemark` mediumtext COLLATE utf8_unicode_ci,
  `createdOn` datetime DEFAULT NULL,
  `createdBy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastMender` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modiDate` datetime DEFAULT NULL,
  `auditBy` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auditingDate` datetime DEFAULT NULL,
  `isValid` tinyint(4) DEFAULT NULL,
  `closeDate` datetime DEFAULT NULL,
  `closeReason` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ywblDate` datetime DEFAULT NULL,
  `reMark` mediumtext COLLATE utf8_unicode_ci,
  `isDq` tinyint(4) DEFAULT NULL,
  `yjQyDate` datetime DEFAULT NULL,
  `isYdBbc` tinyint(4) DEFAULT NULL,
  `zCdiscntvalue` double DEFAULT NULL,
  `mysoftGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ssdj` double DEFAULT NULL,
  `cstCircs` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bankHzDate` datetime DEFAULT NULL,
  `printDate` datetime DEFAULT NULL,
  `ycQyDate` datetime DEFAULT NULL,
  `ycTdDate` datetime DEFAULT NULL,
  `payformType` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `glGUID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isGl` tinyint(4) DEFAULT NULL,
  `employCardID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isSigned` tinyint(4) DEFAULT NULL,
  `createTime` datetime NOT NULL,
  `modifyTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`orderID`),
  KEY `idx_torder_roomGUID` (`roomGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=183265 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `t_trade_dealreport` */

DROP TABLE IF EXISTS `t_trade_dealreport`;

CREATE TABLE `t_trade_dealreport` (
  `FID` varchar(44) NOT NULL COMMENT '主键',
  `FNUMBER` varchar(30) DEFAULT NULL COMMENT '成交报告编码',
  `FTRADESTATUS` varchar(20) DEFAULT NULL COMMENT '交易状态',
  `FAUDITSTATUS` varchar(20) DEFAULT NULL COMMENT '审批状态',
  `FTRANSFERSTATUS` varchar(20) DEFAULT NULL COMMENT '过户状态',
  `FCALCSTATUS` varchar(20) DEFAULT NULL COMMENT '结算状态',
  `FCHARGECOMMSTATUS` varchar(20) DEFAULT NULL COMMENT '收佣状态',
  `FKGARDENID` varchar(44) DEFAULT NULL COMMENT '楼盘对象',
  `FKCUSTOMERID` varchar(44) DEFAULT NULL COMMENT '客户对象',
  `FCUSTOMERNAME` varchar(200) DEFAULT NULL COMMENT '客户名称[冗余]',
  `FKTRANSFERID` varchar(44) DEFAULT NULL COMMENT '过户对象[暂无]',
  `FKROOMLISTINGID` varchar(44) DEFAULT NULL COMMENT '放盘对象',
  `FDEALDATE` datetime DEFAULT NULL COMMENT '成交日期',
  `FDEALTOTALPRICE` decimal(18,2) DEFAULT NULL COMMENT '成交总价',
  `FCUSMARGIN` decimal(12,2) DEFAULT NULL COMMENT '客户保证金',
  `FNORMALCOMMISS` decimal(12,2) DEFAULT NULL COMMENT '标准佣金',
  `FCUSCOMMISS` decimal(12,2) DEFAULT NULL COMMENT '客户佣金',
  `FOWNCOMMISS` decimal(12,2) DEFAULT NULL COMMENT '业主佣金',
  `FMORTGAGETYPE` varchar(20) DEFAULT NULL COMMENT '按揭手续费类型',
  `FSALETYPE` varchar(20) DEFAULT NULL COMMENT '销售类型',
  `FCOOPERATDEDUCT` decimal(12,2) DEFAULT NULL COMMENT '合作扣除费',
  `FCOOPERATDESC` text COMMENT '合作描述',
  `FPERFORMANCE` decimal(12,2) DEFAULT NULL COMMENT '上报业绩',
  `FOWNBEARPAYTYPE` varchar(20) DEFAULT NULL COMMENT '业主费用约定描述',
  `FCUSBEARPAYTYPE` varchar(20) DEFAULT NULL COMMENT '客户费用约定描述',
  `FDESC` text COMMENT '备注',
  `FKDEALPERSONID` varchar(44) DEFAULT NULL COMMENT '成交业务员ID',
  `FPROPERTYNAME` varchar(200) DEFAULT NULL COMMENT '物业房产证名称',
  `FKDEALORGID` varchar(44) DEFAULT NULL COMMENT '成交组织ID',
  `FKMORTGAGEORGID` varchar(44) DEFAULT NULL COMMENT '按揭组织',
  `FKMORTGAGEPERSONID` varchar(44) DEFAULT NULL COMMENT '按揭人员ID',
  `FCUSPAYTYPE` varchar(20) DEFAULT NULL COMMENT '客户付款方式',
  `FSUBIMITDATE` datetime DEFAULT NULL COMMENT '提交日期',
  `FBUSSAUDITDATE` datetime DEFAULT NULL COMMENT '业务审核日期',
  `FPERFORMANCEDATE` datetime DEFAULT NULL COMMENT '业绩日期',
  `FCOMMISSADJUSTAMOUNT` decimal(10,2) DEFAULT NULL COMMENT '佣金调整金额',
  `FCANDEL` decimal(1,0) DEFAULT NULL COMMENT '是否可删除',
  `FFINANCEAUDITDATE` datetime DEFAULT NULL COMMENT '财务审核日期',
  `FKFINANCEPERSONID` varchar(44) DEFAULT NULL COMMENT '财务审核人Id',
  `FFINANCENAME` varchar(20) DEFAULT NULL COMMENT '财务审核人姓名',
  `FINTENTIONDATE` datetime DEFAULT NULL COMMENT '意向日期',
  `FHASPAPERCONTRACT` decimal(1,0) DEFAULT NULL COMMENT '是否有纸质合同',
  `FTRANSFERDATE` datetime DEFAULT NULL COMMENT '过户日期',
  `FKMANAGERORGID` varchar(44) DEFAULT NULL COMMENT '管辖组织Id',
  `FKCREATORID` varchar(44) DEFAULT NULL COMMENT '创建人Id',
  `FKORGID` varchar(44) DEFAULT NULL COMMENT '创建人组织ID',
  `FCREATETIME` datetime DEFAULT NULL COMMENT '创建时间',
  `FVALID` decimal(1,0) DEFAULT NULL COMMENT '是否有效',
  `FBACKORDERDATE` datetime DEFAULT NULL COMMENT '退订日期',
  `FBACKORDERDESC` text COMMENT '退订描述',
  `FKUPDATORID` varchar(44) DEFAULT NULL COMMENT '最后修改人',
  `FLASTUPDATETIME` datetime DEFAULT NULL COMMENT '最后修改时间',
  `FCOOPERATIDS` text COMMENT '合作分行ID串',
  `FHASCOMMISSDEDUCT` decimal(1,0) DEFAULT NULL COMMENT '是否有佣金扣除',
  `FTAXES` decimal(10,2) DEFAULT NULL COMMENT '税费',
  `FDEDUCTDESC` text COMMENT '扣除说明',
  `FPROPERTYNUMBER` varchar(50) DEFAULT NULL COMMENT '房产证编号',
  `FKMORTGAGEBANKID` varchar(44) DEFAULT NULL COMMENT '按揭银行',
  `FMORTGAGEOWE` decimal(12,2) DEFAULT NULL COMMENT '按揭欠款',
  `FCONTRACTNUMBER` varchar(50) DEFAULT NULL COMMENT '纸质合同编号',
  `FOWNERNAMES` varchar(100) DEFAULT NULL COMMENT '业主名称字符串，以逗号隔开',
  `FKFINANCEAUDITORG` text COMMENT '财务可视组织',
  `FKBUSSORG` text COMMENT '业务可视组织',
  `FCOOPERATNAMES` varchar(200) DEFAULT NULL COMMENT '业绩分配人员名称长串',
  `FSINCERITYMARGIN` decimal(12,2) DEFAULT NULL COMMENT '诚意保证金',
  `FMORTGAGEBANKNAME` varchar(40) DEFAULT NULL COMMENT '按揭银行名称',
  `FMORTGAGECOST` decimal(6,0) DEFAULT NULL COMMENT '按揭手续费',
  `FDISCOUNTCOMMISS` decimal(12,2) DEFAULT NULL COMMENT '折扣',
  `FKEARLYAUDITPERSON` varchar(44) DEFAULT NULL COMMENT '初审人',
  `FEARLYAUDITDATE` datetime DEFAULT NULL COMMENT '初审时间',
  `FEARLYAUDITDESC` text COMMENT '初审人描述',
  `FEARLYAUDITSTATE` varchar(20) DEFAULT NULL COMMENT '初审状态',
  `FKENDAUDITPERSON` varchar(44) DEFAULT NULL COMMENT '终审人',
  `FENDAUDITDATE` datetime DEFAULT NULL COMMENT '终审时间',
  `FENDAUDITDESC` text COMMENT '终审人描述',
  `FENDAUDITSTATE` varchar(20) DEFAULT NULL COMMENT '终审状态',
  `FSETTLEMENTSTATUS` varchar(30) DEFAULT NULL COMMENT '结算进程',
  `FSETTLEMENTAMOUNT` decimal(12,2) DEFAULT NULL COMMENT '结算金额',
  `FCHARGECOMMISS` decimal(10,2) DEFAULT NULL COMMENT '已收佣金',
  `FDEDUCTION` decimal(10,2) DEFAULT NULL COMMENT '预留扣款',
  `FFINANCEDESC` text COMMENT '财务审核描述',
  `FFINANCESTATE` varchar(200) DEFAULT NULL COMMENT '财务审核状态',
  `FPROPERTYTYPE` varchar(25) DEFAULT NULL COMMENT '用途（CFProductType）',
  `FPROPERTYSTATUS` varchar(25) DEFAULT NULL COMMENT '产权状态',
  `FBUILDAREA` decimal(8,2) DEFAULT NULL COMMENT '建筑面积',
  `FROOMAREA` decimal(8,2) DEFAULT NULL COMMENT '套内面积',
  `FBEDROOM` decimal(4,0) DEFAULT NULL COMMENT '卧室',
  `FLIVINGROOM` decimal(4,0) DEFAULT NULL COMMENT '客厅',
  `FBATHROOM` decimal(4,0) DEFAULT NULL COMMENT '卫生间',
  `FBALCONY` decimal(4,0) DEFAULT NULL COMMENT '阳台',
  `FGARDENNAME` varchar(200) DEFAULT NULL COMMENT '无盘关联--物业名称',
  `FISINCOME` decimal(65,30) DEFAULT NULL,
  `FKCUSTOMERSOURCEID` varchar(44) DEFAULT NULL COMMENT '客户来源',
  `FLOCK` decimal(65,30) DEFAULT NULL COMMENT ' 锁定    1：锁定  ，0不锁定     锁定后除财务人员外，都不可修改',
  `FMODIFING` decimal(65,30) DEFAULT NULL COMMENT '是否变更中',
  `FREVOCATIONING` decimal(65,30) DEFAULT NULL COMMENT '是否撤单中',
  `FAGENCYCOMMISS` decimal(12,2) DEFAULT NULL COMMENT '代理佣金',
  `FAGENCYCOMMISSDESC` text COMMENT '代理佣金描述',
  `FPROJECTPART` decimal(12,2) DEFAULT NULL COMMENT '项目成分',
  `FPROJECTCOMMISSDEDUCT` decimal(12,2) DEFAULT NULL COMMENT '项目佣金扣除',
  `FPROJECTPARTDESC` text COMMENT '项目成分描述',
  `FAGENCYPART` decimal(12,2) DEFAULT NULL COMMENT '联动代理成分',
  `FAGENCYCOMMISSDEDUCT` decimal(12,2) DEFAULT NULL COMMENT '联动佣金扣除',
  `FAGENCYPARTDESC` text COMMENT '联动代理描述',
  `FAGENCYPERFORMANCE` decimal(12,2) DEFAULT NULL COMMENT '代理可上报业绩',
  `FFASTPERFORMANCE` decimal(12,2) DEFAULT NULL COMMENT '快消联动可上报业绩',
  `FKHOUSEPROJECTID` varchar(44) DEFAULT NULL COMMENT '项目ID',
  `FHOUSEPROJECTNAME` varchar(30) DEFAULT NULL COMMENT '项目 名称',
  `FHOUSEPROJECTAMOUNT` decimal(12,2) DEFAULT NULL COMMENT '项目提成比例',
  `FCUSTYPE` varchar(30) DEFAULT NULL COMMENT '客户类型',
  `OriginOwnCommiss` decimal(9,2) DEFAULT NULL,
  `OwnCommissRate` decimal(9,2) DEFAULT NULL,
  `ReceiveOwnCommiss` decimal(9,2) DEFAULT NULL,
  `OriginCusCommiss` decimal(9,2) DEFAULT NULL,
  `CusCommissRate` decimal(9,2) DEFAULT NULL,
  `ReceiveCusCommiss` decimal(9,2) DEFAULT NULL,
  `OriginAllCommiss` decimal(9,2) DEFAULT NULL,
  `AllCommissRate` decimal(9,2) DEFAULT NULL,
  `AllAfterRateCommiss` decimal(9,2) DEFAULT NULL,
  `ReceiveAllCommiss` decimal(9,2) DEFAULT NULL,
  `OriginalCharge` decimal(9,2) DEFAULT NULL,
  `DiscountCharge` decimal(9,2) DEFAULT NULL,
  `ReceiveCharge` decimal(9,2) DEFAULT NULL,
  `BondingCompany` varchar(30) DEFAULT NULL,
  `fguarantee` decimal(9,2) DEFAULT NULL,
  `fGuaranteeDiscount` decimal(10,2) DEFAULT NULL,
  `fkguaranteeCompany` varchar(44) DEFAULT NULL,
  `fcompanyGet` decimal(10,2) DEFAULT NULL,
  `FBILLAUDITSTATUS` varchar(50) DEFAULT NULL,
  `agentType` varchar(50) DEFAULT NULL,
  `endKFFinhshTime` datetime DEFAULT NULL,
  `kFCommedStatus` varchar(50) DEFAULT NULL,
  `oldfkdealpersonid` varchar(44) DEFAULT NULL,
  `oldfkdealorgid` varchar(44) DEFAULT NULL,
  `idcardTelKey` varchar(5000) DEFAULT NULL,
  `fprocessDate` datetime DEFAULT NULL,
  PRIMARY KEY (`FID`),
  UNIQUE KEY `PK_T_TRADE_DEALREPORT` (`FID`) USING BTREE,
  UNIQUE KEY `index_tradeno` (`FNUMBER`) USING BTREE,
  KEY `IDX_T_TRADE_DEALREPORT_FGARDENNAME` (`FGARDENNAME`) USING BTREE,
  KEY `IDX_T_TRADE_DEALREPORT_FCUSTOMERNAME` (`FCUSTOMERNAME`) USING BTREE,
  KEY `IDX_T_TRADE_DEALREPORT_FOWNERNAMES` (`FOWNERNAMES`) USING BTREE,
  KEY `IDX_T_TRADE_DEALREPORT_FVALID` (`FVALID`) USING BTREE,
  KEY `IDX_T_TRADE_DEALREPORT_FKGARDENID` (`FKGARDENID`) USING BTREE,
  KEY `IDX_T_TRADE_DEALREPORT_IDX_T_TRADE_DEALREPORT_` (`FKMANAGERORGID`) USING BTREE,
  KEY `IDX_T_TRADE_DEALREPORT_FKDEALORGID` (`FKDEALORGID`) USING BTREE,
  KEY `IDX_T_TRADE_DEALREPORT_FKDEALPERSONID` (`FKDEALPERSONID`) USING BTREE,
  KEY `IDX_T_TRADE_DEALREPORT_FKCUSTOMERSOURCEID` (`FKCUSTOMERSOURCEID`) USING BTREE,
  KEY `idx_FcontractNumber` (`FCONTRACTNUMBER`) USING BTREE,
  KEY `IDX_FDEALDATE` (`FDEALDATE`) USING BTREE,
  KEY `idx_FBILLAUDITSTATUS` (`FBILLAUDITSTATUS`) USING BTREE,
  KEY `IDX_T_TRADE_DEALREPORT_FKHOUSEPROJECTID` (`FKHOUSEPROJECTID`) USING BTREE,
  KEY `idx_FBUSSAUDITDATE` (`FBUSSAUDITDATE`) USING BTREE,
  KEY `idx_FTRADESTATUS` (`FTRADESTATUS`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tbl_Owner` */

DROP TABLE IF EXISTS `tbl_Owner`;

CREATE TABLE `tbl_Owner` (
  `tmpID` int(11) NOT NULL,
  `BuildingID` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `BuildingName` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `RoomID` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `RoomArea` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `RoomUseArea` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `OwnerID` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `OwnerName` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `OwnerPhone1` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `OwnerPhone2` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `OwnerTel` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `TenantsID` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `TenantsName` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `TenantsPhone1` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `TenantsPhone2` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `TenantsTel` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `Householder` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `HouseholderName` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `HouseholderPhone1` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `HouseholderPhone2` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `HouseholderTel` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `ZoneID` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `ZoneName` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `BodyID` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `BodyName` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `tmpInputDate` datetime DEFAULT NULL,
  `tmpIsUsed` int(11) DEFAULT NULL,
  `OwnerType` int(11) DEFAULT NULL,
  `BuildingFloor` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `roomGUID` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`tmpID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Table structure for table `tmp_cst_count_all` */

DROP TABLE IF EXISTS `tmp_cst_count_all`;

CREATE TABLE `tmp_cst_count_all` (
  `cstGUID` bigint(20) DEFAULT NULL,
  `deal_date` datetime DEFAULT NULL,
  `isMerge` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tmp_cst_count_mutil_all` */

DROP TABLE IF EXISTS `tmp_cst_count_mutil_all`;

CREATE TABLE `tmp_cst_count_mutil_all` (
  `cstGUID` bigint(20) DEFAULT NULL,
  `isMerge` decimal(41,0) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tt_test` */

DROP TABLE IF EXISTS `tt_test`;

CREATE TABLE `tt_test` (
  `cstGUID` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `user_number` */

DROP TABLE IF EXISTS `user_number`;

CREATE TABLE `user_number` (
  `userName` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '号段描叙',
  `beginNumber` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '开始号段',
  `endNumber` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '结束号段',
  `ismgCode` int(10) DEFAULT NULL,
  `areaCode` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `mobileFlag` int(10) DEFAULT NULL COMMENT '运营商标记：0移动，1联通，2电信'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `user_number_city` */

DROP TABLE IF EXISTS `user_number_city`;

CREATE TABLE `user_number_city` (
  `mobileCode` int(11) NOT NULL,
  `cityname` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `areaCode` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`mobileCode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `user_number_city_copy` */

DROP TABLE IF EXISTS `user_number_city_copy`;

CREATE TABLE `user_number_city_copy` (
  `mobileCode` int(11) NOT NULL,
  `cityname` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `areaCode` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`mobileCode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `v_prj_commpany_area_1` */

DROP TABLE IF EXISTS `v_prj_commpany_area_1`;

CREATE TABLE `v_prj_commpany_area_1` (
  `ProjGUID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '源项目GUID',
  `ProjName` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '项目名称',
  `companyGUID` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司GUID',
  `hierarchyCode` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `area_id` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cityCode` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `yuyu2` */

DROP TABLE IF EXISTS `yuyu2`;

CREATE TABLE `yuyu2` (
  `cstguids` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `zDeal` */

DROP TABLE IF EXISTS `zDeal`;

CREATE TABLE `zDeal` (
  `FID` varchar(44) NOT NULL,
  `FKORGID` varchar(44) DEFAULT NULL,
  `FORGNAME` varchar(80) DEFAULT NULL,
  `FNUMBER` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '成交报告编码',
  `FKGARDENID` varchar(44) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '楼盘对象',
  `FKCUSTOMERID` varchar(44) DEFAULT NULL,
  `FKROOMLISTINGID` varchar(44) DEFAULT NULL COMMENT '房间ID',
  `FDEALDATE` datetime DEFAULT NULL COMMENT '成交日期',
  `FDEALTOTALPRICE` decimal(18,2) DEFAULT NULL COMMENT '成交总价',
  `FNORMALCOMMISS` decimal(12,2) DEFAULT NULL,
  `FSALETYPE` varchar(20) DEFAULT NULL,
  `FPROPERTYNAME` varchar(200) DEFAULT NULL,
  `FCUSPAYTYPE` varchar(20) DEFAULT NULL,
  `FLASTUPDATETIME` datetime DEFAULT NULL,
  `cstGUIDS` bigint(20) DEFAULT NULL,
  `SID` varchar(44) DEFAULT NULL COMMENT '拥有此房产的客户ID',
  `SID1` varchar(44) DEFAULT NULL,
  `SRELATION` varchar(44) DEFAULT NULL,
  `cstGUIDB` bigint(20) DEFAULT NULL,
  `BID` varchar(44) DEFAULT NULL COMMENT '购买或者租此房间的客户ID',
  `BID1` varchar(44) DEFAULT NULL,
  `BRELATION` varchar(44) DEFAULT NULL,
  `FKHOUSEPROJECTID` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `FHOUSEPROJECTNAME` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `zRoomlist` */

DROP TABLE IF EXISTS `zRoomlist`;

CREATE TABLE `zRoomlist` (
  `FKROOMID` varchar(44) NOT NULL,
  `FPRICE` decimal(20,2) DEFAULT NULL,
  `FRENT` decimal(15,2) DEFAULT NULL,
  `FLISTINGTYPE` varchar(50) DEFAULT NULL,
  `FLASTFOLLOWDATE` datetime DEFAULT NULL,
  `FCREATETIME` datetime DEFAULT NULL,
  `FLASTUPDATETIME` datetime DEFAULT NULL,
  `FKGARDENID` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `FBUILDINGIDS` varchar(4000) DEFAULT NULL,
  `FFLOORIDS` varchar(4000) DEFAULT NULL,
  `FDIRECTION` varchar(50) DEFAULT NULL,
  `FBUILDAREA` decimal(15,2) DEFAULT NULL,
  `FBEDROOM` decimal(15,0) DEFAULT NULL,
  `FLIVINGROOM` decimal(15,0) DEFAULT NULL,
  `FBATHROOM` decimal(15,0) DEFAULT NULL,
  `FROOMNUMBER` varchar(50) DEFAULT NULL,
  `FTOTALFLOOR` decimal(8,0) DEFAULT NULL,
  `FFLOORNUM` decimal(8,0) DEFAULT NULL,
  `FROOMNUMBERSTR` varchar(100) DEFAULT NULL,
  `FGARDENNAME` varchar(100) DEFAULT NULL,
  `FBUILDNAME` varchar(100) DEFAULT NULL,
  `FAREANAME` varchar(50) DEFAULT NULL,
  `FAREAID` varchar(50) DEFAULT NULL,
  `FPARENTAREAID` varchar(50) DEFAULT NULL,
  `FStatus` int(10) DEFAULT NULL COMMENT '当前出租出售状态',
  PRIMARY KEY (`FKROOMID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `zb_test_tmp` */

DROP TABLE IF EXISTS `zb_test_tmp`;

CREATE TABLE `zb_test_tmp` (
  `cstGUID` bigint(20) NOT NULL COMMENT '客户GUID',
  `label_guid` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `label_name` varchar(4) CHARACTER SET utf8 NOT NULL DEFAULT '',
  KEY `tmp_cstguid` (`cstGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*!50106 set global event_scheduler = 1*/;

/* Event structure for event `job1` */

/*!50106 DROP EVENT IF EXISTS `job1`*/;

DELIMITER $$

/*!50106 CREATE EVENT `job1` ON SCHEDULE AT '2015-10-12 00:51:15' ON COMPLETION NOT PRESERVE ENABLE DO call test */$$
DELIMITER ;

/* Function  structure for function  `func_compare_str` */

/*!50003 DROP FUNCTION IF EXISTS `func_compare_str` */;
DELIMITER $$

/*!50003 CREATE DEFINER=``@`` FUNCTION `func_compare_str`(`subStr` VARCHAR(50),`allStr` VARCHAR(100)) RETURNS int(11)
BEGIN
	#Routine body goes here...
  DECLARE i INT;
  SET i=1;
  WHILE SUBSTRING(SUBSTR,i,1)!='' DO
    IF INSTR(allStr,SUBSTRING(SUBSTR,i,1))=0 THEN
      RETURN i;
    END IF;
    SET i=i+1;
  END WHILE;
	RETURN 0;
END */$$
DELIMITER ;

/* Function  structure for function  `func_room_cmdp_to_wy` */

/*!50003 DROP FUNCTION IF EXISTS `func_room_cmdp_to_wy` */;
DELIMITER $$

/*!50003 CREATE DEFINER=``@`` FUNCTION `func_room_cmdp_to_wy`(`p_roomGUID` VARCHAR(64)) RETURNS int(1)
BEGIN
	#Routine body goes here...
  DECLARE r_projs VARCHAR(4000);
  
  /*楼栋代码*/
  DECLARE v_bldCode VARCHAR(50); 
  /*楼栋名称*/
  DECLARE v_bldName VARCHAR(50);
  /*单元名称*/
  DECLARE v_unit VARCHAR(50);
  /*房间编号*/
  DECLARE v_room VARCHAR(50);
  /*项目名称*/
  DECLARE v_projName VARCHAR(100);
  /*处理后楼栋编码*/
  DECLARE v_new_bldCode VARCHAR(50);
  /*包含座取座的信息*/
  DECLARE v_sub_bld VARCHAR(10);
  
  /*ROOMID*/
  DECLARE v_wy_roomID VARCHAR(50);
  
  /*匹配到的物业数据*/
  DECLARE v_tmpIDs VARCHAR(200);
  
  DECLARE v_roomGUID_Ok VARCHAR(64);
  /*获取CMPD中的房间信息*/
  SELECT t2.bldCode,t2.bldName,t1.unit,t1.room,t3.projName INTO v_bldCode,v_bldName,v_unit,v_room,v_projName FROM b_room t1,b_building t2,b_proj t3 WHERE t1.bldGUID=t2.bldGUID AND t1.projGUID=t3.projGUID  AND t1.roomGUID=p_roomGUID;
  
  
  /*重新定义特殊的项目名称*/
  IF v_projName ='深圳兰溪谷-国际公寓' THEN
     SET v_projName='深圳兰溪谷二期-国际公寓';
  END IF;
  IF v_projName ='深圳兰溪谷-国际公寓' THEN
     SET v_projName='深圳兰溪谷二期-国际公寓';
  END IF;
  SET v_projName=CONCAT('招商',v_projName);
  /*分析楼栋信息*/
  SET v_sub_bld= SUBSTRING_INDEX(SUBSTRING_INDEX(v_bldName,'座',1),'栋',-1);
  
  IF CAST(v_bldName AS UNSIGNED INT)>0 THEN
     SET v_new_bldCode=CAST(v_bldName AS UNSIGNED INT);
  ELSE
     SET v_new_bldCode=CAST(v_bldCode AS UNSIGNED INT);
  END IF;
  IF INSTR(v_bldName,'A栋')>0 OR INSTR(v_bldName,'B栋')>0 OR INSTR(v_bldName,'C栋')>0 OR INSTR(v_bldName,'D栋')>0 OR INSTR(v_bldName,'E栋')>0 OR INSTR(v_bldName,'F栋')>0 THEN
    SET v_new_bldCode=SUBSTRING_INDEX(v_bldName,'栋',1);
  END IF;
  /*精减单元*/
  SET v_unit=REPLACE(v_unit,'单元','');
  SET v_unit=REPLACE(v_unit,'号楼','');
  
  IF INSTR(v_unit,'座')>0 THEN
     SET v_unit=SUBSTRING_INDEX(v_unit,'座',1);
  END IF;
   
  /*判断是否是商铺*/
  IF INSTR(v_bldName,'商铺')>0 THEN
    
    /*特殊room处理*/
    SET v_room=REPLACE(v_room,'商店','');
    /*SP-room*/
    SET v_wy_roomID= CONCAT('SP','-',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      RETURN 1;
    END IF;
    SET v_wy_roomID= CONCAT('SP','-0',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      RETURN 1;
    END IF;    
    
    /*SPbldCode-room*/
    SET v_wy_roomID= CONCAT('SP',v_new_bldCode,'-',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      RETURN 1;
    END IF;
    SET v_wy_roomID= CONCAT('SP',v_new_bldCode,'-0',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      RETURN 1;
    END IF;
    /*bldCode-room*/
    SET v_wy_roomID= CONCAT(v_new_bldCode,'-',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      RETURN 1;
    END IF;
    SET v_wy_roomID= CONCAT('0',v_new_bldCode,'-0',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      RETURN 1;
    END IF;
    SET v_wy_roomID= CONCAT('0',v_new_bldCode,'-',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      RETURN 1;
    END IF;
    /*bldCode-SP-room*/
    SET v_wy_roomID= CONCAT(v_new_bldCode,'-SP-',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      RETURN 1;
    END IF;
    /*bldCode#room*/
    SET v_wy_roomID= CONCAT(v_new_bldCode,'#',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      RETURN 1;
    END IF;
  ELSEIF v_sub_bld IS NOT NULL AND v_sub_bld!='' THEN   /*包含座信息*/
    
    /*bldCode-subBld-room*/
    SET v_wy_roomID= CONCAT(v_new_bldCode,'-',v_sub_bld,'-',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      RETURN 1;
    END IF;  
   
    SET v_wy_roomID= CONCAT(v_new_bldCode,'-',v_sub_bld,'-0',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      RETURN 1;
    END IF;  
    SET v_wy_roomID= CONCAT('0',v_new_bldCode,'-',v_sub_bld,'-',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      RETURN 1;
    END IF;  
   
    SET v_wy_roomID= CONCAT('0',v_new_bldCode,'-',v_sub_bld,'-0',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      RETURN 1;
    END IF;
    /*subBld-room*/
    SET v_wy_roomID= CONCAT(v_sub_bld,'-',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      RETURN 1;
    END IF;
    SET v_wy_roomID= CONCAT(v_sub_bld,'-0',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      RETURN 1;
    END IF;
    
    /*有座同时有单元的*/
    IF  v_unit IS NOT NULL AND v_unit!=''  THEN
      SET v_wy_roomID= CONCAT(v_new_bldCode,'-',v_sub_bld,v_unit,'-',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         RETURN 1;
      END IF;
      SET v_wy_roomID= CONCAT(v_new_bldCode,'-',v_sub_bld,v_unit,'-0',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         RETURN 1;
      END IF;
      SET v_wy_roomID= CONCAT('0',v_new_bldCode,'-',v_sub_bld,v_unit,'-0',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         RETURN 1;
      END IF;
      SET v_wy_roomID= CONCAT('0',v_new_bldCode,'-',v_sub_bld,v_unit,'-',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         RETURN 1;
      END IF;
    END IF;
  END IF;
  /*有单元的匹配*/
  IF  v_unit IS NOT NULL AND v_unit!=''  THEN
    /*特殊情况 6#-A-2B*/
    IF INSTR(v_bldName,'＃')>0 OR INSTR(v_bldName,'#')>0 THEN
      SET v_wy_roomID= CONCAT(v_new_bldCode,'#-',v_unit,'-',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         RETURN 1;
      END IF;
    END IF;
      SET v_wy_roomID= CONCAT(v_new_bldCode,'-',v_unit,'-',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         RETURN 1;
      END IF;
      SET v_wy_roomID= CONCAT(v_new_bldCode,'-',v_unit,'-0',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         RETURN 1;
      END IF;
      SET v_wy_roomID= CONCAT('0',v_new_bldCode,'-',v_unit,'-0',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         RETURN 1;
      END IF;
      SET v_wy_roomID= CONCAT('0',v_new_bldCode,'-',v_unit,'-',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         RETURN 1;
      END IF;
  END IF;
    /*特殊情况 6#-2B*/
    IF INSTR(v_bldName,'＃')>0 OR INSTR(v_bldName,'#')>0 THEN
      SET v_wy_roomID= CONCAT(v_new_bldCode,'#-',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         RETURN 1;
      END IF;
    END IF;
  
  /*普通的匹配方式*/
 
      SET v_wy_roomID= CONCAT(v_new_bldCode,'-',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         RETURN 1;
      END IF;
      SET v_wy_roomID= CONCAT(v_new_bldCode,'-0',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         RETURN 1;
      END IF;
      SET v_wy_roomID= CONCAT('0',v_new_bldCode,'-0',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         RETURN 1;
      END IF;
      SET v_wy_roomID= CONCAT('0',v_new_bldCode,'-',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         RETURN 1;
      END IF;
      SET v_wy_roomID= CONCAT(v_new_bldCode,'D-',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         RETURN 1;
      END IF;
  
  
    RETURN 0;
END */$$
DELIMITER ;

/* Function  structure for function  `func_room_cmdp_to_wy_all` */

/*!50003 DROP FUNCTION IF EXISTS `func_room_cmdp_to_wy_all` */;
DELIMITER $$

/*!50003 CREATE DEFINER=``@`` FUNCTION `func_room_cmdp_to_wy_all`(p_tailInt INT) RETURNS varchar(400) CHARSET utf8
BEGIN
	#Routine body goes here...
  DECLARE done INT DEFAULT 0;
  DECLARE v_tmpID VARCHAR(64);
  DECLARE v_ok INT;
  DECLARE v_nothing INT;
  DECLARE v_ret INT;
  DECLARE r_str VARCHAR(200);
  
  DECLARE cur_room CURSOR FOR SELECT t1.roomGUID FROM b_room t1,b_proj t2 WHERE  t1.projGUID=t2.projGUID AND t2.projCode LIKE 'SZ.%' AND t2.projStatus='入伙' AND INSTR(t1.huXing,'车')=0 AND RIGHT(t1.roomID,2)=p_tailInt;
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
  SET v_ok = 0;
  SET v_nothing  = 0;
  SET v_ret=0;
  OPEN cur_room;
  FETCH cur_room INTO v_tmpID;  
  REPEAT   
   
     SET v_ret=func_room_cmdp_to_wy(v_tmpID);
     IF v_ret=1 THEN
       SET v_ok=v_ok+1;
     END IF;
     IF v_ret=0 THEN
       SET v_nothing=v_nothing+1;
     END IF;
     FETCH cur_room INTO v_tmpID;  
  UNTIL done END REPEAT;  
  CLOSE cur_room;  
   
  SET  r_str=CONCAT('匹配成功:',v_ok,'匹配不到:',v_nothing);
  
  RETURN r_str;
END */$$
DELIMITER ;

/* Function  structure for function  `func_room_find_wy` */

/*!50003 DROP FUNCTION IF EXISTS `func_room_find_wy` */;
DELIMITER $$

/*!50003 CREATE DEFINER=``@`` FUNCTION `func_room_find_wy`(`p_projName` VARCHAR(100),`p_roomID` VARCHAR(20)) RETURNS varchar(200) CHARSET utf8
BEGIN
	#Routine body goes here...
  DECLARE done INT DEFAULT 0;
  DECLARE v_tmpID VARCHAR(20);
  DECLARE r_str VARCHAR(200);
  DECLARE cur_tmpID CURSOR FOR SELECT tmpID FROM tbl_Owner WHERE func_compare_str(bodyName,p_projName)=0 AND RoomID=p_roomID;
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
  OPEN cur_tmpID;
  FETCH cur_tmpID INTO v_tmpID;  
  REPEAT      
     SET r_str=CONCAT_WS(',',r_str,v_tmpID);
     FETCH cur_tmpID INTO v_tmpID;
  UNTIL done END REPEAT;  
  CLOSE cur_tmpID;  
	RETURN r_str;
END */$$
DELIMITER ;

/* Function  structure for function  `func_room_upTmpID` */

/*!50003 DROP FUNCTION IF EXISTS `func_room_upTmpID` */;
DELIMITER $$

/*!50003 CREATE DEFINER=``@`` FUNCTION `func_room_upTmpID`(`p_roomID` VARCHAR(50),`p_projName` VARCHAR(200),`p_roomGUID` VARCHAR(200)) RETURNS int(1)
BEGIN
    DECLARE v_tmpIDs VARCHAR(200);
    SET v_tmpIDs = func_room_find_wy(p_projName ,p_roomID);
    IF v_tmpIDs IS NOT NULL AND v_tmpIDs!='' THEN
      UPDATE b_room SET wy_tmpID=v_tmpIDs WHERE roomGUID=p_roomGUID;
      RETURN 1;
    END IF;
	RETURN 0;
END */$$
DELIMITER ;

/* Function  structure for function  `func_room_wy_to_cmdp` */

/*!50003 DROP FUNCTION IF EXISTS `func_room_wy_to_cmdp` */;
DELIMITER $$

/*!50003 CREATE DEFINER=``@`` FUNCTION `func_room_wy_to_cmdp`(`p_tmpID` INT) RETURNS int(11)
BEGIN
  DECLARE r_projs VARCHAR(4000);
  DECLARE v_roomID VARCHAR(50);
  DECLARE v_bodyName VARCHAR(100);
  DECLARE v_bld VARCHAR(50);
  DECLARE v_room VARCHAR(50);
  
  DECLARE v_subProj VARCHAR(4000);
  DECLARE v_count INT;
  DECLARE v_roomGUID VARCHAR(64);
  DECLARE v_projGUID VARCHAR(64);
  DECLARE v_projName VARCHAR(100);
  
  DECLARE v_roomGUID_Ok VARCHAR(64);
  SELECT RoomID,bodyName INTO v_roomID , v_bodyName FROM tbl_Owner WHERE tmpID=p_tmpID;
  
  SELECT SUBSTRING_INDEX(v_roomID,'-',1) INTO v_bld;
  SELECT SUBSTRING_INDEX(v_roomID,'-',-1) INTO v_room;
  
  CALL proc_room_wy_to_cmdp(v_room,v_bld,r_projs);
  
  IF r_projs!='' THEN 
    
     SET v_count=0;
     REPEAT 
        
        SET v_subProj= SUBSTRING_INDEX(r_projs,'|',1);      
        SET v_projGUID=SUBSTRING_INDEX(v_subProj,',',1);
        SET v_roomGUID=SUBSTRING_INDEX(v_subProj,',',-1);
        
        IF (INSTR(r_projs,'|')>0) THEN
          SET r_projs= SUBSTRING(r_projs,INSTR(r_projs,'|')+1);
        ELSE
          SET r_projs='';
        END IF;
        SELECT projName INTO v_projName FROM b_proj WHERE projGUID=v_projGUID;
        IF func_compare_str(v_bodyName,v_projName)=0 THEN
          SET v_count=v_count+1;
          SET v_roomGUID_Ok=v_roomGUID;
        END IF;
       
     UNTIL r_projs='' END REPEAT;  
   
     IF v_count=1 THEN
       UPDATE tbl_Owner SET roomGUID=v_roomGUID_Ok WHERE tmpID=p_tmpID;
       RETURN 1;
     END IF;
     IF v_count>1 THEN
       UPDATE tbl_Owner SET roomGUID='99' WHERE tmpID=p_tmpID;
       RETURN v_count;
     END IF;
  END IF;
  
  RETURN 0;
END */$$
DELIMITER ;

/* Function  structure for function  `func_room_wy_to_cmdp_all` */

/*!50003 DROP FUNCTION IF EXISTS `func_room_wy_to_cmdp_all` */;
DELIMITER $$

/*!50003 CREATE DEFINER=``@`` FUNCTION `func_room_wy_to_cmdp_all`() RETURNS varchar(4000) CHARSET utf8
BEGIN
	#Routine body goes here...
  DECLARE done INT DEFAULT 0;
  DECLARE v_tmpID INT;
  DECLARE v_ok INT;
  DECLARE v_more INT;
  DECLARE v_nothing INT;
  DECLARE v_ret INT;
  DECLARE r_str VARCHAR(200);
  DECLARE cur_tmpID CURSOR FOR SELECT tmpID FROM tbl_Owner WHERE RIGHT(tmpID,1)=4;
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
  SET v_ok = 0;
  SET v_more  = 0;
  SET v_nothing  = 0;
  SET v_ret=0;
  OPEN cur_tmpID;
  FETCH cur_tmpID INTO v_tmpID;  
  REPEAT   
   
     SET v_ret=func_room_wy_to_cmdp(v_tmpID);
     IF v_ret=1 THEN
       SET v_ok=v_ok+1;
     END IF;
     IF v_ret>1 THEN
       SET v_more=v_more+1;
     END IF;
     IF v_ret=0 THEN
       SET v_nothing=v_nothing+1;
     END IF;
     FETCH cur_tmpID INTO v_tmpID;  
  UNTIL done END REPEAT;  
  CLOSE cur_tmpID;  
   
  SET  r_str=CONCAT('匹配成功:',v_ok,'无法确定:',v_more,'匹配不到:',v_nothing);
  
  RETURN r_str;
END */$$
DELIMITER ;

/* Function  structure for function  `getOrgChild` */

/*!50003 DROP FUNCTION IF EXISTS `getOrgChild` */;
DELIMITER $$

/*!50003 CREATE DEFINER=``@`` FUNCTION `getOrgChild`(orgId VARCHAR(100)) RETURNS varchar(4000) CHARSET utf8
BEGIN
	DECLARE sTemp VARCHAR(4000);
	DECLARE sTempChd VARCHAR(4000);
	SET sTemp = '$';
	SET sTempChd = orgId;
	WHILE sTempChd IS NOT NULL DO
		SET sTemp = CONCAT(sTemp,',',sTempChd);
		SELECT GROUP_CONCAT(orgGUID) INTO sTempChd FROM b_org WHERE orgType = 3 AND FIND_IN_SET(parentGUID,sTempChd)>0;
	END WHILE;
	RETURN sTemp;
    END */$$
DELIMITER ;

/* Function  structure for function  `get_week_beg` */

/*!50003 DROP FUNCTION IF EXISTS `get_week_beg` */;
DELIMITER $$

/*!50003 CREATE DEFINER=``@`` FUNCTION `get_week_beg`(pdate VARCHAR(10)) RETURNS char(50) CHARSET utf8
BEGIN 
 DECLARE weekNum INT;
 DECLARE begDate DATE;
 DECLARE rweekNum INT;
 SET  weekNum=ABS(DAYOFWEEK(pdate)  ); 
 
 IF weekNum=1 THEN 
      SET  rweekNum =6 ;
 ELSEIF  weekNum=2 THEN 
     SET  rweekNum =0  ; 
 ELSEIF  weekNum=3 THEN   
        SET  rweekNum = 1  ; 
 ELSEIF  weekNum=4 THEN   
        SET  rweekNum =2  ; 
 ELSEIF  weekNum=5 THEN   
        SET  rweekNum =3  ; 
 ELSEIF  weekNum=6 THEN   
        SET  rweekNum =4  ; 
 ELSEIF  weekNum=7 THEN   
        SET  rweekNum =5  ; 
 END IF;
 SET begDate=   DATE_ADD(pdate , INTERVAL -rweekNum DAY) ;  
 
 RETURN begDate;
 
END */$$
DELIMITER ;

/* Function  structure for function  `get_week_end` */

/*!50003 DROP FUNCTION IF EXISTS `get_week_end` */;
DELIMITER $$

/*!50003 CREATE DEFINER=``@`` FUNCTION `get_week_end`(pdate VARCHAR(10)) RETURNS char(50) CHARSET utf8
BEGIN 
 DECLARE weekNum INT;
 DECLARE begDate DATE;
 DECLARE rweekNum INT;
 SET  weekNum=ABS(DAYOFWEEK(pdate)  ); 
 
 IF weekNum=1 THEN 
      SET  rweekNum =0 ;
 ELSEIF  weekNum=2 THEN 
     SET  rweekNum =6  ; 
 ELSEIF  weekNum=3 THEN   
        SET  rweekNum = 5  ; 
 ELSEIF  weekNum=4 THEN   
        SET  rweekNum =4 ; 
 ELSEIF  weekNum=5 THEN   
        SET  rweekNum =3  ; 
 ELSEIF  weekNum=6 THEN   
        SET  rweekNum =2  ; 
 ELSEIF  weekNum=7 THEN   
        SET  rweekNum =1 ; 
 END IF;
 SET begDate=   DATE_ADD(pdate , INTERVAL rweekNum DAY) ;  
 RETURN begDate;
 
END */$$
DELIMITER ;

/* Function  structure for function  `queryFunctionTree` */

/*!50003 DROP FUNCTION IF EXISTS `queryFunctionTree` */;
DELIMITER $$

/*!50003 CREATE DEFINER=``@`` FUNCTION `queryFunctionTree`(functionId INT) RETURNS varchar(4000) CHARSET utf8
BEGIN
	DECLARE sTemp VARCHAR(4000);
	DECLARE sTempChd VARCHAR(4000);
	SET sTemp = '$';
	SET sTempChd = CAST(functionId AS CHAR);
	WHILE sTempChd IS NOT NULL DO
		SET sTemp = CONCAT(sTemp,',',sTempChd);
		SELECT GROUP_CONCAT(function_id) INTO sTempChd FROM sys_function WHERE FIND_IN_SET(parent_id,sTempChd)>0;
	END WHILE;
	RETURN sTemp;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `first_run1` */

/*!50003 DROP PROCEDURE IF EXISTS  `first_run1` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `first_run1`(in p_totaldate varchar(10))
BEGIN
  declare v_date date; 
  IF  p_totaldate ='AUTO' THEN
		   SET v_date =DATE_FORMAT (curdate()-1 ,'%Y-%m-%d');
  ELSE
		   SET	 v_date =  p_totaldate ;
  END IF;
  -- 中间表 
 
  call proc_report_cst_deal_own_2; 
  call proc_report_cst_deal_analyse_2;
  call proc_run_mid_table;
 
  call proc_b_proj_sum; 
 	call proc_rpt_cst_repeat_buy_detail;
	call proc_yx_customer_typeModel(v_date);
  call proc_stand_label_count; 
  
END */$$
DELIMITER ;

/* Procedure structure for procedure `first_run2` */

/*!50003 DROP PROCEDURE IF EXISTS  `first_run2` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `first_run2`(in p_totaldate varchar(10))
BEGIN
	#Routine body goes here...
  declare v_date date; 
  
  IF  p_totaldate ='AUTO' THEN
		   SET v_date =DATE_FORMAT (curdate()-1 ,'%Y-%m-%d');
  ELSE
		   SET	 v_date =  p_totaldate ;
  END IF;
 
  -- 项目 客户细分
  call proc_cust_attach_count(v_date);
  call proc_cust_bought_count(v_date);
  call proc_cust_count_main(v_date);
  call proc_rpt_format_convert(v_date);
  
  -- 项目 客户职业
  call proc_rpt_proj_cst_industry(v_date);
  call proc_rpt_proj_cst_origin(v_date);
  
 
  -- 项目  指标
 	call proc_rpt_index_flow(v_date);
	call proc_rpt_index_base(v_date); 
 
  call proc_xs_format_index(v_date);
  -- 项目 客服
  call proc_rpt_kf_format_index(v_date);
  call proc_rpt_kf_index_flow(v_date);
  call proc_rpt_kf_key_index(v_date);
  
  -- 项目 置业 
  call proc_projhome_zhiye(v_date);
  call proc_rpt_zy_key_index(v_date);
  -- 项目 首页  
  call proc_proj_cst_contract(v_date);
	call proc_proj_homepage_data(v_date);
	call proc_proj_homepage_data_1(v_date);
	call proc_proj_homepage_data_2(v_date);
	call proc_proj_homepage_data_3(v_date);  
  
  -- 客户
	call proc_kh_cst_number(v_date);
  call proc_stand_label_count; 
  -- 报表
 
  call proc_rpt_owner_feat_analyse(v_date);  
  call proc_rpt_format_sale_analyse(v_date);
  -- 营销
	-- call proc_yx_customer_typeModel(v_date);
  -- 标签
	call proc_lable_count(v_date);
 
  -- 仪表盘
	call proc_ybp_count(v_date); 
	call proc_ybp_kf_month_ruhuo(v_date);
	call proc_ybp_kf_month_analyse(v_date);
	call proc_ybp_kf_wy_analyse(v_date);
 
	call proc_ybp_zy_build_info(v_date);
	call proc_ybp_zy_cst_info(v_date);
	call proc_ybp_zy_translate_analyse(v_date);
	call proc_ybp_zy_proj_sale_info(v_date);
	call proc_ybp_zy_m_sale_income(v_date);
   
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_bq_detail_count` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_bq_detail_count` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_bq_detail_count`(IN p_totaldate VARCHAR(10))
BEGIN 
 
   -- 遍历数据结束标志
  DECLARE done INT DEFAULT FALSE;
  DECLARE a CHAR(16);
  DECLARE v_lable_id VARCHAR(64);
  DECLARE v_Lable_name VARCHAR(64);
  DECLARE v_sqltext VARCHAR(3000);
  DECLARE v_table VARCHAR(3000);
  DECLARE v_filedsname VARCHAR(3000);
  DECLARE v_where VARCHAR(3000);
  DECLARE v_int INT;
  DECLARE v_id INT;
  DECLARE v_tableName VARCHAR(300) ;
  DECLARE v_model VARCHAR(300) ;
  DECLARE v_labelExpress VARCHAR(300);
  DECLARE v_id_b INT;
  DECLARE v_tableName_b VARCHAR(30) ;
  DECLARE v_tableName_grup  VARCHAR(3000) ;
  DECLARE v_aliasName    VARCHAR(50) ;
  DECLARE v_aliasName_b    VARCHAR(50) ;
 
  -- 游标
  DECLARE cur CURSOR FOR   SELECT id,tableName,model,labelExpress  FROM labellocal_storage ORDER BY id ,tableName;
  -- 将结束标志绑定到游标
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  DELETE FROM rpt_lable_run_count;
  INSERT INTO rpt_lable_run_count(lable_id,Lable_name,Lable_num,Lable_time)
  SELECT  id,labelAttr,0,SYSDATE()   FROM labellocal_storage  GROUP BY   id,labelAttr  ;
  -- 打开游标
  OPEN cur; 
  -- 开始循环
  SET v_id_b:='000';
  SET v_tableName_b:='000';
  read_loop: LOOP
    -- 提取游标里的数据，这里只有一个，多个的话也一样；
    FETCH cur INTO    v_id ,  v_tableName ,  v_model , v_labelExpress ;
    -- 声明结束的时候
    IF done THEN
      LEAVE read_loop;
    END IF;
    -- 这里做你想做的循环的事件
    /*取出表的别名*/   
    SELECT aliasName INTO v_aliasName   FROM rpt_table_alias WHERE UPPER(tablename)=v_tableName;  
    SELECT aliasName INTO v_aliasName_b FROM rpt_table_alias WHERE UPPER(tablename)=v_tableName_b;   
 
    /*如果标签ID不同，就需要重新生成SQL*/ 
    IF (v_id_b<>v_id) THEN
  
       UPDATE   rpt_lable_run_count SET  lable_sql=v_sqltext WHERE Data_seq_id=v_id_b;
    ELSE
      
       IF (v_tableName_b<>v_tableName)  THEN   
           /*获取表的关聊*/           
           SET v_tableName_grup := CONCAT(v_tableName_grup ,' LEFT JOIN  ',v_tableName, v_aliasName,' ON ',v_aliasName,'.cstGUID=',v_tableName_b,'.cstGUID' );
          
       END IF;
       /*获取表的字段名*/   
       SET v_filedsname =CONCAT(v_filedsname,v_aliasName,'.',v_model);
         
       /*获WHERE  条件*/   
       SET v_labelExpress=REPLACE(v_labelExpress,'@tabalis',v_aliasName);
       SET v_where =CONCAT(v_where,v_aliasName,'.',v_labelExpress);
     
    END IF;
  
    SET  v_sqltext := CONCAT('SELECT  ', v_filedsname, v_tableName_grup);
     
  END LOOP;
  -- 关闭游标
  CLOSE cur;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_b_proj_sum` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_b_proj_sum` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_b_proj_sum`()
BEGIN
	 
  
  DECLARE v_date DATE;
  
  /*统计项目的成交套数，金额*/
  SET v_date =DATE_FORMAT (CURDATE() -1,'%Y-%m-%d');
  DELETE FROM rpt_b_proj_sum;
  INSERT INTO rpt_b_proj_sum(create_time,proj_guid ,proj_name,big_code,city_code,sale_sum,
         saleamountsum ,sale_scale,trade_sum,repairs_sum,family_sum,`status`)  
  SELECT   v_date,projGUID,NULL,NULL,NULL,0,
           0,0,0,0,0, IF( projSaleStatus='在售' ,'在售' ,'已售')  FROM  b_proj WHERE    projSaleStatus='在售' OR projSaleStatus='售完'  ;
   
/*  在售 入伙
  DELETE FROM rpt_b_proj_sum;
  Insert into rpt_b_proj_sum(create_time,proj_guid ,proj_name,area_id,cityCode,sale_sum,
         saleamountsum ,sale_scale,trade_sum,repairs_sum,family_sum,`status`)  
  SELECT deal_date, projGUID,null,big_area,city_name,COUNT(*),sum(sale_amount), 0,0,0,0,'在售'
   FROM  report_cst_deal_mid_bak2
   GROUP BY deal_date,projGUID ,big_area,city_name;
   
*/
  UPDATE  rpt_b_proj_sum a,  (   SELECT  projGUID,COUNT(*) sale_sum ,SUM(sale_amount) saleamountsum,SUM(sale_acreage) sale_acreage 
							FROM  (SELECT   projGUID, MAX(sale_amount) sale_amount, MAX(sale_acreage) sale_acreage ,roomGUID FROM report_cst_deal_mid_own  
                   WHERE NOT( proj_house_type ='商铺' OR proj_house_type ='车位'   ) GROUP BY projGUID,roomGUID
                     
                     ) a
							GROUP BY projGUID 
	) b 
   SET a.sale_sum=b.sale_sum,a.saleamountsum=b.saleamountsum  
  WHERE a.proj_guid=b.projGUID;
   
 
  /*统计项目的投诉套数，金额*/
  UPDATE   rpt_b_proj_sum a ,(
	SELECT   ProjGUID   ,
	   SUM(CASE WHEN ReceiveType = '维修'   THEN 1 ELSE 0 END ) WX ,
	   SUM(CASE WHEN ReceiveType = '投诉'   THEN 1 ELSE 0 END ) TS 
		FROM k_Receive   GROUP BY ProjGUID
	) b 
  SET   a.trade_sum=b.ts,a.repairs_sum=b.WX
	WHERE a.proj_guid=b.ProjGUID;
 
 /*更改项目信息area_name,cityName   UPDATE rpt_b_proj_sum a,b_proj b  SET  proj_name=b.projName  area_id,cityCode where a.proj_guid=b.projGUID;*/ 
 
  UPDATE rpt_b_proj_sum a,v_proj_area_city_name_new  b  SET  a.big_name=b.big_name,a.city_name=b.city_name  , proj_name=b.projName ,
           a.big_code=b.big_code,  a.city_code=b.city_code     WHERE a.proj_guid=b.projGUID;
 
  
/*总户数去掉车位及商铺信息*/   
  
  UPDATE rpt_b_proj_sum a,( 
  SELECT projGUID,COUNT(*) sp_set FROM  b_room a
  LEFT JOIN     report_basic_room_enum b    ON
                  (       category =1 AND enumValue   LIKE  CONCAT('%,', a.roomStru ,',%')   
	AND b.attachCode >='100006' AND b.attachCode <='100007'  ) 
  WHERE b.attachKey='商铺' OR  b.attachKey='车位'
  GROUP BY projGUID 
	)  b  
  SET a.sp_set =b.sp_set    WHERE a.proj_guid=b.projGUID; 
 
 UPDATE rpt_b_proj_sum a,( 
	 SELECT projGUID,COUNT(*) total_set FROM  b_room a   GROUP BY projGUID
   
	)  b  
  SET a.total_set=b.total_set    WHERE a.proj_guid=b.projGUID; 
   
 UPDATE rpt_b_proj_sum SET family_sum=IFNULL(total_set,0)-IFNULL(sp_set,0); 
  UPDATE rpt_b_proj_sum a,(
  SELECT  projGUID, saleStatus ,COUNT(*) subsc_sum  FROM b_room GROUP BY projGUID,saleStatus  ) b
  SET   a.subsc_sum=b.subsc_sum
  WHERE a.proj_guid=b.projGUID AND  b.saleStatus='认购'; 
  UPDATE rpt_b_proj_sum a SET  a.sale_scale= FLOOR(a.sale_sum/a.family_sum*10000)/100;
  
  
   /*   住户（客服户数）	Wy_cst_service_num	int	客服住户数，签约之后到保修期内（1年） （准业主，磨合期）
      物业户数	Wy_property_num	int	保修期之后房产套数（稳定期，老业主）
   */
   UPDATE rpt_b_proj_sum a  ,(
             SELECT projGUID,SUM( CASE WHEN ctype=1 OR ctype=2 THEN 1 ELSE 0 END ) Wy_cst_service_num ,
                             SUM( CASE WHEN ctype=3 OR ctype=4 THEN 1 ELSE 0 END ) Wy_property_num
             FROM (
								SELECT projGUID, (CASE WHEN ((SYSDATE() > t.deal_date) AND (SYSDATE() < t.jFDate)) THEN '1' 
										WHEN (((SYSDATE() - t.jFDate) >= 0)  AND (SYSDATE() < (t.jFDate+ INTERVAL 1 YEAR))) THEN '2' 
										WHEN ((SYSDATE() >= (t.jFDate + INTERVAL 1 YEAR)) AND (SYSDATE() < (t.jFDate + INTERVAL 5 YEAR))) THEN '3'
										WHEN (SYSDATE() >= (t.jFDate + INTERVAL 5 YEAR)) THEN '4' ELSE '0' END) AS ctype  
										FROM    report_cst_deal_mid_bak2 t WHERE cstType=1 AND  NOT (proj_house_type='商铺' OR  proj_house_type='车库')
									) b GROUP BY     projGUID
						) c SET a.Wy_cst_service_num=c.Wy_cst_service_num,a.wy_property_num=c.wy_property_num
   WHERE a.proj_guid=c.projGUID;
  /*在售	Xs_Sale_house_num	int	楼盘在售套数*/
  UPDATE rpt_b_proj_sum a  SET xs_Sale_house_num=IFNULL(family_sum,0)-IFNULL(sale_sum,0);
 
 
  /* 取掉 公司 */
  UPDATE rpt_b_proj_sum SET cityName1=REPLACE(city_name,'公司','');
  /*  有楼盘在销售将状态1*/
  UPDATE  rpt_b_proj_sum a,( SELECT DISTINCT projGUID FROM b_room  WHERE saleStatus<>'销控') b
		SET  a.curr_status=1 
  WHERE a.proj_guid=b.projGUID;
  /* 楼盘在售的只有车位了 将楼盘标为0 即为不在售 */
  UPDATE  rpt_b_proj_sum SET curr_status=0 WHERE total_set=sp_set;
  
   /* 当项目全是商铺或车位记为2  */
  UPDATE  rpt_b_proj_sum SET format_id='0'  WHERE total_set=sp_set;
  
  DELETE FROM rpt_b_proj_sum WHERE format_id='0';
  /* 住宅销售完了，记为已售*/ 
  UPDATE  rpt_b_proj_sum SET STATUS='已售'  WHERE family_sum=sale_sum;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_call` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_call` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_call`(IN p_totaldate VARCHAR(10))
BEGIN
	#Routine body goes here...
  DECLARE v_date DATE; 
  
  IF  p_totaldate ='AUTO' THEN
		   SET v_date =DATE_FORMAT (CURDATE()-1 ,'%Y-%m-%d');
  ELSE
		   SET	 v_date =  p_totaldate ;
  END IF;
  -- 中间表 
 call proc_report_cst_deal_own_2; 
  call proc_report_cst_deal_analyse_2;
  call proc_run_mid_table;
 
  call proc_b_proj_sum; 
 	call proc_rpt_cst_repeat_buy_detail;
	call proc_yx_customer_typeModel(v_date);
  call proc_stand_label_count; 
 
-- 项目 客户细分
  call proc_cust_attach_count(v_date);
  call proc_cust_bought_count(v_date);
  call proc_cust_count_main(v_date);
  call proc_rpt_format_convert(v_date);
  
  -- 项目 客户职业
  call proc_rpt_proj_cst_industry(v_date);
  call proc_rpt_proj_cst_origin(v_date);
  
 
  -- 项目  指标
 	call proc_rpt_index_flow(v_date);
	call proc_rpt_index_base(v_date); 
 
  call proc_xs_format_index(v_date);
  -- 项目 客服
  call proc_rpt_kf_format_index(v_date);
  call proc_rpt_kf_index_flow(v_date);
  call proc_rpt_kf_key_index(v_date);
  
  -- 项目 置业 
  call proc_projhome_zhiye(v_date);
  call proc_rpt_zy_key_index(v_date);
  -- 项目 首页  
  call proc_proj_cst_contract(v_date);
	call proc_proj_homepage_data(v_date);
	call proc_proj_homepage_data_1(v_date);
	call proc_proj_homepage_data_2(v_date);
	call proc_proj_homepage_data_3(v_date);  
  
  -- 客户
	call proc_kh_cst_number(v_date);
  call proc_stand_label_count; 
  -- 报表
 
  call proc_rpt_owner_feat_analyse(v_date);  
  call proc_rpt_format_sale_analyse(v_date);
  -- 营销
	-- call proc_yx_customer_typeModel(v_date);
  -- 标签
	call proc_lable_count(v_date);
 
  -- 仪表盘
	call proc_ybp_count(v_date); 
	call proc_ybp_kf_month_ruhuo(v_date);
	call proc_ybp_kf_month_analyse(v_date);
	call proc_ybp_kf_wy_analyse(v_date);
 
	call proc_ybp_zy_build_info(v_date);
	call proc_ybp_zy_cst_info(v_date);
	call proc_ybp_zy_translate_analyse(v_date);
	call proc_ybp_zy_proj_sale_info(v_date);
	call proc_ybp_zy_m_sale_income(v_date);
   
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_cust_attach_count` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_cust_attach_count` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_cust_attach_count`(IN p_totaldate VARCHAR(10))
BEGIN
	
  DECLARE v_date DATE;     
  
  IF  p_totaldate ='AUTO' THEN
		  SET v_date =DATE_FORMAT (CURDATE()-1 ,'%Y-%m-%d');
  ELSE
		 SET	v_date =p_totaldate;
  END IF;
    
  /*统计项目的客户特征*/
  DELETE FROM rpt_customer_attach_count WHERE create_time=v_date;
  INSERT INTO rpt_customer_attach_count(create_time,proj_id,index_format_type,customer_type,customer_age_type,customer_age_sum)  
  SELECT DATE_FORMAT (v_date,'%Y-%m-%d'), projGUID,'销售','已购客户',cstCurYl,COUNT(*)
   FROM  report_cst_deal_mid_own WHERE NOT( proj_house_type ='商铺' OR proj_house_type ='车位')
   GROUP BY   projGUID,  cstCurYl ;
  
  UPDATE rpt_customer_attach_count SET  customer_age_type='未知'  WHERE customer_age_type IS NULL;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_cust_bought_count` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_cust_bought_count` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_cust_bought_count`(IN p_totaldate VARCHAR(10))
BEGIN
	
  DECLARE v_date DATE;
  DECLARE v_cudate DATE;
  DECLARE v_sql VARCHAR(4000);     
  IF  p_totaldate ='AUTO' THEN
		  SET v_date =DATE_FORMAT (CURDATE()-1 ,'%Y-%m-%d');
  ELSE
		 SET	v_date =p_totaldate;
  END IF;
  
  SET  v_cudate=SYSDATE();
 
  /*统计项目 */
  DELETE FROM rpt_customer_bought_count WHERE create_time=p_totaldate ;
  INSERT INTO rpt_customer_bought_count(
		create_time,proj_id,index_format_type,customer_type,customer_invest_sum,
		customer_self_sum,customer_forward_sum,customer_change_sum,customer_follow_sum,customer_expect_sum,
    customer_away_sum)
  SELECT DATE_FORMAT (v_date ,'%Y-%m-%d'), projGUID,'销售','已购客户',0,0,0,0,0,0 ,0
   FROM  b_proj      WHERE   projSaleStatus='在售' OR projSaleStatus='售完';
  
  /* 计算 总投资客户数  取出一客多房的，再对应到客户项中 */
  
   UPDATE  rpt_customer_bought_count a,      
    (
			SELECT  projGUID,COUNT( DISTINCT cstGUID ) customer_invest_sum FROM report_t_proj_tzk_info WHERE create_time<=v_date
			GROUP BY projGUID
   
    ) b    
   SET a.customer_invest_sum=b.customer_invest_sum
   WHERE a.proj_id=b.projGUID  AND create_time=p_totaldate;
   
 /* 更改     自住客户数户数 */   
	UPDATE  rpt_customer_bought_count a,      
    (
				SELECT    a.projGUID, COUNT(DISTINCT a.cstGUID)  customer_self_sum  FROM report_cst_deal_mid_own   a, t_contract b    
             WHERE NOT( proj_house_type ='商铺' OR proj_house_type ='车位'   )  AND a.tradeGUID=b.tradeGUID AND b.jFDate<=v_date
        GROUP BY   projGUID    
   
    ) b
     
  SET a.customer_self_sum=b.customer_self_sum
  WHERE a.proj_id=b.projGUID AND create_time=p_totaldate;
  /* 更改   总期房客户数  ,*/   
	UPDATE  rpt_customer_bought_count a,      
    (
				SELECT     a.projGUID, COUNT(DISTINCT a.cstGUID)   customer_forward_sum    FROM report_cst_deal_mid_own   a, t_contract b    
             WHERE NOT( proj_house_type ='商铺' OR proj_house_type ='车位'   )  AND a.tradeGUID=b.tradeGUID AND b.jFDate>v_date
        GROUP BY   projGUID    
   
    ) b
    
   SET a.customer_forward_sum=b.customer_forward_sum
   WHERE a.proj_id=b.projGUID AND create_time=p_totaldate;
 
  /*31天以内*/
  UPDATE rpt_customer_bought_count a  ,(
		SELECT  projGUID, 
		COUNT(DISTINCT cstGUID) customer_follow_sum
 
		FROM (
			 
        SELECT d.projGUID,d.cstGUID       FROM   rpt_cst_opp_mid d
        LEFT  JOIN   report_cst_deal_mid_own_02  f ON f.projGUID = d.projGUID AND f.cstGUID=d.cstGUID
        WHERE 		f.cstGUID IS NULL	AND createTime<=v_date	AND  deal_date <= v_date 
         AND  NOT (proj_house_type='商铺' OR  proj_house_type='车库') AND DATEDIFF(v_date,createTime )  <31
        
     ) g GROUP BY projGUID
   ) c 
   SET a.customer_follow_sum=c.customer_follow_sum 
   WHERE a.proj_id=c.projGUID  AND create_time=p_totaldate;
  /*31-180天*/
  UPDATE rpt_customer_bought_count a  ,(
		SELECT  projGUID, 
		COUNT(DISTINCT cstGUID) customer_expect_sum
 
		FROM (
			 
        SELECT d.projGUID,d.cstGUID       FROM   rpt_cst_opp_mid d
        LEFT  JOIN   report_cst_deal_mid_own_02  f ON f.projGUID = d.projGUID AND f.cstGUID=d.cstGUID
        WHERE 		f.cstGUID IS NULL	AND createTime<=v_date	AND  deal_date <= v_date 
         AND  NOT (proj_house_type='商铺' OR  proj_house_type='车库') AND DATEDIFF(v_date,createTime ) BETWEEN  31   AND 180 
        
     ) g GROUP BY projGUID
   ) c 
   SET  a.customer_expect_sum=c.customer_expect_sum 
   WHERE a.proj_id=c.projGUID  AND create_time=p_totaldate;
/*大于180*/
 UPDATE rpt_customer_bought_count a  ,(
		SELECT  projGUID, 
		COUNT(DISTINCT cstGUID) customer_away_sum
 
		FROM (
			 
        SELECT d.projGUID,d.cstGUID       FROM   rpt_cst_opp_mid d
        LEFT  JOIN   report_cst_deal_mid_own_02  f ON f.projGUID = d.projGUID AND f.cstGUID=d.cstGUID
        WHERE 		f.cstGUID IS NULL	AND createTime<=v_date	AND  deal_date <= v_date 
         AND  NOT (proj_house_type='商铺' OR  proj_house_type='车库') AND DATEDIFF(v_date,createTime ) >    180 
        
     ) g GROUP BY projGUID
   ) c 
   SET  a.customer_away_sum=c.customer_away_sum
   WHERE a.proj_id=c.projGUID  AND create_time=p_totaldate;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_cust_count_main` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_cust_count_main` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_cust_count_main`(IN p_totaldate VARCHAR(10))
BEGIN
  
  DECLARE v_date DATE; 
  
  IF  p_totaldate ='AUTO' THEN
		  SET v_date =DATE_FORMAT (CURDATE()-1 ,'%Y-%m-%d');
  ELSE
		 SET	v_date =p_totaldate;
  END IF;
   
 
  DELETE FROM rpt_customer_count_main WHERE create_time=v_date; 
  INSERT INTO rpt_customer_count_main(create_time,proj_id,index_format_type,customer_type,customer_bought_sum,customer_intention_sum)
  SELECT    v_date , projGUID,'客服','已购客户',0,0    FROM  b_proj WHERE    projSaleStatus='在售' OR projSaleStatus='售完';
 
  /*统已购客户数*/
  UPDATE rpt_customer_count_main c,(
	SELECT    projGUID,  COUNT(DISTINCT a.cstGUID)  customer_bought_sum FROM report_cst_deal_mid_own_02 a 
	WHERE   deal_date <=v_date  AND   NOT( proj_house_type ='商铺' OR proj_house_type ='车位') 
	GROUP BY projGUID) b 
  SET c.customer_bought_sum=b.customer_bought_sum 
  WHERE c.proj_id=b.projGUID AND create_time=v_date; 
 
 /*意向客户数*/
  UPDATE rpt_customer_count_main  f ,  (  
		SELECT projGUID ,COUNT(DISTINCT cstGUID) customer_intention_sum  FROM   rpt_cst_opp_first_mid where isbuy='0'
      group by projGUID
  ) e 
  SET  f.customer_intention_sum=e.customer_intention_sum
  WHERE    f.proj_id=e.ProjGUID   AND create_time=v_date;
    
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_get_date_by_stime_etime` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_get_date_by_stime_etime` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_get_date_by_stime_etime`(IN ps_stime VARCHAR(10), IN ps_etime VARCHAR(10))
BEGIN
  DECLARE ps_count INT DEFAULT 0; 
  DECLARE ps_time VARCHAR(10); 
	SET ps_time = ps_stime; 
  WHILE ps_time < ps_etime  DO   
    SET ps_time = DATE_ADD(ps_stime, INTERVAL ps_count DAY);    
    INSERT INTO rpt_calendar VALUES(ps_time);
    SET ps_count = ps_count + 1;  
  END WHILE;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_kh_cst_number` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_kh_cst_number` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_kh_cst_number`(IN p_totaldate VARCHAR(10))
BEGIN
	 
  DECLARE v_date DATETIME;
  DECLARE v_cdate DATETIME;  
  DECLARE v_Ydate DATETIME;
  DECLARE v_Y_edate DATETIME;
  DECLARE v_Num INT; 
  DECLARE v_YZ INT;
  DECLARE v_curM_bDate DATETIME;
  DECLARE v_curM_EDate DATETIME;
  DECLARE v_totalAmount BIGINT;
  DECLARE v_yesterdayAdded  BIGINT;
  DECLARE v_b_cstnum   BIGINT;
  IF  p_totaldate ='AUTO' THEN
		 SET  v_date =DATE_FORMAT (CURDATE()  ,'%Y-%m-%d');
  ELSE
		 SET	v_date = p_totaldate; 
  END IF;
  SET v_Ydate =  DATE_ADD(v_date, INTERVAL -1 DAY) ;
  SET v_Y_edate = CONCAT (DATE_FORMAT(v_Ydate,'%Y-%m-%d') ,' 23:59:59');
  
  SET v_curM_bDate  =DATE_FORMAT (v_date,'%Y-%m-01');
  SET v_curM_EDate  =CONCAT(LAST_DAY(v_curM_bDate), ' 23:59:59');
  /* 统计项目 SET v_date =DATE_FORMAT (curdate() -1,'%Y-%m-%d')  */
  DELETE FROM rpt_cst_number;
   
  /*
  INSERT INTO rpt_cst_number(cstType,title,createTime,yesterdayAdded,monthAdded,totalAmount,proportion)
  SELECT 2,'住宅客户', v_date,0,0,sum(typeNum) ,0           
  FROM tmp_cst_count   where  substr(lpad(bin(isMerge),4,0),3,1)=1;  
  */
  
  
 
  /* 计算各客户昨天新增*/
  DROP TABLE IF EXISTS  tmp_cst_count_yest;
  CREATE TEMPORARY TABLE tmp_cst_count_yest (
		isMerge INT,
		typeNum INT
  ) ;
  INSERT INTO tmp_cst_count_yest  (isMerge,typeNum)
	SELECT isMerge,SUM(bb) FROM (
  SELECT isMerge,COUNT(*) bb FROM cst_customer_0 WHERE modifyTime BETWEEN   v_Ydate AND v_Y_edate GROUP BY isMerge
	UNION ALL
	SELECT isMerge,COUNT(*) FROM cst_customer_1 WHERE  modifyTime  BETWEEN    v_Ydate AND v_Y_edate  GROUP BY isMerge
	UNION ALL
	SELECT isMerge,COUNT(*) FROM cst_customer_2 WHERE  modifyTime  BETWEEN   v_Ydate AND v_Y_edate  GROUP BY isMerge
	UNION ALL
	SELECT isMerge,COUNT(*) FROM cst_customer_3 WHERE  modifyTime  BETWEEN   v_Ydate AND v_Y_edate  GROUP BY isMerge
	UNION ALL
	SELECT isMerge,COUNT(*) FROM cst_customer_4 WHERE  modifyTime  BETWEEN   v_Ydate AND v_Y_edate  GROUP BY isMerge
	UNION ALL
	SELECT isMerge,COUNT(*) FROM cst_customer_5 WHERE  modifyTime  BETWEEN   v_Ydate AND v_Y_edate  GROUP BY isMerge
	UNION ALL
	SELECT isMerge,COUNT(*) FROM cst_customer_6 WHERE  modifyTime  BETWEEN   v_Ydate AND v_Y_edate  GROUP BY isMerge
	UNION ALL
	SELECT isMerge,COUNT(*) FROM cst_customer_7 WHERE  modifyTime  BETWEEN   v_Ydate AND v_Y_edate  GROUP BY isMerge
	UNION ALL
	SELECT isMerge,COUNT(*) FROM cst_customer_8 WHERE  modifyTime  BETWEEN   v_Ydate AND v_Y_edate  GROUP BY isMerge
	UNION ALL
	SELECT isMerge,COUNT(*) FROM cst_customer_9 WHERE  modifyTime  BETWEEN   v_Ydate AND v_Y_edate  GROUP BY isMerge
	)a GROUP BY  isMerge;
 
 
  
 
  DROP TABLE  IF EXISTS   tmp_cst_count_all;
  CREATE   TABLE tmp_cst_count_all AS 
  SELECT  * FROM (  
		SELECT cstGUID,MIN(deal_date) deal_date ,2 AS isMerge  FROM report_cst_deal_mid_own GROUP BY cstGUID
  UNION ALL
		SELECT cstGUIDS,MIN(FDEALDATE),4 FROM zDeal GROUP BY cstGUIDS
  UNION ALL
		SELECT cstGUID,modifyTime ,8 FROM cst_customer_0  WHERE  SUBSTR(LPAD(BIN(isMerge),4,'0'),1,1)='1' 
	UNION ALL
		SELECT cstGUID,modifyTime ,8 FROM cst_customer_1  WHERE  SUBSTR(LPAD(BIN(isMerge),4,'0'),1,1)='1'   
	UNION ALL
		SELECT cstGUID,modifyTime ,8 FROM cst_customer_2  WHERE  SUBSTR(LPAD(BIN(isMerge),4,'0'),1,1)='1' 
	UNION ALL
		SELECT cstGUID,modifyTime ,8 FROM cst_customer_3  WHERE  SUBSTR(LPAD(BIN(isMerge),4,'0'),1,1)='1' 
	UNION ALL
		SELECT cstGUID,modifyTime ,8 FROM cst_customer_4  WHERE  SUBSTR(LPAD(BIN(isMerge),4,'0'),1,1)='1'  
	UNION ALL
		SELECT cstGUID,modifyTime ,8 FROM cst_customer_5  WHERE  SUBSTR(LPAD(BIN(isMerge),4,'0'),1,1)='1' 
	UNION ALL
		SELECT cstGUID,modifyTime ,8 FROM cst_customer_6  WHERE  SUBSTR(LPAD(BIN(isMerge),4,'0'),1,1)='1' 
	UNION ALL
		SELECT cstGUID,modifyTime ,8 FROM cst_customer_7  WHERE  SUBSTR(LPAD(BIN(isMerge),4,'0'),1,1)='1' 
	UNION ALL
		SELECT cstGUID,modifyTime ,8 FROM cst_customer_8  WHERE  SUBSTR(LPAD(BIN(isMerge),4,'0'),1,1)='1' 
	UNION ALL
		SELECT cstGUID,modifyTime ,8 FROM cst_customer_9  WHERE  SUBSTR(LPAD(BIN(isMerge),4,'0'),1,1)='1' 
  )a;
  -- 住宅 昨天
 INSERT INTO rpt_cst_number(cstType,title,createTime,yesterdayAdded,monthAdded,totalAmount,proportion)
  SELECT 2,'住宅客户', v_date, COUNT(DISTINCT cstGUID)   ,  0,0,0
  FROM tmp_cst_count_all WHERE deal_date=v_Ydate AND  isMerge=2;
  
	/* 月度  */  
  UPDATE rpt_cst_number a,(
		SELECT   
         COUNT(DISTINCT cstGUID)    monthAdded 
		FROM tmp_cst_count_all WHERE   deal_date  BETWEEN v_curM_bDate AND  v_curM_EDate AND   isMerge=2
  ) b
  SET a.monthAdded=b.monthAdded  
  WHERE cstType=2 AND createTime=v_date;
 
	/* 全部  */  
  UPDATE rpt_cst_number a,(
		SELECT   
         COUNT(DISTINCT cstGUID)   totalAmount   
		FROM tmp_cst_count_all  WHERE  isMerge=2
  ) b
  SET a.totalAmount=b.totalAmount  
  WHERE cstType=2 AND createTime=v_date;
 
 
  -- 
  INSERT INTO rpt_cst_number(cstType,title,createTime,yesterdayAdded,monthAdded,totalAmount,proportion)
  SELECT 0,'全部客户', v_date,0,0 ,COUNT(DISTINCT cstguid),0
  FROM tmp_cst_count_all;
    
   UPDATE rpt_cst_number a, (
		SELECT COUNT(DISTINCT cstguid) monthAdded  FROM tmp_cst_count_all 	 WHERE deal_date BETWEEN  v_curM_bDate  AND v_curM_EDate 
    )b 
   SET a.monthAdded=b.monthAdded 
   WHERE cstType=0;
  UPDATE rpt_cst_number a, (
		SELECT COUNT(DISTINCT cstguid) yestAdded  FROM tmp_cst_count_all 	 WHERE deal_date BETWEEN  v_Ydate AND v_Y_edate 
    )b 
   SET a.yesterdayAdded=b.yestAdded 
   WHERE cstType=0;
 
  /*8*/
  INSERT INTO rpt_cst_number(cstType,title,createTime,yesterdayAdded,monthAdded,totalAmount,proportion)
  SELECT 8,'商业客户', v_date,0,0,COUNT(DISTINCT cstGUID) ,0           
  FROM tmp_cst_count_all   WHERE   SUBSTR(LPAD(BIN(isMerge),4,0),1,1)=1;
    
  -- 商业 昨天
  UPDATE  rpt_cst_number  a, (SELECT  COUNT(DISTINCT cstGUID) yesterdayAdded FROM  tmp_cst_count_all  
     WHERE deal_date  BETWEEN   v_Ydate AND v_Y_edate AND  isMerge=8 ) b
		SET a.yesterdayAdded=b.yesterdayAdded 
  WHERE  a.cstType=8 ; 
  
 
  /*4*/
  INSERT INTO rpt_cst_number(cstType,title,createTime,yesterdayAdded,monthAdded,totalAmount,proportion)
	SELECT 4,'置业客户', v_date,0,0,COUNT(DISTINCT  cstGUIDS ),0                 
					FROM  zDeal a     ;  
		  
  /* 置业 客户 */
  UPDATE  rpt_cst_number  a, (SELECT  COUNT(DISTINCT cstGUID) yesterdayAdded FROM  tmp_cst_count_all 
       WHERE deal_date  BETWEEN   v_Ydate AND v_Y_edate AND  isMerge=4 ) b
		SET a.yesterdayAdded=b.yesterdayAdded 
  WHERE  a.cstType=4 ; 
 
   /* 0为全部用户类型不能累加进来*/
  SELECT SUM( totalAmount) INTO v_totalAmount FROM rpt_cst_number  WHERE cstType >0  ;  
  DROP  TABLE tmp_cst_count_yest;
  /*算百分比*/
  UPDATE rpt_cst_number  SET proportion=  ( FLOOR(totalAmount/v_totalAmount *10000)/100);
  /*以下是多业态客户占比  8科迈(商业客户)---4 置业---2 明源(住宅) -  */
  DROP TABLE  IF EXISTS   tmp_cst_count_mutil_all;
  CREATE TABLE tmp_cst_count_mutil_all AS  SELECT   cstGUID,SUM(isMerge) AS isMerge FROM tmp_cst_count_all GROUP BY cstGUID;
  DELETE FROM rpt_mutiple_formats;   
  INSERT INTO rpt_mutiple_formats (csttype,title,createTime,number,allTotal,proportion)
  SELECT 6,'住宅&置业', v_date,  SUM(1) ,0,0           
  FROM tmp_cst_count_mutil_all a   WHERE   SUBSTR(BIN(isMerge),2,1)=1 AND  SUBSTR(LPAD(BIN(isMerge),4,0),3,1)=1   ;  
   
 
  INSERT INTO rpt_mutiple_formats (csttype,title,createTime,number,allTotal,proportion)
  SELECT 12,'商业&置业', v_date,  SUM(1) ,0,0           
  FROM tmp_cst_count_mutil_all   WHERE    SUBSTR(LPAD(BIN(isMerge),4,0),2,1)=1  AND   SUBSTR(LPAD(BIN(isMerge),4,0),1,1)=1    ;  
   
  INSERT INTO rpt_mutiple_formats (csttype,title,createTime,number,allTotal,proportion)
  SELECT 10,'商业&住宅', v_date,  SUM(1) ,0,0           
  FROM tmp_cst_count_mutil_all   WHERE   SUBSTR(LPAD(BIN(isMerge),4,0),3,1)=1    AND  SUBSTR(LPAD(BIN(isMerge),4,0),1,1)=1   ;  
  INSERT INTO rpt_mutiple_formats (csttype,title,createTime,number,allTotal,proportion)
  SELECT 16,'商业&住宅&置业', v_date , SUM(1),0 ,0           
  FROM tmp_cst_count_mutil_all   WHERE    SUBSTR(LPAD(BIN(isMerge),4,0),3,1)=1   AND  SUBSTR(LPAD(BIN(isMerge),4,0),2,1)=1   AND  SUBSTR(LPAD(BIN(isMerge),4,0),1,1)=1 ;     
   /*  全部用户数*/
  SELECT SUM( number) INTO v_totalAmount FROM rpt_mutiple_formats     ;
  /*算百分比*/
  UPDATE rpt_mutiple_formats  SET proportion=  ( FLOOR(number/v_totalAmount *10000)/100),  allTotal=v_totalAmount;
 
  /*分类客户占比表  1再购客户、2会员、3业主、4租客、5企业客户 */
  DELETE FROM rpt_classification;
  INSERT INTO rpt_classification(csttype,title,finished,proportion,createTime)
  SELECT 1,'再购客户',COUNT(DISTINCT cstguid) ,0, v_date FROM rpt_cst_repeat_buy_detail  ;
 
 
  INSERT INTO rpt_classification(csttype,title,finished,proportion,createTime)   
  SELECT 2,'会员', COUNT(DISTINCT cstGUID) ,0  ,   v_date     
  FROM tmp_cst_count_all   WHERE   isMerge=8 ;
   
  INSERT INTO rpt_classification(csttype,title,finished,proportion,createTime)   
  SELECT 3,'业主', COUNT(DISTINCT cstguid) ,0  ,   v_date      
  FROM report_cst_deal_mid_own_02   WHERE cstType=1 AND NOT( proj_house_type='商铺' OR proj_house_type='车位') ;
    
  INSERT INTO rpt_classification(csttype,title,finished,proportion,createTime)   
  SELECT 5,'企业客户', COUNT(DISTINCT cstguid) ,0  ,   v_date      
  FROM report_cst_deal_mid_own_02   WHERE cstType=2 AND NOT( proj_house_type='商铺' OR proj_house_type='车位') ;
    
  INSERT INTO rpt_classification(csttype,title,finished,proportion,createTime)   
  SELECT 4,'租客', COUNT(DISTINCT cstguidb),0,v_date  FROM zDeal WHERE FSALETYPE='RENT';
   /*  */
  SELECT SUM( finished) INTO v_totalAmount FROM rpt_classification WHERE csttype=3 OR csttype=2 OR csttype=4;
  /*算百分比*/
  UPDATE rpt_classification  SET proportion=  ( FLOOR(finished/v_totalAmount *10000)/100) ,allTotal=v_totalAmount;
 
  SELECT  finished INTO v_YZ  FROM rpt_classification WHERE csttype=3;
  
  UPDATE rpt_classification  SET proportion=  ( FLOOR(finished/v_YZ *10000)/100) ,
     allTotal=v_YZ WHERE csttype=1 OR csttype=5;
 
  DROP TABLE IF EXISTS  tmp_city_distributed;
  CREATE TEMPORARY TABLE tmp_city_distributed (
	cityId VARCHAR (64),cityName VARCHAR(64),areaId VARCHAR(64),areaName VARCHAR (64),amount BIGINT
  ) ;
  
  DELETE FROM rpt_city_distributed;
  INSERT INTO   tmp_city_distributed (cityId,cityName,areaId,areaName,amount)
  SELECT citycode , city_name1,area_id, Area_name,COUNT(DISTINCT cstGUID) FROM rpt_cst_opp_mid_all a 
  GROUP BY citycode ,city_name1,area_id, Area_name;
  /* 清除不知是那个成市场的确数据 */
  DELETE FROM tmp_city_distributed WHERE cityId IS NULL;
 
  
  INSERT INTO   rpt_city_distributed(cityId,cityName,areaId,areaName,amount,sortIf)
  SELECT cityId,cityname,areaId,areaName,amount,1 FROM (SELECT cityId,cityname,areaId,areaName,amount FROM  tmp_city_distributed ORDER BY amount DESC) a LIMIT 10;
  INSERT INTO   rpt_city_distributed(cityId,cityName,areaId,areaName,amount,sortIf)
  SELECT cityId,cityname,areaId,areaName,amount,2 FROM (SELECT cityId,cityname,areaId,areaName,amount FROM  tmp_city_distributed ORDER BY amount ASC) a LIMIT 10;
  DROP TABLE tmp_city_distributed;
  
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_lable_count` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_lable_count` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_lable_count`(in p_totaldate varchar(10))
BEGIN
  DECLARE v_lable_Code VARCHAR(20);
  DECLARE v_lable_Name VARCHAR(20); 
  DECLARE v_lable_SQL  VARCHAR(3000);
  DECLARE v_user_id    VARCHAR(64);
  DECLARE v_sql        VARCHAR(3000); 
  DECLARE v_sql1        VARCHAR(3000); 
  DECLARE v_date  		 VARCHAR(10);
  DECLARE v_Num     BIGINT;
  DECLARE v_lable_cst_num BIGINT;
  DECLARE v_rootValue VARCHAR(64);

  -- 游标
  DECLARE done INT DEFAULT FALSE;
  -- 将结束标志绑定到游标 
  DECLARE cur CURSOR FOR  
  SELECT label_id,label_name,querySql,creatorguid FROM  rpt_l_label_storge WHERE not (  querySql is NULL or querySql='') and   label_type='0';

  -- 遍历数据结束标志
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  IF  p_totaldate ='AUTO' THEN
		  SET v_date =DATE_FORMAT (curdate()-1 ,'%Y-%m-%d');
  ELSE
		 SET	v_date =p_totaldate;
  END IF;
  -- 打开游标
  SELECT count(*) into v_Num from report_cst_customer;
  
  DROP TABLE IF EXISTS  rpt_l_cst_label_storage_tmp;
  create table rpt_l_cst_label_storage_tmp as SELECT * from rpt_l_cst_label_storage LIMIT 0;

  OPEN cur;
  -- 开始循环
 	read_loop: LOOP
    -- 提取游标里的数据，这里只有一个，多个的话也一样；
    FETCH cur INTO v_lable_Code ,v_lable_Name,v_lable_SQL,v_user_id ;
    -- 声明结束的时候
    IF done THEN
      LEAVE read_loop;
    END IF; 

    DELETE FROM rpt_l_cst_label_storage  WHERE labelGUID=v_lable_Code; 
    truncate table rpt_l_cst_label_storage_tmp ;
   
    SET v_sql = CONCAT("insert into rpt_l_cst_label_storage_tmp( cstGUID,cstName,labelGUID,labelName) ",v_lable_SQL  ) ;
    SET v_sql = REPLACE(v_sql,'v_cst_customer','report_cst_customer'); 
    SET v_sql1= REPLACE(v_sql,'cst_attach','rpt_cst_attach'); 
    SELECT   v_sql1;
     
    SET @ms=v_sql1; 
    PREPARE s1 from @ms; 
    EXECUTE s1;  
    DEALLOCATE PREPARE s1; 

   /* 取出档签所在分类是投资客户,自住客户, 期房客户, 意向客户 */
 
   SELECT min( rootValue) into v_rootValue  from  rpt_l_label_storge a
	        LEFT JOIN rpt_l_feature_storage  b on a.label_guid=b.labelguid
	        LEFT JOIN rpt_feature_template   c on b.templateguid=c.fea_template_guid 

   where a.label_id=v_lable_Code  ;
   
   /* 取出创建标签用户的数据 */
   INSERT INTO rpt_l_cst_label_storage( cstGUID,cstName, cst_mobile,cst_email,cst_address,labelGUID,labelName )
   SELECT g.cstGUID, g.cstname ,g.mobile_tel, g.cst_email,g.cst_address ,f.labelGUID,f.labelName   
   FROM    rpt_l_cst_label_storage_tmp f,( 
           SELECT cstGUID, b.cstname ,b.mobile_tel,b.cst_email,b.cst_address  FROM sys_user_project a, rpt_yx_cst_model b  
					WHERE user_id=v_user_id and a.project_guid=b.proj_guid and cst_type =v_rootValue
        ) g 
   WHERE f.cstguid=g.cstGUID; 

    /*更改客户标签数据的生成时间*/
    UPDATE rpt_l_cst_label_storage set createTime= v_date  where  labelGUID=v_lable_Code;


    /*更标签数据量及标签运行时间*/    
    SELECT COUNT(*) INTO v_lable_cst_num FROM rpt_l_cst_label_storage   where  labelGUID=v_lable_Code; 
    UPDATE  rpt_l_label_storge SET label_cst_num =v_lable_cst_num,execTime=NOW() WHERE  label_id=v_lable_Code; 
 
    /* 客户首页-各标签 占比 */ 
    DELETE FROM rpt_cst_lable_count WHERE lable_Code=v_lable_Code;
	  INSERT rpt_cst_lable_count(lable_Code,lable_Name,lable_cst_num ,lable_cst_rate,lable_num)
    SELECT v_lable_Code,v_lable_Name,v_lable_cst_num, ( floor(v_lable_cst_num/v_Num *10000)/100),v_Num;
 
  END LOOP;
  -- 关闭游标
  CLOSE cur;
 
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_projhome_zhiye` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_projhome_zhiye` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_projhome_zhiye`(IN p_totaldate VARCHAR(10))
BEGIN
  
  DECLARE v_date DATETIME; 
  DECLARE v_Ydate DATETIME;
  DECLARE v_Y_edate DATETIME;
  DECLARE v_curM_bDate DATETIME; 
  DECLARE v_curM_EDate DATETIME;
 
  IF  p_totaldate ='AUTO' THEN
		 SET  v_date =DATE_FORMAT (CURDATE()  ,'%Y-%m-%d');
  ELSE
		 SET	v_date = p_totaldate; 
  END IF;
  SET v_Ydate =  DATE_ADD(v_date, INTERVAL -1 DAY) ;
  SET v_Y_edate = CONCAT (DATE_FORMAT(v_Ydate,'%Y-%m-%d') ,' 23:59:59');
  
  SET v_curM_bDate  =DATE_FORMAT (v_date,'%Y-%m-01');
  SET v_curM_EDate  =CONCAT(LAST_DAY(v_curM_bDate), ' 23:59:59');
    
  DELETE FROM rpt_zy_proj_rent_sale  WHERE create_time=v_date;   
 
  /*在售及在出租的套数 */
  INSERT INTO rpt_zy_proj_rent_sale(sale_total_set,rent_total_set,create_time)
  SELECT SUM( CASE WHEN FLISTINGTYPE = 'RENT' OR FLISTINGTYPE = 'RENT_SALE'   THEN 1 ELSE 0 END) AS sale_total_set ,
			   SUM( CASE WHEN FLISTINGTYPE = 'SALE' OR FLISTINGTYPE = 'RENT_SALE'  THEN 1 ELSE 0 END  )AS  rent_total_set,v_date
      FROM zRoomlist;
  /* 出租的项目*/
  UPDATE rpt_zy_proj_rent_sale a ,(
			SELECT  COUNT(DISTINCT FKGARDENID) rent_proj_num   FROM zRoomlist  WHERE FLISTINGTYPE = 'RENT' OR FLISTINGTYPE = 'RENT_SALE'
		)b
  SET a.rent_proj_num=b.rent_proj_num
  WHERE a.create_time=v_date;
    
																												 
  /* 出售的项目*/
  UPDATE rpt_zy_proj_rent_sale a ,(
			SELECT   COUNT( DISTINCT FKGARDENID) sale_proj_num  FROM zRoomlist WHERE  FLISTINGTYPE = 'SALE' OR FLISTINGTYPE = 'RENT_SALE'  
		)b
  SET a.sale_proj_num=b.sale_proj_num
  WHERE a.create_time=v_date;
    
  /* 已出售套数，已出租套数*/
  UPDATE rpt_zy_proj_rent_sale a ,(
		SELECT SUM(CASE WHEN FLISTINGTYPE = 'SOLD'   AND FStatus = 1  THEN 1 ELSE 0 END) sold_set,
           SUM(CASE WHEN FLISTINGTYPE = 'RENTED' AND FStatus = 1 THEN 1 ELSE 0 END ) rent_set  FROM zRoomlist  
   )b 
  SET a.sold_set =b.sold_set,a.rent_set=b.rent_set
  WHERE a.create_time=v_date;
  /* 出售失效套数  出租 失效套数*/
  UPDATE rpt_zy_proj_rent_sale a ,(
		SELECT SUM(CASE WHEN FLISTINGTYPE = 'RENTD' AND FStatus = 0  THEN 1 ELSE 0 END)  rent_invalid_set,
           SUM(CASE WHEN FLISTINGTYPE = 'SOLD'  AND FStatus = 0  THEN 1 ELSE 0 END ) sale_invalid_set  FROM zRoomlist  
   )b 
  SET a.rent_invalid_set =b.rent_invalid_set,a.sale_invalid_set=b.sale_invalid_set
  WHERE a.create_time=v_date;
 /* 昨日 销售交额-出租成交 sale_yest_deal  rent_yest_deal */ 
  UPDATE rpt_zy_proj_rent_sale a ,(
		SELECT  
			SUM(CASE WHEN FSALETYPE = 'SALE' THEN  FDEALTOTALPRICE ELSE 0 END ) sale_yest_deal ,
			SUM(CASE WHEN FSALETYPE = 'RENT' THEN  FDEALTOTALPRICE ELSE 0 END ) rent_yest_deal
		FROM zDeal WHERE  FDEALDATE BETWEEN  v_Ydate AND v_Y_edate
  ) b
  SET a.sale_yest_deal=b.sale_yest_deal  ,a.rent_yest_deal=b.rent_yest_deal
  WHERE a.create_time=v_date;
 /* 本月 销售交额-出租成交 sale_month_deal  rent_month_deal */ 
  UPDATE rpt_zy_proj_rent_sale a ,(
		SELECT  
			SUM(CASE WHEN FSALETYPE = 'SALE' THEN  FDEALTOTALPRICE ELSE 0 END ) sale_month_deal ,
			SUM(CASE WHEN FSALETYPE = 'RENT' THEN  FDEALTOTALPRICE ELSE 0 END ) rent_month_deal
		FROM zDeal WHERE   FDEALDATE BETWEEN  v_curM_bDate  AND v_curM_EDate
  ) b
  SET a.sale_month_deal=b.sale_month_deal  ,a.rent_month_deal=b.rent_month_deal
  WHERE a.create_time=v_date;
  /* 本季 销售交额-出租成交 sale_season_deal  rent_season_deal */ 
  UPDATE rpt_zy_proj_rent_sale a ,(
		SELECT  
			SUM(CASE WHEN FSALETYPE = 'SALE' THEN  FDEALTOTALPRICE ELSE 0 END ) sale_season_deal ,
			SUM(CASE WHEN FSALETYPE = 'RENT' THEN  FDEALTOTALPRICE ELSE 0 END ) rent_season_deal
		FROM zDeal WHERE  QUARTER( FDEALDATE ) = QUARTER( v_date)  AND  YEAR(  FDEALDATE ) = YEAR( v_date)   
  ) b
  SET a.sale_season_deal=b.sale_season_deal  ,a.rent_season_deal=b.rent_season_deal
  WHERE a.create_time=v_date;
   
  /* 本年 销售交额-出租成交 sale_season_deal  rent_season_deal */ 
  UPDATE rpt_zy_proj_rent_sale a ,(
		SELECT  
			SUM(CASE WHEN FSALETYPE = 'SALE' THEN  FDEALTOTALPRICE ELSE 0 END ) sale_year_deal ,
			SUM(CASE WHEN FSALETYPE = 'RENT' THEN  FDEALTOTALPRICE ELSE 0 END ) rent_year_deal
		FROM zDeal WHERE    YEAR(FDEALDATE ) = YEAR( v_date)   
  ) b
  SET a.sale_year_deal=b.sale_year_deal  ,a.rent_year_deal=b.rent_year_deal
  WHERE a.create_time=v_date;
 
  DELETE FROM rpt_zy_store_rank WHERE count_year=YEAR(v_date);
  INSERT INTO rpt_zy_store_rank(store_code,store_name,store_deal_amount,count_year,create_time)  
	SELECT  FKORGID,FORGNAME ,
					SUM(CASE WHEN FSALETYPE = 'SALE' THEN  FDEALTOTALPRICE ELSE 0 END )   ,
          YEAR( v_date) ,v_date   
		FROM zDeal WHERE    YEAR(FDEALDATE ) = YEAR( v_date)   
  GROUP BY FKORGID,FORGNAME ;
 
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_proj_cst_contract` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_proj_cst_contract` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_proj_cst_contract`(IN p_totaldate VARCHAR(10))
BEGIN
	 
	 
  DECLARE v_date DATE;
  DECLARE v_Ydate DATE;
  DECLARE v_Y_edate DATE;
  DECLARE v_Num INT; 
  DECLARE v_Num1 INT; 
  DECLARE v_Num2 INT; 
  DECLARE v_Num3 INT; 
  DECLARE v_Num4 INT;  
  DECLARE v_num_count INT;
  DECLARE v_curM_bDate DATE;
  DECLARE v_curM_EDate DATE;
  IF  p_totaldate ='AUTO' THEN
		 SET  v_date =DATE_FORMAT (CURDATE()-1 ,'%Y-%m-%d');
  ELSE
		 SET	v_date =p_totaldate;
  END IF;
   
   
  DELETE FROM rpt_contract; 
  
  SELECT  COUNT(DISTINCT cstGUID) INTO v_Num    FROM report_cst_deal_mid_own;
  /* 总公司 */
  INSERT INTO rpt_contract(type_id,  index_name,index_value,create_time,DIMENSION )  
  SELECT 'YL',  cstcuryl,COUNT(DISTINCT cstGUID) , v_date,1 FROM report_cst_deal_mid_own  WHERE  csttype=1 AND  NOT( proj_house_type ='商铺' OR proj_house_type ='车位') 
  GROUP BY cstcuryl  ;     
 
  INSERT INTO rpt_contract(type_id,  index_name,index_value,create_time,DIMENSION )  
  SELECT 'MJ',  room_acre_segment,COUNT(DISTINCT cstGUID) , v_date,1 FROM report_cst_deal_mid_own  WHERE  csttype=1 AND  NOT( proj_house_type ='商铺' OR proj_house_type ='车位') 
  GROUP BY room_acre_segment  ;    
      
 
 
  UPDATE rpt_contract a, rpt_base_index b  SET  a.index_code=b.index_code 
   WHERE b.type_id='MJ' AND a.type_id='MJ' AND  a.index_name =b.index_name;
 
  UPDATE rpt_contract a, rpt_base_index b  SET  a.index_code=b.index_code 
   WHERE b.type_id='YL' AND a.type_id='YL' AND  a.index_name =b.index_name;
  /*贷款方式，等王总中间表 */ 
  INSERT INTO   rpt_contract(type_id, index_code,index_value,create_time, DIMENSION)  
  SELECT  'DKFS', PayType,COUNT(*),v_date ,1 FROM cst_room_attach a,     report_cst_deal_mid_own b 
    WHERE  a.RoomGuid=b.roomGUID AND  b.csttype=1 	 	AND  NOT( b.proj_house_type ='商铺' OR b.proj_house_type ='车位') 
  GROUP BY   payType;
  UPDATE rpt_contract a, rpt_base_index b  SET  a.index_name=b.index_name 
   WHERE b.type_id='DKFS' AND a.type_id='DKFS' AND  a.index_code =b.index_code;
 
  /*首符比例*/
	INSERT INTO   rpt_contract(type_id, index_code,index_value,create_time,DIMENSION )  
	SELECT 'SF', sf ,SUM(num),v_date,1 FROM (
		SELECT 
	   CASE 
     WHEN dd=0 THEN  2 
     WHEN dd=10 THEN 3 
     WHEN dd=20 THEN 4   
     WHEN dd=30 THEN 5   
     WHEN dd=40 THEN 6  
     WHEN dd>40 AND dd<100 THEN 7   
     WHEN dd>=100  THEN 1   END sf  ,num
	  FROM ( 
				SELECT dd,COUNT(*) num FROM (
				SELECT   FLOOR( ROUND(sfamount/sale_amount*100)/10    )*10   dd   
					FROM report_cst_deal_mid_own  WHERE  csttype=1 AND  NOT( proj_house_type ='商铺' OR proj_house_type ='车位') 
						AND sfamount>0
				) a  GROUP BY dd
			) c
	) d GROUP BY sf; 
  UPDATE rpt_contract a, rpt_base_index b  SET a.index_name =b.index_name
   WHERE b.type_id='SF' AND a.type_id='SF' AND a.index_code=b.index_code;
 
  /*重复购买 */  
 
  INSERT INTO   rpt_contract(type_id, index_code, index_name,index_value,create_time,DIMENSION,   city_code  )  
  SELECT 	 'CFGM','1','1套', COUNT(*), v_date ,1,NULL FROM ( 
  SELECT * FROM (  
  SELECT   cstguid, @rownum:=@rownum+1,  
  IF(@pdept=a.cstguid,@rank:=@rank+1,@rank:=1) AS rank,@pdept:=a.cstguid  , big_code,city_code 
  FROM (   
    SELECT  big_code,city_code, cstguid FROM
	  	  report_cst_deal_mid_own  WHERE csttype=1 AND  NOT( proj_house_type ='商铺' OR proj_house_type ='车位')   ORDER BY cstguid ,deal_date DESC    
		    ) a , 
	 	(SELECT @rownum :=0 , @pdept := NULL ,@rank:=0) b  
     	) result 
		) c WHERE rank=1 ;
  
	SELECT SUM(CASE WHEN ts=2 THEN 1 ELSE 0 END )  , SUM(CASE WHEN ts=3 THEN 1 ELSE 0 END)  
    ,SUM(CASE WHEN ts>=4 THEN 1 ELSE 0 END )  INTO V_NUM2,V_NUM3,V_NUM4 FROM (
		SELECT   cstguid,   COUNT(*) ts 
		FROM rpt_cst_repeat_buy_detail  WHERE csttype=1 AND  NOT( proj_house_type ='商铺' OR proj_house_type ='车位')  
		GROUP BY cstguid 
	)a; 
  INSERT INTO   rpt_contract(type_id, index_code, index_name,index_value,create_time,DIMENSION )  
	VALUE('CFGM','2','2套', V_NUM2, v_date,1 ) ;   
  INSERT INTO   rpt_contract(type_id, index_code, index_name,index_value,create_time,DIMENSION )  
	VALUE('CFGM','3','3套', V_NUM3, v_date,1 ) ;  
  INSERT INTO   rpt_contract(type_id, index_code, index_name,index_value,create_time ,DIMENSION)  
	VALUE('CFGM','4','4套及以上', V_NUM4, v_date,1 ) ;   
  /* 总公司结束 */
  /* 大区ID */
  INSERT INTO rpt_contract(type_id,  index_name,index_value,create_time,DIMENSION,city_code )  
  SELECT 'YL',  cstcuryl,COUNT(DISTINCT cstGUID) , v_date,2,big_code FROM report_cst_deal_mid_own 
      WHERE     csttype=1 	 	AND  NOT(  proj_house_type ='商铺' OR proj_house_type ='车位') 
  GROUP BY cstcuryl,big_code ;     
 
  INSERT INTO rpt_contract(type_id,  index_name,index_value,create_time,DIMENSION,city_code )  
  SELECT 'MJ',  room_acre_segment,COUNT(DISTINCT cstGUID) , v_date,2,big_code FROM report_cst_deal_mid_own 
    WHERE      csttype=1 	 	AND  NOT( proj_house_type ='商铺' OR proj_house_type ='车位') 
  GROUP BY room_acre_segment,big_code;    
      
 
  UPDATE rpt_contract a, rpt_base_index b  SET  a.index_code=b.index_code 
   WHERE b.type_id='MJ' AND a.type_id='MJ' AND  a.index_name =b.index_name AND a.dimension=2 ;
 
  UPDATE rpt_contract a, rpt_base_index b  SET  a.index_code=b.index_code 
   WHERE b.type_id='YL' AND a.type_id='YL' AND  a.index_name =b.index_name AND a.dimension=2 ;
 
  /*贷款方式，等王总中间表 */ 
  INSERT INTO   rpt_contract(type_id, index_code,index_value,create_time,DIMENSION,city_code)  
  SELECT  'DKFS', PayType,COUNT(*), v_date,2,c.big_code FROM cst_room_attach a,   report_cst_deal_mid_own c 
    WHERE   a.RoomGuid=c.roomGUID AND  c.csttype=1  	AND  NOT( c.proj_house_type ='商铺' OR c.proj_house_type ='车位') 
   GROUP BY   payType,c.big_code ;  
  UPDATE rpt_contract a, rpt_base_index b  SET  a.index_name=b.index_name 
   WHERE b.type_id='DKFS' AND a.type_id='DKFS' AND  a.index_code =b.index_code AND a.dimension=2 ;
 
  
  /*首符比例*/
	INSERT INTO   rpt_contract(type_id, index_code,index_value,create_time,DIMENSION,city_code )  
	SELECT 'SF', sf ,SUM(num),v_date,2,big_code FROM (
		SELECT big_code,
	   CASE 
     WHEN dd=0 THEN  2 
     WHEN dd=10 THEN 3 
     WHEN dd=20 THEN 4   
     WHEN dd=30 THEN 5   
     WHEN dd=40 THEN 6  
     WHEN dd>40 AND dd<100 THEN 7   
     WHEN dd>=100  THEN 1   END sf  ,num
	  FROM ( 
				SELECT big_code,dd,COUNT(*) num FROM (
					SELECT  big_code, FLOOR( ROUND(sfamount/sale_amount*100)/10    )*10   dd   
						FROM report_cst_deal_mid_own  WHERE  csttype=1 AND  NOT( proj_house_type ='商铺' OR proj_house_type ='车位') 
							AND sfamount>0 
				) a  GROUP BY big_code,dd
			) c
	) d GROUP BY sf,big_code; 
  UPDATE rpt_contract a, rpt_base_index b  SET a.index_name =b.index_name
   WHERE b.type_id='SF' AND a.type_id='SF' AND a.index_code=b.index_code AND a.dimension=2 ;
 
  /* 购买 */  
  INSERT INTO   rpt_contract(type_id, index_code, index_name,index_value,create_time,DIMENSION, city_code  )  
  SELECT 	 'CFGM','1','1套', COUNT(*), v_date ,2,  big_code FROM ( 
  SELECT * FROM (  
  SELECT   cstguid, @rownum:=@rownum+1,  
  IF(@pdept=a.cstguid,@rank:=@rank+1,@rank:=1) AS rank,@pdept:=a.cstguid , big_code 
  FROM (   
    SELECT  big_code,city_code, cstguid FROM
	  	  report_cst_deal_mid_own  WHERE csttype=1 AND  NOT( proj_house_type ='商铺' OR proj_house_type ='车位')   ORDER BY cstguid ,deal_date DESC    
		    ) a , 
	 	(SELECT @rownum :=0 , @pdept := NULL ,@rank:=0) b  
     	) result 
		) c WHERE rank=1 GROUP BY big_code; 
 
  INSERT INTO   rpt_contract(type_id, index_code, index_name,index_value,create_time,DIMENSION,   city_code  )  
 	SELECT   'CFGM','2','2套',COUNT(DISTINCT c.cstGUID), v_date ,2,  big_code    FROM (
		SELECT   cstguid,   COUNT(*) ts 
		FROM rpt_cst_repeat_buy_detail  WHERE csttype=1 AND  NOT( proj_house_type ='商铺' OR proj_house_type ='车位')  
		GROUP BY cstguid HAVING COUNT(*)=2
	)a , rpt_cst_repeat_buy_detail c WHERE a.cstguid=c.cstGUID
	GROUP BY big_code;
  INSERT INTO   rpt_contract(type_id, index_code, index_name,index_value,create_time,DIMENSION,   city_code  )  
 	SELECT   'CFGM','3','3套',COUNT(DISTINCT c.cstGUID), v_date ,2,  big_code    FROM (
		SELECT   cstguid,   COUNT(*) ts 
		FROM rpt_cst_repeat_buy_detail  WHERE csttype=1 AND  NOT( proj_house_type ='商铺' OR proj_house_type ='车位')  
		GROUP BY cstguid HAVING COUNT(*)=3
	)a , rpt_cst_repeat_buy_detail c WHERE a.cstguid=c.cstGUID
	GROUP BY big_code;
  INSERT INTO   rpt_contract(type_id, index_code, index_name,index_value,create_time,DIMENSION,   city_code  )  
 	SELECT   'CFGM','4','4套及以上',COUNT(DISTINCT c.cstGUID), v_date ,2,  big_code    FROM (
		SELECT   cstguid,   COUNT(*) ts 
		FROM rpt_cst_repeat_buy_detail  WHERE csttype=1 AND  NOT( proj_house_type ='商铺' OR proj_house_type ='车位')  
		GROUP BY cstguid HAVING COUNT(*)=3
	)a , rpt_cst_repeat_buy_detail c WHERE a.cstguid=c.cstGUID
	GROUP BY big_code;
  /* 大区ID 结束 */
 
  /* 分公司 开始 ID */
  INSERT INTO rpt_contract(type_id,  index_name,index_value,create_time,DIMENSION,city_code )  
  SELECT 'YL',  cstcuryl,COUNT(DISTINCT cstGUID) , v_date,3,city_code FROM report_cst_deal_mid_own 
      WHERE     csttype=1 	 	AND  NOT(  proj_house_type ='商铺' OR proj_house_type ='车位') 
  GROUP BY cstcuryl,city_code ;     
 
  INSERT INTO rpt_contract(type_id,  index_name,index_value,create_time,DIMENSION,city_code)  
  SELECT 'MJ',  room_acre_segment,COUNT(DISTINCT cstGUID) , v_date,3,city_code FROM report_cst_deal_mid_own 
    WHERE      csttype=1 	 	AND  NOT( proj_house_type ='商铺' OR proj_house_type ='车位') 
  GROUP BY room_acre_segment,city_code ;    
      
 
  UPDATE rpt_contract a, rpt_base_index b  SET  a.index_code=b.index_code 
   WHERE b.type_id='MJ' AND a.type_id='MJ' AND  a.index_name =b.index_name AND a.dimension=3 ;
 
  UPDATE rpt_contract a, rpt_base_index b  SET  a.index_code=b.index_code 
   WHERE b.type_id='YL' AND a.type_id='YL' AND  a.index_name =b.index_name AND a.dimension=3 ;
 
  /*贷款方式，等王总中间表 */ 
  INSERT INTO   rpt_contract(type_id, index_code,index_value,create_time,DIMENSION,city_code)  
  SELECT  'DKFS', PayType,COUNT(*), v_date,3,c.city_code FROM cst_room_attach a,     report_cst_deal_mid_own c 
    WHERE     a.RoomGuid=c.roomGUID AND  c.csttype=1  	AND  NOT( c.proj_house_type ='商铺' OR c.proj_house_type ='车位') 
   GROUP BY   payType,c.city_code  ;  
  UPDATE rpt_contract a, rpt_base_index b  SET  a.index_name=b.index_name 
   WHERE b.type_id='DKFS' AND a.type_id='DKFS' AND  a.index_code =b.index_code AND a.dimension=3 ;
 
  
  /*首符比例*/
	INSERT INTO   rpt_contract(type_id, index_code,index_value,create_time,DIMENSION,city_code )  
	SELECT 'SF', sf ,SUM(num),v_date,3,city_code FROM (
		SELECT city_code,
	   CASE 
     WHEN dd=0 THEN  2 
     WHEN dd=10 THEN 3 
     WHEN dd=20 THEN 4   
     WHEN dd=30 THEN 5   
     WHEN dd=40 THEN 6  
     WHEN dd>40 AND dd<100 THEN 7   
     WHEN dd>=100  THEN 1   END sf  ,num
	  FROM ( 
				SELECT city_code,dd,COUNT(*) num FROM (
					SELECT  big_code, city_code, FLOOR( ROUND(sfamount/sale_amount*100)/10    )*10   dd   
						FROM report_cst_deal_mid_own  WHERE  csttype=1 AND  NOT( proj_house_type ='商铺' OR proj_house_type ='车位') 
							AND sfamount>0 
				) a  GROUP BY city_code,dd
			) c
	) d GROUP BY sf,city_code; 
  UPDATE rpt_contract a, rpt_base_index b  SET a.index_name =b.index_name
   WHERE b.type_id='SF' AND a.type_id='SF' AND a.index_code=b.index_code AND a.dimension=3 ;
 
  /* 购买 */  
  INSERT INTO   rpt_contract(type_id, index_code, index_name,index_value,create_time,DIMENSION,city_code)  
  SELECT 	 'CFGM','1','1套', COUNT(*), v_date ,3, city_code FROM ( 
  SELECT * FROM (  
  SELECT   cstguid, @rownum:=@rownum+1,  
  IF(@pdept=a.cstguid,@rank:=@rank+1,@rank:=1) AS rank,@pdept:=a.cstguid  , city_code 
  FROM (   
    SELECT  city_code, cstguid FROM
	  	  report_cst_deal_mid_own  WHERE csttype=1 AND  NOT( proj_house_type ='商铺' OR proj_house_type ='车位')   ORDER BY cstguid ,deal_date DESC    
		    ) a , 
	 	(SELECT @rownum :=0 , @pdept := NULL ,@rank:=0) b  
     	) result 
		) c WHERE rank=1 GROUP BY city_code; 
 
  INSERT INTO   rpt_contract(type_id, index_code, index_name,index_value,create_time,DIMENSION,    city_code  )  
 	SELECT   'CFGM','2','2套',COUNT(DISTINCT c.cstGUID), v_date ,3,  city_code    FROM (
		SELECT   cstguid,   COUNT(*) ts 
		FROM rpt_cst_repeat_buy_detail  WHERE csttype=1 AND  NOT( proj_house_type ='商铺' OR proj_house_type ='车位')  
		GROUP BY cstguid HAVING COUNT(*)=2
	)a , rpt_cst_repeat_buy_detail c WHERE a.cstguid=c.cstGUID
	GROUP BY city_code;
  INSERT INTO   rpt_contract(type_id, index_code, index_name,index_value,create_time,DIMENSION,    city_code  )  
 	SELECT   'CFGM','3','3套',COUNT(DISTINCT c.cstGUID), v_date ,3,  city_code    FROM (
		SELECT   cstguid,   COUNT(*) ts 
		FROM rpt_cst_repeat_buy_detail  WHERE csttype=1 AND  NOT( proj_house_type ='商铺' OR proj_house_type ='车位')  
		GROUP BY cstguid HAVING COUNT(*)=3
	)a , rpt_cst_repeat_buy_detail c WHERE a.cstguid=c.cstGUID
	GROUP BY city_code;
  INSERT INTO   rpt_contract(type_id, index_code, index_name,index_value,create_time,DIMENSION,    city_code  )  
 	SELECT   'CFGM','4','4套及以上',COUNT(DISTINCT c.cstGUID), v_date ,3,  city_code    FROM (
		SELECT   cstguid,   COUNT(*) ts 
		FROM rpt_cst_repeat_buy_detail  WHERE csttype=1 AND  NOT( proj_house_type ='商铺' OR proj_house_type ='车位')  
		GROUP BY cstguid HAVING COUNT(*)=3
	)a , rpt_cst_repeat_buy_detail c WHERE a.cstguid=c.cstGUID
	GROUP BY city_code;
  /* 分公司 结束 */
  UPDATE  rpt_contract a, (SELECT * FROM b_org WHERE orgtype=3 AND subtype=1)b 
   SET a.city_code=b.orgGUID  WHERE a.dimension=1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_proj_homepage_data` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_proj_homepage_data` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_proj_homepage_data`(IN p_totaldate VARCHAR(10))
BEGIN
	 
  DECLARE v_date DATETIME;
 
  DECLARE v_Y_edate DATETIME;
  DECLARE v_Num INT; 
  DECLARE v_Num_amount DOUBLE(20,3); 
  DECLARE v_Num1 INT; 
  DECLARE v_Num2 INT; 
  DECLARE v_Num3 INT; 
  DECLARE v_Num4 INT; 
  DECLARE v_Ydate DATETIME;
  DECLARE v_num_count INT;
  DECLARE v_curM_bDate DATETIME;
  DECLARE v_curM_EDate DATETIME;
  IF  p_totaldate ='AUTO' THEN
		 SET  v_date = DATE_FORMAT(CURDATE()  ,'%Y-%m-%d');
  ELSE
		 SET	v_date = p_totaldate;
  END IF;
 
  SET v_Ydate =  DATE_ADD(v_date, INTERVAL -1 DAY) ;
  SET v_curM_bDate  =DATE_FORMAT(v_date ,'%Y-%m-01');
  SET v_curM_EDate  = LAST_DAY (v_curM_bDate);
  
  DELETE FROM rpt_proj_house WHERE create_time=v_date;
  INSERT INTO  rpt_proj_house( big_code,city_code, city_name,big_name, create_time  )  
   SELECT   big_code  ,city_Code ,city_name,big_name ,v_date FROM  v_org_city_area    ; 
     
 
  /*售完项目 */    /*售完套数 */  
  UPDATE rpt_proj_house a,( SELECT   big_code,city_code, COUNT(*) v_Num1 ,SUM(sale_sum) v_num_count1    FROM rpt_b_proj_sum WHERE STATUS='已售'  GROUP BY  big_code,city_code  ) b
      SET  proj_sold =b.v_Num1,proj_sold_set =b.v_num_count1 
  WHERE  create_time=v_date AND  a.big_code=b.big_code AND a.city_code=b.city_code ;
 
  UPDATE rpt_proj_house a,( SELECT  big_code,city_code,  COUNT(*) v_Num1 ,SUM(sale_sum) v_num_count1     FROM rpt_b_proj_sum WHERE STATUS='在售' GROUP BY  big_code,city_code    ) b
      SET  proj_onsell =b.v_Num1,proj_onsell_set =b.v_num_count1 
  WHERE  create_time=v_date AND  a.big_code=b.big_code AND a.city_code=b.city_code ;
  
	 /*'昨日成交',*/
	 UPDATE rpt_proj_house a,( SELECT COUNT(*) v_Num1, SUM(sale_amount) v_Num_amount1,big_code,city_code   FROM report_cst_deal_mid_bak2  
                              WHERE deal_date=v_Ydate  AND  NOT( proj_house_type='商铺' OR  proj_house_type='车位') GROUP BY big_code,city_code ) b
      SET proj_deal01 = b.v_Num_amount1,proj_deal01_set = b.v_Num1       
   WHERE  create_time=v_date AND a.big_code=b.big_code AND a.city_code=b.city_code;
 
	/*'本月成交',*/
	 UPDATE rpt_proj_house a,( SELECT COUNT(*) v_Num1, SUM(sale_amount) v_Num_amount1,big_code,city_code   FROM report_cst_deal_mid_bak2  
                              WHERE   deal_date BETWEEN  v_curM_bDate AND   v_curM_EDate AND  NOT( proj_house_type='商铺' OR  proj_house_type='车位') GROUP BY big_code,city_code  ) b
      SET proj_deal02 = v_Num_amount1,proj_deal02_set = b.v_Num1        
   WHERE  create_time=v_date AND a.big_code=b.big_code AND a.city_code=b.city_code;
 
  
   /* proj_deal04          int comment '本年成交',*/
	 UPDATE rpt_proj_house a,( SELECT COUNT(*) v_Num1, SUM(sale_amount) v_Num_amount1,big_code,city_code  FROM report_cst_deal_mid_bak2  
                              WHERE   YEAR(   deal_date ) = YEAR( v_date) AND  NOT( proj_house_type='商铺' OR  proj_house_type='车位') 
							GROUP BY big_code,city_code   ) b
      SET proj_deal04 = v_Num_amount1,proj_deal04_set= b.v_Num1        
   WHERE  create_time=v_date AND a.big_code=b.big_code AND a.city_code=b.city_code;
 
   
  /*    proj_deal03          int comment '本季成交', */ 
	 UPDATE rpt_proj_house a,( SELECT COUNT(*) v_Num1, SUM(sale_amount) v_Num_amount1,big_code,city_code  FROM report_cst_deal_mid_bak2  
                              WHERE    QUARTER( deal_date ) = QUARTER( v_date)  AND  YEAR(   deal_date ) = YEAR( v_date)  AND
                                       NOT( proj_house_type='商铺' OR  proj_house_type='车位') GROUP BY big_code,city_code  ) b
      SET proj_deal03 = v_Num_amount1,proj_deal03_set= b.v_Num1        
   WHERE  create_time=v_date AND a.big_code=b.big_code AND a.city_code=b.city_code;
 
  /*   proj_set01   int comment '租售套数', */   
   UPDATE rpt_proj_house a,( SELECT  SUM(sale_sum) v_num_count1,big_code,city_code    FROM rpt_b_proj_sum WHERE STATUS='已售' OR  STATUS='在售'  GROUP BY  big_code,city_code ) b
      SET   proj_set01 =ABS(v_num_count1 )
   WHERE  create_time=v_date AND a.big_code=b.big_code AND a.city_code=b.city_code;
 
   /*  proj_set02    int comment '库存套数', */ 
   UPDATE rpt_proj_house a,( SELECT  SUM(xs_Sale_house_num) v_num_count1,big_code,city_code    FROM rpt_b_proj_sum WHERE  STATUS='在售' GROUP BY  big_code,city_code   ) b
      SET   proj_set02 =ABS(v_num_count1) 
   WHERE  create_time=v_date AND a.big_code=b.big_code AND a.city_code=b.city_code;
 
   /*   proj_rate   double comment '总去化率' */
   UPDATE rpt_proj_house SET proj_rate = FLOOR( proj_set02/(proj_set01+ proj_set02)*10000 )/100   WHERE create_time=v_date;
   UPDATE rpt_proj_house a,b_org b SET a.path = b.path  WHERE a.city_code=b.orgGUID;
  /*   住宅项目 结束 */ 
  /*   项目汇总 开始*/
  DELETE FROM rpt_proj_complete WHERE  create_time=v_date ; 
  INSERT INTO rpt_proj_complete(yesterday_deal,month_deal  ,quarter_deal, year_deal ,onsell_deal ,complete_deal,create_time,big_code,city_code)
    SELECT SUM(proj_deal01 ) ,SUM(proj_deal02),SUM(proj_deal03 ),SUM(proj_deal04 ) ,SUM(proj_onsell),SUM(complete_deal),  v_date ,big_code,city_code   FROM (
					SELECT proj_deal01  ,proj_deal02  ,  proj_deal03   ,proj_deal04 , proj_onsell ,0 complete_deal ,big_code,city_code   
                    FROM   rpt_proj_house  WHERE  create_time=v_date  
      UNION ALL
          SELECT proj_deal01 +proj_deal05,proj_deal02+proj_deal06 , proj_deal03+proj_deal07 , proj_deal04+proj_deal08,0,0 ,big_code,city_code    
					FROM   rpt_proj_properties WHERE  create_time=v_date 
     UNION ALL
          SELECT 0,0,0,0,0,1, b.big_code,b.city_code    FROM b_proj a LEFT JOIN v_proj_area_city_name_new b ON a.projGUID=b.projGUID
    
     ) a  GROUP BY  big_code,city_code ; 
 
  UPDATE rpt_proj_complete a,v_org_city_area b 
	SET a.big_name=b.big_name ,a.city_name=b.city_name 
	WHERE a.big_code=b.big_code AND a.city_code=b.city_code;
 /* 	union all 
					select sale_yest_deal,sale_month_deal, sale_season_deal  ,sale_year_deal  ,sale_proj_num ,sale_proj_num+rent_proj_num ,big_code,city_code      from   rpt_zy_proj_rent_sale 
						WHERE  create_time=v_date 
 */
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_proj_homepage_data_1` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_proj_homepage_data_1` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_proj_homepage_data_1`(IN p_totaldate VARCHAR(10))
BEGIN
	 
  DECLARE v_date DATETIME;
  DECLARE v_Ydate DATETIME;
  DECLARE v_Y_edate DATETIME;
  DECLARE v_Num INT; 
  DECLARE v_Num_amount DOUBLE(20,3); 
  DECLARE v_Num1 INT; 
  DECLARE v_Num2 INT; 
  DECLARE v_Num3 INT; 
  DECLARE v_Num4 INT; 
  DECLARE v_num_count INT;
  DECLARE v_curM_bDate DATETIME;
  DECLARE v_curM_EDate DATETIME;
  IF  p_totaldate ='AUTO' THEN
		 SET  v_date = DATE_FORMAT(CURDATE()  ,'%Y-%m-%d');
  ELSE
		 SET	v_date = p_totaldate;
  END IF;
 
  SET v_Ydate =  DATE_ADD(v_date, INTERVAL -1 DAY) ;
  SET v_curM_bDate  =DATE_FORMAT(v_date ,'%Y-%m-01');
  SET v_curM_EDate  = LAST_DAY (v_curM_bDate);
  
  /* 总部统计 开始 */
  /* 客户与成交  住宅销售分析表*/ 
  
  DELETE FROM rpt_residential_sale WHERE  create_time=v_date AND DIMENSION=1 ; 
  INSERT INTO rpt_residential_sale(    visit_number  ,recognition_number  , recognition_counts   ,  subscribe_number ,   subscribe_counts,   
      contract_numner ,   contract_counts  ,   visit_cst_num  , confess_cst_num , subscribe_cst_num ,   contract_cst_num ,   visit_days  ,
   recognition_days ,   subscribe_days ,   contract_days , visit_contract_days,create_time ,DIMENSION)
   SELECT 0,0,0,0,0,0,0,0,0,0,0,0,0 ,0,0,0,   v_date ,1  ;
  UPDATE   rpt_residential_sale  a,( 
    SELECT COUNT(DISTINCT cstGUID) AS visit_number  FROM rpt_cst_opp_mid  WHERE createtime   <=v_date
     ) b
  SET a.visit_number=b.visit_number
  WHERE a.create_time=v_date  AND DIMENSION=1;
   /*   '认筹人数',  '认筹套数', '认购人数',  '认购套数', '签约人数',  '签约套数' */
 
  
   UPDATE   rpt_residential_sale  a,(  
                                      
       SELECT COUNT(DISTINCT cstguid) AS recognition_number ,COUNT(*) AS recognition_counts 
       FROM  rpt_book_cst_mid 
       WHERE bgndate<=v_date
               ) b
   SET  a.recognition_number =b.recognition_number,
        a.recognition_counts =b.recognition_counts 
   WHERE a.create_time=v_date   AND DIMENSION=1  ;
   UPDATE   rpt_residential_sale  a,(  
                                      
       SELECT COUNT(DISTINCT cstguid) AS subscribe_number ,COUNT(*) AS subscribe_counts 
       FROM  rpt_order_cst_mid 
       WHERE qsdate<=v_date
   ) b
   SET  a.subscribe_number =b.subscribe_number,
        a.subscribe_counts =b.subscribe_counts 
   WHERE a.create_time=v_date   AND DIMENSION=1  ;
   UPDATE   rpt_residential_sale  a,(  
                                      
       SELECT COUNT(DISTINCT cstguid) AS contract_numner ,COUNT(DISTINCT tradeGUID)  AS contract_counts  
       FROM  report_cst_deal_mid_own
       WHERE deal_date<=v_date
   ) b
   SET  a.contract_numner =b.contract_numner,
        a.contract_counts =b.contract_counts 
   WHERE a.create_time=v_date   AND DIMENSION=1  ;
		 
    
    /* 转化率周期   visit_days   int comment '访转筹天数',   contract_days int comment '购转签天数',    */
	 UPDATE   rpt_residential_sale  a,(  
    	SELECT  SUM(DATEDIFF(e.bgnDate,d.firstVistTime)  )/COUNT(*) AS visit_days   FROM 
		     rpt_book_cst_mid  e, rpt_cst_opp_first_mid   d  ,rpt_b_proj_sum f           
			WHERE d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID AND d.projGUID=f.proj_guid  AND  STATUS='在售'  
            
      
	 ) b
	 SET a.visit_days=ABS(b.visit_days)
   WHERE a.create_time=v_date  AND DIMENSION=1;
	 UPDATE   rpt_residential_sale  a,( 
			SELECT   
				   FLOOR( SUM(confess_days)/SUM(CASE WHEN confess_days=0 THEN 0 ELSE 1 END )) contract_days  
			FROM rpt_index_flow  
			WHERE projSaleStatus='在售' AND   createtime<=v_date  
	 ) b
	 SET  a.contract_days=b.contract_days
   WHERE a.create_time=v_date  AND DIMENSION=1;
  /*      recognition_days     int comment '筹转购天数',   */ 
	 UPDATE   rpt_residential_sale  a,( 
				SELECT  FLOOR( ABS(SUM(DATEDIFF(e.bgnDate,d.qsDate)  )) /COUNT(*) ) recognition_days  FROM 
						rpt_book_cst_mid  e, rpt_order_cst_mid   d   
				WHERE   d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID  
						 AND NOT( proj_house_type='商铺' OR  proj_house_type='车位') 
						 AND  d.qsDate<=v_date  
		 
    ) b 
   SET a.recognition_days=b.recognition_days
   WHERE a.create_time=v_date AND      DIMENSION=1;
   /*   subscribe_days       int comment '访转购天数', */
	 UPDATE   rpt_residential_sale  a,( 
		SELECT  FLOOR( ABS(SUM(DATEDIFF(e.firstVistTime ,d.qsDate) ) ) /COUNT(*) ) subscribe_days    FROM 
					rpt_cst_opp_first_mid e,rpt_order_cst_mid  d
		WHERE   d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID  AND NOT( proj_house_type='商铺' OR  proj_house_type='车位')
					AND d.qsDate<=v_date 
 
    ) b 
   SET a.subscribe_days=b.subscribe_days
   WHERE a.create_time=v_date   AND DIMENSION=1;
 
   /*  visit_contract_days  int comment '访转签天数',   */ 
   UPDATE   rpt_residential_sale  a,( 
		SELECT FLOOR(ABS(SUM(DATEDIFF(e.firstVistTime ,d.deal_date) )) /COUNT(*)) visit_contract_days    FROM  rpt_cst_opp_first_mid e,report_cst_deal_mid_own    d
		WHERE   d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID  AND NOT( proj_house_type='商铺' OR  proj_house_type='车位')
          AND d.deal_date<=v_date 
    
   ) b 
   SET a.visit_contract_days=b.visit_contract_days
   WHERE a.create_time=v_date   AND DIMENSION=1;
 
  
  /*平均转化率  夸项目 不算  */
  /*   visit_reco_num       int comment '访转筹人数'   */
   
  UPDATE   rpt_residential_sale  a,( 
		SELECT   COUNT(DISTINCT e.cstGUID) AS   visit_reco_num  
    FROM  rpt_cst_opp_first_mid e,rpt_book_cst_mid    d
	  WHERE   d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID   
          AND d.bgnDate<=v_date 
     
  ) b 
  SET a.visit_reco_num=b.visit_reco_num
  WHERE a.create_time=v_date   AND DIMENSION=1;
 
  /*  recognition_subs_num  int comment '筹转购人数'   */
   
  UPDATE   rpt_residential_sale  a,( 
		SELECT COUNT(DISTINCT e.cstGUID) AS recognition_subs_num  
    FROM  rpt_order_cst_mid e,rpt_book_cst_mid    d
	  WHERE    d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID  
          AND NOT( proj_house_type='商铺' OR  proj_house_type='车位')
          AND e.qsdate<=v_date 
 
  ) b 
  SET a.recognition_subs_num=b.recognition_subs_num
  WHERE a.create_time=v_date    AND DIMENSION=1;
  /* visit_subscribe_num    int comment '访转购人数' */
  UPDATE   rpt_residential_sale  a,( 
		SELECT   COUNT(DISTINCT e.cstGUID)  AS visit_subscribe_num  
    FROM  rpt_order_cst_mid e,rpt_cst_opp_first_mid    d
	  WHERE    d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID  
          AND NOT( proj_house_type='商铺' OR  proj_house_type='车位')
          AND e.qsdate<=v_date 
   
  ) b 
  SET a.visit_subscribe_num=b.visit_subscribe_num
  WHERE a.create_time=v_date   AND DIMENSION=1;
  /*平均转化率  夸项目 不算，
    
   subs_contract_num        int comment '购转签人数',
   visit_contract_num       int comment '访转签人数', 
  
	*/
  UPDATE   rpt_residential_sale  a,( 
		SELECT   COUNT(DISTINCT e.cstGUID) AS subs_contract_num  
     FROM  rpt_order_cst_mid e,report_cst_deal_mid_own    d
	   WHERE    d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID  
          AND NOT( d.proj_house_type='商铺' OR  d.proj_house_type='车位')
          AND e.qsdate<=v_date 
  
  ) b 
  SET a.subs_contract_num=b.subs_contract_num
  WHERE a.create_time=v_date AND DIMENSION=1;
 
  UPDATE   rpt_residential_sale  a,( 
		SELECT COUNT(DISTINCT e.cstGUID) AS visit_contract_num  
    FROM  rpt_cst_opp_first_mid e,report_cst_deal_mid_own    d
	  WHERE    d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID  
          AND NOT( d.proj_house_type='商铺' OR  d.proj_house_type='车位')
          AND d.deal_date<=v_date 
 
  ) b 
  SET a.visit_contract_num=b.visit_contract_num
  WHERE a.create_time=v_date AND DIMENSION=1;
 
  /* 总部统计 结束 */ 
  
  UPDATE  rpt_residential_sale  a, (SELECT * FROM b_org WHERE orgtype=3 AND subtype=1)b 
   SET a.city_code=b.orgGUID  WHERE a.dimension=1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_proj_homepage_data_2` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_proj_homepage_data_2` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_proj_homepage_data_2`(IN p_totaldate VARCHAR(10))
BEGIN
	 
  DECLARE v_date DATETIME;
  DECLARE v_Ydate DATETIME;
  DECLARE v_Y_edate DATETIME;
  DECLARE v_Num INT; 
  DECLARE v_Num_amount DOUBLE(20,3); 
  DECLARE v_Num1 INT; 
  DECLARE v_Num2 INT; 
  DECLARE v_Num3 INT; 
  DECLARE v_Num4 INT; 
  DECLARE v_num_count INT;
  DECLARE v_curM_bDate DATETIME;
  DECLARE v_curM_EDate DATETIME;
  IF  p_totaldate ='AUTO' THEN
		 SET  v_date = DATE_FORMAT(CURDATE()  ,'%Y-%m-%d');
  ELSE
		 SET	v_date = p_totaldate;
  END IF;
 
  SET v_Ydate =  DATE_ADD(v_date, INTERVAL -1 DAY) ;
  SET v_curM_bDate  =DATE_FORMAT(v_date ,'%Y-%m-01');
  SET v_curM_EDate  = LAST_DAY (v_curM_bDate);
  
    
  /* 大区统计 开始 */
  /* 客户与成交  住宅销售分析表*/ 
  
  DELETE FROM rpt_residential_sale WHERE  create_time=v_date AND  DIMENSION=2;
  INSERT INTO rpt_residential_sale(    visit_number  ,recognition_number  , recognition_counts   ,  subscribe_number ,   subscribe_counts,   
      contract_numner ,   contract_counts  ,   visit_cst_num  , confess_cst_num , subscribe_cst_num ,   contract_cst_num ,   visit_days  ,
   recognition_days ,   subscribe_days ,   contract_days , visit_contract_days,create_time ,city_code,big_code,DIMENSION)
   SELECT DISTINCT 0,0,0,0,0,0,0,0,0,0,0,0,0 ,0,0,0,   v_date ,big_code,big_code,2 FROM  v_org_city_area;
  UPDATE   rpt_residential_sale  a,( 
  SELECT COUNT(DISTINCT cstGUID) AS visit_number,b.big_code  FROM rpt_cst_opp_mid a LEFT JOIN v_proj_area_city_name_new b ON a.projGUID=b.projGUID
  GROUP BY b.big_code   ) b
  SET a.visit_number=b.visit_number
  WHERE a.create_time=v_date AND a.big_code=b.big_code AND DIMENSION=2;
   /*   '认筹人数',  '认筹套数', '认购人数',  '认购套数', '签约人数',  '签约套数' */
   
   UPDATE   rpt_residential_sale  a,(                                        
       SELECT COUNT(DISTINCT cstguid) AS recognition_number ,COUNT(*) AS recognition_counts ,big_code
       FROM  rpt_book_cst_mid a
          LEFT JOIN  v_org_city_area b ON a.companyGUID=b.city_code
       WHERE bgndate<=v_date
       GROUP BY big_code
    ) b
   SET  a.recognition_number =b.recognition_number,
        a.recognition_counts =b.recognition_counts 
   WHERE a.create_time=v_date   AND DIMENSION=2 AND a.big_code=b.big_code;
   UPDATE   rpt_residential_sale  a,(  
                                      
       SELECT COUNT(DISTINCT cstguid) AS subscribe_number ,COUNT(*) AS subscribe_counts,big_code
       FROM  rpt_order_cst_mid a
          LEFT JOIN  v_org_city_area b ON a.companyGUID=b.city_code
       WHERE qsdate<=v_date
       GROUP BY big_code
   ) b
   SET  a.subscribe_number =b.subscribe_number,
        a.subscribe_counts =b.subscribe_counts 
   WHERE a.create_time=v_date   AND DIMENSION=2  AND a.big_code=b.big_code;
   UPDATE   rpt_residential_sale  a,(  
                                      
       SELECT COUNT(DISTINCT cstguid) AS contract_numner ,COUNT(DISTINCT tradeGUID)  AS contract_counts  ,big_code 
       FROM  report_cst_deal_mid_own
       WHERE deal_date<=v_date
   ) b
   SET  a.contract_numner =b.contract_numner,
        a.contract_counts =b.contract_counts 
   WHERE a.create_time=v_date   AND DIMENSION=2 AND a.big_code=b.big_code;
     
    /* 转化率周期   visit_days   int comment '访转筹天数',   contract_days int comment '购转签天数',    */
	 UPDATE   rpt_residential_sale  a,(  
    	SELECT   big_code,SUM(DATEDIFF(e.bgnDate,d.firstVistTime)  )/COUNT(*) AS visit_days   FROM 
		     rpt_book_cst_mid  e, rpt_cst_opp_first_mid   d  ,rpt_b_proj_sum f           
			WHERE d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID AND d.projGUID=f.proj_guid  AND    STATUS='在售'   
      GROUP BY big_code
	 ) b
	 SET a.visit_days=ABS(b.visit_days)
   WHERE a.create_time=v_date  AND DIMENSION=2 AND a.big_code=b.big_code;
 UPDATE   rpt_residential_sale  a,( 
			SELECT big_code, 
				   FLOOR( SUM(confess_days)/SUM(CASE WHEN confess_days=0 THEN 0 ELSE 1 END )) contract_days  
			FROM rpt_index_flow  
			WHERE projSaleStatus='在售' AND   createtime<=v_date 
			GROUP BY big_code 
      
	 ) b
	 SET  a.contract_days=b.contract_days
   WHERE a.create_time=v_date  AND DIMENSION=2 AND a.big_code=b.big_code;
  /*      recognition_days     int comment '筹转购天数',   */ 
	 UPDATE   rpt_residential_sale  a,( 
				SELECT f.big_code, FLOOR( ABS(SUM(DATEDIFF(e.bgnDate,d.qsDate)  )) /COUNT(*) ) recognition_days  FROM 
						rpt_book_cst_mid  e, rpt_order_cst_mid   d ,  rpt_proj_area_city_name f
				WHERE   d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID AND e.projGUID=f.projGUID   AND d.projGUID=f.projGUID
						 AND NOT( proj_house_type='商铺' OR  proj_house_type='车位') 
						 AND  d.qsDate<=v_date  
		    GROUP BY f.big_code
    ) b 
   SET a.recognition_days=b.recognition_days
   WHERE a.create_time=v_date AND   DIMENSION=2 AND a.big_code=b.big_code;
   /*   subscribe_days       int comment '访转购天数', */
	 UPDATE   rpt_residential_sale  a,( 
		SELECT f.big_code, FLOOR( ABS(SUM(DATEDIFF(e.firstVistTime ,d.qsDate) ) ) /COUNT(*) ) subscribe_days    FROM 
					rpt_cst_opp_first_mid e,rpt_order_cst_mid  d ,  rpt_proj_area_city_name f
		WHERE   d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID   AND d.projGUID=f.projGUID  AND NOT( proj_house_type='商铺' OR  proj_house_type='车位')
					AND d.qsDate<=v_date 
 	   GROUP BY f.big_code
    ) b 
   SET a.subscribe_days=b.subscribe_days
   WHERE a.create_time=v_date   AND DIMENSION=2  AND a.big_code=b.big_code;
 
   /*  visit_contract_days  int comment '访转签天数',   */ 
   UPDATE   rpt_residential_sale  a,( 
		SELECT d.big_code,FLOOR(ABS(SUM(DATEDIFF(e.firstVistTime ,d.deal_date) )) /COUNT(*)) visit_contract_days    FROM  rpt_cst_opp_first_mid e,report_cst_deal_mid_own    d
		WHERE   d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID  AND NOT( proj_house_type='商铺' OR  proj_house_type='车位')
          AND d.deal_date<=v_date 
    GROUP BY d.big_code
   ) b 
   SET a.visit_contract_days=b.visit_contract_days
   WHERE a.create_time=v_date   AND DIMENSION=2  AND a.big_code=b.big_code;
 
  
  /*平均转化率  夸项目 不算  */ 
  /*   visit_reco_num       int comment '访转筹人数'   */
   
  UPDATE   rpt_residential_sale  a,( 
		SELECT f.big_code,f.companyGUID, COUNT(DISTINCT e.cstGUID) AS   visit_reco_num  
    FROM  rpt_cst_opp_first_mid e,rpt_book_cst_mid    d, rpt_proj_area_city_name f
	  WHERE   d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID  AND d.projGUID=f.projGUID
          AND d.bgnDate<=v_date 
    GROUP BY f.big_code 
  ) b 
  SET a.visit_reco_num=b.visit_reco_num
  WHERE a.create_time=v_date AND a.big_code=b.big_code  AND DIMENSION=2;
 
  /*  recognition_subs_num  int comment '筹转购人数'   */
   
  UPDATE   rpt_residential_sale  a,( 
		SELECT f.big_code,COUNT(DISTINCT e.cstGUID) AS recognition_subs_num  
    FROM  rpt_order_cst_mid e,rpt_book_cst_mid   d, rpt_proj_area_city_name f
	  WHERE    d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID   AND d.projGUID=f.projGUID
          AND NOT( proj_house_type='商铺' OR  proj_house_type='车位') 
          AND e.qsdate<=v_date 
    GROUP BY f.big_code
  ) b 
  SET a.recognition_subs_num=b.recognition_subs_num
  WHERE a.create_time=v_date AND a.big_code=b.big_code  AND DIMENSION=2;
  /* visit_subscribe_num    int comment '访转购人数' */
  UPDATE   rpt_residential_sale  a,( 
		SELECT  big_code, COUNT(DISTINCT e.cstGUID)  AS visit_subscribe_num  
    FROM  rpt_order_cst_mid e,rpt_cst_opp_first_mid    d,rpt_proj_area_city_name f
	  WHERE    d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID   AND d.projGUID=f.projGUID
          AND NOT( proj_house_type='商铺' OR  proj_house_type='车位')
          AND e.qsdate<=v_date 
    GROUP BY big_code
  ) b 
  SET a.visit_subscribe_num=b.visit_subscribe_num
  WHERE a.create_time=v_date AND a.big_code=b.big_code  AND DIMENSION=2;
  /*平均转化率  夸项目 不算，
    
   subs_contract_num        int comment '购转签人数',
   visit_contract_num       int comment '访转签人数', */
  UPDATE   rpt_residential_sale  a,( 
		SELECT  big_code,COUNT(DISTINCT e.cstGUID) AS subs_contract_num  
     FROM  rpt_order_cst_mid e,report_cst_deal_mid_own    d
	   WHERE    d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID  
          AND NOT( d.proj_house_type='商铺' OR  d.proj_house_type='车位')
          AND e.qsdate<=v_date 
    GROUP BY big_code
  ) b 
  SET a.subs_contract_num=b.subs_contract_num
  WHERE a.create_time=v_date AND a.big_code=b.big_code AND DIMENSION=2;
  UPDATE   rpt_residential_sale  a,( 
		SELECT big_code,COUNT(DISTINCT e.cstGUID) AS visit_contract_num  
    FROM  rpt_cst_opp_first_mid e,report_cst_deal_mid_own    d
	  WHERE    d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID  
          AND NOT( d.proj_house_type='商铺' OR  d.proj_house_type='车位')
          AND d.deal_date<=v_date 
    GROUP BY big_code
  ) b 
  SET a.visit_contract_num=b.visit_contract_num
  WHERE a.create_time=v_date AND a.big_code=b.big_code  AND DIMENSION=2;
  /* 大区统计 结束 */
 
 
  UPDATE rpt_residential_sale SET visit_cst_num=visit_number,confess_cst_num=recognition_number,subscribe_cst_num=subscribe_number,contract_cst_num=contract_numner;
 
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_proj_homepage_data_3` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_proj_homepage_data_3` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_proj_homepage_data_3`(IN p_totaldate VARCHAR(10))
BEGIN
	 
  DECLARE v_date DATETIME;
  DECLARE v_Ydate DATETIME;
  DECLARE v_Y_edate DATETIME;
  DECLARE v_Num INT; 
  DECLARE v_Num_amount DOUBLE(20,3); 
  DECLARE v_Num1 INT; 
  DECLARE v_Num2 INT; 
  DECLARE v_Num3 INT; 
  DECLARE v_Num4 INT; 
  DECLARE v_num_count INT;
  DECLARE v_curM_bDate DATETIME;
  DECLARE v_curM_EDate DATETIME;
  IF  p_totaldate ='AUTO' THEN
		 SET  v_date = DATE_FORMAT(CURDATE()  ,'%Y-%m-%d');
  ELSE
		 SET	v_date = p_totaldate;
  END IF;
 
  SET v_Ydate =  DATE_ADD(v_date, INTERVAL -1 DAY) ;
  SET v_curM_bDate  =DATE_FORMAT(v_date ,'%Y-%m-01');
  SET v_curM_EDate  = LAST_DAY (v_curM_bDate);
  /* 分公司的统计 开始 */
  /* 客户与成交  住宅销售分析表*/ 
  
  DELETE FROM rpt_residential_sale WHERE  create_time=v_date AND  DIMENSION=3;
  INSERT INTO rpt_residential_sale(    visit_number  ,recognition_number  , recognition_counts   ,  subscribe_number ,   subscribe_counts,   
      contract_numner ,   contract_counts  ,   visit_cst_num  , confess_cst_num , subscribe_cst_num ,   contract_cst_num ,   visit_days  ,
   recognition_days ,   subscribe_days ,   contract_days , visit_contract_days,create_time ,city_code,big_code,DIMENSION)
   SELECT 0,0,0,0,0,0,0,0,0,0,0,0,0 ,0,0,0,   v_date ,city_code,big_code,3 FROM  v_org_city_area;
  UPDATE   rpt_residential_sale  a,( 
  SELECT COUNT(DISTINCT cstGUID) AS visit_number,b.city_code  FROM rpt_cst_opp_mid a LEFT JOIN v_proj_area_city_name_new b ON a.projGUID=b.projGUID
  GROUP BY b.city_code   ) b
  SET a.visit_number=b.visit_number
  WHERE a.create_time=v_date AND a.city_code=b.city_code AND DIMENSION=3;
   /*   '认筹人数',  '认筹套数', '认购人数',  '认购套数', '签约人数',  '签约套数' */
   UPDATE   rpt_residential_sale  a,(                                        
       SELECT COUNT(DISTINCT cstguid) AS recognition_number ,COUNT(*) AS recognition_counts ,companyGUID
       FROM  rpt_book_cst_mid a
   
       WHERE bgndate<=v_date
       GROUP BY companyGUID
    ) b
   SET  a.recognition_number =b.recognition_number,
        a.recognition_counts =b.recognition_counts 
   WHERE a.create_time=v_date   AND DIMENSION=3 AND a.city_code=b.companyGUID;
   UPDATE   rpt_residential_sale  a,(  
                                      
       SELECT COUNT(DISTINCT cstguid) AS subscribe_number ,COUNT(*) AS subscribe_counts,companyGUID
       FROM  rpt_order_cst_mid  
       WHERE qsdate<=v_date
       GROUP BY companyGUID
   ) b
   SET  a.subscribe_number =b.subscribe_number,
        a.subscribe_counts =b.subscribe_counts 
   WHERE a.create_time=v_date   AND DIMENSION=3  AND a.city_code=b.companyGUID;
   UPDATE   rpt_residential_sale  a,(                                        
       SELECT COUNT(DISTINCT cstguid) AS contract_numner ,COUNT(DISTINCT tradeGUID)  AS contract_counts  ,city_code 
       FROM  report_cst_deal_mid_own
       WHERE deal_date<=v_date
   ) b
   SET  a.contract_numner =b.contract_numner,
        a.contract_counts =b.contract_counts 
   WHERE a.create_time=v_date   AND DIMENSION=3 AND a.city_code=b.city_code;
    /* 转化率周期  visit_days   int comment '访转筹天数',   contract_days int comment '购转签天数', */
	 UPDATE   rpt_residential_sale  a,(  
    	SELECT  big_code,city_code, SUM(DATEDIFF(e.bgnDate,d.firstVistTime)  )/COUNT(*) AS visit_days   FROM 
		     rpt_book_cst_mid  e, rpt_cst_opp_first_mid   d  ,rpt_b_proj_sum f           
			WHERE d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID AND d.projGUID=f.proj_guid  AND  STATUS='在售' 
      GROUP BY big_code,city_code
	 ) b
	 SET a.visit_days=ABS(b.visit_days)
   WHERE a.create_time=v_date AND a.big_code=b.big_code AND a.city_code=b.city_code  AND DIMENSION=3; 
	 UPDATE   rpt_residential_sale  a,( 
		SELECT 
				   FLOOR( SUM(confess_days)/SUM(CASE WHEN confess_days=0 THEN 0 ELSE 1 END )) contract_days ,big_code,city_code
		FROM rpt_index_flow  WHERE projSaleStatus='在售' AND   createtime=v_date
    GROUP BY big_code,city_code
      
	 ) b
	 SET  a.contract_days=b.contract_days
   WHERE a.create_time=v_date AND a.big_code=b.big_code AND a.city_code=b.city_code  AND DIMENSION=3;
  /*      recognition_days     int comment '筹转购天数',   */ 
	 UPDATE   rpt_residential_sale  a,( 
				SELECT e.projGUID,f.city_Code,f.big_code ,FLOOR( ABS(SUM(DATEDIFF(e.bgnDate,d.qsDate)  )) /COUNT(*) ) recognition_days  FROM 
						rpt_book_cst_mid  e, rpt_order_cst_mid   d  , v_proj_area_city_name_new f
				WHERE   d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID AND e.projGUID=f.projGUID  
						 AND NOT( proj_house_type='商铺' OR  proj_house_type='车位') 
						 AND  d.qsDate<=v_date  
				GROUP BY e.projGUID,f.city_Code,f.big_code
    ) b 
   SET a.recognition_days=b.recognition_days
   WHERE a.create_time=v_date AND a.city_code=b.city_code AND a.big_code=b.big_code  AND DIMENSION=3;
   /*   subscribe_days       int comment '访转购天数', */
	 UPDATE   rpt_residential_sale  a,( 
		SELECT d.companyGUID,FLOOR( ABS(SUM(DATEDIFF(e.firstVistTime ,d.qsDate) ) ) /COUNT(*) ) subscribe_days    FROM 
					rpt_cst_opp_first_mid e,rpt_order_cst_mid  d
		WHERE   d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID  AND NOT( proj_house_type='商铺' OR  proj_house_type='车位')
					AND d.qsDate<=v_date 
    GROUP BY d.companyGUID
    ) b 
   SET a.subscribe_days=b.subscribe_days
   WHERE a.create_time=v_date AND a.city_code=b.companyGUID  AND DIMENSION=3;
 
   /*  visit_contract_days  int comment '访转签天数',   */ 
   UPDATE   rpt_residential_sale  a,( 
		SELECT city_code,FLOOR(ABS(SUM(DATEDIFF(e.firstVistTime ,d.deal_date) )) /COUNT(*)) visit_contract_days    FROM  rpt_cst_opp_first_mid e,report_cst_deal_mid_own    d
		WHERE   d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID  AND NOT( proj_house_type='商铺' OR  proj_house_type='车位')
          AND d.deal_date<=v_date 
    GROUP BY city_code
   ) b 
   SET a.visit_contract_days=b.visit_contract_days
   WHERE a.create_time=v_date AND a.city_code=b.city_code  AND DIMENSION=3;
 
  
  /*平均转化率  夸项目 不算  */
  /*   visit_reco_num       int comment '访转筹人数'   */
   
  UPDATE   rpt_residential_sale  a,( 
		SELECT companyGUID, COUNT(DISTINCT e.cstGUID) AS   visit_reco_num  
    FROM  rpt_cst_opp_first_mid e,rpt_book_cst_mid    d
	  WHERE   d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID   
          AND d.bgnDate<=v_date 
    GROUP BY companyGUID 
  ) b 
  SET a.visit_reco_num=b.visit_reco_num
  WHERE a.create_time=v_date AND a.city_code=b.companyGUID  AND DIMENSION=3;
 
  /*  recognition_subs_num  int comment '筹转购人数'   */
   
  UPDATE   rpt_residential_sale  a,( 
		SELECT d.companyGUID ,COUNT(DISTINCT e.cstGUID) AS recognition_subs_num  
    FROM  rpt_order_cst_mid e,rpt_book_cst_mid    d
	  WHERE    d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID  
          AND NOT( proj_house_type='商铺' OR  proj_house_type='车位')
          AND e.qsdate<=v_date 
    GROUP BY d.companyGUID
  ) b 
  SET a.recognition_subs_num=b.recognition_subs_num
  WHERE a.create_time=v_date AND a.city_code=b.companyGUID  AND DIMENSION=3;
  /* visit_subscribe_num    int comment '访转购人数' */
  UPDATE   rpt_residential_sale  a,( 
		SELECT  companyGUID, COUNT(DISTINCT e.cstGUID)  AS visit_subscribe_num  
    FROM  rpt_order_cst_mid e,rpt_cst_opp_first_mid    d
	  WHERE    d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID  
          AND NOT( proj_house_type='商铺' OR  proj_house_type='车位')
          AND e.qsdate<=v_date 
    GROUP BY companyGUID
  ) b 
  SET a.visit_subscribe_num=b.visit_subscribe_num
  WHERE a.create_time=v_date AND a.city_code=b.companyGUID  AND DIMENSION=3;
  /*平均转化率  夸项目 不算，
    
   subs_contract_num        int comment '购转签人数',
   visit_contract_num       int comment '访转签人数', */
  UPDATE   rpt_residential_sale  a,( 
		SELECT  city_code,COUNT(DISTINCT e.cstGUID) AS subs_contract_num  
     FROM  rpt_order_cst_mid e,report_cst_deal_mid_own    d
	   WHERE    d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID  
          AND NOT( d.proj_house_type='商铺' OR  d.proj_house_type='车位')
          AND e.qsdate<=v_date 
    GROUP BY city_code
  ) b 
  SET a.subs_contract_num=b.subs_contract_num
  WHERE a.create_time=v_date AND a.city_code=b.city_code AND DIMENSION=3;
  UPDATE   rpt_residential_sale  a,( 
		SELECT city_code,COUNT(DISTINCT e.cstGUID) AS visit_contract_num  
    FROM  rpt_cst_opp_first_mid e,report_cst_deal_mid_own    d
	  WHERE    d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID  
          AND NOT( d.proj_house_type='商铺' OR  d.proj_house_type='车位')
          AND d.deal_date<=v_date 
    GROUP BY city_code
  ) b 
  SET a.visit_contract_num=b.visit_contract_num
  WHERE a.create_time=v_date AND a.city_code=b.city_code  AND DIMENSION=3;
    
   /* 分公司的统计 结束 */ 
  UPDATE rpt_residential_sale SET visit_cst_num=visit_number,confess_cst_num=recognition_number,subscribe_cst_num=subscribe_number,contract_cst_num=contract_numner;
 
 
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_report_cst_deal_analyse_2` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_report_cst_deal_analyse_2` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_report_cst_deal_analyse_2`()
BEGIN
	   #Routine body goes here... 
   DECLARE v_date DATE;
   DECLARE v_sql VARCHAR(4000); 
   
   DELETE FROM report_s_product_order;
   INSERT INTO report_s_product_order(productCode,cstGUID,cstGUID_All,owner_num )
   SELECT productCode,cstGUID,cstGUID_All,owner_num  FROM v_s_product_order;
   DELETE  FROM report_cst_deal_mid_bak2;
   SET v_sql = "insert into report_cst_deal_mid_bak2(
          age_segment,children_num,room_acre_segment,work_area,live_area,big_area,prject_name,city_name, 
       deal_date,room_acreage,sale_acreage,sale_amount,proj_house_type,live_format,roomGUID,bldGUID,cst_num,cstGUID,birth_day,owner_num,projGUID,companyGUID
       ,proj_house_type_orig,cstType,tradeGUID ,jfdate,big_code,city_code)
    select DISTINCT age_segment,children_num,room_acre_segment,work_area,live_area,big_area,prject_name,city_name, deal_date,room_acreage,sale_acreage,sale_amount,proj_house_type,live_format,roomGUID,bldGUID,1,a.cstGUID,birth_day,1,projGUID,companyGUID
       ,proj_house_type_orig ,cstType,tradeGUID ,jfdate,big_code,city_code from   report_cst_deal_mid_own a,
       report_s_product_order b where a.cstGUID=b.cstGUID and a.roomGUID=b.productCode
         ";
       
   SET @ms=v_sql; 
   PREPARE s1 FROM @ms; 
   EXECUTE s1; 
   DEALLOCATE PREPARE s1; 
   DELETE FROM report_cst_deal_analyse;
   INSERT INTO report_cst_deal_analyse (children_num,  age_segment,  proj_house_type,  live_format,  room_acreage,  cst_num,  owner_num,  sale_acreage,
          sale_amount,  work_area,  live_area,  deal_date,  big_area,  prject_name,  city_name     )
   SELECT children_num,  age_segment,  proj_house_type,  live_format,  room_acre_segment,  SUM(cst_num),  SUM(owner_num),  SUM(sale_acreage),
          SUM(sale_amount),  work_area,  live_area,  deal_date,  big_area,  prject_name,  city_name     FROM report_cst_deal_mid_bak2
   WHERE cstType=1
   GROUP BY  children_num,  age_segment,  proj_house_type,  live_format,  room_acre_segment,  
           work_area,  live_area,  deal_date,  big_area,  prject_name,  city_name;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_report_cst_deal_own_2` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_report_cst_deal_own_2` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_report_cst_deal_own_2`()
BEGIN
	 #Routine body goes here... 招商没有用上居住区域
   DECLARE v_date DATE;
   DECLARE v_sql VARCHAR(4000); 
   /* 直取个人数据，并且是签约数据*/
   TRUNCATE TABLE report_cst_deal_mid_own_02;
   INSERT INTO  report_rpt_run_time(programname ,begindate ,enddate ,runstatus ) VALUES ('proc_reprot_cst_deal_own',SYSDATE(),NULL,'0');
   /* set v_sql = "insert into report_cst_deal_mid_own_02(deal_date,room_acreage,sale_acreage,sale_amount,proj_house_type,live_format,roomGUID,bldGUID,cst_num,cstGUID,birth_day,owner_num,projGUID,companyGUID
       ,proj_house_type_orig, cstNum,propertyRate,tradeGUID ,jfdate) 
     select a.qSDate,a.bldArea,a.bldArea,
        htTotal,null,null , a.roomGUID, b.bldGUID,1,d.cstGUID ,
         null,1,c.projGUID,c.companyGUID,b.roomStru ,d.cstNum,d.propertyRate ,a.tradeGUID ,a.jfdate 
     from t_contract  a
	    left join b_room b on a.roomGUID=b.roomGUID
	    left join b_building c on b.bldGUID=c.bldGUID
      left join s_product_order d on d.productCode=a.roomGUID  
      where a.status='激活'";
       
   set @ms=v_sql; 
   PREPARE s1 from @ms; 
   EXECUTE s1; 
   deallocate prepare s1; 
   commit;
  */
   INSERT INTO report_cst_deal_mid_own_02(deal_date,room_acreage,sale_acreage,sale_amount,proj_house_type,live_format,roomGUID,bldGUID,cst_num,cstGUID,birth_day,owner_num,projGUID,companyGUID
       ,proj_house_type_orig, cstNum,propertyRate,tradeGUID ,jfdate,product_type_orig,sfamount) 
     SELECT DISTINCT a.qSDate,a.bldArea,a.bldArea,
        htTotal,NULL,NULL , a.roomGUID, b.bldGUID,1 ,d.cstGUID ,
         NULL,1,c.projGUID,c.companyGUID,b.roomStru ,d.cstNum,d.propertyRate ,a.tradeGUID ,a.jfdate ,c.bldProPerty,IFNULL(a.ajTotal,0)+IFNULL(gjjTotal,0)
     FROM t_contract  a
	    LEFT JOIN b_room b ON a.roomGUID=b.roomGUID
	    LEFT JOIN b_building c ON b.bldGUID=c.bldGUID
      LEFT JOIN s_product_order d ON d.productCode=a.roomGUID   AND a.tradeGUID=d.tradeGUID
      WHERE a.status='激活';
 
   /* 更新用户的身份证号，出生日期*/ 
   UPDATE report_cst_deal_mid_own_02 a, cst_customer_0 b  SET a.cardID= b.cardID, a.cstType =b.cstType,a.cardType=b.cardType ,a.birth_day=b.birthDate,  a.sex=  CASE WHEN gender='1' THEN '男'  WHEN  gender='2' THEN '女' ELSE '未知' END  WHERE a.cstGUID=b.cstGUID;
   UPDATE report_cst_deal_mid_own_02 a, cst_customer_1 b  SET a.cardID= b.cardID, a.cstType =b.cstType,a.cardType=b.cardType ,a.birth_day=b.birthDate,  a.sex=  CASE WHEN gender='1' THEN '男'  WHEN  gender='2' THEN '女' ELSE '未知' END  WHERE a.cstGUID=b.cstGUID;
   UPDATE report_cst_deal_mid_own_02 a, cst_customer_2 b  SET a.cardID= b.cardID, a.cstType =b.cstType,a.cardType=b.cardType ,a.birth_day=b.birthDate,  a.sex=  CASE WHEN gender='1' THEN '男'  WHEN  gender='2' THEN '女' ELSE '未知' END  WHERE a.cstGUID=b.cstGUID;
   UPDATE report_cst_deal_mid_own_02 a, cst_customer_3 b  SET a.cardID= b.cardID, a.cstType =b.cstType,a.cardType=b.cardType ,a.birth_day=b.birthDate,  a.sex=  CASE WHEN gender='1' THEN '男'  WHEN  gender='2' THEN '女' ELSE '未知' END  WHERE a.cstGUID=b.cstGUID;
   UPDATE report_cst_deal_mid_own_02 a, cst_customer_4 b  SET a.cardID= b.cardID, a.cstType =b.cstType,a.cardType=b.cardType ,a.birth_day=b.birthDate,  a.sex=  CASE WHEN gender='1' THEN '男'  WHEN  gender='2' THEN '女' ELSE '未知' END  WHERE a.cstGUID=b.cstGUID;
   UPDATE report_cst_deal_mid_own_02 a, cst_customer_5 b  SET a.cardID= b.cardID, a.cstType =b.cstType,a.cardType=b.cardType ,a.birth_day=b.birthDate,  a.sex=  CASE WHEN gender='1' THEN '男'  WHEN  gender='2' THEN '女' ELSE '未知' END  WHERE a.cstGUID=b.cstGUID;
   UPDATE report_cst_deal_mid_own_02 a, cst_customer_6 b  SET a.cardID= b.cardID, a.cstType =b.cstType,a.cardType=b.cardType ,a.birth_day=b.birthDate,  a.sex=  CASE WHEN gender='1' THEN '男'  WHEN  gender='2' THEN '女' ELSE '未知' END  WHERE a.cstGUID=b.cstGUID;
   UPDATE report_cst_deal_mid_own_02 a, cst_customer_7 b  SET a.cardID= b.cardID, a.cstType =b.cstType,a.cardType=b.cardType ,a.birth_day=b.birthDate,  a.sex=  CASE WHEN gender='1' THEN '男'  WHEN  gender='2' THEN '女' ELSE '未知' END  WHERE a.cstGUID=b.cstGUID;
   UPDATE report_cst_deal_mid_own_02 a, cst_customer_8 b  SET a.cardID= b.cardID, a.cstType =b.cstType,a.cardType=b.cardType ,a.birth_day=b.birthDate,  a.sex=  CASE WHEN gender='1' THEN '男'  WHEN  gender='2' THEN '女' ELSE '未知' END  WHERE a.cstGUID=b.cstGUID;
   UPDATE report_cst_deal_mid_own_02 a, cst_customer_9 b  SET a.cardID= b.cardID, a.cstType =b.cstType,a.cardType=b.cardType ,a.birth_day=b.birthDate,  a.sex=  CASE WHEN gender='1' THEN '男'  WHEN  gender='2' THEN '女' ELSE '未知' END  WHERE a.cstGUID=b.cstGUID;
   COMMIT;
   
 
   /*以身份证二次修改出生日期 取出用户的出生日期,只更改是客户是个人的记录，公司不存在生日*/
   UPDATE report_cst_deal_mid_own_02    SET birth_day = ( CASE WHEN  LENGTH(cardID)=18  THEN DATE_FORMAT(SUBSTRING(cardID,7,8), '%Y-%m-%d') 
																						WHEN  LENGTH(cardID)=15  THEN  DATE_FORMAT( CONCAT('19',SUBSTRING(cardID,7,6)), '%Y-%m-%d') END)
    WHERE (LENGTH(cardID)=18 OR  LENGTH(cardID)=15 ) AND birth_day IS NULL  AND cstType=1 AND   (cardType=1 OR cardType=99);
   /*更改项目的所属的公司，区域 */
 
   /* 更改项目所属的公司 区域,城市编号 */
    UPDATE  report_cst_deal_mid_own_02 a, v_proj_area_city_name_new  b 
    SET a.big_code=b.big_code,a.city_name =b.city_name ,a.area_id=b.big_code ,a.city_Code=b.city_Code,a.big_name=b.big_name  WHERE a.projGUID=b.projguid ;
  
   /*更改面积段*/
   UPDATE report_cst_deal_mid_own_02 a SET 
       room_acre_segment= CASE WHEN a.room_acreage< 91  THEN  '90㎡以下'
       WHEN a.room_acreage>=91 AND   a.room_acreage<=120 THEN  '91-120㎡'
       WHEN a.room_acreage>120 AND   a.room_acreage<=145  THEN  '121-145㎡'
       WHEN a.room_acreage>145 AND   a.room_acreage<=200 THEN  '146-200㎡'
       WHEN a.room_acreage>200   THEN  '200㎡以上' END,
       mjcode= CASE WHEN a.room_acreage<=90  THEN  1
       WHEN a.room_acreage>90 AND   a.room_acreage<=120 THEN  2
       WHEN a.room_acreage>120 AND   a.room_acreage<=145  THEN  3
       WHEN a.room_acreage>145 AND   a.room_acreage<=200 THEN  4
       WHEN a.room_acreage>200   THEN  5 END;
 
   COMMIT;
  /*更改业主子女个数,工作区域,居住区域 */ 
   UPDATE report_cst_deal_mid_own_02 a, cst_attach_0 b 
       SET a.children_num_orig=b.`values` 
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_childNum';
   UPDATE report_cst_deal_mid_own_02 a, cst_attach_0 b 
       SET  
            a.work_area_orig=b.values 
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_workArea';
   UPDATE report_cst_deal_mid_own_02 a, cst_attach_0 b 
       SET   
             a.live_area_orig=b.values  
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_workArea';
 
  /*更改业主子女个数,工作区域,居住区域 */ 
    UPDATE report_cst_deal_mid_own_02 a, cst_attach_1 b 
       SET a.children_num_orig=b.`values` 
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_childNum';
   UPDATE report_cst_deal_mid_own_02 a, cst_attach_1 b 
       SET  
            a.work_area_orig=b.values 
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_workArea';
   UPDATE report_cst_deal_mid_own_02 a, cst_attach_1 b 
       SET   
             a.live_area_orig=b.values  
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_workArea';
  /*更改业主子女个数,工作区域,居住区域 */ 
    UPDATE report_cst_deal_mid_own_02 a, cst_attach_2 b 
       SET a.children_num_orig=b.`values` 
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_childNum';
   UPDATE report_cst_deal_mid_own_02 a, cst_attach_2 b 
       SET  
            a.work_area_orig=b.values 
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_workArea';
   UPDATE report_cst_deal_mid_own_02 a, cst_attach_2 b 
       SET   
             a.live_area_orig=b.values  
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_workArea';
   COMMIT;
  /*更改业主子女个数,工作区域,居住区域 */ 
 
  UPDATE report_cst_deal_mid_own_02 a, cst_attach_3 b 
       SET a.children_num_orig=b.`values` 
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_childNum';
   UPDATE report_cst_deal_mid_own_02 a, cst_attach_3 b 
       SET  
            a.work_area_orig=b.values 
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_workArea';
   UPDATE report_cst_deal_mid_own_02 a, cst_attach_3 b 
       SET  
             a.live_area_orig=b.values  
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_workArea';
   COMMIT;
  /*更改业主子女个数,工作区域,居住区域 */ 
 
  UPDATE report_cst_deal_mid_own_02 a, cst_attach_4 b 
       SET a.children_num_orig=b.`values` 
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_childNum';
   UPDATE report_cst_deal_mid_own_02 a, cst_attach_4 b 
       SET   
            a.work_area_orig=b.values 
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_workArea';
   UPDATE report_cst_deal_mid_own_02 a, cst_attach_4 b 
       SET  
             a.live_area_orig=b.values  
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_workArea';
  /*更改业主子女个数,工作区域,居住区域 */ 
 
  UPDATE report_cst_deal_mid_own_02 a, cst_attach_5 b 
       SET a.children_num_orig=b.`values` 
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_childNum';
   UPDATE report_cst_deal_mid_own_02 a, cst_attach_5 b 
       SET  
            a.work_area_orig=b.values 
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_workArea';
   UPDATE report_cst_deal_mid_own_02 a, cst_attach_5 b 
       SET   
             a.live_area_orig=b.values  
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_workArea';
  /*更改业主子女个数,工作区域,居住区域 */ 
   
  UPDATE report_cst_deal_mid_own_02 a, cst_attach_6 b 
       SET a.children_num_orig=b.`values` 
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_childNum';
   UPDATE report_cst_deal_mid_own_02 a, cst_attach_6 b 
       SET  
            a.work_area_orig=b.values 
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_workArea';
   UPDATE report_cst_deal_mid_own_02 a, cst_attach_6 b 
       SET   
             a.live_area_orig=b.values  
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_workArea';
  /*更改业主子女个数,工作区域,居住区域 */ 
  UPDATE report_cst_deal_mid_own_02 a, cst_attach_7 b 
       SET a.children_num_orig=b.`values` 
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_childNum';
   UPDATE report_cst_deal_mid_own_02 a, cst_attach_7 b 
       SET  
            a.work_area_orig=b.values 
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_workArea';
   UPDATE report_cst_deal_mid_own_02 a, cst_attach_7 b 
       SET    
             a.live_area_orig=b.values  
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_workArea';
  /*更改业主子女个数,工作区域,居住区域 */ 
  UPDATE report_cst_deal_mid_own_02 a, cst_attach_8 b 
       SET a.children_num_orig=b.`values` 
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_childNum';
   UPDATE report_cst_deal_mid_own_02 a, cst_attach_8 b 
       SET  
            a.work_area_orig=b.values 
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_workArea';
   UPDATE report_cst_deal_mid_own_02 a, cst_attach_8 b 
       SET   
             a.live_area_orig=b.values  
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_workArea';
  /*更改业主子女个数,工作区域,居住区域 */ 
  UPDATE report_cst_deal_mid_own_02 a, cst_attach_9 b 
       SET a.children_num_orig=b.`values` 
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_childNum';
   UPDATE report_cst_deal_mid_own_02 a, cst_attach_9 b 
       SET   
            a.work_area_orig=b.values 
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_workArea';
   UPDATE report_cst_deal_mid_own_02 a, cst_attach_9 b 
       SET   
             a.live_area_orig=b.values  
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_workArea';
   COMMIT;
/*更改业主居住状态*/
UPDATE report_cst_deal_mid_own_02 a, cst_attach_0 b 
       SET   
         live_format=b.values ,live_format_orig=b.values  
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_opp_formatIntent';
UPDATE report_cst_deal_mid_own_02 a, cst_attach_1 b 
       SET   
         live_format=b.values ,live_format_orig=b.values  
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_opp_formatIntent';
UPDATE report_cst_deal_mid_own_02 a, cst_attach_2 b 
       SET   
         live_format=b.values ,live_format_orig=b.values  
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_opp_formatIntent'; 
UPDATE report_cst_deal_mid_own_02 a, cst_attach_3 b 
       SET   
         live_format=b.values ,live_format_orig=b.values  
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_opp_formatIntent';
UPDATE report_cst_deal_mid_own_02 a, cst_attach_4 b 
       SET   
         live_format=b.values ,live_format_orig=b.values  
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_opp_formatIntent';
UPDATE report_cst_deal_mid_own_02 a, cst_attach_5 b 
       SET   
         live_format=b.values ,live_format_orig=b.values  
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_opp_formatIntent';
UPDATE report_cst_deal_mid_own_02 a, cst_attach_6 b 
       SET   
         live_format=b.values ,live_format_orig=b.values  
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_opp_formatIntent';
UPDATE report_cst_deal_mid_own_02 a, cst_attach_7 b 
       SET   
         live_format=b.values ,live_format_orig=b.values  
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_opp_formatIntent';
UPDATE report_cst_deal_mid_own_02 a, cst_attach_8 b 
       SET   
         live_format=b.values ,live_format_orig=b.values  
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_opp_formatIntent';
UPDATE report_cst_deal_mid_own_02 a, cst_attach_9 b 
       SET   
         live_format=b.values ,live_format_orig=b.values  
   WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_opp_formatIntent';
   /*更改房子户型 		*/
 
    COMMIT;
  UPDATE report_cst_deal_mid_own_02 a,report_basic_room_enum b SET proj_house_type= b.attachKey WHERE 
           category =1 AND enumValue   LIKE  CONCAT('%,', SUBSTRING(a.proj_house_type_orig,1,2) ,',%')   
   AND b.attachCode >='100001' AND b.attachCode <='100005' ;
  UPDATE report_cst_deal_mid_own_02 a,report_basic_room_enum b SET proj_house_type= b.attachKey WHERE 
           category =1 AND enumValue   LIKE  CONCAT('%,',a.proj_house_type_orig ,',%')   
   AND b.attachCode >='100006' AND b.attachCode <='100007'   AND  proj_house_type IS NULL ;
   COMMIT;
  /*更改居住区域*/
 
  UPDATE report_cst_deal_mid_own_02    b SET live_area =    SUBSTRING_INDEX(live_area_orig,'省',1);      
            
  /* 
  update report_cst_deal_mid_own_02 a,report_basic_area_enum  b set live_area = ( b.attachKey) where 
           category =10 and  attachKey   like  concat('%',live_area_orig,'%') and  live_area is null ;
 
   
  update report_cst_deal_mid_own_02 a,report_basic_area_enum  b set live_area = ( b.attachKey) where 
           category =10 and  live_area_orig=enumValue;
  update report_cst_deal_mid_own_02 a,report_basic_area_enum  b set live_area = ( b.attachKey) where 
           category =10 and  live_area_orig=attachKey;
   */
  /*更改工作区域 */
  UPDATE report_cst_deal_mid_own_02   SET work_area =  SUBSTRING_INDEX(work_area_orig,'省',1);   
   /*
   update report_cst_deal_mid_own_02 a,report_basic_area_enum  b set work_area =  (b.attachKey) where 
           category =10 and  attachKey   like  concat('%',work_area_orig,'%') and  work_area is null;
  
   update report_cst_deal_mid_own_02 a,report_basic_area_enum  b set work_area = ( b.attachKey) where            category =10 and  work_area_orig=enumValue;
   update report_cst_deal_mid_own_02 a,report_basic_area_enum  b set work_area = ( b.attachKey) where            category =10 and  work_area_orig=attachKey;
   */
  /* 更改  房间产品类型 */
   UPDATE report_cst_deal_mid_own_02 a,report_basic_room_enum b SET product_type = b.attachKey WHERE 
           category =3 AND enumValue   LIKE  CONCAT('%,',product_type_orig,',%')   
   AND b.attachCode >='300001' AND b.attachCode <='300004'    ;
   COMMIT;
   /*更改业主年龄段  update  report_cst_deal_mid set */
      
   UPDATE  report_cst_deal_mid_own_02  SET 
   age_segment=  (CASE WHEN  (YEAR(deal_date)- YEAR(birth_day)) <=20 THEN  '20岁以下' 
								     WHEN  (  (YEAR(deal_date)- YEAR(birth_day)))<35 THEN  '21-34岁'
								     WHEN  (     (YEAR(deal_date)- YEAR(birth_day)))<45 THEN  '35-44岁'
								     WHEN  (    (YEAR(deal_date)- YEAR(birth_day)))<55 THEN  '45-55岁'
								     WHEN  ( (YEAR(deal_date)- YEAR(birth_day)))<65 THEN  '56-64岁'
								     WHEN  (YEAR(deal_date)- YEAR(birth_day))>=65  THEN  '64岁以上' END) ; 
   COMMIT;
   UPDATE  report_cst_deal_mid_own_02  SET 
   cstCurYl=  (CASE WHEN  (YEAR(SYSDATE())- YEAR(birth_day)) <=20 THEN  '20岁以下' 
								     WHEN  (  (YEAR(SYSDATE())- YEAR(birth_day)))<35 THEN  '21-34岁'
								     WHEN  (     (YEAR(SYSDATE())- YEAR(birth_day)))<45 THEN  '35-44岁'
								     WHEN  (    (YEAR(SYSDATE())- YEAR(birth_day)))<55 THEN  '45-54岁'
								     WHEN  ( (YEAR(SYSDATE())- YEAR(birth_day)))<65 THEN  '55-64岁'
								     WHEN  (YEAR(SYSDATE())- YEAR(birth_day))>=65  THEN  '64岁以上' END),
   ylcode=  (CASE WHEN  (YEAR(SYSDATE())- YEAR(birth_day)) <=20 THEN  '1' 
								     WHEN  (  (YEAR(SYSDATE())- YEAR(birth_day)))<35 THEN  '2'
								     WHEN  (     (YEAR(SYSDATE())- YEAR(birth_day)))<45 THEN  '3'
								     WHEN  (    (YEAR(SYSDATE())- YEAR(birth_day)))<55 THEN  '4'
								     WHEN  ( (YEAR(SYSDATE())- YEAR(birth_day)))<65 THEN  '5'
								     WHEN  (YEAR(SYSDATE())- YEAR(birth_day))>=65  THEN  '6' END);  
   COMMIT;
  /*修改各字段为空的值改为未知    更改房子居住状态  居住状态数据比较完整，只要修正字段值为NULL及空格*/   
  UPDATE report_cst_deal_mid_own_02 SET 
        proj_house_type= CASE  ISNULL(proj_house_type) WHEN '1' THEN '未知' ELSE proj_house_type END ,
        live_area = CASE  ISNULL(live_area) WHEN '1' THEN '未知' ELSE live_area  END ,
        work_area = CASE  ISNULL(work_area) WHEN '1' THEN '未知' ELSE work_area  END , 
        age_segment = CASE  ISNULL(age_segment) WHEN '1' THEN '未知' ELSE age_segment END ,
        live_format = CASE  ISNULL(live_format_orig) WHEN '1' THEN '未知' 
                                                 WHEN live_format_orig='' THEN '未知' 	ELSE live_format_orig END  ,
        children_num = CASE  ISNULL(children_num_orig) WHEN '1' THEN '未知' ELSE children_num_orig  END ,
        cstCurYl = CASE  ISNULL(cstCurYl) WHEN '1' THEN '未知' ELSE cstCurYl END,
        sex = CASE  ISNULL(sex) WHEN '1' THEN '未知' ELSE sex END ,
        product_type = CASE  ISNULL(product_type) WHEN '1' THEN '未知' ELSE product_type END    ;
   COMMIT;
  /*居住业态*/
  UPDATE report_cst_deal_mid_own_02 SET live_format='未知'  WHERE  live_format='小高层住宅';
  UPDATE report_cst_deal_mid_own_02 SET live_format='未知'  WHERE  live_format='高层住宅'; 
  UPDATE report_cst_deal_mid_own_02 SET live_format='别墅'  WHERE  live_format='联排别墅';
  UPDATE report_cst_deal_mid_own_02 SET children_num='2个以上' WHERE  children_num='3+';
  COMMIT;
	UPDATE report_cst_deal_mid_own_02 a, cst_attach_0 b    SET      a.cstIndustry=b.values    WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_job';
	UPDATE report_cst_deal_mid_own_02 a, cst_attach_1 b    SET      a.cstIndustry=b.values    WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_job';
	UPDATE report_cst_deal_mid_own_02 a, cst_attach_2 b    SET      a.cstIndustry=b.values    WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_job';
	UPDATE report_cst_deal_mid_own_02 a, cst_attach_3 b    SET      a.cstIndustry=b.values    WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_job';
	UPDATE report_cst_deal_mid_own_02 a, cst_attach_4 b    SET      a.cstIndustry=b.values    WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_job';
	UPDATE report_cst_deal_mid_own_02 a, cst_attach_5 b    SET      a.cstIndustry=b.values    WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_job';
	UPDATE report_cst_deal_mid_own_02 a, cst_attach_6 b    SET      a.cstIndustry=b.values    WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_job';
	UPDATE report_cst_deal_mid_own_02 a, cst_attach_7 b    SET      a.cstIndustry=b.values    WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_job';
	UPDATE report_cst_deal_mid_own_02 a, cst_attach_8 b    SET      a.cstIndustry=b.values    WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_job';
	UPDATE report_cst_deal_mid_own_02 a, cst_attach_9 b    SET      a.cstIndustry=b.values    WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_job';
	UPDATE report_cst_deal_mid_own_02 a, cst_attach_0 b    SET      a.cstOriginPlace=b.values    WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown';
	UPDATE report_cst_deal_mid_own_02 a, cst_attach_1 b    SET      a.cstOriginPlace=b.values    WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown';
	UPDATE report_cst_deal_mid_own_02 a, cst_attach_2 b    SET      a.cstOriginPlace=b.values    WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown';
	UPDATE report_cst_deal_mid_own_02 a, cst_attach_3 b    SET      a.cstOriginPlace=b.values    WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown';
	UPDATE report_cst_deal_mid_own_02 a, cst_attach_4 b    SET      a.cstOriginPlace=b.values    WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown';
	UPDATE report_cst_deal_mid_own_02 a, cst_attach_5 b    SET      a.cstOriginPlace=b.values    WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown';
	UPDATE report_cst_deal_mid_own_02 a, cst_attach_6 b    SET      a.cstOriginPlace=b.values    WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown';
	UPDATE report_cst_deal_mid_own_02 a, cst_attach_7 b    SET      a.cstOriginPlace=b.values    WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown';
	UPDATE report_cst_deal_mid_own_02 a, cst_attach_8 b    SET      a.cstOriginPlace=b.values    WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown';
	UPDATE report_cst_deal_mid_own_02 a, cst_attach_9 b    SET      a.cstOriginPlace=b.values    WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown'; 
 
	COMMIT;
  /* 更改项目名称 */
  UPDATE report_cst_deal_mid_own_02 a, b_proj b SET a.prject_name=b.projName WHERE a.projGUID=b.projGUID;
 
  /* 修正交房时间*/  
  TRUNCATE TABLE  report_cst_deal_mid_own;
  INSERT INTO report_cst_deal_mid_own( children_num,age_segment,proj_house_type,live_format,room_acreage,cst_num,owner_num,
		sale_acreage,sale_amount,work_area,live_area,deal_date,big_area,prject_name,city_name,roomGUID,bldGUID,cstGUID,birth_day,projGUID,companyGUID,
		live_format_orig,proj_house_type_orig,work_area_orig,live_area_orig,children_num_orig,cardID,
		subType,cstType,cardType,room_acre_segment,  cstNum,propertyRate,tradeGUID,cstOriginPlace,cstIndustry,cstCurYl,
		jFDate,ID,ylcode,mjcode,area_id,citycode,sex,product_type,product_type_orig,sfamount,big_code,big_name,city_code,curr_house_amount
	)
  SELECT children_num,age_segment,proj_house_type,live_format,room_acreage,cst_num,owner_num,
		sale_acreage,sale_amount,work_area,live_area,deal_date,big_area,prject_name,city_name,roomGUID,bldGUID,cstGUID,birth_day,projGUID,companyGUID,
		live_format_orig,proj_house_type_orig,work_area_orig,live_area_orig,children_num_orig,cardID,
		subType,cstType,cardType,room_acre_segment,  cstNum,propertyRate,tradeGUID,cstOriginPlace,cstIndustry,cstCurYl,
		jFDate,ID,ylcode,mjcode,area_id,citycode,sex,product_type,product_type_orig,sfamount,big_code,big_name,city_code,IFNULL(curr_house_amount,sale_amount)
  FROM report_cst_deal_mid_own_02;
  UPDATE report_cst_deal_mid_own a SET 
       curr_amount_id = CASE WHEN a.curr_house_amount < 1010000  THEN  '1'
       WHEN a.curr_house_amount>=1010001 AND   a.curr_house_amount<1510000 THEN  '2'
       WHEN a.curr_house_amount>=1510000 AND   a.curr_house_amount<2010000 THEN  '3'
       WHEN a.curr_house_amount>=2010000 AND   a.curr_house_amount<2510000 THEN  '4'
       WHEN a.curr_house_amount>=2510000 AND   a.curr_house_amount<3010000 THEN  '5'
       WHEN a.curr_house_amount>=3010000 AND   a.curr_house_amount<5010000 THEN  '6'
       WHEN a.curr_house_amount>=5010000 AND   a.curr_house_amount<8010000 THEN  '7'
       WHEN a.curr_house_amount>=8010000 AND   a.curr_house_amount<10010000 THEN  '8'  
       WHEN a.curr_house_amount>=10010000   THEN  '9' END; 
  
	UPDATE report_cst_deal_mid_own a, cst_attach_0 b    SET   a.household_city_name=SUBSTR(b.values,CASE WHEN  LOCATE('-',b.values)>0 THEN  LOCATE('-',b.values)+1 ELSE NULL  END ,20 ) , a.household_name=SUBSTR(b.values,1, CASE WHEN  LOCATE('-',b.values)>0 THEN   LOCATE('-',b.values)-1 ELSE 20  END ),
																														a.household_city_code=SUBSTR(b.remark,CASE WHEN  LOCATE('-',b.remark)>0 THEN  LOCATE('-',b.remark)+1 ELSE NULL  END ,20 ) , a.household_code=SUBSTR(b.remark,1, CASE WHEN  LOCATE('-',b.remark)>0 THEN   LOCATE('-',b.remark)-1 ELSE 20  END )
																													
				WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown_city';
	 
	UPDATE report_cst_deal_mid_own a, cst_attach_1 b    SET   a.household_city_name=SUBSTR(b.values,CASE WHEN  LOCATE('-',b.values)>0 THEN  LOCATE('-',b.values)+1 ELSE NULL  END ,20 ) , a.household_name=SUBSTR(b.values,1, CASE WHEN  LOCATE('-',b.values)>0 THEN   LOCATE('-',b.values)-1 ELSE 20  END ),
																														a.household_city_code=SUBSTR(b.remark,CASE WHEN  LOCATE('-',b.remark)>0 THEN  LOCATE('-',b.remark)+1 ELSE NULL  END ,20 ) , a.household_code=SUBSTR(b.remark,1, CASE WHEN  LOCATE('-',b.remark)>0 THEN   LOCATE('-',b.remark)-1 ELSE 20  END )
																													
				WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown_city';
  
	UPDATE report_cst_deal_mid_own a, cst_attach_2 b    SET   a.household_city_name=SUBSTR(b.values,CASE WHEN  LOCATE('-',b.values)>0 THEN  LOCATE('-',b.values)+1 ELSE NULL  END ,20 ) , a.household_name=SUBSTR(b.values,1, CASE WHEN  LOCATE('-',b.values)>0 THEN   LOCATE('-',b.values)-1 ELSE 20  END ),
																														a.household_city_code=SUBSTR(b.remark,CASE WHEN  LOCATE('-',b.remark)>0 THEN  LOCATE('-',b.remark)+1 ELSE NULL  END ,20 ) , a.household_code=SUBSTR(b.remark,1, CASE WHEN  LOCATE('-',b.remark)>0 THEN   LOCATE('-',b.remark)-1 ELSE 20  END )
																WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown_city';
	 
	UPDATE report_cst_deal_mid_own a, cst_attach_3 b    SET   a.household_city_name=SUBSTR(b.values,CASE WHEN  LOCATE('-',b.values)>0 THEN  LOCATE('-',b.values)+1 ELSE NULL  END ,20 ) , a.household_name=SUBSTR(b.values,1, CASE WHEN  LOCATE('-',b.values)>0 THEN   LOCATE('-',b.values)-1 ELSE 20  END ),
																														a.household_city_code=SUBSTR(b.remark,CASE WHEN  LOCATE('-',b.remark)>0 THEN  LOCATE('-',b.remark)+1 ELSE NULL  END ,20 ) , a.household_code=SUBSTR(b.remark,1, CASE WHEN  LOCATE('-',b.remark)>0 THEN   LOCATE('-',b.remark)-1 ELSE 20  END )
																 WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown_city';
	UPDATE report_cst_deal_mid_own a, cst_attach_4 b    SET   a.household_city_name=SUBSTR(b.values,CASE WHEN  LOCATE('-',b.values)>0 THEN  LOCATE('-',b.values)+1 ELSE NULL  END ,20 ) , a.household_name=SUBSTR(b.values,1, CASE WHEN  LOCATE('-',b.values)>0 THEN   LOCATE('-',b.values)-1 ELSE 20  END ),
																														a.household_city_code=SUBSTR(b.remark,CASE WHEN  LOCATE('-',b.remark)>0 THEN  LOCATE('-',b.remark)+1 ELSE NULL  END ,20 ) , a.household_code=SUBSTR(b.remark,1, CASE WHEN  LOCATE('-',b.remark)>0 THEN   LOCATE('-',b.remark)-1 ELSE 20  END )
																WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown_city';
	 
	UPDATE report_cst_deal_mid_own a, cst_attach_5 b    SET   a.household_city_name=SUBSTR(b.values,CASE WHEN  LOCATE('-',b.values)>0 THEN  LOCATE('-',b.values)+1 ELSE NULL  END ,20 ) , a.household_name=SUBSTR(b.values,1, CASE WHEN  LOCATE('-',b.values)>0 THEN   LOCATE('-',b.values)-1 ELSE 20  END ),
																														a.household_city_code=SUBSTR(b.remark,CASE WHEN  LOCATE('-',b.remark)>0 THEN  LOCATE('-',b.remark)+1 ELSE NULL  END ,20 ) , a.household_code=SUBSTR(b.remark,1, CASE WHEN  LOCATE('-',b.remark)>0 THEN   LOCATE('-',b.remark)-1 ELSE 20  END )
																 WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown_city';
	UPDATE report_cst_deal_mid_own a, cst_attach_6 b    SET   a.household_city_name=SUBSTR(b.values,CASE WHEN  LOCATE('-',b.values)>0 THEN  LOCATE('-',b.values)+1 ELSE NULL  END ,20 ) , a.household_name=SUBSTR(b.values,1, CASE WHEN  LOCATE('-',b.values)>0 THEN   LOCATE('-',b.values)-1 ELSE 20  END ),
																														a.household_city_code=SUBSTR(b.remark,CASE WHEN  LOCATE('-',b.remark)>0 THEN  LOCATE('-',b.remark)+1 ELSE NULL  END ,20 ) , a.household_code=SUBSTR(b.remark,1, CASE WHEN  LOCATE('-',b.remark)>0 THEN   LOCATE('-',b.remark)-1 ELSE 20  END )
																WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown_city';
	 
	UPDATE report_cst_deal_mid_own a, cst_attach_7 b    SET   a.household_city_name=SUBSTR(b.values,CASE WHEN  LOCATE('-',b.values)>0 THEN  LOCATE('-',b.values)+1 ELSE NULL  END ,20 ) , a.household_name=SUBSTR(b.values,1, CASE WHEN  LOCATE('-',b.values)>0 THEN   LOCATE('-',b.values)-1 ELSE 20  END ),
																														a.household_city_code=SUBSTR(b.remark,CASE WHEN  LOCATE('-',b.remark)>0 THEN  LOCATE('-',b.remark)+1 ELSE NULL  END ,20 ) , a.household_code=SUBSTR(b.remark,1, CASE WHEN  LOCATE('-',b.remark)>0 THEN   LOCATE('-',b.remark)-1 ELSE 20  END )
														  	WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown_city';
	UPDATE report_cst_deal_mid_own a, cst_attach_8 b    SET   a.household_city_name=SUBSTR(b.values,CASE WHEN  LOCATE('-',b.values)>0 THEN  LOCATE('-',b.values)+1 ELSE NULL  END ,20 ) , a.household_name=SUBSTR(b.values,1, CASE WHEN  LOCATE('-',b.values)>0 THEN   LOCATE('-',b.values)-1 ELSE 20  END ),
																														a.household_city_code=SUBSTR(b.remark,CASE WHEN  LOCATE('-',b.remark)>0 THEN  LOCATE('-',b.remark)+1 ELSE NULL  END ,20 ) , a.household_code=SUBSTR(b.remark,1, CASE WHEN  LOCATE('-',b.remark)>0 THEN   LOCATE('-',b.remark)-1 ELSE 20  END )
															 	WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown_city';
	 
	UPDATE report_cst_deal_mid_own a, cst_attach_9 b    SET   a.household_city_name=SUBSTR(b.values,CASE WHEN  LOCATE('-',b.values)>0 THEN  LOCATE('-',b.values)+1 ELSE NULL  END ,20 ) , a.household_name=SUBSTR(b.values,1, CASE WHEN  LOCATE('-',b.values)>0 THEN   LOCATE('-',b.values)-1 ELSE 20  END ),
																														a.household_city_code=SUBSTR(b.remark,CASE WHEN  LOCATE('-',b.remark)>0 THEN  LOCATE('-',b.remark)+1 ELSE NULL  END ,20 ) , a.household_code=SUBSTR(b.remark,1, CASE WHEN  LOCATE('-',b.remark)>0 THEN   LOCATE('-',b.remark)-1 ELSE 20  END )
														 		WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown_city';
 
 
  UPDATE  report_cst_deal_mid_own SET  work_city_name  = SUBSTR(  work_area_orig, LOCATE('省',work_area_orig  )+1 ,20 ),work_sheng_name  = SUBSTR(  work_area_orig,1, LOCATE('省',work_area_orig  ) ) ;
  UPDATE  report_cst_deal_mid_own a,b_city b  SET  a.work_city_code   = b.cityCode  WHERE a.work_city_name=b.cityname;
  UPDATE  report_cst_deal_mid_own a,b_city b  SET  a.work_sheng_code  = b.cityCode  WHERE a.work_sheng_name=b.cityname;
  UPDATE  report_cst_deal_mid_own a, b_room  b  SET a.house_address = b.house_address WHERE a.roomGUID=b.roomGUID; 
 
  UPDATE  report_cst_deal_mid_own  a, (SELECT * FROM b_org WHERE orgtype=3 )b 
   SET a.path=b.path   
  WHERE a.city_code=b.orgGUID;
  UPDATE   report_rpt_run_time SET   enddate=SYSDATE()  , runstatus='1' WHERE runstatus='0'  AND programname='proc_reprot_cst_deal_own'  ;
  COMMIT;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_room_cmdp_to_wy` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_room_cmdp_to_wy` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_room_cmdp_to_wy`(`p_roomGUID` VARCHAR(64))
BEGIN
	#Routine body goes here...
  DECLARE r_projs VARCHAR(4000);
  
  /*楼栋代码*/
  DECLARE v_bldCode VARCHAR(50); 
  /*楼栋名称*/
  DECLARE v_bldName VARCHAR(50);
  /*单元名称*/
  DECLARE v_unit VARCHAR(50);
  /*房间编号*/
  DECLARE v_room VARCHAR(50);
  /*项目名称*/
  DECLARE v_projName VARCHAR(100);
  /*处理后楼栋编码*/
  DECLARE v_new_bldCode VARCHAR(50);
  /*包含座取座的信息*/
  DECLARE v_sub_bld VARCHAR(10);
  
  /*ROOMID*/
  DECLARE v_wy_roomID VARCHAR(50);
  
  /*匹配到的物业数据*/
  DECLARE v_tmpIDs VARCHAR(200);
  
  DECLARE v_roomGUID_Ok VARCHAR(64);
  /*获取CMPD中的房间信息*/
  SELECT t2.bldCode,t2.bldName,t1.unit,t1.room,t3.projName INTO v_bldCode,v_bldName,v_unit,v_room,v_projName FROM b_room t1,b_building t2,b_proj t3 WHERE t1.bldGUID=t2.bldGUID AND t1.projGUID=t3.projGUID  AND t1.roomGUID=p_roomGUID;
  
  
  /*重新定义特殊的项目名称*/
  IF v_projName ='深圳兰溪谷-国际公寓' THEN
     SET v_projName='深圳兰溪谷二期-国际公寓';
  END IF;
  /*分析楼栋信息*/
  SET v_sub_bld= SUBSTRING_INDEX(SUBSTRING_INDEX(v_bldName,'座',1),'栋',-1);
  
  IF CAST(v_bldName AS UNSIGNED INT)>0 THEN
     SET v_new_bldCode=CAST(v_bldName AS UNSIGNED INT);
  ELSE
     SET v_new_bldCode=CAST(v_bldCode AS UNSIGNED INT);
  END IF;
  IF INSTR(v_bldName,'A栋')>0 OR INSTR(v_bldName,'B栋')>0 OR INSTR(v_bldName,'C栋')>0 OR INSTR(v_bldName,'D栋')>0 OR INSTR(v_bldName,'E栋')>0 OR INSTR(v_bldName,'F栋')>0 THEN
    SET v_new_bldCode=SUBSTRING_INDEX(v_bldName,'栋',1);
  END IF;
  /*精减单元*/
  SET v_unit=REPLACE(v_unit,'单元','');
  SET v_unit=REPLACE(v_unit,'号楼','');
  /*判断是否是商铺*/
  IF INSTR(v_bldName,'商铺')>0 THEN
    
    /*特殊room处理*/
    SET v_room=REPLACE(v_room,'商店','');
    /*SP-room*/
    SET v_wy_roomID= CONCAT('SP','-',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      SELECT v_wy_roomID,p_roomGUID;
    END IF;
    SET v_wy_roomID= CONCAT('SP','-0',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      SELECT v_wy_roomID,p_roomGUID;
    END IF;    
    
    /*SPbldCode-room*/
    SET v_wy_roomID= CONCAT('SP',v_new_bldCode,'-',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      SELECT v_wy_roomID,p_roomGUID;
    END IF;
    SET v_wy_roomID= CONCAT('SP',v_new_bldCode,'-0',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      SELECT v_wy_roomID,p_roomGUID;
    END IF;
    /*bldCode-room*/
    SET v_wy_roomID= CONCAT(v_new_bldCode,'-',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      SELECT v_wy_roomID,p_roomGUID;
    END IF;
    SET v_wy_roomID= CONCAT('0',v_new_bldCode,'-0',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      SELECT v_wy_roomID,p_roomGUID;
    END IF;
    SET v_wy_roomID= CONCAT('0',v_new_bldCode,'-',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      SELECT v_wy_roomID,p_roomGUID;
    END IF;
    /*bldCode-SP-room*/
    SET v_wy_roomID= CONCAT(v_new_bldCode,'-SP-',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      SELECT v_wy_roomID,p_roomGUID;
    END IF;
    /*bldCode#room*/
    SET v_wy_roomID= CONCAT(v_new_bldCode,'#',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      SELECT v_wy_roomID,p_roomGUID;
    END IF;
  ELSEIF v_sub_bld IS NOT NULL AND v_sub_bld!='' THEN   /*包含座信息*/
    
    /*bldCode-subBld-room*/
    SET v_wy_roomID= CONCAT(v_new_bldCode,'-',v_sub_bld,'-',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      SELECT v_wy_roomID,p_roomGUID;
    END IF;  
   
    SET v_wy_roomID= CONCAT(v_new_bldCode,'-',v_sub_bld,'-0',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      SELECT v_wy_roomID,p_roomGUID;
    END IF;  
    SET v_wy_roomID= CONCAT('0',v_new_bldCode,'-',v_sub_bld,'-',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      SELECT v_wy_roomID,p_roomGUID;
    END IF;  
   
    SET v_wy_roomID= CONCAT('0',v_new_bldCode,'-',v_sub_bld,'-0',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      SELECT v_wy_roomID,p_roomGUID;
    END IF;
    /*subBld-room*/
    SET v_wy_roomID= CONCAT(v_sub_bld,'-',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      SELECT v_wy_roomID,p_roomGUID;
    END IF;
    SET v_wy_roomID= CONCAT(v_sub_bld,'-0',v_room);
    IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
      SELECT v_wy_roomID,p_roomGUID;
    END IF;
    
    /*有座同时有单元的*/
    IF  v_unit IS NOT NULL AND v_unit!=''  THEN
      SET v_wy_roomID= CONCAT(v_new_bldCode,'-',v_sub_bld,v_unit,'-',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         SELECT v_wy_roomID,p_roomGUID;
      END IF;
      SET v_wy_roomID= CONCAT(v_new_bldCode,'-',v_sub_bld,v_unit,'-0',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         SELECT v_wy_roomID,p_roomGUID;
      END IF;
      SET v_wy_roomID= CONCAT('0',v_new_bldCode,'-',v_sub_bld,v_unit,'-0',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         SELECT v_wy_roomID,p_roomGUID;
      END IF;
      SET v_wy_roomID= CONCAT('0',v_new_bldCode,'-',v_sub_bld,v_unit,'-',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         SELECT v_wy_roomID,p_roomGUID;
      END IF;
    END IF;
  END IF;
  /*有单元的匹配*/
  IF  v_unit IS NOT NULL AND v_unit!=''  THEN
      SELECT v_new_bldCode,v_room,v_projName,v_unit,v_bldName;
    /*特殊情况 6#-A-2B*/
    IF INSTR(v_bldName,'＃')>0 OR INSTR(v_bldName,'#')>0 THEN
      SET v_wy_roomID= CONCAT(v_new_bldCode,'#-',v_unit,'-',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         SELECT v_wy_roomID,p_roomGUID;
      END IF;
    END IF;
      SET v_wy_roomID= CONCAT(v_new_bldCode,'-',v_unit,'-',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         SELECT v_wy_roomID,p_roomGUID;
      END IF;
      SET v_wy_roomID= CONCAT(v_new_bldCode,'-',v_unit,'-0',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         SELECT v_wy_roomID,p_roomGUID;
      END IF;
      SET v_wy_roomID= CONCAT('0',v_new_bldCode,'-',v_unit,'-0',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         SELECT v_wy_roomID,p_roomGUID;
      END IF;
      SET v_wy_roomID= CONCAT('0',v_new_bldCode,'-',v_unit,'-',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         SELECT v_wy_roomID,p_roomGUID;
      END IF;
  END IF;
  
  /*普通的匹配方式*/
 
      SELECT v_new_bldCode,v_room,v_projName,v_unit,v_bldName;
      SET v_wy_roomID= CONCAT(v_new_bldCode,'-',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         SELECT v_wy_roomID,p_roomGUID;
      END IF;
      SET v_wy_roomID= CONCAT(v_new_bldCode,'-0',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         SELECT v_wy_roomID,p_roomGUID;
      END IF;
      SET v_wy_roomID= CONCAT('0',v_new_bldCode,'-0',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         SELECT v_wy_roomID,p_roomGUID;
      END IF;
      SET v_wy_roomID= CONCAT('0',v_new_bldCode,'-',v_room);
      IF func_room_upTmpID(v_wy_roomID,v_projName,p_roomGUID) > 0 THEN
         SELECT v_wy_roomID,p_roomGUID;
      END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_room_wy_to_cmdp` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_room_wy_to_cmdp` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_room_wy_to_cmdp`(IN p_room VARCHAR(50),IN p_bld VARCHAR(50),OUT r_projs VARCHAR(4000))
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE v_roomGUID VARCHAR(64);
  DECLARE v_projGUID VARCHAR(64);
  DECLARE cur_projGUID CURSOR FOR SELECT t2.projGUID,t1.roomGUID FROM b_room t1,b_building t2 WHERE t1.bldGUID=t2.bldGUID 
                               AND (t1.room=p_room  OR CONCAT('0',t1.room)=p_room)
                               AND (t2.bldCode=p_bld OR t2.bldCode=CONCAT(p_bld,'栋') OR t2.bldCode=CONCAT('0',p_bld) OR t2.bldCode=CONCAT('0',p_bld,'栋') OR CONCAT('0',t2.bldCode)=p_bld);
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET Done = 1;
  OPEN cur_projGUID;
  FETCH cur_projGUID INTO v_projGUID, v_roomGUID;  
  REPEAT      
     SELECT CONCAT_WS('|',r_projs,CONCAT(v_projGUID,',',v_roomGUID)) INTO r_projs;  
     FETCH cur_projGUID INTO v_projGUID, v_roomGUID;
  UNTIL done END REPEAT;  
  CLOSE cur_projGUID;  
 END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_rpt_cst_customer_basic` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_rpt_cst_customer_basic` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_rpt_cst_customer_basic`()
BEGIN
	#Routine body goes here...
/* 已不使用*/
  TRUNCATE TABLE rpt_cst_customer_basic;
INSERT INTO rpt_cst_customer_basic 
SELECT t1.cstGUID,t1.cstName,t1.gender,t1.mobileTel,t1.cardID, (CASE WHEN  (YEAR(t1.createTime)- YEAR(birthDate)) <=20 THEN  '20岁以下' 
								     WHEN  (  (YEAR(t1.createTime)- YEAR(t1.birthDate)))<35 THEN  '21-34岁'
								     WHEN  (     (YEAR(t1.createTime)- YEAR(t1.birthDate)))<45 THEN  '35-44岁'
								     WHEN  (    (YEAR(t1.createTime)- YEAR(t1.birthDate)))<55 THEN  '45-55岁'
								     WHEN  ( (YEAR(t1.createTime)- YEAR(t1.birthDate)))<65 THEN  '56-64岁'
								     WHEN  (YEAR(t1.createTime)- YEAR(t1.birthDate))>=65  THEN  '64岁以上' END)  ,1,'',
								     (SELECT `values` FROM cst_attach_0 WHERE attachCode='cst_degree' AND cstGUID=t1.cstGUID LIMIT 1),'',
								     (SELECT `values` FROM cst_attach_0 WHERE attachCode='cst_workArea' AND cstGUID=t1.cstGUID LIMIT 1),
								     (SELECT `values` FROM cst_attach_0 WHERE attachCode='cst_lifeArea' AND cstGUID=t1.cstGUID LIMIT 1),
                     (SELECT `values` FROM cst_attach_0 WHERE attachCode='cst_companyType' AND cstGUID=t1.cstGUID LIMIT 1),
                     (SELECT `values` FROM cst_attach_0 WHERE attachCode='cst_opp_projectIntent' AND cstGUID=t1.cstGUID LIMIT 1),
                     t4.area_id,t4.citycode,t4.projGUID,t1.ismerge&14,'',t4.firstVistTime,NULL,NULL,NULL,NULL,'流失',t1.createTime,''
                     FROM cst_customer_0 t1 
LEFT JOIN rpt_cst_opp_mid_all t4 ON t1.cstGUID=t4.cstGUID;
INSERT INTO rpt_cst_customer_basic 
SELECT t1.cstGUID,t1.cstName,t1.gender,t1.mobileTel,t1.cardID, (CASE WHEN  (YEAR(t1.createTime)- YEAR(birthDate)) <=20 THEN  '20岁以下' 
								     WHEN  (  (YEAR(t1.createTime)- YEAR(t1.birthDate)))<35 THEN  '21-34岁'
								     WHEN  (     (YEAR(t1.createTime)- YEAR(t1.birthDate)))<45 THEN  '35-44岁'
								     WHEN  (    (YEAR(t1.createTime)- YEAR(t1.birthDate)))<55 THEN  '45-55岁'
								     WHEN  ( (YEAR(t1.createTime)- YEAR(t1.birthDate)))<65 THEN  '56-64岁'
								     WHEN  (YEAR(t1.createTime)- YEAR(t1.birthDate))>=65  THEN  '64岁以上' END)  ,1,'',
								     (SELECT `values` FROM cst_attach_1 WHERE attachCode='cst_degree' AND cstGUID=t1.cstGUID LIMIT 1),'',
								     (SELECT `values` FROM cst_attach_1 WHERE attachCode='cst_workArea' AND cstGUID=t1.cstGUID LIMIT 1),
								     (SELECT `values` FROM cst_attach_1 WHERE attachCode='cst_lifeArea' AND cstGUID=t1.cstGUID LIMIT 1),
                     (SELECT `values` FROM cst_attach_1 WHERE attachCode='cst_companyType' AND cstGUID=t1.cstGUID LIMIT 1),
                     (SELECT `values` FROM cst_attach_1 WHERE attachCode='cst_opp_projectIntent' AND cstGUID=t1.cstGUID LIMIT 1),
                     t4.area_id,t4.citycode,t4.projGUID,t1.ismerge&14,'',t4.firstVistTime,NULL,NULL,NULL,NULL,'流失',t1.createTime,''
                     FROM cst_customer_1 t1 
LEFT JOIN rpt_cst_opp_mid_all t4 ON t1.cstGUID=t4.cstGUID;
INSERT INTO rpt_cst_customer_basic 
SELECT t1.cstGUID,t1.cstName,t1.gender,t1.mobileTel,t1.cardID, (CASE WHEN  (YEAR(t1.createTime)- YEAR(birthDate)) <=20 THEN  '20岁以下' 
								     WHEN  (  (YEAR(t1.createTime)- YEAR(t1.birthDate)))<35 THEN  '21-34岁'
								     WHEN  (     (YEAR(t1.createTime)- YEAR(t1.birthDate)))<45 THEN  '35-44岁'
								     WHEN  (    (YEAR(t1.createTime)- YEAR(t1.birthDate)))<55 THEN  '45-55岁'
								     WHEN  ( (YEAR(t1.createTime)- YEAR(t1.birthDate)))<65 THEN  '56-64岁'
								     WHEN  (YEAR(t1.createTime)- YEAR(t1.birthDate))>=65  THEN  '64岁以上' END)  ,1,'',
								     (SELECT `values` FROM cst_attach_2 WHERE attachCode='cst_degree' AND cstGUID=t1.cstGUID LIMIT 1),'',
								     (SELECT `values` FROM cst_attach_2 WHERE attachCode='cst_workArea' AND cstGUID=t1.cstGUID LIMIT 1),
								     (SELECT `values` FROM cst_attach_2 WHERE attachCode='cst_lifeArea' AND cstGUID=t1.cstGUID LIMIT 1),
                     (SELECT `values` FROM cst_attach_2 WHERE attachCode='cst_companyType' AND cstGUID=t1.cstGUID LIMIT 1),
                     (SELECT `values` FROM cst_attach_2 WHERE attachCode='cst_opp_projectIntent' AND cstGUID=t1.cstGUID LIMIT 1),
                     t4.area_id,t4.citycode,t4.projGUID,t1.ismerge&14,'',t4.firstVistTime,NULL,NULL,NULL,NULL,'流失',t1.createTime,''
                     FROM cst_customer_2 t1 
LEFT JOIN rpt_cst_opp_mid_all t4 ON t1.cstGUID=t4.cstGUID;
INSERT INTO rpt_cst_customer_basic 
SELECT t1.cstGUID,t1.cstName,t1.gender,t1.mobileTel,t1.cardID, (CASE WHEN  (YEAR(t1.createTime)- YEAR(birthDate)) <=20 THEN  '20岁以下' 
								     WHEN  (  (YEAR(t1.createTime)- YEAR(t1.birthDate)))<35 THEN  '21-34岁'
								     WHEN  (     (YEAR(t1.createTime)- YEAR(t1.birthDate)))<45 THEN  '35-44岁'
								     WHEN  (    (YEAR(t1.createTime)- YEAR(t1.birthDate)))<55 THEN  '45-55岁'
								     WHEN  ( (YEAR(t1.createTime)- YEAR(t1.birthDate)))<65 THEN  '56-64岁'
								     WHEN  (YEAR(t1.createTime)- YEAR(t1.birthDate))>=65  THEN  '64岁以上' END)  ,1,'',
								     (SELECT `values` FROM cst_attach_3 WHERE attachCode='cst_degree' AND cstGUID=t1.cstGUID LIMIT 1),'',
								     (SELECT `values` FROM cst_attach_3 WHERE attachCode='cst_workArea' AND cstGUID=t1.cstGUID LIMIT 1),
								     (SELECT `values` FROM cst_attach_3 WHERE attachCode='cst_lifeArea' AND cstGUID=t1.cstGUID LIMIT 1),
                     (SELECT `values` FROM cst_attach_3 WHERE attachCode='cst_companyType' AND cstGUID=t1.cstGUID LIMIT 1),
                     (SELECT `values` FROM cst_attach_3 WHERE attachCode='cst_opp_projectIntent' AND cstGUID=t1.cstGUID LIMIT 1),
                     t4.area_id,t4.citycode,t4.projGUID,t1.ismerge&14,'',t4.firstVistTime,NULL,NULL,NULL,NULL,'流失',t1.createTime,''
                     FROM cst_customer_3 t1 
LEFT JOIN rpt_cst_opp_mid_all t4 ON t1.cstGUID=t4.cstGUID;
INSERT INTO rpt_cst_customer_basic 
SELECT t1.cstGUID,t1.cstName,t1.gender,t1.mobileTel,t1.cardID, (CASE WHEN  (YEAR(t1.createTime)- YEAR(birthDate)) <=20 THEN  '20岁以下' 
								     WHEN  (  (YEAR(t1.createTime)- YEAR(t1.birthDate)))<35 THEN  '21-34岁'
								     WHEN  (     (YEAR(t1.createTime)- YEAR(t1.birthDate)))<45 THEN  '35-44岁'
								     WHEN  (    (YEAR(t1.createTime)- YEAR(t1.birthDate)))<55 THEN  '45-55岁'
								     WHEN  ( (YEAR(t1.createTime)- YEAR(t1.birthDate)))<65 THEN  '56-64岁'
								     WHEN  (YEAR(t1.createTime)- YEAR(t1.birthDate))>=65  THEN  '64岁以上' END)  ,1,'',
								     (SELECT `values` FROM cst_attach_4 WHERE attachCode='cst_degree' AND cstGUID=t1.cstGUID LIMIT 1),'',
								     (SELECT `values` FROM cst_attach_4 WHERE attachCode='cst_workArea' AND cstGUID=t1.cstGUID LIMIT 1),
								     (SELECT `values` FROM cst_attach_4 WHERE attachCode='cst_lifeArea' AND cstGUID=t1.cstGUID LIMIT 1),
                     (SELECT `values` FROM cst_attach_4 WHERE attachCode='cst_companyType' AND cstGUID=t1.cstGUID LIMIT 1),
                     (SELECT `values` FROM cst_attach_4 WHERE attachCode='cst_opp_projectIntent' AND cstGUID=t1.cstGUID LIMIT 1),
                     t4.area_id,t4.citycode,t4.projGUID,t1.ismerge&14,'',t4.firstVistTime,NULL,NULL,NULL,NULL,'流失',t1.createTime,''
                     FROM cst_customer_4 t1 
LEFT JOIN rpt_cst_opp_mid_all t4 ON t1.cstGUID=t4.cstGUID;
INSERT INTO rpt_cst_customer_basic 
SELECT t1.cstGUID,t1.cstName,t1.gender,t1.mobileTel,t1.cardID, (CASE WHEN  (YEAR(t1.createTime)- YEAR(birthDate)) <=20 THEN  '20岁以下' 
								     WHEN  (  (YEAR(t1.createTime)- YEAR(t1.birthDate)))<35 THEN  '21-34岁'
								     WHEN  (     (YEAR(t1.createTime)- YEAR(t1.birthDate)))<45 THEN  '35-44岁'
								     WHEN  (    (YEAR(t1.createTime)- YEAR(t1.birthDate)))<55 THEN  '45-55岁'
								     WHEN  ( (YEAR(t1.createTime)- YEAR(t1.birthDate)))<65 THEN  '56-64岁'
								     WHEN  (YEAR(t1.createTime)- YEAR(t1.birthDate))>=65  THEN  '64岁以上' END)  ,1,'',
								     (SELECT `values` FROM cst_attach_5 WHERE attachCode='cst_degree' AND cstGUID=t1.cstGUID LIMIT 1),'',
								     (SELECT `values` FROM cst_attach_5 WHERE attachCode='cst_workArea' AND cstGUID=t1.cstGUID LIMIT 1),
								     (SELECT `values` FROM cst_attach_5 WHERE attachCode='cst_lifeArea' AND cstGUID=t1.cstGUID LIMIT 1),
                     (SELECT `values` FROM cst_attach_5 WHERE attachCode='cst_companyType' AND cstGUID=t1.cstGUID LIMIT 1),
                     (SELECT `values` FROM cst_attach_5 WHERE attachCode='cst_opp_projectIntent' AND cstGUID=t1.cstGUID LIMIT 1),
                     t4.area_id,t4.citycode,t4.projGUID,t1.ismerge&14,'',t4.firstVistTime,NULL,NULL,NULL,NULL,'流失',t1.createTime,''
                     FROM cst_customer_5 t1 
LEFT JOIN rpt_cst_opp_mid_all t4 ON t1.cstGUID=t4.cstGUID;
INSERT INTO rpt_cst_customer_basic 
SELECT t1.cstGUID,t1.cstName,t1.gender,t1.mobileTel,t1.cardID, (CASE WHEN  (YEAR(t1.createTime)- YEAR(birthDate)) <=20 THEN  '20岁以下' 
								     WHEN  (  (YEAR(t1.createTime)- YEAR(t1.birthDate)))<35 THEN  '21-34岁'
								     WHEN  (     (YEAR(t1.createTime)- YEAR(t1.birthDate)))<45 THEN  '35-44岁'
								     WHEN  (    (YEAR(t1.createTime)- YEAR(t1.birthDate)))<55 THEN  '45-55岁'
								     WHEN  ( (YEAR(t1.createTime)- YEAR(t1.birthDate)))<65 THEN  '56-64岁'
								     WHEN  (YEAR(t1.createTime)- YEAR(t1.birthDate))>=65  THEN  '64岁以上' END)  ,1,'',
								     (SELECT `values` FROM cst_attach_6 WHERE attachCode='cst_degree' AND cstGUID=t1.cstGUID LIMIT 1),'',
								     (SELECT `values` FROM cst_attach_6 WHERE attachCode='cst_workArea' AND cstGUID=t1.cstGUID LIMIT 1),
								     (SELECT `values` FROM cst_attach_6 WHERE attachCode='cst_lifeArea' AND cstGUID=t1.cstGUID LIMIT 1),
                     (SELECT `values` FROM cst_attach_6 WHERE attachCode='cst_companyType' AND cstGUID=t1.cstGUID LIMIT 1),
                     (SELECT `values` FROM cst_attach_6 WHERE attachCode='cst_opp_projectIntent' AND cstGUID=t1.cstGUID LIMIT 1),
                     t4.area_id,t4.citycode,t4.projGUID,t1.ismerge&14,'',t4.firstVistTime,NULL,NULL,NULL,NULL,'流失',t1.createTime,''
                     FROM cst_customer_6 t1 
LEFT JOIN rpt_cst_opp_mid_all t4 ON t1.cstGUID=t4.cstGUID;
INSERT INTO rpt_cst_customer_basic 
SELECT t1.cstGUID,t1.cstName,t1.gender,t1.mobileTel,t1.cardID, (CASE WHEN  (YEAR(t1.createTime)- YEAR(birthDate)) <=20 THEN  '20岁以下' 
								     WHEN  (  (YEAR(t1.createTime)- YEAR(t1.birthDate)))<35 THEN  '21-34岁'
								     WHEN  (     (YEAR(t1.createTime)- YEAR(t1.birthDate)))<45 THEN  '35-44岁'
								     WHEN  (    (YEAR(t1.createTime)- YEAR(t1.birthDate)))<55 THEN  '45-55岁'
								     WHEN  ( (YEAR(t1.createTime)- YEAR(t1.birthDate)))<65 THEN  '56-64岁'
								     WHEN  (YEAR(t1.createTime)- YEAR(t1.birthDate))>=65  THEN  '64岁以上' END)  ,1,'',
								     (SELECT `values` FROM cst_attach_7 WHERE attachCode='cst_degree' AND cstGUID=t1.cstGUID LIMIT 1),'',
								     (SELECT `values` FROM cst_attach_7 WHERE attachCode='cst_workArea' AND cstGUID=t1.cstGUID LIMIT 1),
								     (SELECT `values` FROM cst_attach_7 WHERE attachCode='cst_lifeArea' AND cstGUID=t1.cstGUID LIMIT 1),
                     (SELECT `values` FROM cst_attach_7 WHERE attachCode='cst_companyType' AND cstGUID=t1.cstGUID LIMIT 1),
                     (SELECT `values` FROM cst_attach_7 WHERE attachCode='cst_opp_projectIntent' AND cstGUID=t1.cstGUID LIMIT 1),
                     t4.area_id,t4.citycode,t4.projGUID,t1.ismerge&14,'',t4.firstVistTime,NULL,NULL,NULL,NULL,'流失',t1.createTime,''
                     FROM cst_customer_7 t1 
LEFT JOIN rpt_cst_opp_mid_all t4 ON t1.cstGUID=t4.cstGUID;
INSERT INTO rpt_cst_customer_basic 
SELECT t1.cstGUID,t1.cstName,t1.gender,t1.mobileTel,t1.cardID, (CASE WHEN  (YEAR(t1.createTime)- YEAR(birthDate)) <=20 THEN  '20岁以下' 
								     WHEN  (  (YEAR(t1.createTime)- YEAR(t1.birthDate)))<35 THEN  '21-34岁'
								     WHEN  (     (YEAR(t1.createTime)- YEAR(t1.birthDate)))<45 THEN  '35-44岁'
								     WHEN  (    (YEAR(t1.createTime)- YEAR(t1.birthDate)))<55 THEN  '45-55岁'
								     WHEN  ( (YEAR(t1.createTime)- YEAR(t1.birthDate)))<65 THEN  '56-64岁'
								     WHEN  (YEAR(t1.createTime)- YEAR(t1.birthDate))>=65  THEN  '64岁以上' END)  ,1,'',
								     (SELECT `values` FROM cst_attach_8 WHERE attachCode='cst_degree' AND cstGUID=t1.cstGUID LIMIT 1),'',
								     (SELECT `values` FROM cst_attach_8 WHERE attachCode='cst_workArea' AND cstGUID=t1.cstGUID LIMIT 1),
								     (SELECT `values` FROM cst_attach_8 WHERE attachCode='cst_lifeArea' AND cstGUID=t1.cstGUID LIMIT 1),
                     (SELECT `values` FROM cst_attach_8 WHERE attachCode='cst_companyType' AND cstGUID=t1.cstGUID LIMIT 1),
                     (SELECT `values` FROM cst_attach_8 WHERE attachCode='cst_opp_projectIntent' AND cstGUID=t1.cstGUID LIMIT 1),
                     t4.area_id,t4.citycode,t4.projGUID,t1.ismerge&14,'',t4.firstVistTime,NULL,NULL,NULL,NULL,'流失',t1.createTime,''
                     FROM cst_customer_8 t1 
LEFT JOIN rpt_cst_opp_mid_all t4 ON t1.cstGUID=t4.cstGUID;
INSERT INTO rpt_cst_customer_basic 
SELECT t1.cstGUID,t1.cstName,t1.gender,t1.mobileTel,t1.cardID, (CASE WHEN  (YEAR(t1.createTime)- YEAR(birthDate)) <=20 THEN  '20岁以下' 
								     WHEN  (  (YEAR(t1.createTime)- YEAR(t1.birthDate)))<35 THEN  '21-34岁'
								     WHEN  (     (YEAR(t1.createTime)- YEAR(t1.birthDate)))<45 THEN  '35-44岁'
								     WHEN  (    (YEAR(t1.createTime)- YEAR(t1.birthDate)))<55 THEN  '45-55岁'
								     WHEN  ( (YEAR(t1.createTime)- YEAR(t1.birthDate)))<65 THEN  '56-64岁'
								     WHEN  (YEAR(t1.createTime)- YEAR(t1.birthDate))>=65  THEN  '64岁以上' END)  ,1,'',
								     (SELECT `values` FROM cst_attach_9 WHERE attachCode='cst_degree' AND cstGUID=t1.cstGUID LIMIT 1),'',
								     (SELECT `values` FROM cst_attach_9 WHERE attachCode='cst_workArea' AND cstGUID=t1.cstGUID LIMIT 1),
								     (SELECT `values` FROM cst_attach_9 WHERE attachCode='cst_lifeArea' AND cstGUID=t1.cstGUID LIMIT 1),
                     (SELECT `values` FROM cst_attach_9 WHERE attachCode='cst_companyType' AND cstGUID=t1.cstGUID LIMIT 1),
                     (SELECT `values` FROM cst_attach_9 WHERE attachCode='cst_opp_projectIntent' AND cstGUID=t1.cstGUID LIMIT 1),
                     t4.area_id,t4.citycode,t4.projGUID,t1.ismerge&14,'',t4.firstVistTime,NULL,NULL,NULL,NULL,'流失',t1.createTime,''
                     FROM cst_customer_9 t1 
LEFT JOIN rpt_cst_opp_mid_all t4 ON t1.cstGUID=t4.cstGUID;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_rpt_cst_repeat_buy_detail` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_rpt_cst_repeat_buy_detail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_rpt_cst_repeat_buy_detail`()
BEGIN
  DECLARE v_date DATE;
 
  SET v_date =DATE_FORMAT (CURDATE()-1 ,'%Y-%m-%d');
 
  /*统计项目的成交套数，金额SET v_date =DATE_FORMAT (curdate() -1,'%Y-%m-%d');
 
  select room_acre_segment,deal_date,cstguid,big_area,city_name ,sex,cstCurYl,proj_house_type,product_type, big_code,city_code ,prject_name,projGUID ,csttype,cardtype,sale_acreage,mjcode ,curr_amount_id,ylcode from ( 
  select room_acre_segment,deal_date,cstguid,rank ,big_area,city_name ,sex,cstCurYl,proj_house_type,product_type,big_code,city_code,prject_name,projGUID ,csttype,cardtype,sale_acreage ,mjcode ,curr_amount_id,ylcode from (  
  select  cstCurYl, cstguid,a.deal_date,@rownum:=@rownum+1,  
  if(@pdept=a.cstguid,@rank:=@rank+1,@rank:=1) as rank,@pdept:=a.cstguid  ,
			big_area,city_name,sex,product_type,big_code,city_code,proj_house_type,room_acre_segment ,prject_name,projGUID,csttype,cardtype ,sale_acreage,mjcode,curr_amount_id,ylcode
  from (   
  select deal_date,room_acre_segment ,cstguid ,big_area,city_name,sex,product_type ,cstCurYl,proj_house_type  ,big_code,city_code,prject_name,projGUID,
		csttype,cardtype,sale_acreage,mjcode, curr_amount_id  ,ylcode 
		from report_cst_deal_mid_own  where csttype=1 and  not( proj_house_type ='商铺' or proj_house_type ='车位')   order by cstguid ,deal_date desc    
		) a , 
		(select @rownum :=0 , @pdept := null ,@rank:=0) b  
	) result 
		) c where rank>1;
*/
   
  DELETE FROM rpt_cst_repeat_buy_detail; 
  INSERT INTO rpt_cst_repeat_buy_detail(room_acre_segment,deal_date,cstguid,big_area,city_name ,sex,cstCurYl,proj_house_type,product_type, big_code,city_code,prject_name,projGUID,csttype,cardtype,sale_acreage,mjcode,curr_amount_id,ylcode )  
  SELECT room_acre_segment,deal_date,cstguid,big_area,city_name ,sex,cstCurYl,proj_house_type,product_type, big_code,city_code ,prject_name,projGUID ,csttype,cardtype,sale_acreage,mjcode ,curr_amount_id,ylcode   FROM (
  SELECT DISTINCT cstguid AS cstguid1 FROM ( 
  SELECT *
  FROM (  
  SELECT   
  IF(@pdept=a.cstguid,@rank:=@rank+1,@rank:=1) AS rank,@pdept:=a.cstguid , deal_date,a.cstguid  
  FROM (   
  SELECT  cstguid ,deal_date
		FROM report_cst_deal_mid_own  WHERE csttype=1 AND  NOT( proj_house_type ='商铺' OR proj_house_type ='车位')   ORDER BY cstguid ,deal_date DESC    
		) a , 
		(SELECT @rownum :=0 , @pdept := NULL ,@rank:=0) b  
	) result 
		) c WHERE rank>1) d, report_cst_deal_mid_own e WHERE d.cstguid1=e.cstguid
  AND  csttype=1 AND  NOT( proj_house_type ='商铺' OR proj_house_type ='车位') ;
	
  /*户型ID */
	UPDATE  rpt_cst_repeat_buy_detail a,rpt_base_index b 
	SET  				a.house_id = b.index_code 
      WHERE b.type_id='FCHR_R_013' AND a.proj_house_type=b.index_name;
  /* 产品类别偏好 */
	UPDATE  rpt_cst_repeat_buy_detail a,rpt_base_index b  SET  
				a.product_type_id = b.index_code
      WHERE b.type_id='FCHP_R_004' AND a.product_type=b.index_name;
 
 
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_rpt_format_convert` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_rpt_format_convert` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_rpt_format_convert`(IN p_totaldate VARCHAR(10))
BEGIN
	#Routine body goes here...
	DECLARE v_date DATE; 
  DECLARE v_datem DATETIME; 
  IF  p_totaldate ='AUTO' THEN
		 SET  v_date =DATE_FORMAT(CURDATE()-1 ,'%Y-%m-%d');
  ELSE
		 SET	v_date =p_totaldate;
  END IF;
  SET v_datem=CONCAT(v_date,' 23:59:59');
 
  /* 
  DELETE FROM rpt_format_convert where create_time=DATE_FORMAT (v_date ,'%Y-%m-%d');*/
  DELETE FROM rpt_format_convert  WHERE create_time=v_date;
  INSERT INTO rpt_format_convert(create_time,proj_guid,index_format_type,
	  incoming_visit_sum,visit_confess_sum,visti_subscribe_sum,confess_subscribe_sum,
	  subscribe_contract_sum,contract_returned_sum)  
  SELECT DATE_FORMAT (v_date ,'%Y-%m-%d'), proj_guid,'销售',0,0,0,0,0,0
   FROM  rpt_b_proj_sum      WHERE   (STATUS='在售' OR STATUS='已售') AND format_id='1'; 
    
  
	/* 认筹转认购   rpt_order_cst_mid  rpt_book_cst_mid 以下为中间表*/
 
	UPDATE rpt_format_convert d,
		( 
				SELECT  a.projGUID,COUNT(DISTINCT  a.cstGUID) confess_subscribe_sum FROM  rpt_order_cst_mid  a,rpt_book_cst_mid b 
			       	WHERE    a.projGUID=b.projGUID AND a.cstGUID=b.cstGUID  AND  a.qsDate<=v_date  AND (  NOT( proj_house_type ='商铺' OR proj_house_type ='车位'   ) ) GROUP BY   a.projGUID
		) e
	SET  d.confess_subscribe_sum=e.confess_subscribe_sum 
	WHERE d.proj_guid=e.projGUID  AND d.create_time=v_date;
 
  /* 到访转认筹*/ 
 
  UPDATE rpt_format_convert a,(
				 SELECT  a.projGUID, COUNT(DISTINCT a.cstGUID)  visit_confess_sum  
         FROM   rpt_book_cst_mid a, rpt_cst_opp_mid b  WHERE  a.projGUID=b.projGUID AND a.cstGUID=b.cstGUID AND   b.createTime<=v_datem    GROUP BY    projGUID  
		) c SET a.visit_confess_sum=c.visit_confess_sum 
  WHERE a.proj_guid=c.projGUID  AND create_time=v_date;
 
	/* 来电转到访 */ 
  UPDATE rpt_format_convert a,( 
				SELECT projGUID,COUNT(DISTINCT cstGUID) incoming_visit_sum  FROM s_opp a,s_cst_opp b 
		    WHERE a.oppGUID=b.oppGUID AND createTime<=v_date   AND oppSource='来电' AND PROCESS LIKE '%来访%'  GROUP BY projGUID 
		) c SET a.incoming_visit_sum=c.incoming_visit_sum 
  WHERE a.proj_guid=c.projGUID  AND create_time=v_date;
  
 	/* 到访转认购*/  
	UPDATE rpt_format_convert d, 
    (  
      SELECT   a.projGUID,  COUNT(DISTINCT  a.cstGUID) visti_subscribe_sum   FROM  rpt_order_cst_mid a,rpt_cst_opp_mid  b 
          WHERE 	a.projGUID=b.projGUID  AND a.cstGUID=b.cstGUID  AND   a.qsDate<=v_date 
             AND b.createTime<=v_datem   AND NOT( proj_house_type ='商铺' OR proj_house_type ='车位') 
            GROUP BY    a.projGUID    
	 	) e
	SET   d.visti_subscribe_sum=e.visti_subscribe_sum 
	WHERE d.proj_guid=e.projGUID  AND create_time=v_date;
	 
	/* 认购转签约 套数*/ 
      UPDATE rpt_format_convert d,(SELECT b.projGUID,COUNT(DISTINCT b.roomGUID) subscribe_contract_sum   FROM  rpt_order_cst_mid a,report_cst_deal_mid_bak2 b   
        WHERE deal_date<=v_date AND a.projGUID=b.projGUID AND a.roomGUID=b.roomGUID               AND NOT( b.proj_house_type ='商铺' OR b.proj_house_type ='车位' )  
	 GROUP BY b.projGUID) e         SET d.subscribe_contract_sum =e.subscribe_contract_sum      	WHERE d.proj_guid=e.projGUID AND create_time=v_date;
  
  /* 更改回款数 */ 
  UPDATE rpt_format_convert d,(SELECT projGUID,COUNT(*) AS contract_returned_sum FROM report_cst_deal_mid_bak2 a ,
               (SELECT  SaleGUID FROM t_getin WHERE itemType='贷款类房款' OR itemType='非贷款类房款'	GROUP BY SaleGUID  )b
          WHERE a.TradeGUID=b.SaleGUID  AND a.deal_date<=v_date  AND NOT( proj_house_type ='商铺' OR proj_house_type ='车位'   )    GROUP BY projGUID) e 
     SET d.contract_returned_sum =e.contract_returned_sum 
    WHERE d.proj_guid=e.projGUID AND create_time=v_date;
 
  /* 来电客户数   
  UPDATE rpt_format_convert d,(SELECT projGUID,count(*) incoming_tele_sum FROM  s_opp where createTime<=v_date  and OppSource='来电' group by projGUID) e
     SET d.incoming_tele_sum =e.incoming_tele_sum 
    WHERE d.proj_guid=e.projGUID and create_time=v_date;
  */
   UPDATE rpt_format_convert d,(
      SELECT projGUID,COUNT(DISTINCT cstGUID) incoming_tele_sum  FROM s_opp a,s_cst_opp b 
		   WHERE a.oppGUID=b.oppGUID AND createTime<=v_date  AND OppSource='来电' GROUP BY projGUID 
   ) e
   SET d.incoming_tele_sum =e.incoming_tele_sum 
   WHERE d.proj_guid=e.projGUID AND create_time=v_date;
 
 
  /*到访客户数  */ 
  UPDATE rpt_format_convert d,( 
   SELECT projGUID,COUNT(DISTINCT cstGUID) visit_cst_num  FROM  rpt_cst_opp_mid    WHERE  createTime<=v_datem  GROUP BY projGUID
   ) e
  SET d.visit_cst_num =e.visit_cst_num 
  WHERE d.proj_guid=e.projGUID AND d.create_time=v_date;
 
 /*认筹客户数  认筹转认购(分母) */ 
 UPDATE rpt_format_convert d,(SELECT projGUID,COUNT(DISTINCT cstGUID) confess_cst_num FROM rpt_book_cst_mid   WHERE bgnDate<=v_date   GROUP BY projGUID ) e
       SET d.confess_cst_num =e.confess_cst_num 
    WHERE d.proj_guid=e.projGUID AND create_time=v_date;
 /*认购 套数  */ 
 UPDATE rpt_format_convert d,(SELECT projGUID, COUNT(DISTINCT roomGUID) subscribe_cst_num FROM rpt_order_cst_mid 
 WHERE   qsDate<=v_date AND NOT( proj_house_type ='商铺' OR proj_house_type ='车位' )   GROUP BY projGUID) e
       SET d.subscribe_cst_num =e.subscribe_cst_num 
    WHERE d.proj_guid=e.projGUID AND create_time=v_date; 
 
 /*签约客户数   */
 UPDATE rpt_format_convert d,(SELECT projGUID,COUNT(* ) contract_cst_num FROM report_cst_deal_mid_bak2  
       WHERE deal_date<=v_date  AND NOT( proj_house_type ='商铺' OR proj_house_type ='车位'   )     GROUP BY projGUID) e
       SET d.contract_cst_num =e.contract_cst_num 
    WHERE d.proj_guid=e.projGUID AND create_time=v_date;
  
 UPDATE rpt_format_convert  SET incoming_tele_sum=0 WHERE incoming_tele_sum IS NULL;
 UPDATE rpt_format_convert  SET visit_cst_num=0 WHERE visit_cst_num IS NULL;
 UPDATE rpt_format_convert  SET confess_cst_num=0 WHERE confess_cst_num IS NULL;
 UPDATE rpt_format_convert  SET subscribe_cst_num=0 WHERE subscribe_cst_num IS NULL;
 UPDATE rpt_format_convert  SET contract_cst_num=0 WHERE contract_cst_num IS NULL;
 
  
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_rpt_format_sale_analyse` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_rpt_format_sale_analyse` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_rpt_format_sale_analyse`(IN p_totaldate VARCHAR(10))
BEGIN
	   #Routine body goes here... 
   DECLARE v_date DATE;
   DECLARE v_sql VARCHAR(4000); 
   
   IF  p_totaldate ='AUTO' THEN
		  SET v_date =DATE_FORMAT (CURDATE()-1 ,'%Y-%m-%d');
   ELSE
		  SET	v_date =p_totaldate;
   END IF;
   
   /* 全部重新算 */
 
   DELETE FROM rpt_format_sale_analyse ; 
 	 
   INSERT INTO rpt_format_sale_analyse(big_code,big_name,city_code,city_name,comp_prom_num,timeo_finished_num,wait_deal_promble,ReceiveDate,createtime ,ReceiveGUID,STATUS)   
		SELECT  b.big_code,b.big_name ,b.city_code,b.city_name,1,0,0,a.ReceiveDate,v_date ,ReceiveGUID ,0 FROM (
                  SELECT ProjGUID ,ReceiveDate ,ReceiveGUID  FROM k_Receive WHERE    (ReceiveType='投诉' OR ReceiveType='投诉/咨询') 
       )a
     LEFT JOIN   v_proj_area_city_name_new  b     ON a.ProjGUID=b.projGUID
   ;
           
 
   
   /* 任务超时完成数 
   update  rpt_format_sale_analyse a,(	    
     select area_name,cityName,count(*) as timeo_finished_num    from (
                   select a.ProjGUID,SlDate,RwclSx,RwwcSj,DfkhSj,DfkhSx,ZsjfDate,Cnwcsj from k_Receive a  ,
                   k_Task b where a.ReceiveGUID=b.ReceiveGUID and (ReceiveType='投诉' or ReceiveType='投诉/咨询') 
                      and RwwcSj>RwclSx  
                ) c
               left  join v_proj_area_city_name  d on c.ProjGUID=d.projGUID 
               group by area_name,cityName 
    ) f set a.timeo_finished_num=f.timeo_finished_num
  where a.City_name=f.cityName and a.big_area=f.area_name   ;
 
  update  rpt_format_sale_analyse a,(	          
                   select a.ReceiveGUID ,1 from k_Receive a  ,
                   k_Task b where a.ReceiveGUID=b.ReceiveGUID and (ReceiveType='投诉' or ReceiveType='投诉/咨询') 
                      and RwwcSj>RwclSx  
                )  b 
   set a.`status`=1
 where a.ReceiveGUID=b.ReceiveGUID;
  */ 
/*
 更改任务完成时间,任务完成时效
*/
  UPDATE  rpt_format_sale_analyse a,(	          
           SELECT a.ReceiveGUID ,RwwcSj ,RwclSx FROM k_Receive a  ,
                   k_Task b WHERE a.ReceiveGUID=b.ReceiveGUID AND (ReceiveType='投诉' OR ReceiveType='投诉/咨询')                      
                )  b 
   SET  a.RwwcSj=b.RwwcSj,a.RwclSx=b.RwclSx ,a.`status`=1
 WHERE a.ReceiveGUID=b.ReceiveGUID;
  UPDATE rpt_format_sale_analyse a,  b_org b SET a.path=b.path WHERE a.city_code=b.orgGUID ;
  /*等待处理数 
  update  rpt_format_sale_analyse a,(	    
     select area_name,cityName,count(*) as wait_deal_promble    from (
                   select a.ProjGUID,SlDate,RwclSx,RwwcSj,DfkhSj,DfkhSx,ZsjfDate,Cnwcsj from k_Receive a  ,
                   k_Task b where a.ReceiveGUID=b.ReceiveGUID and (ReceiveType='投诉' or ReceiveType='投诉/咨询') 
                    and   RwwcSj is null   
                ) c
               left  join v_proj_area_city_name  d on c.ProjGUID=d.projGUID       
     group by area_name,cityName
     ) f set a.wait_deal_promble=f.wait_deal_promble
  where a.City_name=f.cityName and a.big_area=f.area_name   ;
  */ 
/* 等待处理数 
  update  rpt_format_sale_analyse a,(	          
                   select a.ReceiveGUID   from k_Receive a  ,
                   k_Task b where a.ReceiveGUID=b.ReceiveGUID and (ReceiveType='投诉' or ReceiveType='投诉/咨询') 
                      and RwwcSj is null 
                )  b 
   set a.`status`=2
 where a.ReceiveGUID=b.ReceiveGUID;
 */
 
/* 按时完成数 
 update  rpt_format_sale_analyse a,(	          
                   select a.ReceiveGUID  from k_Receive a  ,
                   k_Task b where a.ReceiveGUID=b.ReceiveGUID and (ReceiveType='投诉' or ReceiveType='投诉/咨询') 
                      and RwwcSj<=RwclSx  
                )  b 
   set a.`status`=3
 where a.ReceiveGUID=b.ReceiveGUID;
 */
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_rpt_index_base` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_rpt_index_base` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_rpt_index_base`(IN p_totaldate VARCHAR(10))
BEGIN
	
  DECLARE v_date DATETIME;
  DECLARE v_date_e DATETIME;
  
  IF  p_totaldate ='AUTO' THEN
		  SET v_date =DATE_FORMAT (CURDATE()-1 ,'%Y-%m-%d');
  ELSE
		 SET	v_date =p_totaldate;
  END IF;
    
  SET v_date_e= CONCAT(DATE_FORMAT(v_date ,'%Y-%m-%d'),' 23:59:59');     
  /*统计项目的成交套数，金额*/
  DELETE FROM rpt_index_base  WHERE create_time=v_date;
  INSERT INTO rpt_index_base(proj_guid,index_format_type,  
     follow_customer_sum  , new_visitors_sum,old_visitors_sum   ,confess_customer_sum ,   confess_cycle_sum   ,
     confess_amount_sum,subscribe_customer_sum ,subscribe_cycle_sum,subscribe_amount_sum,contract_customer_sum,contract_cycle_sum,   
     contract_amount_sum,returned_customer_sum,returned_cycle_sum,returned_amount_sum ,create_time  )         
   SELECT   proj_guid,'销售',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,DATE_FORMAT(v_date,'%Y-%m-%d')      FROM  rpt_b_proj_sum    
             WHERE   (STATUS='在售' OR STATUS='已售') AND format_id='1'; 
  /* 更改项目所属的公司大区*/   
  UPDATE  rpt_index_base a, v_proj_area_city_name_new b 
   SET a.big_code=b.big_code,a.city_code=b.city_Code 
  WHERE a.proj_guid=b.projGUID AND  create_time=v_date;
   /* 新到访客户数  */   
   UPDATE rpt_index_base  a,( SELECT ProjGUID,  COUNT(*) AS new_visitors_sum  
       FROM rpt_cst_opp_first_mid  WHERE firstVistTime BETWEEN v_date  AND v_date_e   GROUP BY ProjGUID)  b 
    SET  a.new_visitors_sum =b.new_visitors_sum  
   WHERE a.proj_guid=b.ProjGUID AND  create_time=v_date;
 
  /*老到访客户数=总到访客户-新到访客户数 */
   UPDATE rpt_index_base  a,( SELECT ProjGUID,  COUNT(*) AS all_visitors_sum  
       FROM rpt_cst_opp_mid  WHERE createTime BETWEEN v_date  AND v_date_e   GROUP BY ProjGUID)  b 
    SET  a.old_visitors_sum =b.all_visitors_sum-a.new_visitors_sum 
   WHERE a.proj_guid=b.ProjGUID AND  create_time=v_date;
  
  /*跟进客户数 e表为跟进客户数,跟进客户字段不能相加 */ 
  DROP TABLE IF EXISTS `rpt_cst_opp_mid_tmp`;
  CREATE  TABLE rpt_cst_opp_mid_tmp  AS 
	SELECT  projGUID,cstGUID,createTime FROM rpt_cst_opp_mid 	 WHERE  createTime BETWEEN DATE_SUB(v_date,INTERVAL 6 MONTH) AND v_date;
	  
 
  DROP TABLE IF EXISTS `report_cst_deal_mid_own_02_tmp`;
  CREATE  TABLE report_cst_deal_mid_own_02_tmp  AS 
   SELECT   projGUID  ,cstGUID  ,deal_date  FROM  report_cst_deal_mid_own_02
      WHERE     deal_date <= v_date AND  NOT (proj_house_type='商铺' OR  proj_house_type='车库');
  CREATE INDEX idx_own_02_tmp  ON report_cst_deal_mid_own_02_tmp(projGUID,cstGUID);
  UPDATE  rpt_index_base SET  follow_customer_sum =0 WHERE create_time<= v_date;
  UPDATE rpt_index_base  f ,(
		SELECT c.projGUID ,COUNT(DISTINCT c.cstGUID) follow_customer_sum  FROM  rpt_cst_opp_mid_tmp c   
	LEFT JOIN  	  report_cst_deal_mid_own_02_tmp   d
	ON  c.projGUID=d.projGUID AND c.cstGUID=d.cstGUID 
	WHERE d.cstGUID  IS NULL  GROUP BY c.projGUID
  ) e 
  SET  f.follow_customer_sum=e.follow_customer_sum
  WHERE    f.proj_guid=e.ProjGUID ;
 
 /* 对认筹套数，认筹客户，认筹金额全量清0重新运算，主要用于退认，退订的情况*/
  UPDATE  rpt_index_base SET  confess_customer_sum =0 ,confess_cycle_sum=0,confess_amount_sum=0 WHERE create_time<= v_date;
  /*认筹客户数*/
 
  UPDATE rpt_index_base  e,(SELECT  ProjGUID,bgnDate,COUNT(DISTINCT cstGUID) AS confess_customer_sum FROM 
    ( SELECT projGUID,cstGUID,MIN(bgnDate)  bgnDate FROM rpt_book_cst_mid  WHERE  bgnDate<=v_date GROUP BY projGUID,cstGUID    
      ) a GROUP BY   ProjGUID,bgnDate   ) d
    SET e.confess_customer_sum=d.confess_customer_sum  
  WHERE e.proj_guid=d.ProjGUID AND create_time=bgnDate;
 
  /*认筹套数 认筹金额 */
  UPDATE rpt_index_base  a,(
      SELECT ProjGUID,bgnDate, COUNT(*) confess_cycle_sum,SUM(Total) confess_amount_sum  FROM t_booking 
             WHERE     ( closeYy='转小订' OR closeYy='转签约' OR closeYy='转认购' OR STATUS='待处理' 	OR STATUS='排号' )
			GROUP BY ProjGUID,bgnDate
  )  b 
    SET a.confess_cycle_sum=b.confess_cycle_sum ,a.confess_amount_sum=b.confess_amount_sum  
  WHERE a.proj_guid=b.ProjGUID AND  create_time=bgnDate ;
  
 
  
 /* 对认购客户数，认购客户，认购金额全量清0重新运算，主要用于退认，退订的情况*/
  UPDATE  rpt_index_base SET  subscribe_customer_sum =0 ,subscribe_cycle_sum=0,subscribe_amount_sum=0 WHERE create_time<= v_date;
 
  DROP TABLE IF EXISTS `rpt_order_day_mid_tmp`;
  CREATE TABLE rpt_order_day_mid_tmp AS 
  SELECT  ProjGUID,qsDate,COUNT(DISTINCT cstGUID) AS subscribe_customer_sum    FROM 
         ( SELECT projGUID,cstGUID,MIN(qsDate)  qsDate   FROM rpt_order_cst_mid  WHERE  NOT( proj_house_type ='商铺' OR proj_house_type ='车位'   )  
           AND qsDate<=v_date GROUP BY projGUID,cstGUID    
           ) a GROUP BY   ProjGUID,qsDate   ;
  UPDATE rpt_index_base e,(SELECT ProjGUID,SUM(subscribe_customer_sum) subscribe_customer_sum ,qsDate FROM  rpt_order_day_mid_tmp GROUP BY ProjGUID,qsDate)     d 
    SET e.subscribe_customer_sum=d.subscribe_customer_sum  
  WHERE e.proj_guid=d.ProjGUID AND create_time=qsDate;
 
 
  /*认购套数  认购金额  */
  UPDATE rpt_index_base a,(SELECT ProjGUID,COUNT( * ) AS  subscribe_cycle_sum, SUM(roomTotal) AS  subscribe_amount_sum ,qsDate  
    FROM ( 
     SELECT ProjGUID,roomGUID,MIN(roomTotal) roomTotal,proj_house_type,qsDate FROM rpt_order_cst_mid 
    WHERE  NOT( proj_house_type ='商铺' OR proj_house_type ='车位'   )  AND qsDate<=v_date  
       GROUP BY  ProjGUID,roomGUID,proj_house_type,qsDate )d 
      GROUP BY ProjGUID ,qsDate  ) b
      SET  a.subscribe_cycle_sum=b.subscribe_cycle_sum ,  a.subscribe_amount_sum=b.subscribe_amount_sum  
  WHERE a.proj_guid=b.ProjGUID AND  create_time=qsDate  ;
 
 
 /*签约客户数    */
  UPDATE  rpt_index_base SET  contract_customer_sum =0 ,contract_cycle_sum=0,contract_amount_sum=0 WHERE create_time<= v_date;
 
 
  UPDATE rpt_index_base  e,(   
     SELECT a.ProjGUID,deal_date,COUNT(DISTINCT a.cstGUID) AS contract_customer_sum FROM 
       (  SELECT ProjGUID,MIN(deal_date) deal_date,cstGUID FROM  report_cst_deal_mid_own_02  WHERE NOT( proj_house_type ='商铺' OR proj_house_type ='车位')  GROUP BY ProjGUID,cstGUID    
        )   a  
       GROUP BY ProjGUID,deal_date  
   ) d
      SET e.contract_customer_sum=d.contract_customer_sum   
  WHERE e.proj_guid=d.ProjGUID  AND  create_time=deal_date  ;
  /*签约套数  /*  签约金额  */  
  UPDATE rpt_index_base a,(  SELECT ProjGUID,deal_date, COUNT(*) AS contract_cycle_sum,SUM(sale_amount) AS contract_amount_sum
                        FROM report_cst_deal_mid_bak2   WHERE  deal_date<=v_date  AND NOT( proj_house_type ='商铺' OR proj_house_type ='车位')   GROUP BY ProjGUID ,deal_date ) b
      SET a.contract_cycle_sum=b.contract_cycle_sum  ,a.contract_amount_sum=b.contract_amount_sum  
  WHERE a.proj_guid=b.ProjGUID  AND a.create_time=b.deal_date;
 
 
 
 /*  回款客户数 ,回款套数    
  UPDATE rpt_index_base  a,(
    select projGUID,count(*) AS returned_cycle_sum,sum(a.RmbAmount) returned_amount_sum  from t_getin a ,report_cst_deal_mid_bak2 b where a.SaleGUID=b.TradeGUID
			group by projGUID
   ) b
   SET a.returned_customer_sum=b.returned_cycle_sum  ,a.returned_cycle_sum=b.returned_cycle_sum ,a.returned_amount_sum=b.returned_amount_sum
  WHERE a.proj_guid=b.ProjGUID  ;
  */
  
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_rpt_index_flow` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_rpt_index_flow` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_rpt_index_flow`(IN p_totaldate VARCHAR(10))
BEGIN
  
  DECLARE v_date DATE; 
  DECLARE  v_projNum INT;
  DECLARE  v_visit_days BIGINT;
  DECLARE  v_contract_num INT;
  DECLARE  v_order_num INT;
  DECLARE  v_confess_days  INT;
 
 
  
  IF  p_totaldate ='AUTO' THEN
		  SET v_date =DATE_FORMAT (CURDATE()-1 ,'%Y-%m-%d');
  ELSE
		 SET	v_date =p_totaldate;
  END IF;
    
  
   
  DELETE FROM rpt_index_flow  ;
  INSERT INTO rpt_index_flow(proj_guid,index_format_type,visit_days,average_baseline_days,overstep_days,
            confess_days,createtime,confess_overstep_days, projSaleStatus)  
  SELECT   projGUID,'销售',0,0,0,0, v_date,0,projSaleStatus FROM  b_proj WHERE          projSaleStatus='在售' OR projSaleStatus='售完'  ;
 
  
  /*到访天数 	 closeReason='转签约' or status='激活'  */
 
  /*到访-认购时间*/
  UPDATE rpt_index_flow g,(
		 SELECT d.projGUID,SUM(DATEDIFF(e.qSDate,d.firstVistTime)  ) AS visit_days ,COUNT(*) order_num  FROM 
		     rpt_order_cst_fisrt_mid  e, rpt_cst_opp_first_mid   d ,rpt_index_flow f
	   WHERE d.projGUID=e.projGUID AND d.cstGUID=e.cstGUID AND d.projGUID=f.proj_guid AND projSaleStatus='在售'  GROUP BY  d.projGUID 
	 )f
  SET g.visit_days=FLOOR(ABS(f.visit_days)/f.order_num) 
  WHERE g.proj_guid=f.projGUID ;
  /*超出天数，平均基线*/
  SELECT COUNT(*) ,SUM(visit_days)  INTO v_projNum ,  v_visit_days  FROM   rpt_index_flow WHERE projSaleStatus='在售';
	UPDATE rpt_index_flow  a SET  a.average_baseline_days= FLOOR(v_visit_days / v_projNum),  
   a.overstep_days=ABS(a.visit_days -FLOOR(v_visit_days / v_projNum)) ;
 
  SELECT COUNT(*) INTO v_contract_num  FROM report_cst_deal_mid_bak2;
 
  /*认购日期 -项目认购时间*/
	UPDATE rpt_index_flow a,( 
		 SELECT a.projGUID,ABS(SUM(DATEDIFF(qSDate,b.deal_date) ) )AS  confess_days,COUNT(*)   order_num  FROM
    (SELECT  projGUID,MIN(qsDate) qsDate,roomGUID   FROM rpt_order_cst_mid WHERE  NOT( proj_house_type='商铺' OR  proj_house_type='车位') GROUP BY projGUID,roomGUID  )   a
		  , report_cst_deal_mid_bak2  b ,rpt_index_flow c  WHERE  a.roomGUID=b.roomGUID  	AND a.projGUID=c.proj_guid	AND projSaleStatus='在售' 
     GROUP BY  a.projGUID
	) b SET a.confess_days =FLOOR( b.confess_days/order_num)
  WHERE   a.proj_guid=b.projGUID ;
  /*认购－签约(基线)*/
   
  SELECT COUNT(*) ,SUM(confess_days)  INTO v_projNum ,  v_confess_days  FROM   rpt_index_flow  WHERE projSaleStatus='在售';
	UPDATE rpt_index_flow  a SET  a.average_order_baseline_days= FLOOR(v_confess_days / v_projNum) ,  
       a.confess_overstep_days=ABS(a.confess_days -FLOOR(v_confess_days / v_projNum))   WHERE projSaleStatus='在售'; 
  
    /* 更改项目所属的公司 区域,城市编号 */
    UPDATE  rpt_index_flow a, v_proj_area_city_name_new  b 
    SET a.big_code=b.big_code, a.city_Code=b.city_Code    WHERE a.proj_guid=b.projguid ;
  
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_rpt_kf_format_index` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_rpt_kf_format_index` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_rpt_kf_format_index`(IN p_totaldate VARCHAR(10))
BEGIN
	 
  DECLARE v_date DATE;
  DECLARE v_Num INT; 
  IF  p_totaldate ='AUTO' THEN
		  SET v_date =DATE_FORMAT (CURDATE()-1 ,'%Y-%m-%d');
  ELSE
		 SET	v_date =p_totaldate;
  END IF;
  /*统计项目的成交套数，金额SET v_date =DATE_FORMAT (curdate() -1,'%Y-%m-%d');*/
   
  DELETE FROM rpt_kf_format_index WHERE createTime=v_date;
  INSERT INTO rpt_kf_format_index(proj_guid,devel_member_num,cst_num,repair_satisfy_num,repair_num,complain_satisfy_num,complain_num,createTime)
  SELECT   projGUID,0,0,0,0,0,0, v_date   FROM  b_proj WHERE    projSaleStatus='在售' OR projSaleStatus='售完';
 
  /* 会员数*/
	UPDATE rpt_kf_format_index a,( 
				SELECT projGUID,COUNT(DISTINCT a.cstGUID) devel_member_num FROM report_cst_deal_mid_own_02 a, cst_member b WHERE a.cstGUID=b.cstGUID
            AND  NOT( proj_house_type ='商铺' OR proj_house_type ='车位') AND joinDate<= v_date
			  GROUP BY projGUID 
	) b
  SET  a.devel_member_num=b.devel_member_num
  WHERE a.proj_guid=b.projGUID ;
  /* 业主数 */
	UPDATE rpt_kf_format_index a,( 
				SELECT projGUID,COUNT(DISTINCT cstGUID) cst_num FROM report_cst_deal_mid_own_02 a WHERE NOT( proj_house_type ='商铺' OR proj_house_type ='车位'   )
			   AND  deal_date <= v_date  GROUP BY projGUID 
	) b
  SET  a.cst_num=b.cst_num
  WHERE a.proj_guid=b.projGUID ;
  
 
  /*  报修数	Repair_num */
  UPDATE rpt_kf_format_index c,( SELECT ProjGUID ,COUNT(*) AS   repair_num  FROM k_Receive  WHERE ReceiveDate<=v_date AND ReceiveType='维修' GROUP BY projGUID  )d  
    SET c.repair_num = d.repair_num  
  WHERE c.proj_guid=d.projGUID AND createTime=v_date; 
  /* 报修满意数	Repair_satisfy_Num	i */ 
  
  /* 投诉数	complain_num */
  UPDATE rpt_kf_format_index c,( SELECT ProjGUID ,COUNT(*) AS complain_num
     FROM k_Receive WHERE   (ReceiveType='投诉' OR ReceiveType='投诉/咨询')  AND ReceiveDate<=v_date GROUP BY projGUID  )d  
     SET c.complain_num = d.complain_num 
  WHERE c.proj_guid=d.projGUID AND createTime=v_date; 
 
  /*投诉满意数	complain_satisfy_Num */
  
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_rpt_kf_index_flow` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_rpt_kf_index_flow` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_rpt_kf_index_flow`(IN p_totaldate VARCHAR(10))
BEGIN
	 
  DECLARE v_date DATE;
  DECLARE v_Num INT; 
  DECLARE v_repair_days INT;
  DECLARE v_payment_days INT;
  DECLARE v_complaint_days INT;
  IF  p_totaldate ='AUTO' THEN
		  SET v_date =DATE_FORMAT (CURDATE()-1 ,'%Y-%m-%d');
  ELSE
		 SET	v_date =p_totaldate;
  END IF;
  /*统计项目的成交套数，金额*/
 
  DELETE FROM rpt_kf_index_flow WHERE createTime=v_date;
  INSERT INTO rpt_kf_index_flow(proj_guid,index_format_type,repair_days,repair_average_days,repair_overstep_days,
                           complaint_days,complaint_average_days,complaint_overstep_days, payment_days,payment_average_days,payment_overstep_days,createtime)
  SELECT   projGUID,'客服',0,0,0,0,0,0,0,0,0, v_date   FROM  b_proj WHERE    projSaleStatus='在售' OR projSaleStatus='售完';
 
 
  /*任务受理(开始)－任务完成(结束)  受理日期到任务完成日期  */
  UPDATE rpt_kf_index_flow a ,( 
		SELECT  a.projGUID, SUM(ABS(DATEDIFF(SlDate,RwwcSj)))/COUNT(*) repair_days  FROM k_Task a, k_Work b 
      WHERE a.TaskGUID=b.taskGUID  AND RwwcSj <  DATE_ADD(v_date,INTERVAL 1 DAY)       ) b 
		SET a.repair_days=b.repair_days 
		WHERE a.proj_guid=b.projGUID AND createtime=v_date;
 
  SELECT COUNT(*), SUM(repair_days) INTO  v_Num ,v_repair_days FROM rpt_kf_index_flow WHERE createTime=v_date;
   /*任务受理-任务完成(基线) ,任务完成时间超出基线天数 */ 
  UPDATE  rpt_kf_index_flow SET repair_average_days= FLOOR( v_repair_days/v_Num),repair_overstep_days= ABS(repair_days- FLOOR( v_repair_days/v_Num))
  WHERE  createtime=v_date;
  /*任务受理(开始)－任务完成(结束)  维修任务的受理日期到答复客 */
  UPDATE rpt_kf_index_flow a ,( 
		SELECT  a.projGUID, SUM(ABS(DATEDIFF(SlDate,DfkhSj)))/COUNT(*) payment_days FROM k_Task a, k_Work b WHERE a.TaskGUID=b.taskGUID   
         AND SlDate<  DATE_ADD(v_date,INTERVAL 1 DAY)   ) b 
		SET a.payment_days=b.payment_days 
		WHERE a.proj_guid=b.projGUID AND createtime=v_date;
  SELECT COUNT(*), SUM(payment_days) INTO  v_Num ,v_payment_days FROM rpt_kf_index_flow  WHERE createTime=v_date;
  UPDATE  rpt_kf_index_flow SET payment_average_days= FLOOR( v_payment_days/v_Num),payment_overstep_days= ABS(repair_days- FLOOR( v_payment_days/v_Num))
   WHERE  createtime=v_date;
 
  /*任务受理(开始)－任务完成(结束)  任务处理日期到任务完成日期 */
 
  UPDATE rpt_kf_index_flow a ,( 
		SELECT  a.projGUID, SUM(ABS(DATEDIFF(BdsxDate,RwwcSj)))/COUNT(*) complaint_days   FROM k_Task a, k_Work b WHERE a.TaskGUID=b.taskGUID
    AND RwwcSj<  DATE_ADD(v_date,INTERVAL 1 DAY) 
) b 
		SET a.complaint_days=b.complaint_days 
		WHERE a.proj_guid=b.projGUID AND createtime=v_date;
  SELECT COUNT(*), SUM(complaint_days) INTO  v_Num ,v_complaint_days  FROM rpt_kf_index_flow WHERE createTime=v_date;
  UPDATE  rpt_kf_index_flow SET complaint_average_days= FLOOR( v_complaint_days/v_Num),
                               complaint_overstep_days=ABS(complaint_days- FLOOR( v_complaint_days/v_Num))
  WHERE  createtime=v_date;
  
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_rpt_kf_key_index` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_rpt_kf_key_index` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_rpt_kf_key_index`(IN p_totaldate VARCHAR(10))
BEGIN
	 
  DECLARE v_date DATE;
  DECLARE v_Num INT; 
  IF  p_totaldate ='AUTO' THEN
		  SET v_date =DATE_FORMAT (CURDATE()-1 ,'%Y-%m-%d');
  ELSE
		 SET	v_date =p_totaldate;
  END IF;
  /*统计项目 SET v_date =DATE_FORMAT (curdate() -1,'%Y-%m-%d'); */
  
  DELETE FROM rpt_kf_key_index WHERE createTime=v_date;
  INSERT INTO rpt_kf_key_index(proj_id,curr_member_num,add_member_num,exit_member_num,reception_record_num,pay_reception_num,visit_reception_num,
				tele_reception_num,repair_apply_num,guar_handle_num,guar_finished_num,repair_hs,complaint_num,createTime,visit_num)
  SELECT   projGUID,0,0,0,0,0,0,0,0  ,0,0,0,0,v_date,0   FROM  b_proj WHERE    projSaleStatus='在售' OR projSaleStatus='售完';
 
 /* 总会员*/
 
  UPDATE rpt_kf_key_index c,(SELECT  projGUID,COUNT(DISTINCT b.cstGUID) curr_member_num FROM cst_member a 
      LEFT JOIN report_cst_deal_mid_own_02 b ON a.cstGUID=b.cstGUID  WHERE a.joinDate<=v_date    GROUP BY projGUID  )d 
    SET c.curr_member_num = d.curr_member_num  
  WHERE c.proj_id=d.projGUID ;
 
 /* 当天新增会员*/
 
  UPDATE rpt_kf_key_index c,(SELECT  projGUID,COUNT(DISTINCT b.cstGUID) add_member_num FROM cst_member a 
      LEFT JOIN report_cst_deal_mid_own_02 b ON a.cstGUID=b.cstGUID  WHERE joinDate=v_date GROUP BY projGUID  )d  
    SET c.add_member_num = d.add_member_num  
  WHERE c.proj_id=d.projGUID AND createTime=v_date;
  
 
  /*接待记录数	reception_record_num */
   
  UPDATE rpt_kf_key_index c,( SELECT ProjGUID ,COUNT(*) AS reception_record_num FROM k_Receive 
   WHERE receivedate   BETWEEN v_date AND  CONCAT(v_date,' 23:59:59')    GROUP BY projGUID  )d  
    SET c.reception_record_num = d.reception_record_num  
  WHERE c.proj_id=d.projGUID AND createTime=v_date; 
  /*交付接待数	pay_reception_num*/
  UPDATE rpt_kf_key_index c,( SELECT ProjGUID ,COUNT(*) AS pay_reception_num FROM k_Task 
                                  WHERE  TaskSource='正式交付' AND CreateOn    BETWEEN v_date AND  CONCAT(v_date,' 23:59:59')      GROUP BY projGUID  )d  
    SET c.pay_reception_num = d.pay_reception_num  
  WHERE c.proj_id=d.projGUID AND createTime=v_date; 
  /*来访接待数	visit_reception_num*/
  UPDATE rpt_kf_key_index c,( SELECT ProjGUID ,COUNT(*) AS visit_reception_num FROM k_Receive  
                                  WHERE  receiveSource='来访' AND receivedate BETWEEN v_date AND  CONCAT(v_date,' 23:59:59')      GROUP BY projGUID  )d  
    SET c.visit_reception_num = d.visit_reception_num  
  WHERE c.proj_id=d.projGUID AND createTime=v_date; 
 /*来电接待数	tele_reception_num*/
 
  UPDATE rpt_kf_key_index c,( SELECT ProjGUID ,COUNT(*) AS tele_reception_num FROM k_Receive  
                                  WHERE  receiveSource='来电' AND receivedate  BETWEEN v_date AND  CONCAT(v_date,' 23:59:59')      GROUP BY projGUID  )d  
    SET c.tele_reception_num = d.tele_reception_num  
  WHERE c.proj_id=d.projGUID AND createTime=v_date; 
 /*报修申报数	repair_apply_fee*/
 
  UPDATE rpt_kf_key_index c,( SELECT ProjGUID ,COUNT(*) AS repair_apply_num FROM k_Receive  
                                  WHERE  receiveType='维修' AND receivedate  BETWEEN v_date AND  CONCAT(v_date,' 23:59:59')      GROUP BY projGUID  )d  
    SET c.repair_apply_num = d.repair_apply_num  
  WHERE c.proj_id=d.projGUID AND createTime=v_date; 

 /* 报修处理数*/ 
  UPDATE rpt_kf_key_index c,( SELECT b.ProjGUID ,COUNT(*) AS guar_handle_num FROM k_Receive a,k_Task b   
                                  WHERE    a.ReceiveGUID=b.ReceiveGUID and a.receiveType='维修'  AND SlDate  BETWEEN v_date AND  CONCAT(v_date,' 23:59:59')      GROUP BY projGUID  )d  
    SET c.guar_handle_num = d.guar_handle_num  
  WHERE c.proj_id=d.projGUID AND createTime=v_date; 
  /* 报修完成数	guar_finished_num*/
 
   UPDATE rpt_kf_key_index c,( SELECT a.ProjGUID ,COUNT(*) AS guar_finished_num FROM k_Receive a,k_Task b 
                                  WHERE  a.receiveType='维修' AND b.RwwcSj   BETWEEN v_date AND  CONCAT(v_date,' 23:59:59')    AND a.ReceiveGUID=b.ReceiveGUID
     GROUP BY projGUID  )d  
    SET c.guar_finished_num = d.guar_finished_num  
    WHERE c.proj_id=d.projGUID AND createTime=v_date; 
   /* 报修总户数	repair_hs*/
  
   UPDATE rpt_kf_key_index c,( SELECT ProjGUID ,COUNT(DISTINCT RoomGUID) AS repair_hs FROM k_Receive  
                                  WHERE  receiveType='维修' AND receivedate< DATE_ADD(v_date,INTERVAL 1 DAY)     GROUP BY projGUID  )d  
    SET c.repair_hs = d.repair_hs  
  WHERE c.proj_id=d.projGUID  ;
  /*投诉单数	Complaint_num  */
  UPDATE rpt_kf_key_index c,( SELECT ProjGUID ,COUNT(*) AS complaint_num 
     FROM k_Receive WHERE   (ReceiveType='投诉' OR ReceiveType='投诉/咨询')  AND receivedate BETWEEN v_date AND  CONCAT(v_date,' 23:59:59')     GROUP BY projGUID  )d  
     SET c.complaint_num = d.complaint_num   
  WHERE c.proj_id=d.projGUID AND createTime=v_date; 
 
  /*  回访人数 */
  UPDATE rpt_kf_key_index c,( SELECT ProjGUID ,COUNT(*) AS visit_num   FROM k_Task 
             WHERE clstatus='已回访' AND RwclSx BETWEEN v_date AND  CONCAT(v_date,' 23:59:59')     GROUP BY projGUID  )d  
    SET c.visit_num = d.visit_num  
  WHERE c.proj_id=d.projGUID AND createTime=v_date; 
  
  
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_rpt_owner_feat_analyse` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_rpt_owner_feat_analyse` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_rpt_owner_feat_analyse`(IN p_totaldate VARCHAR(10))
BEGIN
  DECLARE v_date DATE;
  DECLARE v_deldate DATE;
 
  IF  p_totaldate ='AUTO' THEN
		  SET v_date =DATE_FORMAT (CURDATE()-1 ,'%Y-%m-%d');
  ELSE
		 SET	v_date =p_totaldate;
  END IF;
  SET v_deldate  = DATE_ADD(v_date,INTERVAL  -31 DAY );
  /*统计项目的成交套数，金额SET v_date =DATE_FORMAT (curdate() -1,'%Y-%m-%d');*/   
  DELETE FROM rpt_owner_feature_analyse WHERE createtime=v_date OR createtime<v_deldate;
  DELETE FROM rpt_owner_buynum_analyse;
 
	
  INSERT INTO rpt_owner_feature_analyse( Owner_type, Owner_num, sex	, 	cstCurYl	, live_area, 	createtime,  city_code,city_name,product_type,big_name,big_code)
  SELECT 
		( CASE WHEN ((SYSDATE() > t.deal_date) AND (SYSDATE() < t.jFDate)) THEN '准业主' 
		WHEN (((SYSDATE() - t.jFDate) >= 0)  AND (SYSDATE() < (t.jFDate+ INTERVAL 1 YEAR))) THEN '磨合期业主' 
		WHEN ((SYSDATE() >= (t.jFDate + INTERVAL 1 YEAR)) AND (SYSDATE() < (t.jFDate + INTERVAL 5 YEAR))) THEN '稳定期业主'
		WHEN (SYSDATE() >= (t.jFDate + INTERVAL 5 YEAR)) THEN '老业主' ELSE '未知' END) AS  ctype,
		COUNT(*),		sex	, 	cstCurYl	, live_area,v_date,  city_code,city_name,product_type,big_name,big_code
		FROM report_cst_deal_mid_own  t WHERE cstType=1 AND  NOT (proj_house_type='商铺' OR  proj_house_type='车库')
	GROUP BY ctype,sex,cstCurYl,live_area,city_code,city_name,product_type,big_name,big_code;
 
  UPDATE rpt_owner_feature_analyse a,  b_org b SET a.dimension=b.subtype ,a.path=b.path WHERE a.city_code=b.orgGUID AND a.createtime=v_date;
  
	INSERT INTO  rpt_owner_buynum_analyse(Owner_type,buy_num,Owner_num,createtime ,DIMENSION)
	SELECT ctype1,buyNum1,COUNT(*),v_date,1 FROM (
	SELECT 
     (  CASE WHEN ctype=1 THEN '准业主' 
	     	WHEN ctype=2 THEN '磨合期业主' 
	    	WHEN ctype=3  THEN '稳定期业主'
		    WHEN ctype=4   THEN '老业主' ELSE '未知' END) AS  ctype1,
				CASE WHEN buyNum=1 THEN '1次' 
        WHEN buyNum=2 THEN '2次'
        WHEN buyNum>2 THEN '2次以上' END   AS buyNum1  FROM (
					SELECT MAX(ctype) ctype, cstGUID ,COUNT(*) buyNum FROM (
						SELECT (CASE WHEN ((SYSDATE() > t.deal_date) AND (SYSDATE() < t.jFDate)) THEN '1' 
							WHEN (((SYSDATE() - t.jFDate) >= 0)  AND (SYSDATE() < (t.jFDate+ INTERVAL 1 YEAR))) THEN '2' 
							WHEN ((SYSDATE() >= (t.jFDate + INTERVAL 1 YEAR)) AND (SYSDATE() < (t.jFDate + INTERVAL 5 YEAR))) THEN '3'
							WHEN (SYSDATE() >= (t.jFDate + INTERVAL 5 YEAR)) THEN '4' ELSE '0' END) AS ctype, t.cstGUID
 
							FROM    report_cst_deal_mid_own t WHERE cstType=1 AND  NOT (proj_house_type='商铺' OR  proj_house_type='车库')
				   ) a  GROUP BY cstGUID
			) b 
	) c 
	GROUP BY  ctype1,buyNum1;
 
	INSERT INTO  rpt_owner_buynum_analyse(Owner_type,buy_num,Owner_num,createtime,city_code)
	SELECT ctype1,buyNum1,COUNT(*),v_date, big_code FROM (
	SELECT 
     (  CASE WHEN ctype=1 THEN '准业主' 
	     	WHEN ctype=2 THEN '磨合期业主' 
	    	WHEN ctype=3  THEN '稳定期业主'
		    WHEN ctype=4   THEN '老业主' ELSE '未知' END) AS  ctype1,
				CASE WHEN buyNum=1 THEN '1次' 
        WHEN buyNum=2 THEN '2次'
        WHEN buyNum>2 THEN '2次以上' END   AS buyNum1  ,big_code FROM (
					SELECT MAX(ctype) ctype, cstGUID ,COUNT(*) buyNum , big_code  FROM (
						SELECT big_code, (CASE WHEN ((SYSDATE() > t.deal_date) AND (SYSDATE() < t.jFDate)) THEN '1' 
							WHEN (((SYSDATE() - t.jFDate) >= 0)  AND (SYSDATE() < (t.jFDate+ INTERVAL 1 YEAR))) THEN '2' 
							WHEN ((SYSDATE() >= (t.jFDate + INTERVAL 1 YEAR)) AND (SYSDATE() < (t.jFDate + INTERVAL 5 YEAR))) THEN '3'
							WHEN (SYSDATE() >= (t.jFDate + INTERVAL 5 YEAR)) THEN '4' ELSE '0' END) AS ctype, t.cstGUID
 
							FROM    report_cst_deal_mid_own t WHERE cstType=1 AND  NOT (proj_house_type='商铺' OR  proj_house_type='车库')
				   ) a  GROUP BY cstGUID,big_code
			) b 
	) c 
	GROUP BY  big_code, ctype1,buyNum1;
	INSERT INTO  rpt_owner_buynum_analyse(Owner_type,buy_num,Owner_num,createtime,city_code)
	SELECT ctype1,buyNum1,COUNT(*),v_date, city_code FROM (
	SELECT 
     (  CASE WHEN ctype=1 THEN '准业主' 
	     	WHEN ctype=2 THEN '磨合期业主' 
	    	WHEN ctype=3  THEN '稳定期业主'
		    WHEN ctype=4   THEN '老业主' ELSE '未知' END) AS  ctype1,
				CASE WHEN buyNum=1 THEN '1次' 
        WHEN buyNum=2 THEN '2次'
        WHEN buyNum>2 THEN '2次以上' END   AS buyNum1 ,city_code FROM (
					SELECT MAX(ctype) ctype, cstGUID ,COUNT(*) buyNum , city_code  FROM (
						SELECT city_code, (CASE WHEN ((SYSDATE() > t.deal_date) AND (SYSDATE() < t.jFDate)) THEN '1' 
							WHEN (((SYSDATE() - t.jFDate) >= 0)  AND (SYSDATE() < (t.jFDate+ INTERVAL 1 YEAR))) THEN '2' 
							WHEN ((SYSDATE() >= (t.jFDate + INTERVAL 1 YEAR)) AND (SYSDATE() < (t.jFDate + INTERVAL 5 YEAR))) THEN '3'
							WHEN (SYSDATE() >= (t.jFDate + INTERVAL 5 YEAR)) THEN '4' ELSE '0' END) AS ctype, t.cstGUID
 
							FROM    report_cst_deal_mid_own t WHERE cstType=1 AND  NOT (proj_house_type='商铺' OR  proj_house_type='车库')
				   ) a  GROUP BY cstGUID,city_code
			) b 
	) c 
	GROUP BY  city_code, ctype1,buyNum1;
  UPDATE rpt_owner_buynum_analyse a,  b_org b SET a.dimension=b.subtype,a.path=b.path WHERE a.city_code=b.orgGUID AND a.createtime=v_date;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_rpt_proj_cst_industry` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_rpt_proj_cst_industry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_rpt_proj_cst_industry`(IN p_totaldate VARCHAR(10))
BEGIN 
  DECLARE v_date DATE;
  DECLARE v_cudate DATE;
  DECLARE v_sql VARCHAR(4000);     
  IF  p_totaldate ='AUTO' THEN
		  SET v_date =DATE_FORMAT (CURDATE() -1,'%Y-%m-%d');
  ELSE
		 SET	v_date =p_totaldate;
  END IF;
  
  DELETE FROM rpt_proj_cst_industry  WHERE create_time=v_date ;    
  INSERT INTO  rpt_proj_cst_industry(proj_id,industry_id,cst_num ,create_time )
   SELECT a.projGUID,IFNULL(a.cstIndustry,'未知'),COUNT(DISTINCT a.cstGUID) ,DATE_FORMAT ( v_date,'%Y-%m-%d')   FROM report_cst_deal_mid_own a , t_contract b
   WHERE a.roomGUID=b.roomGUID AND b.`status`='激活'   AND qSDate<=v_date
   GROUP BY a.projGUID,   a.cstIndustry;
 
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_rpt_proj_cst_origin` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_rpt_proj_cst_origin` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_rpt_proj_cst_origin`(IN p_totaldate VARCHAR(10))
BEGIN 
  DECLARE v_date DATE;
  DECLARE v_cudate DATE;
  DECLARE v_sql VARCHAR(4000);     
  IF  p_totaldate ='AUTO' THEN
		  SET v_date =DATE_FORMAT (CURDATE() -1,'%Y-%m-%d');
  ELSE
		 SET	v_date =p_totaldate;
  END IF;
  
   
  DELETE FROM  rpt_proj_cst_area WHERE create_time=v_date ; 
  INSERT INTO  rpt_proj_cst_area(proj_id,area_id,cst_num ,create_time)
  SELECT a.projGUID,IFNULL(a.cstOriginPlace,'未知'),COUNT(DISTINCT a.cstGUID) ,DATE_FORMAT ( v_date,'%Y-%m-%d')  FROM report_cst_deal_mid_own  a, t_contract b
   WHERE a.roomGUID=b.roomGUID AND b.`status`='激活'  AND   qSDate<=v_date
  GROUP BY a.projGUID,a.cstOriginPlace;
 
  UPDATE rpt_proj_cst_area a,v_proj_area_city_name_new b  SET  a.area_id='本地' 
    WHERE a.proj_id=b.projGUID AND a.area_id   LIKE CONCAT('%',SUBSTR(b.city_name,1,2) ,'%') ;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_rpt_zy_key_index` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_rpt_zy_key_index` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_rpt_zy_key_index`(in p_totaldate varchar(10))
BEGIN
	 
  DECLARE v_date date;
  DECLARE v_Num int; 
  DECLARE v_Num1 INT;
  IF  p_totaldate ='AUTO' THEN
		  SET v_date =DATE_FORMAT (curdate()-1 ,'%Y-%m-%d');
  ELSE
		 SET	v_date =p_totaldate;
  END IF;
  /*统计项目 SET v_date =DATE_FORMAT (curdate() -1,'%Y-%m-%d'); */ 
  DELETE FROM rpt_zy_key_index WHERE create_time=v_date;
  INSERT INTO rpt_zy_key_index(proj_id,add_lease_cst,add_Sale_cst,add_lease_house,add_sale_house,
					lease_follow_num,sale_follow_num,house_lease_num,house_sale_num,lease_deal_money,sale_deal_money,create_time)
  SELECT   projGUID,0,0,0,0,0,0,0,0  ,0,0, v_date   FROM  b_proj WHERE    projSaleStatus='在售' or projSaleStatus='售完';
    
  /*  置业客户不存在争对项目
  UPDATE  rpt_zy_key_index a,( SELECT  sum(case when  fintentiontype= 'BUY'  then 1  when  fintentiontype='BUYRENT'   then 1 else 0 end) v_Num,  
				 sum(case when  fintentiontype= 'RENT' then 1  when  fintentiontype='BUYRENT'   then 1 else 0 end)  v_Num1
         	FROM   t_bk_customer  where FCreateTime BETWEEN  v_date  and   concat(DATE_FORMAT(v_date ,'%Y-%m-%d'),' 23:59:59')  ) b 
  SET add_lease_cst= v_Num,add_Sale_cst=v_num1 WHERE create_time=v_date;
  */ 
	UPDATE  rpt_zy_key_index a,( 
			SELECT FKGARDENID,sum(case when  FLISTINGTYPE= 'RENTED'  then 1  when  FLISTINGTYPE='RENT'   then 1  WHEN FLISTINGTYPE='RENT_SALE' THEN 1   else 0 end)v_Num , 
												sum(case when  FLISTINGTYPE= 'SALE'    then 1  when  FLISTINGTYPE='SOLD'   then 1  WHEN FLISTINGTYPE='RENT_SALE' THEN 1   else 0 end)     v_Num1 
			FROM zRoomlist where  FCreateTime BETWEEN  v_date  and   concat(DATE_FORMAT(v_date ,'%Y-%m-%d'),' 23:59:59')
      GROUP BY FKGARDENID
     )b   
  SET add_lease_house= v_Num,add_sale_house=v_num1 WHERE a.proj_id= CONVERT(b.FKGARDENID USING utf8) COLLATE utf8_unicode_ci      and create_time=v_date;
  /*  */  
	UPDATE  rpt_zy_key_index a,( 
		SELECT  FKGARDENID, sum(case when FSALETYPE='SALE'  then  FDEALTOTALPRICE  when FSALETYPE='AGENTSALE'  then  FDEALTOTALPRICE 
                             when FSALETYPE='ZSDC'  then  FDEALTOTALPRICE  when FSALETYPE='AGENT'  then  FDEALTOTALPRICE  else 0 end) house_lease_num,
										    sum(case when FSALETYPE='RENT'  then  FDEALTOTALPRICE    else 0 end)  house_sale_num,
												sum(case when FSALETYPE='SALE'  then  1  when FSALETYPE='AGENTSALE'  then  1 
                             when FSALETYPE='ZSDC'  then  1  when FSALETYPE='AGENT'  then  1  else 0 end)  Lease_deal_money,
										    sum(case when FSALETYPE='RENT'  then  1    else 0 end)sale_deal_money
    FROM   zDeal where FDEALTOTALPRICE>0   and FDEALDATE BETWEEN  v_date  and   concat(DATE_FORMAT(v_date ,'%Y-%m-%d'),' 23:59:59')
		GROUP by FKGARDENID 
     )b   
  SET a.house_lease_num=b.house_lease_num,a.house_sale_num=b.house_sale_num,a.lease_deal_money=b.lease_deal_money ,a.sale_deal_money=b.sale_deal_money
  WHERE a.proj_id=CONVERT(b.FKGARDENID USING utf8) COLLATE utf8_unicode_ci   and create_time=v_date;
  
 -- 	置业关键流程分析表
    
  DELETE FROM rpt_zy_index_flow  ;
  INSERT INTO rpt_zy_index_flow( proj_id,
			house_deal_day,house_deal_aveg_day,House_deal_over,
			house_rent_day,house_rent_aveg_day,House_rent_over,create_time)
  SELECT   projGUID,0,0,0,0,0,0,  v_date   FROM  b_proj WHERE    projSaleStatus='在售' or projSaleStatus='售完';
    
  UPDATE rpt_zy_index_flow a,(
     SELECT FKGARDENID, sum(case when FSALETYPE='SALE'  then  TS  when FSALETYPE='AGENTSALE'  then  TS 
                                 when FSALETYPE='ZSDC'  then  TS  when FSALETYPE='AGENT'      then  TS  else 0 end) house_deal_day,
										    sum(case when FSALETYPE='RENT'  then  TS  else 0 end)  house_rent_day  FROM (
			 SELECT a.FKGARDENID, FSALETYPE,  datediff(FDEALDATE,FCREATETIME )  TS
			 FROM zDeal a,zRoomlist b 
			 WHERE   a.FKGARDENID  =  CONVERT(b.FKGARDENID USING utf8) COLLATE utf8_unicode_ci  and a.FKROOMLISTINGID=b.FKROOMID  and FCREATETIME <FDEALDATE           
			 GROUP BY  a.FKGARDENID,FSALETYPE )c
     GROUP BY FKGARDENID
    )b 
  SET  a.house_rent_day=b.house_rent_day,a.house_deal_day=b.house_deal_day   WHERE a.proj_id=CONVERT(b.FKGARDENID USING utf8) COLLATE utf8_unicode_ci  and create_time=v_date;
   
  UPDATE rpt_zy_index_flow a,(
     SELECT  FKGARDENID, sum(case when FSALETYPE='SALE'  then  TS  when FSALETYPE='AGENTSALE'  then  TS 
                                 when FSALETYPE='ZSDC'  then  TS  when FSALETYPE='AGENT'      then  TS  else 0 end)
            /sum(case when FSALETYPE='SALE'  then  1  when FSALETYPE='AGENTSALE'  then 1 
                                 when FSALETYPE='ZSDC'  then  1  when FSALETYPE='AGENT'      then  1  else 0 end)   house_deal_aveg_day,
					  sum(case when FSALETYPE='RENT'  then  TS  else 0 end)/  sum(case when FSALETYPE='RENT'  then  1  else 0 end)   house_rent_aveg_day  FROM (
			 SELECT a.FKGARDENID, FSALETYPE,  datediff(FDEALDATE,FCREATETIME )  TS
			 FROM zDeal a,zRoomlist b 
			 WHERE  a.FKGARDENID  =  CONVERT(b.FKGARDENID USING utf8) COLLATE utf8_unicode_ci   and a.FKROOMLISTINGID=b.FKROOMID  and FCREATETIME <FDEALDATE           
			 GROUP BY  a.FKGARDENID,FSALETYPE)c     
    )b 
  SET  a.house_deal_aveg_day=b.house_deal_aveg_day,a.house_rent_aveg_day=b.house_rent_aveg_day   WHERE a.proj_id=CONVERT(b.FKGARDENID USING utf8) COLLATE utf8_unicode_ci  and create_time=v_date;
  UPDATE  rpt_zy_index_flow set  House_deal_over=house_deal_day - house_deal_aveg_day,house_rent_over=house_rent_aveg_day-house_rent_day;
  --  置业转换率分析
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_run_mid_table` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_run_mid_table` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_run_mid_table`()
BEGIN
  TRUNCATE TABLE  rpt_order_cst_mid;
	INSERT INTO  rpt_order_cst_mid(projGUID,cstGUID,qsDate,roomGUID,roomTotal,companyGUID)  
	SELECT a.projGUID,b.cstGUID ,a.qsDate,a.roomGUID,roomTotal,companyGUID  FROM t_order a,t_cst_trade b 
			WHERE a.tradeGUID=b.tradeGUID  AND ( a.closeReason='转签约' OR a.status='激活' ) ;
  
  UPDATE rpt_order_cst_mid a,report_cst_deal_mid_bak2 b SET a.proj_house_type=b.proj_house_type WHERE a.roomGUID=b.roomGUID;
  UPDATE rpt_order_cst_mid a  SET a.proj_house_type='未知' WHERE a.proj_house_type IS NULL;
  
	TRUNCATE TABLE  rpt_book_cst_mid;	 
	INSERT INTO  rpt_book_cst_mid     
	SELECT a.projGUID,b.cstGUID ,DATE_FORMAT(createdOn,'%Y-%m-%d'),companyGUID  FROM t_booking a,t_cst_booking b
		    	WHERE a.bookingGUID=b.BookingGUID AND (  closeYy='转小订' OR closeYy='转签约' OR closeYy='转认购'  OR STATUS='待处理' 	OR STATUS='排号' );
  /* 计算 总投资客户数  取出一客多房的，再对应到客户项中 */
  TRUNCATE TABLE  report_t_proj_tzk_info;
	INSERT INTO   report_t_proj_tzk_info(projGUID,cstGUID,create_time)  
	SELECT B.projGUID, B.cstGUID ,B.deal_date FROM 
		(
		SELECT   cstGUID,COUNT(*) AS dd FROM report_cst_deal_mid_own        WHERE NOT( proj_house_type ='商铺' OR proj_house_type ='车位'   ) 
			GROUP BY   cstGUID    HAVING COUNT(*) >1
		) A,
		( 
			SELECT  projGUID, cstGUID,deal_date   FROM report_cst_deal_mid_own   WHERE NOT( proj_house_type ='商铺' OR proj_house_type ='车位'   ) 
    
		) B WHERE A.cstGUID=B.cstGUID;
 
  /*选出到访人员 */
  TRUNCATE TABLE rpt_cst_opp_mid;
	INSERT INTO rpt_cst_opp_mid (projGUID,cstGUID,createTime ,firstVistTime  )
	SELECT DISTINCT a.projGUID,b.cstGUID, createTime,firstVistTime  FROM s_opp a,s_cst_opp b 
		   WHERE a.oppGUID=b.oppGUID AND  a.oppSource='来访';
  
   
   /* 认筹转认购   以下为中间表*/
	TRUNCATE TABLE rpt_order_cst_fisrt_mid;
   INSERT INTO rpt_order_cst_fisrt_mid   
	 SELECT a.projGUID,a.cstGUID,MIN(qsDate) qsDate,companyGUID  FROM rpt_order_cst_mid  a WHERE  NOT( proj_house_type='商铺' OR  proj_house_type='车位')
	 GROUP BY  a.projGUID,a.cstGUID,companyGUID;
   /* 首次倒访时间 */
	 TRUNCATE TABLE rpt_cst_opp_first_mid;
   INSERT INTO rpt_cst_opp_first_mid  (projGUID,cstGUID,createTime ,firstVistTime,isbuy )  
	 SELECT b.projGUID,cstGUID,MIN(b.firstVistTime) firstVistTime,'0' FROM rpt_cst_opp_mid    b
	 GROUP BY  b.projGUID,cstGUID;
 
 
   /*    */ 
  INSERT INTO  rpt_proj_area_city_name(projGUID,projName,companyGUID, city_code,big_code,city_name,big_name)
  SELECT  a.projGUID,a.projName, a.city_code,a.city_code,a.big_code,a.city_name,a.big_name FROM v_proj_area_city_name_new a 
  LEFT  JOIN   rpt_proj_area_city_name b  ON a.projGUID=b.projGUID 
  WHERE   b.projGUID IS NULL ;
 
 
  /* 客户首页 客户城市报表用 客户=意向客户（机会表）+已购+物业二次成交（不包租客）*/
  TRUNCATE TABLE rpt_cst_opp_mid_all;
  /* 机会表信息*/
	INSERT INTO rpt_cst_opp_mid_all (projGUID,cstGUID,createTime ,firstVistTime )
	SELECT a.projGUID,b.cstGUID, createTime,firstVistTime FROM s_opp a,s_cst_opp b 
		   WHERE a.oppGUID=b.oppGUID ;
  /*已购 客户*/
	INSERT INTO rpt_cst_opp_mid_all (projGUID,cstGUID,createTime ,firstVistTime )
  SELECT a.projGUID,a.cstGUID,NULL,NULL   FROM   report_cst_deal_mid_own  a
                 LEFT JOIN rpt_cst_opp_mid_all  b ON a. cstGUID=b.cstGUID AND a.projGUID=b.projGUID
   WHERE b.cstGUID IS NULL;
 
 /*+物业二次成交（不包租客）*/
  /* 修改数据*/
  UPDATE rpt_cst_opp_mid_all a,cst_customer_0 b  SET a.cstType=b.cstType,a.isMerge=b.isMerge,a.modifyTime=b.modifyTime WHERE a.cstGUID=b.cstGUID;
  UPDATE rpt_cst_opp_mid_all a,cst_customer_1 b  SET a.cstType=b.cstType,a.isMerge=b.isMerge,a.modifyTime=b.modifyTime WHERE a.cstGUID=b.cstGUID;
  UPDATE rpt_cst_opp_mid_all a,cst_customer_2 b  SET a.cstType=b.cstType,a.isMerge=b.isMerge,a.modifyTime=b.modifyTime WHERE a.cstGUID=b.cstGUID;
  UPDATE rpt_cst_opp_mid_all a,cst_customer_3 b  SET a.cstType=b.cstType,a.isMerge=b.isMerge,a.modifyTime=b.modifyTime WHERE a.cstGUID=b.cstGUID;
  UPDATE rpt_cst_opp_mid_all a,cst_customer_4 b  SET a.cstType=b.cstType,a.isMerge=b.isMerge,a.modifyTime=b.modifyTime WHERE a.cstGUID=b.cstGUID;
  UPDATE rpt_cst_opp_mid_all a,cst_customer_5 b  SET a.cstType=b.cstType,a.isMerge=b.isMerge,a.modifyTime=b.modifyTime WHERE a.cstGUID=b.cstGUID;
  UPDATE rpt_cst_opp_mid_all a,cst_customer_6 b  SET a.cstType=b.cstType,a.isMerge=b.isMerge,a.modifyTime=b.modifyTime WHERE a.cstGUID=b.cstGUID;
  UPDATE rpt_cst_opp_mid_all a,cst_customer_7 b  SET a.cstType=b.cstType,a.isMerge=b.isMerge,a.modifyTime=b.modifyTime WHERE a.cstGUID=b.cstGUID;
  UPDATE rpt_cst_opp_mid_all a,cst_customer_8 b  SET a.cstType=b.cstType,a.isMerge=b.isMerge,a.modifyTime=b.modifyTime WHERE a.cstGUID=b.cstGUID;
  UPDATE rpt_cst_opp_mid_all a,cst_customer_9 b  SET a.cstType=b.cstType,a.isMerge=b.isMerge,a.modifyTime=b.modifyTime WHERE a.cstGUID=b.cstGUID;
  UPDATE rpt_cst_opp_mid_all a,rpt_proj_area_city_name b  SET 
    a.area_name=b.big_name ,a.cityName=b.city_name  ,a.area_id=b.big_code,a.cityCode=b.city_code ,a.ProjName=b.ProjName,a.city_name1=b.city_name1 WHERE a.projGUID=b.projGUID;
  
       
     
  /* 将所有用户合并成一张表 */
  TRUNCATE TABLE report_cst_customer;
	INSERT INTO report_cst_customer 
  (cstGUID,cstName,gender,birthDate,cstType,cardType,cardID,mobileTel,officeTel,homeTel,sourceApp,sourceBiz,activitySource,isMerge,isMaster,contact,myGUIDList,address,createTime,modifyTime) 
	SELECT cstGUID,cstName,gender,birthDate,cstType,cardType,cardID,mobileTel,officeTel,homeTel,sourceApp,sourceBiz,activitySource,isMerge,isMaster,contact,myGUIDList,address,createTime,modifyTime
   FROM cst_customer_9;
	INSERT INTO report_cst_customer 
  (cstGUID,cstName,gender,birthDate,cstType,cardType,cardID,mobileTel,officeTel,homeTel,sourceApp,sourceBiz,activitySource,isMerge,isMaster,contact,myGUIDList,address,createTime,modifyTime) 
	SELECT cstGUID,cstName,gender,birthDate,cstType,cardType,cardID,mobileTel,officeTel,homeTel,sourceApp,sourceBiz,activitySource,isMerge,isMaster,contact,myGUIDList,address,createTime,modifyTime
   FROM cst_customer_8;
	INSERT INTO report_cst_customer 
  (cstGUID,cstName,gender,birthDate,cstType,cardType,cardID,mobileTel,officeTel,homeTel,sourceApp,sourceBiz,activitySource,isMerge,isMaster,contact,myGUIDList,address,createTime,modifyTime) 
	SELECT cstGUID,cstName,gender,birthDate,cstType,cardType,cardID,mobileTel,officeTel,homeTel,sourceApp,sourceBiz,activitySource,isMerge,isMaster,contact,myGUIDList,address,createTime,modifyTime
   FROM cst_customer_7;
	INSERT INTO report_cst_customer 
  (cstGUID,cstName,gender,birthDate,cstType,cardType,cardID,mobileTel,officeTel,homeTel,sourceApp,sourceBiz,activitySource,isMerge,isMaster,contact,myGUIDList,address,createTime,modifyTime) 
	SELECT cstGUID,cstName,gender,birthDate,cstType,cardType,cardID,mobileTel,officeTel,homeTel,sourceApp,sourceBiz,activitySource,isMerge,isMaster,contact,myGUIDList,address,createTime,modifyTime
   FROM cst_customer_6;
	INSERT INTO report_cst_customer 
  (cstGUID,cstName,gender,birthDate,cstType,cardType,cardID,mobileTel,officeTel,homeTel,sourceApp,sourceBiz,activitySource,isMerge,isMaster,contact,myGUIDList,address,createTime,modifyTime) 
	SELECT cstGUID,cstName,gender,birthDate,cstType,cardType,cardID,mobileTel,officeTel,homeTel,sourceApp,sourceBiz,activitySource,isMerge,isMaster,contact,myGUIDList,address,createTime,modifyTime
   FROM cst_customer_5;
	INSERT INTO report_cst_customer 
  (cstGUID,cstName,gender,birthDate,cstType,cardType,cardID,mobileTel,officeTel,homeTel,sourceApp,sourceBiz,activitySource,isMerge,isMaster,contact,myGUIDList,address,createTime,modifyTime) 
	SELECT cstGUID,cstName,gender,birthDate,cstType,cardType,cardID,mobileTel,officeTel,homeTel,sourceApp,sourceBiz,activitySource,isMerge,isMaster,contact,myGUIDList,address,createTime,modifyTime
   FROM cst_customer_4;
	INSERT INTO report_cst_customer 
  (cstGUID,cstName,gender,birthDate,cstType,cardType,cardID,mobileTel,officeTel,homeTel,sourceApp,sourceBiz,activitySource,isMerge,isMaster,contact,myGUIDList,address,createTime,modifyTime) 
	SELECT cstGUID,cstName,gender,birthDate,cstType,cardType,cardID,mobileTel,officeTel,homeTel,sourceApp,sourceBiz,activitySource,isMerge,isMaster,contact,myGUIDList,address,createTime,modifyTime
   FROM cst_customer_3;
	INSERT INTO report_cst_customer 
  (cstGUID,cstName,gender,birthDate,cstType,cardType,cardID,mobileTel,officeTel,homeTel,sourceApp,sourceBiz,activitySource,isMerge,isMaster,contact,myGUIDList,address,createTime,modifyTime) 
	SELECT cstGUID,cstName,gender,birthDate,cstType,cardType,cardID,mobileTel,officeTel,homeTel,sourceApp,sourceBiz,activitySource,isMerge,isMaster,contact,myGUIDList,address,createTime,modifyTime
   FROM cst_customer_2;
	INSERT INTO report_cst_customer 
  (cstGUID,cstName,gender,birthDate,cstType,cardType,cardID,mobileTel,officeTel,homeTel,sourceApp,sourceBiz,activitySource,isMerge,isMaster,contact,myGUIDList,address,createTime,modifyTime) 
	SELECT cstGUID,cstName,gender,birthDate,cstType,cardType,cardID,mobileTel,officeTel,homeTel,sourceApp,sourceBiz,activitySource,isMerge,isMaster,contact,myGUIDList,address,createTime,modifyTime
   FROM cst_customer_1;
	INSERT INTO report_cst_customer 
  (cstGUID,cstName,gender,birthDate,cstType,cardType,cardID,mobileTel,officeTel,homeTel,sourceApp,sourceBiz,activitySource,isMerge,isMaster,contact,myGUIDList,address,createTime,modifyTime) 
	SELECT cstGUID,cstName,gender,birthDate,cstType,cardType,cardID,mobileTel,officeTel,homeTel,sourceApp,sourceBiz,activitySource,isMerge,isMaster,contact,myGUIDList,address,createTime,modifyTime
   FROM cst_customer_0;

		TRUNCATE TABLE rpt_cst_attach;
   INSERT INTO rpt_cst_attach
   SELECT * FROM cst_attach_0;
   INSERT INTO rpt_cst_attach
   SELECT * FROM cst_attach_1;
   INSERT INTO rpt_cst_attach
   SELECT * FROM cst_attach_2;
   INSERT INTO rpt_cst_attach
   SELECT * FROM cst_attach_3;
   INSERT INTO rpt_cst_attach
   SELECT * FROM cst_attach_4;

   INSERT INTO rpt_cst_attach
   SELECT * FROM cst_attach_5;
   INSERT INTO rpt_cst_attach
   SELECT * FROM cst_attach_6;
   INSERT INTO rpt_cst_attach
   SELECT * FROM cst_attach_7;
   INSERT INTO rpt_cst_attach
   SELECT * FROM cst_attach_8;
   INSERT INTO rpt_cst_attach
   SELECT * FROM cst_attach_9;

  /* 更改房子的类型为车位或商铺 */
  TRUNCATE TABLE rpt_b_room;
  INSERT INTO rpt_b_room(roomID,
roomGUID,companyGUID,projGUID,bldGUID,mainRoomGUID,cstGUIDList,cstName,
unit,floor,no,room,roomCode,huXing,saleStatus,bldArea,tnArea,blRhDate,YFBZ,roomMemo,zxBz,price,tnPrice,
zxPrice,zxTotal,bedeckKind,isTempletRoom,west,chooseRoom,chooseRoomDate,roomStru,absolutelyFloor,statusChgGUID,saleRentable,productTypeCode,htRoom,dxsArea,
carArea,ltArea,fpDate,zdFpDate,cqfzNum,ysBldArea,scBldArea,scTnArea,ysTnArea,hyArea,flatArea,ytArea,
rhhyArea,ysxkzDate,ysxkzNo,cqfzGetDate,yyjfDate,isCannotSale,cannotSaleReason,chooseRoomNo,variety,
productAttribute,createdOn,parkingType,parkingCurrentHandleMethod,parkingSaleType,parkingHandleDate,isParkingCq,businessCqLife,remarkHTML,
businessManageFee,buysRoomNo,parkingPattern,chooseRoomCstGUID,productFormCode,productFormName,roomStatus,roomType,
createTime,modifyTime,sourceApp,house_address,wy_tmpID
)
  SELECT  roomID,roomGUID,companyGUID,projGUID,bldGUID,mainRoomGUID,cstGUIDList,cstName,
unit,floor,no,room,roomCode,huXing,saleStatus,bldArea,tnArea,blRhDate,YFBZ,roomMemo,zxBz,price,tnPrice,
zxPrice,zxTotal,bedeckKind,isTempletRoom,west,chooseRoom,chooseRoomDate,roomStru,absolutelyFloor,statusChgGUID,saleRentable,productTypeCode,htRoom,dxsArea,
carArea,ltArea,fpDate,zdFpDate,cqfzNum,ysBldArea,scBldArea,scTnArea,ysTnArea,hyArea,flatArea,ytArea,
rhhyArea,ysxkzDate,ysxkzNo,cqfzGetDate,yyjfDate,isCannotSale,cannotSaleReason,chooseRoomNo,variety,
productAttribute,createdOn,parkingType,parkingCurrentHandleMethod,parkingSaleType,parkingHandleDate,isParkingCq,businessCqLife,remarkHTML,
businessManageFee,buysRoomNo,parkingPattern,chooseRoomCstGUID,productFormCode,productFormName,roomStatus,roomType,
createTime,modifyTime,sourceApp,house_address,wy_tmpID FROM  b_room;
  
  UPDATE rpt_b_room a,report_basic_room_enum b SET house_type= b.attachKey WHERE 
           category =1 AND enumValue   LIKE  CONCAT('%,', SUBSTRING(a.roomStru,1,2) ,',%')   
   AND b.attachCode >='100001' AND b.attachCode <='100005' ;
  UPDATE rpt_b_room a,report_basic_room_enum b SET house_type= b.attachKey WHERE 
           category =1 AND enumValue   LIKE  CONCAT('%,',a.roomStru ,',%')   
   AND b.attachCode >='100006' AND b.attachCode <='100007'   AND  house_type IS NULL ;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_run_mid_table1` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_run_mid_table1` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_run_mid_table1`()
BEGIN
  /* 计算 总投资客户数  取出一客多房的，再对应到客户项中 */
  truncate table  report_t_proj_tzk_info;
	insert into   report_t_proj_tzk_info(projGUID,cstGUID,create_time)  
	SeLECT B.projGUID, B.cstGUID ,B.deal_date from 
		(
		select   cstGUID,COUNT(*) as dd from report_cst_deal_mid_own        where not( proj_house_type ='商铺' or proj_house_type ='车位'   ) 
			group by   cstGUID    HAVING COUNT(*) >1
		) A,
		( 
			select  projGUID, cstGUID,deal_date   from report_cst_deal_mid_own   where not( proj_house_type ='商铺' or proj_house_type ='车位'   ) 
    
		) B WHERE A.cstGUID=B.cstGUID;

END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_stand_label_count` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_stand_label_count` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_stand_label_count`()
BEGIN
  DECLARE v_lable_Code VARCHAR(20);
  DECLARE v_lable_Name VARCHAR(20); 
  DECLARE v_lable_SQL  VARCHAR(3000);
  DECLARE v_user_id    VARCHAR(64);
  DECLARE v_sql        VARCHAR(3000); 
  DECLARE v_sql1        VARCHAR(3000); 
  DECLARE v_date  		 VARCHAR(10);
  DECLARE v_Num     BIGINT;
  DECLARE v_lable_cst_num BIGINT;
 
  -- 遍历数据结束标志  
  TRUNCATE TABLE rpt_l_cst_stand_label_storage;
  
	INSERT INTO rpt_l_cst_stand_label_storage(cstguid,labeLtype,labelGUID,labelName )
  SELECT cstGUID,'区域位置','LB001',CASE WHEN `values`='广东省深圳市' THEN  '深圳工作'
                     WHEN `values`='北京市' THEN  '北京市'
                     WHEN `values`='广东省广州市' THEN  '广州市'
                     WHEN `values`='上海市' THEN  '上海市' end
                  from   rpt_cst_attach   where attachCode='cst_workarea'  
	and (`values`='广东省-深圳市'  OR `values`='北京市' or `values`='广东省广州市' and  `values`='上海市');
 
 INSERT INTO rpt_l_cst_stand_label_storage(cstguid,labeLtype,labelGUID,labelName )
 SELECT cstGUID,'区域位置','LB002','山西人'   from   rpt_cst_attach   where attachCode='cst_hometown'  	and  `values`='山西省'  ; 

 INSERT INTO rpt_l_cst_stand_label_storage(cstguid,labeLtype,labelGUID,labelName )
 SELECT cstGUID,'区域位置','LB003','福州人'  from   rpt_cst_attach   where  attachCode='cst_hometown_city'   and  `values`='福建省-福州市';
 
 INSERT INTO rpt_l_cst_stand_label_storage(cstguid,labeLtype,labelGUID,labelName )
 SELECT cstGUID,'区域位置','LB004','潮汕人 ' from   rpt_cst_attach  where attachCode='cst_hometown_city'  and (`values`='广东省-潮州市'  or  `values`='广东省-汕头市'  or `values`='广东省-揭阳市' );
 

 INSERT INTO rpt_l_cst_stand_label_storage(cstguid,labeLtype,labelGUID,labelName )
 SELECT DISTINCT cstGUID,'意向等级','LB005',`values`  from   rpt_cst_attach  where attachCode='cst_opp_intentLevel' ;
  
  
 INSERT INTO rpt_l_cst_stand_label_storage(cstguid,labeLtype,labelGUID,labelName )
	SELECT cstGUID ,'重复购买','LB006_1',   '粉丝客户'   
        from (SELECT cstGUID,count(*) num from rpt_cst_repeat_buy_detail group by cstGUID  HAVING count(*)>1 ) a where num>=2 and num<5  ;

 INSERT INTO rpt_l_cst_stand_label_storage(cstguid,labeLtype,labelGUID,labelName )
	SELECT cstGUID ,'重复购买','LB006_2',   '钻石粉丝'   
        FROM (SELECT cstGUID,count(*) num from rpt_cst_repeat_buy_detail group by cstGUID  HAVING count(*)>1 ) a where num>4 ;
 
INSERT INTO rpt_l_cst_stand_label_storage(cstguid,labeLtype,labelGUID,labelName )
  SELECT cstGUID,'客户资产','LB007_1',  '低价值' 
	FROM (
			SELECT cstGUID,count(*) num ,sum(sale_amount) sale_amount from report_cst_deal_mid_own group by cstGUID  
  )a where     num=1 and sale_amount<3000000;


INSERT INTO rpt_l_cst_stand_label_storage(cstguid,labeLtype,labelGUID,labelName )
 SELECT cstGUID,'客户资产','LB007_2',  '中价值' 
	from (
			SELECT cstGUID,count(*) num ,sum(sale_amount) sale_amount from report_cst_deal_mid_own group by cstGUID  
  )a where    ( sale_amount>=3000000 and sale_amount<10000000 ) or ( num>1 and num<5);

INSERT INTO rpt_l_cst_stand_label_storage(cstguid,labeLtype,labelGUID,labelName )
 SELECT cstGUID,'客户资产','LB007_3',  '高价值' 
	from (
			SELECT cstGUID,count(*) num ,sum(sale_amount) sale_amount from report_cst_deal_mid_own group by cstGUID  
  )a where   sale_amount>=10000000  or num>4 ;

-- 修改标签表
DELETE FROM  rpt_l_cst_label_storage WHERE labelGUID='LB007_2' or labelGUID='LB007_1' or labelGUID='LB007_3' or
                                           labelGUID='LB001' or labelGUID='LB002' or labelGUID='LB003' or 
																					 labelGUID='LB004' or labelGUID='LB006_1' or labelGUID='LB006_2'; 

INSERT INTO rpt_l_cst_label_storage(cstGUID,cstName,labelGUID,labelName,createTime,cst_mobile,cst_address  )    
SELECT DISTINCT a.cstGUID,a.cstName,labelGUID,labelName,createTime,a.mobile_tel,a.cst_address  
from rpt_yx_cst_model a,rpt_l_cst_stand_label_storage b where a.cstguid=b.cstguid;
  

UPDATE rpt_l_label_storge  a,(
SELECT labelGUID,count(*) label_cst_num  from rpt_l_cst_label_storage group by labelGUID ) b 
set a.label_cst_num=b.label_cst_num
where a.label_guid=b.labelGUID;



 
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_xs_format_index` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_xs_format_index` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_xs_format_index`(IN p_totaldate VARCHAR(10))
BEGIN
	#Routine body goes here...
	DECLARE v_date DATE;  
  IF  p_totaldate ='AUTO' THEN
		 SET  v_date =DATE_FORMAT(CURDATE()-1 ,'%Y-%m-%d');
  ELSE
		 SET	v_date =p_totaldate;
  END IF;
  
  DELETE FROM rpt_xs_format_index;
 
  INSERT INTO   rpt_xs_format_index(createTime,proj_id	,Deal_money ,esti_Deal_money,Deal_house_num	,house_all_num	,Deal_acreage	,House_all_acreage	 )
  SELECT DATE_FORMAT (v_date ,'%Y-%m-%d'), proj_guid,0,0,0,0,0,0
     FROM  rpt_b_proj_sum      WHERE   (STATUS='在售' OR STATUS='已售') AND format_id='1'; 
       
  /*更改房的总套数，数据来源于项目表中*/
  UPDATE rpt_xs_format_index a, rpt_b_proj_sum b SET a.house_all_num=b.family_sum WHERE a.proj_id=b.proj_guid;
 /*更改房的成交套数，数据来源于项目表中*/
  UPDATE rpt_xs_format_index a, (SELECT  projGUID,COUNT(*) Deal_house_num,  SUM(sale_amount) Deal_money ,SUM(sale_acreage) Deal_acreage  
   FROM report_cst_deal_mid_bak2 WHERE NOT (proj_house_type='商铺' OR  proj_house_type='车位') GROUP BY projGUID) b
  SET a.Deal_house_num=b.Deal_house_num ,a.Deal_money=b.Deal_money ,a.Deal_acreage=b.Deal_acreage     
  WHERE a.proj_id=b.projGUID;
  /* 项目总可以成交金额  */
	UPDATE rpt_xs_format_index a,(
		SELECT projGUID,SUM( bldArea*price)  esti_Deal_money  FROM b_room GROUP BY projGUID
	) b SET a.esti_Deal_money=b.esti_Deal_money  
  WHERE a.proj_id=b.projGUID;
 /* 用项目修正数据*/
	UPDATE rpt_xs_format_index a,(
		SELECT projGUID,saleAmount  FROM b_proj 
	) b SET a.esti_Deal_money=b.saleAmount  
  WHERE a.proj_id=b.projGUID;
 /*总户数去掉车位及商铺信息*/   
  UPDATE rpt_xs_format_index a,( 
	 SELECT projGUID,SUM(bldArea)  House_all_acreage  FROM  b_room a
  LEFT JOIN     report_basic_room_enum b    ON
                  (       category =1 AND enumValue   LIKE  CONCAT('%,', SUBSTRING(a.roomStru,1,2) ,',%')   
	AND b.attachCode >='100006' AND b.attachCode <='100007'  ) 
  WHERE NOT( enumValue='商铺' OR enumValue='车位') OR enumValue IS NULL 
  GROUP BY projGUID
  
	 
	)  b  
  SET a.House_all_acreage=b.House_all_acreage    WHERE a.proj_id=b.projGUID;  
  UPDATE rpt_xs_format_index a,( 
		SELECT projGUID,COUNT(DISTINCT roomGUID)  Rg_num  FROM  rpt_order_cst_mid WHERE NOT( proj_house_type = '车位' OR  proj_house_type = '商铺'  )
		GROUP BY projGUID  
	)  b  
  SET a.Rg_num=b.Rg_num    
  WHERE a.proj_id=b.projGUID; 
  UPDATE rpt_xs_format_index a,( 
		SELECT proj_guid, (family_sum-sale_sum)  Zs_num FROM  rpt_b_proj_sum  WHERE family_sum-sale_sum >0 
	)  b  
  SET a.Zs_num=b.Zs_num    
  WHERE a.proj_id=b.proj_guid; 
  UPDATE rpt_xs_format_index SET Qs_num=Deal_house_num;
  
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_ybp_count` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_ybp_count` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_ybp_count`(IN p_totaldate VARCHAR(10))
BEGIN
  DECLARE v_date DATETIME;
  DECLARE v_ym   VARCHAR(10); 
  DECLARE v_curM_bDate DATETIME;
  DECLARE v_curM_EDate DATETIME;
  
  IF  p_totaldate ='AUTO' THEN
		 SET v_date =DATE_FORMAT (CURDATE()-1 ,'%Y-%m-%d');
  ELSE
		 SET	v_date =p_totaldate;
  END IF;
  
  SET v_ym := DATE_FORMAT (v_date,'%Y-%m');
  SET v_curM_bDate  =DATE_FORMAT (v_date ,'%Y-%m-01');
  SET v_curM_EDate  =CONCAT(LAST_DAY(v_curM_bDate), ' 23:59:59');
  SELECT  v_curM_bDate,v_curM_EDate;
 
  DELETE FROM rpt_proj_vist_rank WHERE   count_month=v_ym;
  INSERT INTO rpt_proj_vist_rank(big_code,big_name,city_code,city_name,proj_guid,proj_name,Vist_num,deal_amount,deal_set,count_month,createtime)
  SELECT  big_code,big_name, city_code,city_name, proj_guid,proj_name,0,0,0,v_ym,v_date  FROM rpt_b_proj_sum WHERE STATUS='在售' AND curr_status=1;
  UPDATE   rpt_proj_vist_rank a, b_org b SET a.path=b.path WHERE a.city_code=b.orgGUID AND  count_month=v_ym;
  -- 本月新增到访客户 
  UPDATE   rpt_proj_vist_rank a,(
			SELECT  projGUID,DATE_FORMAT(firstVistTime,'%Y-%m'),COUNT(*)  add_vist_num  FROM 
         (
			  	SELECT projGUID,cstGUID,MIN(firstVistTime) firstVistTime  FROM rpt_cst_opp_mid    
						 GROUP BY  projGUID,cstGUID )a 
        WHERE  DATE_FORMAT (firstVistTime,'%Y-%m')= v_ym
				GROUP BY   projGUID,DATE_FORMAT(firstVistTime,'%Y-%m')
   ) b
   SET a.add_vist_num =b.add_vist_num
  WHERE a.Proj_GUID=b.projGUID AND count_month=v_ym;
  -- 本月到访客户 
  UPDATE   rpt_proj_vist_rank a,(
		SELECT    projGUID, COUNT(*)  vist_num  FROM 
		     ( SELECT  projGUID,cstGUID,    MIN( firstVistTime ) firstVistTime  FROM rpt_cst_opp_mid 
               	WHERE    firstVistTime BETWEEN v_curM_bDate AND v_curM_EDate   GROUP BY projGUID, cstGUID )a 	   
		GROUP BY  projGUID
  )b    
  SET  a.vist_num=b.vist_num
  WHERE a.count_month=v_ym AND a.Proj_GUID=b.projGUID; 
  
  -- 本月项目交易金额  
  UPDATE   rpt_proj_vist_rank a,(
			 SELECT projGUID, SUM(sale_amount) deal_amount ,COUNT(*) deal_set FROM report_cst_deal_mid_bak2 
           WHERE deal_date BETWEEN v_curM_bDate AND v_curM_EDate GROUP BY projGUID
   ) b
   SET a.deal_amount=b.deal_amount,a.deal_set=b.deal_set
  WHERE a.Proj_GUID=b.projGUID AND  count_month=v_ym;
   
  UPDATE   rpt_proj_vist_rank a, rpt_b_proj_sum b
   SET a.curr_status=b.curr_status 
  WHERE a.Proj_GUID=b.proj_guid AND  count_month=v_ym;
 
  -- 插入当月的数据日期  
  DELETE FROM rpt_month_sale_trend WHERE data_date BETWEEN v_curM_bDate AND v_curM_EDate;
  INSERT INTO rpt_month_sale_trend( deal_amount,deal_set,order_set,order_amount,count_month,data_date,createtime,city_code,city_name)  
  SELECT 0,0,0,0,v_ym,cdate,v_date ,b.orgGUID, b.orgname   FROM rpt_calendar a,(SELECT * FROM b_org WHERE orgType=3 AND subType=3) b 
     WHERE  cdate BETWEEN v_curM_bDate AND v_curM_EDate;
  -- 统计每日成交量  
  UPDATE   rpt_month_sale_trend a,(
			 SELECT city_code, deal_date,COUNT(*) deal_set,SUM(sale_amount) sale_amount FROM report_cst_deal_mid_bak2      
           WHERE deal_date BETWEEN v_curM_bDate AND v_curM_EDate AND NOT( proj_house_type ='商铺' OR proj_house_type ='车位'  )
        GROUP BY city_code,deal_date
   ) b
  SET  a.deal_set=b.deal_set,a.deal_amount=b.sale_amount
  WHERE a.data_date=b.deal_date AND a.city_code=b.city_code ;
 /*
  -- 统计当月每天新到访人数  从明细表中取出 rpt_cst_curr_opp_first_mid
  UPDATE   rpt_month_sale_trend a,(
		SELECT   DATE_FORMAT (firstVistTime,'%Y-%m-%d') firstVistTime, count(*)  new_vist_num  FROM 
		     ( SELECT  cstGUID,    min( firstVistTime ) firstVistTime  FROM rpt_cst_opp_mid   GROUP BY  cstGUID )a 
		WHERE    firstVistTime BETWEEN v_curM_bDate AND v_curM_EDate   
		GROUP BY   DATE_FORMAT (firstVistTime,'%Y-%m-%d') 
  )b    
  SET  a.new_vist_num=b.new_vist_num
  WHERE a.data_date=b.firstVistTime; 
 */
  --  统计当月 认购套数  
  UPDATE   rpt_month_sale_trend a,(
	   SELECT qsdate ,COUNT(*) order_set   FROM rpt_order_cst_mid   
        WHERE qsdate BETWEEN v_curM_bDate AND v_curM_EDate  AND  NOT( proj_house_type ='商铺' OR proj_house_type ='车位'   ) 
    GROUP BY  qsdate
  )b    
  SET  a.order_set=b.order_set
  WHERE a.data_date=b.qsdate; 
   UPDATE   rpt_month_sale_trend a, b_org b SET a.path=b.path WHERE a.city_code=b.orgGUID AND  count_month=v_ym;
  DELETE FROM rpt_cst_curr_opp_first_mid   WHERE  firstVistTime BETWEEN v_curM_bDate AND v_curM_EDate   ;
  DELETE FROM rpt_cst_curr_opp_first_mid   WHERE  firstVistTime < DATE_ADD(v_curM_EDate,INTERVAL -3 MONTH) ; 
   
  INSERT INTO  rpt_cst_curr_opp_first_mid(projGUID,cstGUID,firstVistTime)
  SELECT   projGUID,cstGUID,firstVistTime FROM rpt_cst_opp_first_mid  WHERE firstVistTime BETWEEN v_curM_bDate AND v_curM_EDate  ;
  UPDATE   rpt_cst_curr_opp_first_mid a, rpt_b_proj_sum b SET a.city_code=b.city_Code
         WHERE a.projGUID=b.proj_guid AND   firstVistTime BETWEEN v_curM_bDate AND v_curM_EDate  ;
  UPDATE   rpt_cst_curr_opp_first_mid a, b_org b SET a.path=b.path
         WHERE a.city_Code=b.orgGUID AND   firstVistTime BETWEEN v_curM_bDate AND v_curM_EDate  ;  
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_ybp_kf_month_analyse` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_ybp_kf_month_analyse` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_ybp_kf_month_analyse`(IN p_totaldate VARCHAR(10))
BEGIN
  DECLARE v_date DATETIME;
  DECLARE v_ym   VARCHAR(10); 
  DECLARE v_curM_bDate DATETIME;
  DECLARE v_curM_EDate DATETIME;
  
  IF  p_totaldate ='AUTO' THEN
		 SET v_date =DATE_FORMAT (CURDATE()-1 ,'%Y-%m-%d');
  ELSE
		 SET	v_date =p_totaldate;
  END IF;
  
  SET v_ym := DATE_FORMAT (v_date,'%Y-%m');
  SET v_curM_bDate  =DATE_FORMAT (v_date ,'%Y-%m-01');
  SET v_curM_EDate  =CONCAT(LAST_DAY(v_curM_bDate), ' 23:59:59');
  -- 插入当月的数据日期  
  DELETE FROM rpt_ybp_kf_month_analyse WHERE count_month =v_ym;
  INSERT INTO rpt_ybp_kf_month_analyse( repair_num,complain_num,count_month,data_date,create_time,  city_Code, big_code, city_name, big_name ) 
  SELECT 0,0, v_ym , cdate,v_date, b.city_Code,b.big_code,b.city_name,b.big_name   FROM rpt_calendar a,
  (SELECT DISTINCT city_Code,big_code ,city_name,big_name FROM  v_org_city_area ) b WHERE  cdate BETWEEN  v_curM_bDate AND v_curM_EDate;
  /*投诉次数*/
  UPDATE rpt_ybp_kf_month_analyse a ,( 
			SELECT city_code,big_code,DATE_FORMAT(receivedate,'%Y-%m-%d') receivedate ,COUNT(*) complain_num  FROM rpt_format_sale_analyse   
    WHERE receivedate  BETWEEN v_curM_bDate AND v_curM_EDate
             GROUP BY  DATE_FORMAT(receivedate,'%Y-%m-%d'),city_code,big_code
		) b
  SET a.complain_num=b.complain_num
  WHERE a.data_date=b.receivedate AND count_month=v_ym AND a.city_code=b.city_code AND a.big_code=b.big_code;
  /*报修次数*/
 UPDATE rpt_ybp_kf_month_analyse a ,( 
 	SELECT     DATE_FORMAT(receivedate,'%Y-%m-%d') receivedate,COUNT(*)repair_num , big_code,big_name,city_Code,city_name 
               FROM k_Receive a  
               LEFT JOIN  k_Task  b ON a.ReceiveGUID=b.ReceiveGUID  
               LEFT JOIN  rpt_b_proj_sum c ON a.ProjGUID=c.proj_guid
  WHERE     (ReceiveType='维修' )    AND receivedate  BETWEEN v_curM_bDate AND v_curM_EDate
	GROUP BY  DATE_FORMAT(receivedate,'%Y-%m-%d'), big_code,big_name,city_Code,city_name 
		) b
  SET a.repair_num=b.repair_num
  WHERE a.data_date=b.receivedate AND count_month=v_ym AND a.city_code=b.city_code AND a.big_code=b.big_code;
  UPDATE   rpt_ybp_kf_month_analyse a, b_org b SET a.path=b.path WHERE a.city_code=b.orgGUID AND  count_month =v_ym;
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_ybp_kf_month_ruhuo` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_ybp_kf_month_ruhuo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_ybp_kf_month_ruhuo`(IN p_totaldate VARCHAR(10))
BEGIN 
 
   -- 遍历数据结束标志
  DECLARE  v_date DATE; 
 
  DECLARE v_curM_bDate DATETIME;
  DECLARE v_curM_EDate DATETIME;
  DECLARE v_month VARCHAR(10); 
  IF  p_totaldate ='AUTO' THEN
		 SET  v_date =DATE_FORMAT (CURDATE()-1 ,'%Y-%m-%d');
  ELSE
		 SET	v_date =p_totaldate;
  END IF;
    
  SET v_curM_bDate  =DATE_FORMAT (v_date ,'%Y-%m-01');
  SET v_curM_EDate  =CONCAT(LAST_DAY(v_curM_bDate), ' 23:59:59');
  SET v_month  =   DATE_FORMAT ( v_date ,'%Y-%m');    
  DELETE FROM rpt_ybp_kf_month_ruhuo WHERE ruhuo_month=  CONVERT( v_month USING utf8) COLLATE utf8_unicode_ci;      
  
  -- 选出当月入伙的楼栋，项目，入伙时间  
  
  DROP TABLE IF EXISTS `rpt_sale_service_tmp`; 
  CREATE TABLE  rpt_sale_service_tmp AS  SELECT c.projGUID ,prject_name ,c.bldGUID, d.bldName , bgndate  FROM s_saleService a,
       t_contract b,report_cst_deal_mid_bak2 c ,b_building d
  WHERE   bgndate BETWEEN v_curM_bDate  AND v_curM_EDate   
        AND a.contractguid=b.contractGUID AND serviceItem='入伙服务' 
        AND b.roomGUID=c.roomGUID AND c.bldGUID=d.bldGUID 
        AND  c.csttype=1 AND  NOT( c.proj_house_type ='商铺' OR c.proj_house_type ='车位')  ;
 -- 取出当月入伙的楼栋 a.big_code=b.area_id ,  a.big_name=b.area_name ,  a.city_code=b.cityCode,  a.city_name=b.cityName1 --
              
  INSERT INTO  rpt_ybp_kf_month_ruhuo(curr_seq,projguid,projname,ruhuo_date,ruhuo_month,checkin_range,household_num )                             
  SELECT   @rownum1:=@rownum1+1 AS rownum, d.projGUID,d.prject_name,d.bgndate,v_month , bldName, ruhou_num FROM (
     SELECT  projGUID ,prject_name , GROUP_CONCAT(  bldName,',') bldName , MIN(bgndate) bgndate ,SUM(ruhou_num) ruhou_num FROM 
				(SELECT   a.projGUID ,prject_name ,a.bldName , MIN(bgndate) bgndate ,COUNT(*) ruhou_num FROM rpt_sale_service_tmp a
					WHERE NOT a.bldName LIKE '%车%'
					GROUP BY a.projGUID ,prject_name ,a.bldName 
        ) c 
     GROUP BY    projGUID ,prject_name    ORDER BY bgndate
   ) d ,(SELECT @rownum1:=0) temp;
   
   
  UPDATE  rpt_ybp_kf_month_ruhuo a,rpt_b_proj_sum b 
               SET      a.big_code=b.big_code,a.big_name=b.big_name ,a.city_name=b.city_name,a.city_code=b.city_code
  WHERE a.projguid=b.proj_guid;
  UPDATE   rpt_ybp_kf_month_ruhuo a, b_org b SET a.path=b.path WHERE a.city_code=b.orgGUID ;
 
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_ybp_kf_wy_analyse` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_ybp_kf_wy_analyse` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_ybp_kf_wy_analyse`(IN p_totaldate VARCHAR(20))
BEGIN 
 
   -- 遍历数据结束标志
  DECLARE  v_date DATE; 
  DECLARE v_curM_bDate DATETIME; 
  DECLARE v_curM_EDate DATETIME; 
  IF  p_totaldate ='AUTO' THEN
		 SET  v_date =DATE_FORMAT (CURDATE()-1 ,'%Y-%m-%d');
  ELSE
		 SET	v_date =p_totaldate;
  END IF;
    
  SET v_curM_bDate  =DATE_FORMAT (v_date ,'%Y-%m-01');
  SET v_curM_EDate  =CONCAT(LAST_DAY(v_curM_bDate), ' 23:59:59');
    
  DELETE FROM rpt_ybp_kf_wy_analyse WHERE create_time=v_date   ;
  DELETE FROM rpt_ybp_kf_wy_analyse WHERE create_time< DATE_ADD( v_date,INTERVAL 5 YEAR)    ;
  INSERT INTO  rpt_ybp_kf_wy_analyse(own_yest_add,Own_month_Add,Own_total,complain_yest_add,
										 	complain_no_solve,complain_comp_cycle,repair_yest_add, repair_no_solve,
                       Repair_comp_cycle,Create_time,city_code)
  SELECT 0,0,0,0,0,0,0,0,0,v_date ,orgGUID  FROM b_org WHERE orgType=3 AND subType=3;
  UPDATE   rpt_ybp_kf_wy_analyse a, b_org b SET a.path=b.path WHERE a.city_code=b.orgGUID AND  create_time=v_date;
 /* 昨天新增 业主数 
  UPDATE rpt_ybp_kf_wy_analyse a,(
		SELECT count(*) FROM ( 
				select cstGUID ,min(deal_date) deal_date from report_cst_deal_mid_own_02 where  not (a.proj_house_type='商铺' or  a.proj_house_type='车位') 
		group by cstGUID) a where deal_date=v_date
	) b
  SET a.own_yest_add=b.own_yest_add 
  WHERE a.create_time=v_date;
  -- 本月新增 业主数 
  UPDATE rpt_ybp_kf_wy_analyse a,(
		SELECT count(DISTINCT a.cstGUID) Own_month_Add FROM report_cst_deal_mid_own_02 a 
			LEFT JOIN report_cst_deal_mid_own_02 b ON a.cstGUID=b.cstGUID AND  b.deal_date<v_curM_bDate
         WHERE   a.deal_date BETWEEN  v_curM_bDate   and  v_curM_EDate   and a.cstType=1 and b.cstType=1 
             and  not (a.proj_house_type='商铺' or  a.proj_house_type='车位') 
   ) b
  SET a.own_month_Add=b.own_month_Add 
  WHERE a.create_time=v_date;
  -- 累计 业主数  
  UPDATE rpt_ybp_kf_wy_analyse a,(
		SELECT count(DISTINCT  cstGUID) Own_total FROM report_cst_deal_mid_own_02  
              where deal_date<=v_date and cstType=1 and  not (proj_house_type='商铺' or  proj_house_type='车位')
	  ) b
  SET a.own_total=b.Own_total 
  WHERE a.create_time=v_date;
 
*/
  /* 投诉昨天新增*/
   UPDATE rpt_ybp_kf_wy_analyse a,(
		   SELECT city_code,COUNT(*) complain_yest_add FROM rpt_format_sale_analyse    WHERE receivedate=v_date GROUP BY city_code 
	  ) b
   SET a.complain_yest_add=b.complain_yest_add 
   WHERE a.create_time=v_date AND a.city_code=b.city_code;
  /* 投诉待解决数  */
   UPDATE rpt_ybp_kf_wy_analyse a,(
		   SELECT  city_code,COUNT(*) complain_no_solve FROM rpt_format_sale_analyse    
			    WHERE receivedate<=v_date AND RwwcSj IS NULL 
				GROUP BY city_code 
	  ) b
   SET a.complain_no_solve=b.complain_no_solve 
   WHERE a.create_time=v_date  AND a.city_code=b.city_code;
  /*投诉诉理时间*/
   UPDATE rpt_ybp_kf_wy_analyse a,(
			SELECT city_code, FLOOR(SUM(ABS(DATEDIFF (receivedate,RwwcSj)))/COUNT(*)) complain_comp_cycle FROM rpt_format_sale_analyse 
					WHERE  receivedate BETWEEN  DATE_ADD(v_date,INTERVAL  -30 DAY ) AND  v_date  
							AND STATUS=1 AND rwwcSj IS NOT NULL AND (RwclSx IS NULL OR (RwclSx IS NULL AND RwwcSj<=RwclSx))
		 GROUP BY city_code ) b
	 SET a.complain_comp_cycle=b.complain_comp_cycle
	 WHERE a.create_time=v_date AND a.city_code=b.city_code;
 
  /*报修昨日投诉数 */
   UPDATE rpt_ybp_kf_wy_analyse a,(
    SELECT city_code, COUNT(*) repair_yest_add  FROM k_Receive a  ,
                   k_Task b,rpt_b_proj_sum c WHERE a.ReceiveGUID=b.ReceiveGUID AND (ReceiveType='维修'  )    AND SlDate=v_date
                AND a.ProjGUID=c.proj_guid 
        GROUP BY city_code
    ) b
	 SET a.repair_yest_add=b.repair_yest_add
	 WHERE a.create_time=v_date AND a.city_code=b.city_code ;     
  /*报修待解决数 */
   UPDATE rpt_ybp_kf_wy_analyse a,(
    SELECT city_code, COUNT(*) repair_no_solve  FROM k_Receive a  ,
                   k_Task b,rpt_b_proj_sum c  
      WHERE a.ReceiveGUID=b.ReceiveGUID AND (ReceiveType='维修'  )    AND SlDate<=v_date AND RwwcSj IS NULL   AND a.ProjGUID=c.proj_guid 
                     
        GROUP BY city_code
    ) b
	 SET a.repair_no_solve=b.repair_no_solve
	 WHERE a.create_time=v_date AND a.city_code=b.city_code;     
   /* 报修完成平均周期 */
   UPDATE rpt_ybp_kf_wy_analyse a,(
    SELECT  city_code,FLOOR(SUM(ABS(DATEDIFF (receivedate,RwwcSj)))/COUNT(*)) repair_comp_cycle     FROM k_Receive a  ,
                   k_Task b ,rpt_b_proj_sum c 
				WHERE a.ReceiveGUID=b.ReceiveGUID AND (ReceiveType='维修') AND SlDate BETWEEN  DATE_ADD(v_date,INTERVAL  -30 DAY ) AND  v_date    
             AND NOT  RwwcSj IS NULL    AND a.ProjGUID=c.proj_guid 
        GROUP BY city_code
    ) b
	 SET a.repair_comp_cycle=b.repair_comp_cycle
	 WHERE a.create_time=v_date AND a.city_code=b.city_code;     
   
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_ybp_zy_build_info` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_ybp_zy_build_info` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_ybp_zy_build_info`(IN p_totaldate VARCHAR(20))
BEGIN 
  
  DECLARE  v_date DATE; 
  DECLARE v_week_bDate DATETIME; 
  DECLARE v_week_EDate DATETIME; 
  IF  p_totaldate ='AUTO' THEN
		 SET  v_date =DATE_FORMAT (CURDATE()-1 ,'%Y-%m-%d');
  ELSE
		 SET	v_date =p_totaldate;
  END IF;
   /* 计算当前日期的周一与周日*/ 
  SET v_week_bDate  =DATE_FORMAT (get_week_beg(v_date) ,'%Y-%m-%d');
  SET v_week_EDate  =CONCAT(get_week_end(v_date), ' 23:59:59');
    
  DELETE FROM  rpt_ybp_zy_build_info WHERE week_code=v_week_bDate;
  INSERT INTO  rpt_ybp_zy_build_info( rent_week_add,rent_num,sale_week_add,Sale_num,week_code,create_time)
                              VALUES(0,0,0,0, v_week_bDate,v_date );
  
  /* 统计本周 新增出租量 */
  UPDATE rpt_ybp_zy_build_info a,(
     SELECT COUNT(*) rent_week_add FROM zRoomlist WHERE (FLISTINGTYPE = 'RENT' OR FLISTINGTYPE = 'RENT_SALE' OR FLISTINGTYPE = 'RENTED'   )
                                    AND  FCREATETIME BETWEEN  v_week_bDate AND  v_week_EDate
   )b
  SET a.rent_week_add=b.rent_week_add
  WHERE a.week_code=v_week_bDate ;
 
   
  
  /* 统计  出租存量 */
  UPDATE rpt_ybp_zy_build_info a,(
     SELECT COUNT(*) rent_num FROM zRoomlist 
           WHERE (FLISTINGTYPE = 'RENT' OR FLISTINGTYPE = 'RENT_SALE'  )  
                                   
   )b
  SET a.rent_num=b.rent_num
  WHERE a.week_code=v_week_bDate ;
 
     /* 统计本周 新增出售量 */
  UPDATE rpt_ybp_zy_build_info a,(
     SELECT COUNT(*) Sale_week_add  FROM zRoomlist WHERE (FLISTINGTYPE = 'SALE' OR FLISTINGTYPE = 'RENT_SALE' OR FLISTINGTYPE = 'SOLD'   )
                                    AND  FCREATETIME BETWEEN  v_week_bDate AND  v_week_EDate
   )b
  SET a.Sale_week_add=b.Sale_week_add
  WHERE a.week_code=v_week_bDate ; 
   
  
  /* 统计  出售存量 */
  UPDATE rpt_ybp_zy_build_info a,(
     SELECT COUNT(*) Sale_num FROM zRoomlist 
           WHERE (FLISTINGTYPE = 'SALE' OR FLISTINGTYPE = 'RENT_SALE'  )  
                                   
   )b
  SET a.Sale_num=b.Sale_num
  WHERE a.week_code=v_week_bDate ;
 
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_ybp_zy_cst_info` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_ybp_zy_cst_info` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_ybp_zy_cst_info`(IN p_totaldate VARCHAR(20))
BEGIN
	#Routine body goes here...
 
  DECLARE  v_date DATE; 
  DECLARE v_week_bDate DATETIME; 
  DECLARE v_week_EDate DATETIME; 
  DECLARE v_month VARCHAR(10); 
  IF  p_totaldate ='AUTO' THEN
		 SET  v_date =DATE_FORMAT (CURDATE()-1 ,'%Y-%m-%d');
  ELSE
		 SET	v_date =p_totaldate;
  END IF;
 
   /* 计算当前日期的周一与周日*/ 
  SET v_week_bDate  =DATE_FORMAT (get_week_beg(v_date) ,'%Y-%m-%d');
  SET v_week_EDate  =CONCAT(get_week_end(v_date), ' 23:59:59');
    
  DELETE FROM  rpt_ybp_zy_cst_info WHERE week_code=v_week_bDate;
  INSERT INTO  rpt_ybp_zy_cst_info( rent_week_add,rent_cst_num,sale_week_add,Sale_cst_num,week_code,create_time)
                              VALUES(0,0,0,0, v_week_bDate,v_date );
  
  /* 统计本周 新增出租量 */
  UPDATE rpt_ybp_zy_cst_info a,(
		SELECT  
			SUM(CASE WHEN fintentiontype='BUY'  THEN 1 ELSE 0 END) sale_week_add,
			SUM(CASE WHEN fintentiontype='RENT' THEN 1 ELSE 0 END) rent_week_add
		FROM t_bk_customer  WHERE fcreatetime  BETWEEN  v_week_bDate AND  v_week_EDate
   )b
  SET a.rent_week_add=b.rent_week_add,a.sale_week_add=b.sale_week_add
  WHERE a.week_code=v_week_bDate ;
   
 
  /* 统计所有量 */
  UPDATE rpt_ybp_zy_cst_info a,(
		SELECT  
			SUM(CASE WHEN fintentiontype='BUY'  THEN 1 ELSE 0 END) sale_cst_num,
			SUM(CASE WHEN fintentiontype='RENT' THEN 1 ELSE 0 END) rent_cst_num
		FROM t_bk_customer 
   )b
  SET a.sale_cst_num=b.sale_cst_num,a.rent_cst_num=b.rent_cst_num
  WHERE a.week_code=v_week_bDate ;
 
 
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_ybp_zy_m_sale_income` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_ybp_zy_m_sale_income` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_ybp_zy_m_sale_income`(IN p_totaldate VARCHAR(20))
BEGIN
	#Routine body goes here...
 
  
  DECLARE  v_date DATE; 
  DECLARE v_curM_bDate DATETIME; 
  DECLARE v_curM_EDate DATETIME; 
  DECLARE v_month VARCHAR(10); 
  IF  p_totaldate ='AUTO' THEN
		 SET  v_date =DATE_FORMAT (CURDATE()-1 ,'%Y-%m-%d');
  ELSE
		 SET	v_date =p_totaldate;
  END IF;
 
  SET v_curM_bDate  =DATE_FORMAT (v_date ,'%Y-%m-01');
  SET v_curM_EDate  =CONCAT(LAST_DAY(v_curM_bDate), ' 23:59:59');
  SET v_month  =   DATE_FORMAT ( v_date ,'%Y-%m'); 
   
  DELETE FROM   rpt_ybp_zy_m_sale_income WHERE count_month=v_month;
  INSERT INTO   rpt_ybp_zy_m_sale_income(sale_num	,rent_num	,sale_amount,rent_amount,count_month,data_date,createtime)
                              SELECT 0,0,0,0, v_month,cdate,v_date   FROM rpt_calendar WHERE  cdate BETWEEN v_curM_bDate AND v_curM_EDate;
    
 
  UPDATE rpt_ybp_zy_m_sale_income c,(
   SELECT SUM( SALE) SALE,SUM(RENT) RENT,SUM(SALE_NUM) SALE_NUM,SUM(RENT_NUM) RENT_NUM,FDEALDATE FROM (
			SELECT  (CASE WHEN FSALETYPE='SALE' THEN FOWNCOMMISS  ELSE 0 END ) SALE ,   
              (CASE WHEN FSALETYPE='SALE' THEN 1  ELSE 0 END ) SALE_NUM,
              (CASE WHEN FSALETYPE='RENT' THEN FOWNCOMMISS  ELSE 0 END ) RENT ,    
							(CASE WHEN FSALETYPE='RENT' THEN 1  ELSE 0 END ) RENT_NUM,
						  FDEALDATE
			FROM (
					SELECT DATE_FORMAT(FDEALDATE,'%Y-%m-%d') FDEALDATE,(FCUSCOMMISS+FOWNCOMMISS) FOWNCOMMISS,
                 CASE WHEN FSALETYPE='AGENTSALE' THEN 'SALE' ELSE FSALETYPE END  FSALETYPE
					FROM  t_trade_dealreport a  WHERE FDEALDATE   BETWEEN v_curM_bDate  AND v_curM_EDate         
				) b  WHERE FSALETYPE='RENT' OR FSALETYPE='SALE'     
			) d GROUP BY FDEALDATE 
  ) e
  SET c.sale_num=e.SALE_NUM,c.rent_num=e.RENT_NUM,c.sale_amount=e.SALE,c.rent_amount=e.RENT
  WHERE c.data_date=e.FDEALDATE;
 
 
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_ybp_zy_proj_sale_info` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_ybp_zy_proj_sale_info` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_ybp_zy_proj_sale_info`(IN p_totaldate VARCHAR(20))
BEGIN
	#Routine body goes here...
 
  
  DECLARE  v_date DATE; 
  DECLARE v_curM_bDate DATETIME; 
  DECLARE v_curM_EDate DATETIME; 
  DECLARE v_month VARCHAR(10); 
  IF  p_totaldate ='AUTO' THEN
		 SET  v_date =DATE_FORMAT (CURDATE()-1 ,'%Y-%m-%d');
  ELSE
		 SET	v_date =p_totaldate;
  END IF;
 
  SET v_curM_bDate  =DATE_FORMAT (v_date ,'%Y-%m-01');
  SET v_curM_EDate  =CONCAT(LAST_DAY(v_curM_bDate), ' 23:59:59');
  SET v_month  =   DATE_FORMAT ( v_date ,'%Y-%m'); 
   
  DELETE FROM   rpt_ybp_proj_sale_info WHERE count_month=v_month;
  INSERT INTO   rpt_ybp_proj_sale_info(proj_GUID,proj_name,deal_amount,deal_set,count_month,trade_type,createtime)                           
 	SELECT     FKGARDENID ,FGARDENNAME, SUM(FOWNCOMMISS) deal_amount,COUNT(*) deal_set, v_month, FSALETYPE,v_date					 
  FROM (
				 	SELECT DATE_FORMAT(FDEALDATE,'%Y-%m-%d') FDEALDATE,(FDEALTOTALPRICE) FOWNCOMMISS,
                 CASE WHEN FSALETYPE='AGENTSALE' THEN 'SALE' ELSE FSALETYPE END  FSALETYPE, 
								FHOUSEPROJECTNAME,FKHOUSEPROJECTID,a.FKGARDENID,b.FGARDENNAME
				  FROM  zDeal a 
             LEFT JOIN  (SELECT DISTINCT FKGARDENID,FGARDENNAME FROM  zRoomlist ) b ON a.FKGARDENID=b.FKGARDENID
          WHERE FDEALDATE   BETWEEN v_curM_bDate  AND  v_curM_EDate
	 ) b  WHERE FSALETYPE='RENT' OR FSALETYPE='SALE'     	
  GROUP BY  FKGARDENID,FGARDENNAME,FSALETYPE ;
   
 
 
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_ybp_zy_translate_analyse` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_ybp_zy_translate_analyse` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_ybp_zy_translate_analyse`(IN p_totaldate VARCHAR(20))
BEGIN
	#Routine body goes here...
 
  DECLARE  v_date DATE; 
  DECLARE v_date7_b DATETIME; 
  DECLARE v_date7_e DATETIME;  
  DECLARE v_date15_b DATETIME; 
  DECLARE v_date15_e DATETIME;  
  DECLARE v_date30_b DATETIME; 
  DECLARE v_date30_e DATETIME;  
  IF  p_totaldate ='AUTO' THEN
		 SET  v_date =DATE_FORMAT (CURDATE()-1 ,'%Y-%m-%d');
  ELSE
		 SET	v_date =p_totaldate;
  END IF;
  
    
  DELETE FROM  rpt_ybp_translate_analyse ;
 
  /* 计算当前日期的周一与周日*/ 
  SET v_date7_b  =DATE_FORMAT ( v_date-7 ,'%Y-%m-%d');
  SET v_date7_e  =CONCAT(v_date7_b , ' 23:59:59');
  SET v_date15_b  =DATE_FORMAT ( v_date-15 ,'%Y-%m-%d');
  SET v_date15_e  =CONCAT(v_date7_b , ' 23:59:59');
  SET v_date30_b  =DATE_FORMAT ( v_date-30 ,'%Y-%m-%d');
  SET v_date30_e  =CONCAT(v_date7_b , ' 23:59:59');
 
  INSERT INTO  rpt_ybp_translate_analyse(sale_cst_num,Rent_cst_num,dime_type,create_time) 
  SELECT 
			SUM(CASE WHEN fintentiontype='BUY'  THEN 1 ELSE 0 END) sale_cst_num,
			SUM(CASE WHEN fintentiontype='RENT' THEN 1 ELSE 0 END) rent_cst_num,'1',v_date 
	FROM t_bk_customer  WHERE fcreatetime  BETWEEN  v_date7_b AND  v_date7_e;
   
  /* 统计 15天 新增出租量 */     
  SET v_date15_b  =DATE_FORMAT ( v_date-15 ,'%Y-%m-%d');
  SET v_date15_e  =CONCAT(v_date15_b , ' 23:59:59'); 
  INSERT INTO  rpt_ybp_translate_analyse(sale_cst_num,Rent_cst_num,dime_type,create_time) 
  SELECT 
			SUM(CASE WHEN fintentiontype='BUY'  THEN 1 ELSE 0 END) sale_cst_num,
			SUM(CASE WHEN fintentiontype='RENT' THEN 1 ELSE 0 END) rent_cst_num,'2',v_date 
	FROM t_bk_customer  WHERE fcreatetime  BETWEEN  v_date7_b AND  v_date7_e;
   
   /* 统计 30天 新增出租量 */   
  SET v_date30_b  =DATE_FORMAT ( v_date-30 ,'%Y-%m-%d');
  SET v_date30_e  =CONCAT(v_date30_b , ' 23:59:59'); 
  INSERT INTO  rpt_ybp_translate_analyse(sale_cst_num,Rent_cst_num,dime_type,create_time) 
  SELECT 
			SUM(CASE WHEN fintentiontype='BUY'  THEN 1 ELSE 0 END) sale_cst_num,
			SUM(CASE WHEN fintentiontype='RENT' THEN 1 ELSE 0 END) rent_cst_num,'3',v_date 
	FROM t_bk_customer  WHERE fcreatetime  BETWEEN  v_date7_b AND  v_date7_e;
   
  /* 7天内新增的客户成功成交的客户 数 */  
  UPDATE rpt_ybp_translate_analyse a,(
		SELECT 
			SUM(CASE WHEN fintentiontype='BUY'  THEN 1 ELSE 0 END) sold_cst_num,
      SUM(CASE WHEN fintentiontype='BUY'  THEN DATEDIFF(b.fdealdate,a.FCREATETIME) ELSE 0 END) /	SUM(CASE WHEN fintentiontype='BUY'  THEN 1 ELSE 0 END) sale_deal_week,
			SUM(CASE WHEN fintentiontype='RENT' THEN 1 ELSE 0 END) rend_cst_num ,  
      SUM(CASE WHEN fintentiontype='RENT'  THEN DATEDIFF(b.fdealdate,a.FCREATETIME) ELSE 0 END) /	SUM(CASE WHEN fintentiontype='RENT'  THEN 1 ELSE 0 END) rent_week 
		FROM t_bk_customer a,t_trade_dealreport b    
		WHERE  a.FNUMBER=b.FKCUSTOMERID AND   a.fcreatetime  BETWEEN  v_date7_b AND  v_date7_e
  )b
  SET a.sold_cst_num=b.sold_cst_num ,a.rend_cst_num=b.rend_cst_num,a.sale_deal_week=b.rent_week 
  WHERE create_time=v_date AND dime_type='1';
 
  /* 15天内新增的客户成功成交的客户 数 */  
  UPDATE rpt_ybp_translate_analyse a,(
		SELECT 
			SUM(CASE WHEN fintentiontype='BUY'  THEN 1 ELSE 0 END) sold_cst_num,
      SUM(CASE WHEN fintentiontype='BUY'  THEN DATEDIFF(b.fdealdate,a.FCREATETIME) ELSE 0 END) /	SUM(CASE WHEN fintentiontype='BUY'  THEN 1 ELSE 0 END) sale_deal_week,
			SUM(CASE WHEN fintentiontype='RENT' THEN 1 ELSE 0 END) rend_cst_num ,  
      SUM(CASE WHEN fintentiontype='RENT'  THEN DATEDIFF(b.fdealdate,a.FCREATETIME) ELSE 0 END) /	SUM(CASE WHEN fintentiontype='RENT'  THEN 1 ELSE 0 END) rent_week 
		FROM t_bk_customer a,t_trade_dealreport b    
		WHERE  a.FNUMBER=b.FKCUSTOMERID AND   a.fcreatetime  BETWEEN  v_date15_b AND  v_date15_e
  )b
  SET a.sold_cst_num=b.sold_cst_num ,a.rend_cst_num=b.rend_cst_num,a.sale_deal_week=b.rent_week 
  WHERE create_time=v_date AND dime_type='2';
 
  /* 30天内新增的客户成功成交的客户 数 */  
  UPDATE rpt_ybp_translate_analyse a,(
		SELECT 
			SUM(CASE WHEN fintentiontype='BUY'  THEN 1 ELSE 0 END) sold_cst_num,
      SUM(CASE WHEN fintentiontype='BUY'  THEN DATEDIFF(b.fdealdate,a.FCREATETIME) ELSE 0 END) /	SUM(CASE WHEN fintentiontype='BUY'  THEN 1 ELSE 0 END) sale_deal_week,
			SUM(CASE WHEN fintentiontype='RENT' THEN 1 ELSE 0 END) rend_cst_num ,  
      SUM(CASE WHEN fintentiontype='RENT'  THEN DATEDIFF(b.fdealdate,a.FCREATETIME) ELSE 0 END) /	SUM(CASE WHEN fintentiontype='RENT'  THEN 1 ELSE 0 END) rent_week 
		FROM t_bk_customer a,t_trade_dealreport b    
		WHERE  a.FNUMBER=b.FKCUSTOMERID AND   a.fcreatetime  BETWEEN  v_date30_b AND  v_date30_e
  )b
  SET a.sold_cst_num=b.sold_cst_num ,a.rend_cst_num=b.rend_cst_num,a.sale_deal_week=b.rent_week 
  WHERE create_time=v_date AND dime_type='3';
  
  /* 更改转换率 */
  UPDATE rpt_ybp_translate_analyse SET rent_rate=rend_cst_num/rent_cst_num ,   sale_deal_rate= sold_cst_num/sale_cst_num 
  WHERE  create_time=v_date;
 
END */$$
DELIMITER ;

/* Procedure structure for procedure `proc_yx_customer_typeModel` */

/*!50003 DROP PROCEDURE IF EXISTS  `proc_yx_customer_typeModel` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `proc_yx_customer_typeModel`(IN p_totaldate VARCHAR(10))
BEGIN
 
  DECLARE v_date  		 VARCHAR(10); 
  IF  p_totaldate ='AUTO' THEN
		 SET  v_date = DATE_FORMAT(CURDATE()-1 ,'%Y-%m-%d');
  ELSE
		 SET	v_date = p_totaldate;
  END IF;
  
  TRUNCATE TABLE rpt_yx_cst_model;
  
	/*插入二次购买用户,取投资客  */
  INSERT INTO rpt_yx_cst_model(big_code,city_code, proj_guid,cstguid,mobile_tel,cst_email,cst_address,cst_type,cstname)
  SELECT DISTINCT big_code,city_code,a.projGUID,a.cstGUID,  IFNULL(b.mobileTel,hometel),NULL,address,13,cstName  FROM rpt_cst_repeat_buy_detail a 
   LEFT JOIN report_cst_customer b ON a.cstGUID=b.cstGUID;
   
  /*插入 12 自住客户 */  
  INSERT INTO rpt_yx_cst_model( big_code,city_code,proj_guid,cstguid,mobile_tel,cst_email,cst_address,cst_type,cstname) 
  SELECT DISTINCT big_code,city_code,b.projGUID,a.cstGUID,  IFNULL(mobileTel,hometel),NULL,address,12,cstName FROM report_cst_customer   a,
          report_cst_deal_mid_own b 
  WHERE a.cstType=1  AND NOT( proj_house_type='商铺' OR  proj_house_type='车位') AND a.cstGUID=b.cstGUID AND b.jFDate<=v_date; 
  /*插入  11 期房客户 */  
  
  INSERT INTO rpt_yx_cst_model( big_code,city_code,proj_guid,cstguid,mobile_tel,cst_email,cst_address,cst_type,cstname) 
  SELECT DISTINCT big_code,city_code, b.projGUID,a.cstGUID,  IFNULL(mobileTel,hometel),NULL,address,11,cstName FROM report_cst_customer   a,
          report_cst_deal_mid_own b 
  WHERE a.cstType=1  AND NOT( proj_house_type='商铺' OR  proj_house_type='车位') AND a.cstGUID=b.cstGUID AND b.jFDate>v_date; 
 
  /* 21. 跟进中意向客户：在30内 rpt_cst_opp_first_mid  */
  INSERT INTO rpt_yx_cst_model( proj_guid,cstguid,mobile_tel,cst_email,cst_address,cst_type,cstname) 
  SELECT  DISTINCT c.projGUID,a.cstGUID,  IFNULL(mobileTel,hometel),NULL,address,21,cstName FROM report_cst_customer   a,
  (SELECT  a.projGUID ,a.cstguid,b.firstVistTime FROM report_cst_deal_mid_own a 
     LEFT JOIN rpt_cst_opp_first_mid b ON a.projGUID=b.projGUID AND b.cstGUID=a.cstGUID
  WHERE a.cstGUID IS NULL) c WHERE a.cstGUID=c.cstGUID AND DATEDIFF(c.firstVistTime,v_date)<31 ;
  /* 22：已逾期意向客户；在30-180内 */
  INSERT INTO rpt_yx_cst_model( proj_guid,cstguid,mobile_tel,cst_email,cst_address,cst_type,cstname) 
  SELECT DISTINCT  c.projGUID,a.cstGUID,  IFNULL(mobileTel,hometel),NULL,address,22,cstName FROM report_cst_customer   a,
  (SELECT a.projGUID ,a.cstguid,b.firstVistTime  FROM report_cst_deal_mid_own a 
     LEFT JOIN rpt_cst_opp_first_mid b ON a.projGUID=b.projGUID AND b.cstGUID=a.cstGUID
   WHERE a.cstGUID IS NULL) c WHERE a.cstGUID=c.cstGUID AND DATEDIFF(c.firstVistTime,v_date)>30 AND  DATEDIFF(c.firstVistTime,v_date)<181 ;
  /* 23：已流失意向客户：超180天 */
  INSERT INTO rpt_yx_cst_model( proj_guid,cstguid,mobile_tel,cst_email,cst_address,cst_type,cstname) 
  SELECT DISTINCT  c.projGUID,a.cstGUID,  IFNULL(mobileTel,hometel),NULL,address,22,cstName FROM report_cst_customer   a,
  (SELECT a.projGUID ,a.cstguid,b.firstVistTime FROM report_cst_deal_mid_own a 
     LEFT JOIN rpt_cst_opp_first_mid b ON a.projGUID=b.projGUID AND b.cstGUID=a.cstGUID
  WHERE a.cstGUID IS NULL) c WHERE a.cstGUID=c.cstGUID AND DATEDIFF(c.firstVistTime,v_date)>180  ;
  /* 31：有效租赁客户  
   先用房间ID 取出每个房间最新用户，再用客户ID取出最近客户租的地址
   */
  INSERT INTO rpt_yx_cst_model( proj_guid,cstguid,mobile_tel,cst_email,cst_address,cst_type,cstname,deal_date) 
  
  SELECT DISTINCT fkgardenid,cstGUIDB,NULL,NULL,FPROPERTYNAME,31,NULL  ,FDEALDATE  FROM (SELECT fkgardenid,cstGUIDB, FKROOMLISTINGID, FDEALDATE ,	IF(@pdept1= cstGUIDB,@rank1:=@rank1+1,@rank1:=1) AS rank,@pdept1:=cstGUIDB  ,
							FPROPERTYNAME   FROM (
	SELECT fkgardenid,cstGUIDB,FPROPERTYNAME,31, FDEALDATE,FKROOMLISTINGID FROM (
		SELECT  * FROM (  
				SELECT  fkgardenid,cstGUIDB,a.FKROOMLISTINGID,a.FDEALDATE ,	IF(@pdept=a.FKROOMLISTINGID,@rank:=@rank+1,@rank:=1) AS rank,@pdept:=a.FKROOMLISTINGID  ,
							a.FPROPERTYNAME
				FROM (   
					SELECT  *
						FROM zDeal  WHERE fsaletype='RENT'   ORDER BY  FDEALDATE DESC, FKROOMLISTINGID DESC    
				) a , 
			 (SELECT  @pdept := NULL ,@rank:=0) b  
		  ) result 
	  ) b WHERE rank=1 ORDER BY  cstGUIDB DESC, FDEALDATE DESC    
  ) c,	(SELECT  @pdept1 := NULL ,@rank1:=0) d ) result1
  WHERE rank=1;
   /* 32：历史租赁客户 */
  INSERT INTO rpt_yx_cst_model( proj_guid,cstguid,mobile_tel,cst_email,cst_address,cst_type,cstname,deal_date) 
	SELECT DISTINCT fkgardenid,cstGUIDB,NULL,NULL,FPROPERTYNAME,32,NULL ,FDEALDATE FROM (
		SELECT  * FROM (  
				SELECT  fkgardenid,cstGUIDB,a.FKROOMLISTINGID,a.FDEALDATE ,	IF(@pdept=a.FKROOMLISTINGID,@rank:=@rank+1,@rank:=1) AS rank,@pdept:=a.FKROOMLISTINGID  ,
							a.FPROPERTYNAME
				FROM (   
					SELECT  *
						FROM zDeal  WHERE fsaletype='RENT'   ORDER BY  FKROOMLISTINGID,FDEALDATE DESC    
				) a , 
			(SELECT  @pdept := NULL ,@rank:=0) b  
			) result 
	) b WHERE rank=2;
 /* 清除是历史租凭的 但后来又租的客户*/    
 DELETE rpt_yx_cst_model a FROM rpt_yx_cst_model a,rpt_yx_cst_model c 
 WHERE c.cstguid=a.cstguid AND c.cst_type=31 AND a.cst_type=32 AND a.deal_date<c.deal_date;
  UPDATE  rpt_yx_cst_model a,report_cst_customer b 
      SET a.mobile_tel= IFNULL(mobileTel,hometel), a.cst_address=IFNULL(a.cst_address,address),a.cstname=b.cstName
  WHERE (cst_type=31 OR cst_type=32) AND a.cstguid=b.cstguid;
  UPDATE  rpt_yx_cst_model a 
      SET a.big_code='F9ADB9FD-628F-43C0-B0CD-3D1805F71FA8', a.city_code='521B8726-9240-4D10-882D-6C54800EF935'
  WHERE (cst_type=31 OR cst_type=32);
 	
	UPDATE rpt_yx_cst_model a, cst_attach_0 b    SET   a.household_city_name=SUBSTR(b.values,CASE WHEN  LOCATE('-',b.values)>0 THEN  LOCATE('-',b.values)+1 ELSE NULL  END ,20 ) , a.household_name=SUBSTR(b.values,1, CASE WHEN  LOCATE('-',b.values)>0 THEN   LOCATE('-',b.values)-1 ELSE 20  END ),
																														a.household_city_code=SUBSTR(b.remark,CASE WHEN  LOCATE('-',b.remark)>0 THEN  LOCATE('-',b.remark)+1 ELSE NULL  END ,20 ) , a.household_code=SUBSTR(b.remark,1, CASE WHEN  LOCATE('-',b.remark)>0 THEN   LOCATE('-',b.remark)-1 ELSE 20  END )
																													
				WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown_city';
	 
	UPDATE rpt_yx_cst_model a, cst_attach_1 b    SET   a.household_city_name=SUBSTR(b.values,CASE WHEN  LOCATE('-',b.values)>0 THEN  LOCATE('-',b.values)+1 ELSE NULL  END ,20 ) , a.household_name=SUBSTR(b.values,1, CASE WHEN  LOCATE('-',b.values)>0 THEN   LOCATE('-',b.values)-1 ELSE 20  END ),
																														a.household_city_code=SUBSTR(b.remark,CASE WHEN  LOCATE('-',b.remark)>0 THEN  LOCATE('-',b.remark)+1 ELSE NULL  END ,20 ) , a.household_code=SUBSTR(b.remark,1, CASE WHEN  LOCATE('-',b.remark)>0 THEN   LOCATE('-',b.remark)-1 ELSE 20  END )
																													
				WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown_city';
  
	UPDATE rpt_yx_cst_model a, cst_attach_2 b    SET   a.household_city_name=SUBSTR(b.values,CASE WHEN  LOCATE('-',b.values)>0 THEN  LOCATE('-',b.values)+1 ELSE NULL  END ,20 ) , a.household_name=SUBSTR(b.values,1, CASE WHEN  LOCATE('-',b.values)>0 THEN   LOCATE('-',b.values)-1 ELSE 20  END ),
																														a.household_city_code=SUBSTR(b.remark,CASE WHEN  LOCATE('-',b.remark)>0 THEN  LOCATE('-',b.remark)+1 ELSE NULL  END ,20 ) , a.household_code=SUBSTR(b.remark,1, CASE WHEN  LOCATE('-',b.remark)>0 THEN   LOCATE('-',b.remark)-1 ELSE 20  END )
																													
				WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown_city';
	 
	UPDATE rpt_yx_cst_model a, cst_attach_3 b    SET   a.household_city_name=SUBSTR(b.values,CASE WHEN  LOCATE('-',b.values)>0 THEN  LOCATE('-',b.values)+1 ELSE NULL  END ,20 ) , a.household_name=SUBSTR(b.values,1, CASE WHEN  LOCATE('-',b.values)>0 THEN   LOCATE('-',b.values)-1 ELSE 20  END ),
																										 a.household_city_code=SUBSTR(b.remark,CASE WHEN  LOCATE('-',b.remark)>0 THEN  LOCATE('-',b.remark)+1 ELSE NULL  END ,20 ) , a.household_code=SUBSTR(b.remark,1, CASE WHEN  LOCATE('-',b.remark)>0 THEN   LOCATE('-',b.remark)-1 ELSE 20  END )
																													
				WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown_city';
	UPDATE rpt_yx_cst_model a, cst_attach_4 b    SET   a.household_city_name=SUBSTR(b.values,CASE WHEN  LOCATE('-',b.values)>0 THEN  LOCATE('-',b.values)+1 ELSE NULL  END ,20 ) , a.household_name=SUBSTR(b.values,1, CASE WHEN  LOCATE('-',b.values)>0 THEN   LOCATE('-',b.values)-1 ELSE 20  END ),
																														a.household_city_code=SUBSTR(b.remark,CASE WHEN  LOCATE('-',b.remark)>0 THEN  LOCATE('-',b.remark)+1 ELSE NULL  END ,20 ) , a.household_code=SUBSTR(b.remark,1, CASE WHEN  LOCATE('-',b.remark)>0 THEN   LOCATE('-',b.remark)-1 ELSE 20  END )
																													
				WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown_city';
	 
	UPDATE rpt_yx_cst_model a, cst_attach_5 b    SET   a.household_city_name=SUBSTR(b.values,CASE WHEN  LOCATE('-',b.values)>0 THEN  LOCATE('-',b.values)+1 ELSE NULL  END ,20 ) , a.household_name=SUBSTR(b.values,1, CASE WHEN  LOCATE('-',b.values)>0 THEN   LOCATE('-',b.values)-1 ELSE 20  END ),
																														a.household_city_code=SUBSTR(b.remark,CASE WHEN  LOCATE('-',b.remark)>0 THEN  LOCATE('-',b.remark)+1 ELSE NULL  END ,20 ) , a.household_code=SUBSTR(b.remark,1, CASE WHEN  LOCATE('-',b.remark)>0 THEN   LOCATE('-',b.remark)-1 ELSE 20  END )
																													
				WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown_city';
	UPDATE rpt_yx_cst_model a, cst_attach_6 b    SET   a.household_city_name=SUBSTR(b.values,CASE WHEN  LOCATE('-',b.values)>0 THEN  LOCATE('-',b.values)+1 ELSE NULL  END ,20 ) , a.household_name=SUBSTR(b.values,1, CASE WHEN  LOCATE('-',b.values)>0 THEN   LOCATE('-',b.values)-1 ELSE 20  END ),
																														a.household_city_code=SUBSTR(b.remark,CASE WHEN  LOCATE('-',b.remark)>0 THEN  LOCATE('-',b.remark)+1 ELSE NULL  END ,20 ) , a.household_code=SUBSTR(b.remark,1, CASE WHEN  LOCATE('-',b.remark)>0 THEN   LOCATE('-',b.remark)-1 ELSE 20  END )
																													
				WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown_city';
	 
	UPDATE rpt_yx_cst_model a, cst_attach_7 b    SET   a.household_city_name=SUBSTR(b.values,CASE WHEN  LOCATE('-',b.values)>0 THEN  LOCATE('-',b.values)+1 ELSE NULL  END ,20 ) , a.household_name=SUBSTR(b.values,1, CASE WHEN  LOCATE('-',b.values)>0 THEN   LOCATE('-',b.values)-1 ELSE 20  END ),
																														a.household_city_code=SUBSTR(b.remark,CASE WHEN  LOCATE('-',b.remark)>0 THEN  LOCATE('-',b.remark)+1 ELSE NULL  END ,20 ) , a.household_code=SUBSTR(b.remark,1, CASE WHEN  LOCATE('-',b.remark)>0 THEN   LOCATE('-',b.remark)-1 ELSE 20  END )
																													
				WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown_city';
	UPDATE rpt_yx_cst_model a, cst_attach_8 b    SET   a.household_city_name=SUBSTR(b.values,CASE WHEN  LOCATE('-',b.values)>0 THEN  LOCATE('-',b.values)+1 ELSE NULL  END ,20 ) , a.household_name=SUBSTR(b.values,1, CASE WHEN  LOCATE('-',b.values)>0 THEN   LOCATE('-',b.values)-1 ELSE 20  END ),
																														a.household_city_code=SUBSTR(b.remark,CASE WHEN  LOCATE('-',b.remark)>0 THEN  LOCATE('-',b.remark)+1 ELSE NULL  END ,20 ) , a.household_code=SUBSTR(b.remark,1, CASE WHEN  LOCATE('-',b.remark)>0 THEN   LOCATE('-',b.remark)-1 ELSE 20  END )
																													
				WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown_city';
	 
	UPDATE rpt_yx_cst_model a, cst_attach_9 b    SET   a.household_city_name=SUBSTR(b.values,CASE WHEN  LOCATE('-',b.values)>0 THEN  LOCATE('-',b.values)+1 ELSE NULL  END ,20 ) , a.household_name=SUBSTR(b.values,1, CASE WHEN  LOCATE('-',b.values)>0 THEN   LOCATE('-',b.values)-1 ELSE 20  END ),
																														a.household_city_code=SUBSTR(b.remark,CASE WHEN  LOCATE('-',b.remark)>0 THEN  LOCATE('-',b.remark)+1 ELSE NULL  END ,20 ) , a.household_code=SUBSTR(b.remark,1, CASE WHEN  LOCATE('-',b.remark)>0 THEN   LOCATE('-',b.remark)-1 ELSE 20  END )
																													
				WHERE a.cstGUID=b.cstGUID AND b.attachCode='cst_hometown_city';
 
  UPDATE  rpt_yx_cst_model a,report_cst_deal_mid_own b SET  a.work_city_name = b.work_city_name,a.work_sheng_name = b.work_sheng_name
      WHERE a.cstguid=b.cstGUID;
  UPDATE  rpt_yx_cst_model a,b_city b  SET  a.work_city_code   =b.cityCode  WHERE a.work_city_name=b.cityname;
  UPDATE  rpt_yx_cst_model a,b_city b  SET  a.work_sheng_code  =b.cityCode  WHERE a.work_sheng_name=b.cityname;
  /* 房产城市，省份 */
  UPDATE  rpt_yx_cst_model a,rpt_b_proj_sum b  SET  a.house_city_name  =b.cityName1  WHERE a.proj_guid=b.proj_guid;
  UPDATE  rpt_yx_cst_model a,b_city b SET a.house_city_code  =b.citycode  WHERE CONCAT(a.house_city_name,'市') =b.cityname;
  UPDATE  rpt_yx_cst_model a SET a.house_sheng_code= CONCAT(SUBSTR(a.house_city_code,1,2),'0000') ;
  UPDATE  rpt_yx_cst_model a,b_city b SET a.house_sheng_name  =b.cityname  WHERE  a.house_sheng_code = b.citycode ;
  UPDATE  rpt_yx_cst_model a,b_city b SET a.house_city_name  =b.cityname  WHERE  a.house_city_code = b.citycode ;
END */$$
DELIMITER ;

/* Procedure structure for procedure `test_del` */

/*!50003 DROP PROCEDURE IF EXISTS  `test_del` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `test_del`()
BEGIN
	#Routine body goes here...
  DECLARE a INT;
   SET a=1;
   WHILE (a<1000000) DO
   DELETE FROM cst_attach WHERE attachName ='工作区域'  OR attachName = '籍贯' LIMIT 1000;
   SET a=a+1000;
   END WHILE;
END */$$
DELIMITER ;

/* Procedure structure for procedure `updateOrgPath` */

/*!50003 DROP PROCEDURE IF EXISTS  `updateOrgPath` */;

DELIMITER $$

/*!50003 CREATE DEFINER=``@`` PROCEDURE `updateOrgPath`(orgId VARCHAR(100))
BEGIN
    DECLARE sOrgId VARCHAR(100) DEFAULT '';
    DECLARE sPath VARCHAR(5000) DEFAULT ''; 
    DECLARE _done INT DEFAULT 0;
    DECLARE _Cur_Org CURSOR FOR
        SELECT orgguid FROM b_org WHERE parentGUID = orgId;
    DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET _done = 1;
    SET max_sp_recursion_depth=5;
        
    SELECT IFNULL(path,'0') INTO sPath FROM b_org WHERE orgguid = orgId;
    IF (sPath = '0') THEN
	SET sPath=orgId;
	UPDATE b_org SET path = orgguid WHERE orgguid = orgId;
    END IF ;
    UPDATE b_org SET path = CONCAT(sPath,'.',orgguid) WHERE parentGUID = orgId;
	
	
    OPEN _Cur_Org;
            REPEAT
          FETCH _Cur_Org INTO sOrgId;
          
          IF NOT _done THEN
            CALL updateOrgPath(sOrgId);
          END IF;
          
        UNTIL _done END REPEAT;
        
    CLOSE _Cur_Org;
    END */$$
DELIMITER ;

/*Table structure for table `cjcptz20160108` */

DROP TABLE IF EXISTS `cjcptz20160108`;

/*!50001 DROP VIEW IF EXISTS `cjcptz20160108` */;
/*!50001 DROP TABLE IF EXISTS `cjcptz20160108` */;

/*!50001 CREATE TABLE  `cjcptz20160108`(
 `age_segment` varchar(50) ,
 `room_acre_segment` varchar(255) ,
 `csum` bigint(21) 
)*/;

/*Table structure for table `report_cst_deal_mid_own_view` */

DROP TABLE IF EXISTS `report_cst_deal_mid_own_view`;

/*!50001 DROP VIEW IF EXISTS `report_cst_deal_mid_own_view` */;
/*!50001 DROP TABLE IF EXISTS `report_cst_deal_mid_own_view` */;

/*!50001 CREATE TABLE  `report_cst_deal_mid_own_view`(
 `ctype` varchar(5) ,
 `children_num` varchar(11) ,
 `age_segment` varchar(50) ,
 `proj_house_type` varchar(50) ,
 `live_format` varchar(50) ,
 `room_acreage` varchar(50) ,
 `cst_num` int(11) ,
 `owner_num` int(11) ,
 `sale_acreage` decimal(20,2) ,
 `sale_amount` decimal(20,2) ,
 `work_area` varchar(50) ,
 `live_area` varchar(50) ,
 `deal_date` date ,
 `big_area` varchar(30) ,
 `prject_name` varchar(50) ,
 `city_name` varchar(30) ,
 `roomGUID` varchar(64) ,
 `bldGUID` varchar(64) ,
 `cstGUID` bigint(20) ,
 `birth_day` date ,
 `projGUID` varchar(64) ,
 `companyGUID` varchar(64) ,
 `live_format_orig` varchar(50) ,
 `proj_house_type_orig` varchar(50) ,
 `work_area_orig` varchar(50) ,
 `live_area_orig` varchar(50) ,
 `children_num_orig` varchar(50) ,
 `cardID` varchar(128) ,
 `subType` varchar(16) ,
 `cstType` tinyint(4) ,
 `cardType` int(11) ,
 `room_acre_segment` varchar(255) ,
 `cstNum` int(11) ,
 `propertyRate` double(11,3) ,
 `tradeGUID` varchar(60) ,
 `cstOriginPlace` varchar(60) ,
 `cstIndustry` varchar(60) ,
 `cstCurYl` varchar(60) ,
 `jFDate` datetime ,
 `ID` bigint(30) ,
 `ylcode` int(11) ,
 `mjcode` int(11) ,
 `area_id` varchar(30) ,
 `citycode` varchar(30) ,
 `sex` varchar(10) 
)*/;

/*Table structure for table `shhfxb` */

DROP TABLE IF EXISTS `shhfxb`;

/*!50001 DROP VIEW IF EXISTS `shhfxb` */;
/*!50001 DROP TABLE IF EXISTS `shhfxb` */;

/*!50001 CREATE TABLE  `shhfxb`(
 `cityName` varchar(30) ,
 `rq` datetime ,
 `compPromNum` decimal(23,0) ,
 `finishedNum` decimal(23,0) ,
 `timeoFinishedNum` decimal(23,0) ,
 `waitDealPromble` decimal(23,0) 
)*/;

/*Table structure for table `sys_role_function_v1` */

DROP TABLE IF EXISTS `sys_role_function_v1`;

/*!50001 DROP VIEW IF EXISTS `sys_role_function_v1` */;
/*!50001 DROP TABLE IF EXISTS `sys_role_function_v1` */;

/*!50001 CREATE TABLE  `sys_role_function_v1`(
 `role_id` int(11) ,
 `function_id` int(11) 
)*/;

/*Table structure for table `sys_role_function_v2` */

DROP TABLE IF EXISTS `sys_role_function_v2`;

/*!50001 DROP VIEW IF EXISTS `sys_role_function_v2` */;
/*!50001 DROP TABLE IF EXISTS `sys_role_function_v2` */;

/*!50001 CREATE TABLE  `sys_role_function_v2`(
 `role_id` int(11) ,
 `function_id` int(11) 
)*/;

/*Table structure for table `v_cst_customer` */

DROP TABLE IF EXISTS `v_cst_customer`;

/*!50001 DROP VIEW IF EXISTS `v_cst_customer` */;
/*!50001 DROP TABLE IF EXISTS `v_cst_customer` */;

/*!50001 CREATE TABLE  `v_cst_customer`(
 `cstGUID` bigint(20) ,
 `cstName` varchar(64) ,
 `gender` tinyint(4) ,
 `birthDate` datetime ,
 `cstType` tinyint(4) ,
 `cardType` int(11) ,
 `cardID` varchar(128) ,
 `mobileTel` varchar(32) ,
 `officeTel` varchar(32) ,
 `homeTel` varchar(32) ,
 `sourceApp` varchar(64) ,
 `sourceBiz` varchar(64) ,
 `activitySource` varchar(16) ,
 `isMerge` int(11) ,
 `isMaster` int(11) ,
 `contact` mediumtext ,
 `myGUIDList` mediumtext ,
 `address` varchar(400) ,
 `createTime` datetime ,
 `modifyTime` datetime 
)*/;

/*Table structure for table `v_cst_guidmapping` */

DROP TABLE IF EXISTS `v_cst_guidmapping`;

/*!50001 DROP VIEW IF EXISTS `v_cst_guidmapping` */;
/*!50001 DROP TABLE IF EXISTS `v_cst_guidmapping` */;

/*!50001 CREATE TABLE  `v_cst_guidmapping`(
 `myGUID` varchar(64) ,
 `cstGUID` bigint(20) ,
 `sourceBiz` varchar(64) ,
 `subSource` varchar(64) ,
 `createTime` datetime ,
 `modifyTime` timestamp 
)*/;

/*Table structure for table `v_org_city_area` */

DROP TABLE IF EXISTS `v_org_city_area`;

/*!50001 DROP VIEW IF EXISTS `v_org_city_area` */;
/*!50001 DROP TABLE IF EXISTS `v_org_city_area` */;

/*!50001 CREATE TABLE  `v_org_city_area`(
 `city_code` varchar(64) ,
 `city_name` varchar(128) ,
 `big_code` varchar(64) ,
 `big_name` varchar(128) 
)*/;

/*Table structure for table `v_prj_commpany_area_old` */

DROP TABLE IF EXISTS `v_prj_commpany_area_old`;

/*!50001 DROP VIEW IF EXISTS `v_prj_commpany_area_old` */;
/*!50001 DROP TABLE IF EXISTS `v_prj_commpany_area_old` */;

/*!50001 CREATE TABLE  `v_prj_commpany_area_old`(
 `ProjGUID` varchar(64) ,
 `ProjName` varchar(512) ,
 `companyGUID` varchar(40) ,
 `hierarchyCode` varchar(512) ,
 `area_id` varchar(512) ,
 `cityCode` varchar(512) 
)*/;

/*Table structure for table `v_proj_area_city_name_new` */

DROP TABLE IF EXISTS `v_proj_area_city_name_new`;

/*!50001 DROP VIEW IF EXISTS `v_proj_area_city_name_new` */;
/*!50001 DROP TABLE IF EXISTS `v_proj_area_city_name_new` */;

/*!50001 CREATE TABLE  `v_proj_area_city_name_new`(
 `projGUID` varchar(64) ,
 `projName` varchar(512) ,
 `city_Code` varchar(40) ,
 `city_name` varchar(128) ,
 `big_code` varchar(64) ,
 `big_name` varchar(128) 
)*/;

/*Table structure for table `v_s_product_order` */

DROP TABLE IF EXISTS `v_s_product_order`;

/*!50001 DROP VIEW IF EXISTS `v_s_product_order` */;
/*!50001 DROP TABLE IF EXISTS `v_s_product_order` */;

/*!50001 CREATE TABLE  `v_s_product_order`(
 `productCode` varchar(128) ,
 `cstGUID` longblob ,
 `cstGUID_All` longblob ,
 `owner_num` bigint(21) 
)*/;

/*Table structure for table `v_s_product_order_desc` */

DROP TABLE IF EXISTS `v_s_product_order_desc`;

/*!50001 DROP VIEW IF EXISTS `v_s_product_order_desc` */;
/*!50001 DROP TABLE IF EXISTS `v_s_product_order_desc` */;

/*!50001 CREATE TABLE  `v_s_product_order_desc`(
 `productCode` varchar(128) ,
 `cstGUID` bigint(20) ,
 `propertyRate` double(11,3) 
)*/;

/*Table structure for table `v_shhfxb` */

DROP TABLE IF EXISTS `v_shhfxb`;

/*!50001 DROP VIEW IF EXISTS `v_shhfxb` */;
/*!50001 DROP TABLE IF EXISTS `v_shhfxb` */;

/*!50001 CREATE TABLE  `v_shhfxb`(
 `cityName` varchar(30) ,
 `compPromNum` decimal(23,0) ,
 `finishedNum` decimal(23,0) ,
 `timeoFinishedNum` decimal(23,0) ,
 `waitDealPromble` decimal(23,0) 
)*/;

/*Table structure for table `v_user_attach_values` */

DROP TABLE IF EXISTS `v_user_attach_values`;

/*!50001 DROP VIEW IF EXISTS `v_user_attach_values` */;
/*!50001 DROP TABLE IF EXISTS `v_user_attach_values` */;

/*!50001 CREATE TABLE  `v_user_attach_values`(
 `cstGUID` bigint(20) ,
 `cst_childnum` varchar(128) ,
 `cst_workarea` varchar(128) ,
 `cst_lifeArea` varchar(128) 
)*/;

/*Table structure for table `v_zgcptz` */

DROP TABLE IF EXISTS `v_zgcptz`;

/*!50001 DROP VIEW IF EXISTS `v_zgcptz` */;
/*!50001 DROP TABLE IF EXISTS `v_zgcptz` */;

/*!50001 CREATE TABLE  `v_zgcptz`(
 `deal_date` date ,
 `orgname` varchar(128) ,
 `countType` varchar(6) ,
 `total` bigint(21) ,
 `countCode` int(0) ,
 `nan` decimal(23,0) ,
 `nv` decimal(23,0) ,
 `wzq` decimal(23,0) ,
 `jl` decimal(23,0) ,
 `jy` decimal(23,0) ,
 `yey` decimal(23,0) ,
 `ysl` decimal(23,0) ,
 `ell` decimal(23,0) ,
 `wz` decimal(23,0) ,
 `el` decimal(23,0) ,
 `ey` decimal(23,0) ,
 `sw1` decimal(23,0) ,
 `sw` decimal(23,0) ,
 `ww` decimal(23,0) ,
 `ls` decimal(23,0) ,
 `nl` decimal(23,0) ,
 `bs` decimal(23,0) ,
 `yf` decimal(23,0) ,
 `pdf` decimal(23,0) ,
 `xgc` decimal(23,0) ,
 `cgc` decimal(23,0) ,
 `wzw` decimal(23,0) ,
 `1s` decimal(23,0) ,
 `2s` decimal(23,0) ,
 `3s` decimal(23,0) ,
 `4s` decimal(23,0) ,
 `5s` decimal(23,0) ,
 `wz1` decimal(23,0) 
)*/;

/*Table structure for table `zgcptz1` */

DROP TABLE IF EXISTS `zgcptz1`;

/*!50001 DROP VIEW IF EXISTS `zgcptz1` */;
/*!50001 DROP TABLE IF EXISTS `zgcptz1` */;

/*!50001 CREATE TABLE  `zgcptz1`(
 `deal_date` date ,
 `countType` varchar(6) ,
 `COUNT(*)` bigint(21) ,
 `countCode` int(0) ,
 `nan` decimal(23,0) ,
 `nv` decimal(23,0) ,
 `wzq` decimal(23,0) ,
 `jl` decimal(23,0) ,
 `jy` decimal(23,0) ,
 `yey` decimal(23,0) ,
 `ysl` decimal(23,0) ,
 `ell` decimal(23,0) ,
 `wz` decimal(23,0) ,
 `el` decimal(23,0) ,
 `ey` decimal(23,0) ,
 `sw1` decimal(23,0) ,
 `sw` decimal(23,0) ,
 `ww` decimal(23,0) ,
 `ls` decimal(23,0) ,
 `nl` decimal(23,0) ,
 `bs` decimal(23,0) ,
 `yf` decimal(23,0) ,
 `pdf` decimal(23,0) ,
 `xgc` decimal(23,0) ,
 `cgc` decimal(23,0) ,
 `wzw` decimal(23,0) ,
 `1s` decimal(23,0) ,
 `2s` decimal(23,0) ,
 `3s` decimal(23,0) ,
 `4s` decimal(23,0) ,
 `5s` decimal(23,0) ,
 `wz1` decimal(23,0) 
)*/;

/*View structure for view cjcptz20160108 */

/*!50001 DROP TABLE IF EXISTS `cjcptz20160108` */;
/*!50001 DROP VIEW IF EXISTS `cjcptz20160108` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=``@`` SQL SECURITY DEFINER VIEW `cjcptz20160108` AS select `report_cst_deal_mid_own`.`age_segment` AS `age_segment`,`report_cst_deal_mid_own`.`room_acre_segment` AS `room_acre_segment`,count(distinct `report_cst_deal_mid_own`.`cstGUID`) AS `csum` from `report_cst_deal_mid_own` group by `report_cst_deal_mid_own`.`age_segment`,`report_cst_deal_mid_own`.`room_acre_segment` */;

/*View structure for view report_cst_deal_mid_own_view */

/*!50001 DROP TABLE IF EXISTS `report_cst_deal_mid_own_view` */;
/*!50001 DROP VIEW IF EXISTS `report_cst_deal_mid_own_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=``@`` SQL SECURITY DEFINER VIEW `report_cst_deal_mid_own_view` AS select (case when ((sysdate() > `t`.`deal_date`) and (sysdate() < `t`.`jFDate`)) then '准业主' when (((sysdate() - `t`.`jFDate`) >= 0) and (sysdate() < (`t`.`jFDate` + interval 1 year))) then '磨合期业主' when ((sysdate() >= (`t`.`jFDate` + interval 1 year)) and (sysdate() < (`t`.`jFDate` + interval 5 year))) then '稳定期业主' when (sysdate() >= (`t`.`jFDate` + interval 5 year)) then '老业主' else '未知' end) AS `ctype`,`t`.`children_num` AS `children_num`,`t`.`age_segment` AS `age_segment`,`t`.`proj_house_type` AS `proj_house_type`,`t`.`live_format` AS `live_format`,`t`.`room_acreage` AS `room_acreage`,`t`.`cst_num` AS `cst_num`,`t`.`owner_num` AS `owner_num`,`t`.`sale_acreage` AS `sale_acreage`,`t`.`sale_amount` AS `sale_amount`,`t`.`work_area` AS `work_area`,`t`.`live_area` AS `live_area`,`t`.`deal_date` AS `deal_date`,`t`.`big_area` AS `big_area`,`t`.`prject_name` AS `prject_name`,`t`.`city_name` AS `city_name`,`t`.`roomGUID` AS `roomGUID`,`t`.`bldGUID` AS `bldGUID`,`t`.`cstGUID` AS `cstGUID`,`t`.`birth_day` AS `birth_day`,`t`.`projGUID` AS `projGUID`,`t`.`companyGUID` AS `companyGUID`,`t`.`live_format_orig` AS `live_format_orig`,`t`.`proj_house_type_orig` AS `proj_house_type_orig`,`t`.`work_area_orig` AS `work_area_orig`,`t`.`live_area_orig` AS `live_area_orig`,`t`.`children_num_orig` AS `children_num_orig`,`t`.`cardID` AS `cardID`,`t`.`subType` AS `subType`,`t`.`cstType` AS `cstType`,`t`.`cardType` AS `cardType`,`t`.`room_acre_segment` AS `room_acre_segment`,`t`.`cstNum` AS `cstNum`,`t`.`propertyRate` AS `propertyRate`,`t`.`tradeGUID` AS `tradeGUID`,`t`.`cstOriginPlace` AS `cstOriginPlace`,`t`.`cstIndustry` AS `cstIndustry`,`t`.`cstCurYl` AS `cstCurYl`,`t`.`jFDate` AS `jFDate`,`t`.`ID` AS `ID`,`t`.`ylcode` AS `ylcode`,`t`.`mjcode` AS `mjcode`,`t`.`area_id` AS `area_id`,`t`.`citycode` AS `citycode`,`t`.`sex` AS `sex` from `report_cst_deal_mid_own` `t` */;

/*View structure for view shhfxb */

/*!50001 DROP TABLE IF EXISTS `shhfxb` */;
/*!50001 DROP VIEW IF EXISTS `shhfxb` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=``@`` SQL SECURITY DEFINER VIEW `shhfxb` AS select `rpt_format_sale_analyse`.`city_name` AS `cityName`,`rpt_format_sale_analyse`.`receivedate` AS `rq`,sum((case when ((`rpt_format_sale_analyse`.`receivedate` >= '2001-01-01') and (`rpt_format_sale_analyse`.`receivedate` <= '2016-12-12')) then 1 else 0 end)) AS `compPromNum`,sum((case when ((`rpt_format_sale_analyse`.`receivedate` >= '2001-01-01') and (`rpt_format_sale_analyse`.`receivedate` <= '2016-12-12') and (`rpt_format_sale_analyse`.`status` = 1) and (`rpt_format_sale_analyse`.`RwwcSj` is not null) and (isnull(`rpt_format_sale_analyse`.`RwclSx`) or (isnull(`rpt_format_sale_analyse`.`RwclSx`) and (`rpt_format_sale_analyse`.`RwwcSj` <= `rpt_format_sale_analyse`.`RwclSx`)))) then 1 else 0 end)) AS `finishedNum`,sum((case when ((`rpt_format_sale_analyse`.`receivedate` >= '2001-01-01') and (`rpt_format_sale_analyse`.`receivedate` <= '2016-12-12') and (`rpt_format_sale_analyse`.`status` = 1) and (`rpt_format_sale_analyse`.`RwwcSj` is not null) and (`rpt_format_sale_analyse`.`RwclSx` is not null) and (`rpt_format_sale_analyse`.`RwwcSj` > `rpt_format_sale_analyse`.`RwclSx`)) then 1 else 0 end)) AS `timeoFinishedNum`,sum((case when (((`rpt_format_sale_analyse`.`RwwcSj` > '2016-12-12') or isnull(`rpt_format_sale_analyse`.`RwwcSj`)) and (`rpt_format_sale_analyse`.`status` = 1) and (`rpt_format_sale_analyse`.`receivedate` <= '2016-12-12')) then 1 else 0 end)) AS `waitDealPromble` from `rpt_format_sale_analyse` group by `rpt_format_sale_analyse`.`city_name`,`rpt_format_sale_analyse`.`receivedate` */;

/*View structure for view sys_role_function_v1 */

/*!50001 DROP TABLE IF EXISTS `sys_role_function_v1` */;
/*!50001 DROP VIEW IF EXISTS `sys_role_function_v1` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=``@`` SQL SECURITY DEFINER VIEW `sys_role_function_v1` AS (select distinct `a`.`role_id` AS `role_id`,`b`.`parent_id` AS `function_id` from (`sys_role_function` `a` join `sys_function` `b` on((`a`.`function_id` = `b`.`function_id`))) where (`b`.`parent_id` <> 0)) */;

/*View structure for view sys_role_function_v2 */

/*!50001 DROP TABLE IF EXISTS `sys_role_function_v2` */;
/*!50001 DROP VIEW IF EXISTS `sys_role_function_v2` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=``@`` SQL SECURITY DEFINER VIEW `sys_role_function_v2` AS (select distinct `a`.`role_id` AS `role_id`,`b`.`parent_id` AS `function_id` from (`sys_role_function_v1` `a` join `sys_function` `b` on((`a`.`function_id` = `b`.`function_id`))) where (`b`.`parent_id` <> 0)) */;

/*View structure for view v_cst_customer */

/*!50001 DROP TABLE IF EXISTS `v_cst_customer` */;
/*!50001 DROP VIEW IF EXISTS `v_cst_customer` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=``@`` SQL SECURITY DEFINER VIEW `v_cst_customer` AS select `cst_customer_0`.`cstGUID` AS `cstGUID`,`cst_customer_0`.`cstName` AS `cstName`,`cst_customer_0`.`gender` AS `gender`,`cst_customer_0`.`birthDate` AS `birthDate`,`cst_customer_0`.`cstType` AS `cstType`,`cst_customer_0`.`cardType` AS `cardType`,`cst_customer_0`.`cardID` AS `cardID`,`cst_customer_0`.`mobileTel` AS `mobileTel`,`cst_customer_0`.`officeTel` AS `officeTel`,`cst_customer_0`.`homeTel` AS `homeTel`,`cst_customer_0`.`sourceApp` AS `sourceApp`,`cst_customer_0`.`sourceBiz` AS `sourceBiz`,`cst_customer_0`.`activitySource` AS `activitySource`,`cst_customer_0`.`isMerge` AS `isMerge`,`cst_customer_0`.`isMaster` AS `isMaster`,`cst_customer_0`.`contact` AS `contact`,`cst_customer_0`.`myGUIDList` AS `myGUIDList`,`cst_customer_0`.`address` AS `address`,`cst_customer_0`.`createTime` AS `createTime`,`cst_customer_0`.`modifyTime` AS `modifyTime` from `cst_customer_0` union all select `cst_customer_1`.`cstGUID` AS `cstGUID`,`cst_customer_1`.`cstName` AS `cstName`,`cst_customer_1`.`gender` AS `gender`,`cst_customer_1`.`birthDate` AS `birthDate`,`cst_customer_1`.`cstType` AS `cstType`,`cst_customer_1`.`cardType` AS `cardType`,`cst_customer_1`.`cardID` AS `cardID`,`cst_customer_1`.`mobileTel` AS `mobileTel`,`cst_customer_1`.`officeTel` AS `officeTel`,`cst_customer_1`.`homeTel` AS `homeTel`,`cst_customer_1`.`sourceApp` AS `sourceApp`,`cst_customer_1`.`sourceBiz` AS `sourceBiz`,`cst_customer_1`.`activitySource` AS `activitySource`,`cst_customer_1`.`isMerge` AS `isMerge`,`cst_customer_1`.`isMaster` AS `isMaster`,`cst_customer_1`.`contact` AS `contact`,`cst_customer_1`.`myGUIDList` AS `myGUIDList`,`cst_customer_1`.`address` AS `address`,`cst_customer_1`.`createTime` AS `createTime`,`cst_customer_1`.`modifyTime` AS `modifyTime` from `cst_customer_1` union all select `cst_customer_2`.`cstGUID` AS `cstGUID`,`cst_customer_2`.`cstName` AS `cstName`,`cst_customer_2`.`gender` AS `gender`,`cst_customer_2`.`birthDate` AS `birthDate`,`cst_customer_2`.`cstType` AS `cstType`,`cst_customer_2`.`cardType` AS `cardType`,`cst_customer_2`.`cardID` AS `cardID`,`cst_customer_2`.`mobileTel` AS `mobileTel`,`cst_customer_2`.`officeTel` AS `officeTel`,`cst_customer_2`.`homeTel` AS `homeTel`,`cst_customer_2`.`sourceApp` AS `sourceApp`,`cst_customer_2`.`sourceBiz` AS `sourceBiz`,`cst_customer_2`.`activitySource` AS `activitySource`,`cst_customer_2`.`isMerge` AS `isMerge`,`cst_customer_2`.`isMaster` AS `isMaster`,`cst_customer_2`.`contact` AS `contact`,`cst_customer_2`.`myGUIDList` AS `myGUIDList`,`cst_customer_2`.`address` AS `address`,`cst_customer_2`.`createTime` AS `createTime`,`cst_customer_2`.`modifyTime` AS `modifyTime` from `cst_customer_2` union all select `cst_customer_3`.`cstGUID` AS `cstGUID`,`cst_customer_3`.`cstName` AS `cstName`,`cst_customer_3`.`gender` AS `gender`,`cst_customer_3`.`birthDate` AS `birthDate`,`cst_customer_3`.`cstType` AS `cstType`,`cst_customer_3`.`cardType` AS `cardType`,`cst_customer_3`.`cardID` AS `cardID`,`cst_customer_3`.`mobileTel` AS `mobileTel`,`cst_customer_3`.`officeTel` AS `officeTel`,`cst_customer_3`.`homeTel` AS `homeTel`,`cst_customer_3`.`sourceApp` AS `sourceApp`,`cst_customer_3`.`sourceBiz` AS `sourceBiz`,`cst_customer_3`.`activitySource` AS `activitySource`,`cst_customer_3`.`isMerge` AS `isMerge`,`cst_customer_3`.`isMaster` AS `isMaster`,`cst_customer_3`.`contact` AS `contact`,`cst_customer_3`.`myGUIDList` AS `myGUIDList`,`cst_customer_3`.`address` AS `address`,`cst_customer_3`.`createTime` AS `createTime`,`cst_customer_3`.`modifyTime` AS `modifyTime` from `cst_customer_3` union all select `cst_customer_4`.`cstGUID` AS `cstGUID`,`cst_customer_4`.`cstName` AS `cstName`,`cst_customer_4`.`gender` AS `gender`,`cst_customer_4`.`birthDate` AS `birthDate`,`cst_customer_4`.`cstType` AS `cstType`,`cst_customer_4`.`cardType` AS `cardType`,`cst_customer_4`.`cardID` AS `cardID`,`cst_customer_4`.`mobileTel` AS `mobileTel`,`cst_customer_4`.`officeTel` AS `officeTel`,`cst_customer_4`.`homeTel` AS `homeTel`,`cst_customer_4`.`sourceApp` AS `sourceApp`,`cst_customer_4`.`sourceBiz` AS `sourceBiz`,`cst_customer_4`.`activitySource` AS `activitySource`,`cst_customer_4`.`isMerge` AS `isMerge`,`cst_customer_4`.`isMaster` AS `isMaster`,`cst_customer_4`.`contact` AS `contact`,`cst_customer_4`.`myGUIDList` AS `myGUIDList`,`cst_customer_4`.`address` AS `address`,`cst_customer_4`.`createTime` AS `createTime`,`cst_customer_4`.`modifyTime` AS `modifyTime` from `cst_customer_4` union all select `cst_customer_5`.`cstGUID` AS `cstGUID`,`cst_customer_5`.`cstName` AS `cstName`,`cst_customer_5`.`gender` AS `gender`,`cst_customer_5`.`birthDate` AS `birthDate`,`cst_customer_5`.`cstType` AS `cstType`,`cst_customer_5`.`cardType` AS `cardType`,`cst_customer_5`.`cardID` AS `cardID`,`cst_customer_5`.`mobileTel` AS `mobileTel`,`cst_customer_5`.`officeTel` AS `officeTel`,`cst_customer_5`.`homeTel` AS `homeTel`,`cst_customer_5`.`sourceApp` AS `sourceApp`,`cst_customer_5`.`sourceBiz` AS `sourceBiz`,`cst_customer_5`.`activitySource` AS `activitySource`,`cst_customer_5`.`isMerge` AS `isMerge`,`cst_customer_5`.`isMaster` AS `isMaster`,`cst_customer_5`.`contact` AS `contact`,`cst_customer_5`.`myGUIDList` AS `myGUIDList`,`cst_customer_5`.`address` AS `address`,`cst_customer_5`.`createTime` AS `createTime`,`cst_customer_5`.`modifyTime` AS `modifyTime` from `cst_customer_5` union all select `cst_customer_6`.`cstGUID` AS `cstGUID`,`cst_customer_6`.`cstName` AS `cstName`,`cst_customer_6`.`gender` AS `gender`,`cst_customer_6`.`birthDate` AS `birthDate`,`cst_customer_6`.`cstType` AS `cstType`,`cst_customer_6`.`cardType` AS `cardType`,`cst_customer_6`.`cardID` AS `cardID`,`cst_customer_6`.`mobileTel` AS `mobileTel`,`cst_customer_6`.`officeTel` AS `officeTel`,`cst_customer_6`.`homeTel` AS `homeTel`,`cst_customer_6`.`sourceApp` AS `sourceApp`,`cst_customer_6`.`sourceBiz` AS `sourceBiz`,`cst_customer_6`.`activitySource` AS `activitySource`,`cst_customer_6`.`isMerge` AS `isMerge`,`cst_customer_6`.`isMaster` AS `isMaster`,`cst_customer_6`.`contact` AS `contact`,`cst_customer_6`.`myGUIDList` AS `myGUIDList`,`cst_customer_6`.`address` AS `address`,`cst_customer_6`.`createTime` AS `createTime`,`cst_customer_6`.`modifyTime` AS `modifyTime` from `cst_customer_6` union all select `cst_customer_7`.`cstGUID` AS `cstGUID`,`cst_customer_7`.`cstName` AS `cstName`,`cst_customer_7`.`gender` AS `gender`,`cst_customer_7`.`birthDate` AS `birthDate`,`cst_customer_7`.`cstType` AS `cstType`,`cst_customer_7`.`cardType` AS `cardType`,`cst_customer_7`.`cardID` AS `cardID`,`cst_customer_7`.`mobileTel` AS `mobileTel`,`cst_customer_7`.`officeTel` AS `officeTel`,`cst_customer_7`.`homeTel` AS `homeTel`,`cst_customer_7`.`sourceApp` AS `sourceApp`,`cst_customer_7`.`sourceBiz` AS `sourceBiz`,`cst_customer_7`.`activitySource` AS `activitySource`,`cst_customer_7`.`isMerge` AS `isMerge`,`cst_customer_7`.`isMaster` AS `isMaster`,`cst_customer_7`.`contact` AS `contact`,`cst_customer_7`.`myGUIDList` AS `myGUIDList`,`cst_customer_7`.`address` AS `address`,`cst_customer_7`.`createTime` AS `createTime`,`cst_customer_7`.`modifyTime` AS `modifyTime` from `cst_customer_7` union all select `cst_customer_8`.`cstGUID` AS `cstGUID`,`cst_customer_8`.`cstName` AS `cstName`,`cst_customer_8`.`gender` AS `gender`,`cst_customer_8`.`birthDate` AS `birthDate`,`cst_customer_8`.`cstType` AS `cstType`,`cst_customer_8`.`cardType` AS `cardType`,`cst_customer_8`.`cardID` AS `cardID`,`cst_customer_8`.`mobileTel` AS `mobileTel`,`cst_customer_8`.`officeTel` AS `officeTel`,`cst_customer_8`.`homeTel` AS `homeTel`,`cst_customer_8`.`sourceApp` AS `sourceApp`,`cst_customer_8`.`sourceBiz` AS `sourceBiz`,`cst_customer_8`.`activitySource` AS `activitySource`,`cst_customer_8`.`isMerge` AS `isMerge`,`cst_customer_8`.`isMaster` AS `isMaster`,`cst_customer_8`.`contact` AS `contact`,`cst_customer_8`.`myGUIDList` AS `myGUIDList`,`cst_customer_8`.`address` AS `address`,`cst_customer_8`.`createTime` AS `createTime`,`cst_customer_8`.`modifyTime` AS `modifyTime` from `cst_customer_8` union all select `cst_customer_9`.`cstGUID` AS `cstGUID`,`cst_customer_9`.`cstName` AS `cstName`,`cst_customer_9`.`gender` AS `gender`,`cst_customer_9`.`birthDate` AS `birthDate`,`cst_customer_9`.`cstType` AS `cstType`,`cst_customer_9`.`cardType` AS `cardType`,`cst_customer_9`.`cardID` AS `cardID`,`cst_customer_9`.`mobileTel` AS `mobileTel`,`cst_customer_9`.`officeTel` AS `officeTel`,`cst_customer_9`.`homeTel` AS `homeTel`,`cst_customer_9`.`sourceApp` AS `sourceApp`,`cst_customer_9`.`sourceBiz` AS `sourceBiz`,`cst_customer_9`.`activitySource` AS `activitySource`,`cst_customer_9`.`isMerge` AS `isMerge`,`cst_customer_9`.`isMaster` AS `isMaster`,`cst_customer_9`.`contact` AS `contact`,`cst_customer_9`.`myGUIDList` AS `myGUIDList`,`cst_customer_9`.`address` AS `address`,`cst_customer_9`.`createTime` AS `createTime`,`cst_customer_9`.`modifyTime` AS `modifyTime` from `cst_customer_9` */;

/*View structure for view v_cst_guidmapping */

/*!50001 DROP TABLE IF EXISTS `v_cst_guidmapping` */;
/*!50001 DROP VIEW IF EXISTS `v_cst_guidmapping` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=``@`` SQL SECURITY DEFINER VIEW `v_cst_guidmapping` AS select `cst_guidmapping_0`.`myGUID` AS `myGUID`,`cst_guidmapping_0`.`cstGUID` AS `cstGUID`,`cst_guidmapping_0`.`sourceBiz` AS `sourceBiz`,`cst_guidmapping_0`.`subSource` AS `subSource`,`cst_guidmapping_0`.`createTime` AS `createTime`,`cst_guidmapping_0`.`modifyTime` AS `modifyTime` from `cst_guidmapping_0` union all select `cst_guidmapping_1`.`myGUID` AS `myGUID`,`cst_guidmapping_1`.`cstGUID` AS `cstGUID`,`cst_guidmapping_1`.`sourceBiz` AS `sourceBiz`,`cst_guidmapping_1`.`subSource` AS `subSource`,`cst_guidmapping_1`.`createTime` AS `createTime`,`cst_guidmapping_1`.`modifyTime` AS `modifyTime` from `cst_guidmapping_1` union all select `cst_guidmapping_2`.`myGUID` AS `myGUID`,`cst_guidmapping_2`.`cstGUID` AS `cstGUID`,`cst_guidmapping_2`.`sourceBiz` AS `sourceBiz`,`cst_guidmapping_2`.`subSource` AS `subSource`,`cst_guidmapping_2`.`createTime` AS `createTime`,`cst_guidmapping_2`.`modifyTime` AS `modifyTime` from `cst_guidmapping_2` union all select `cst_guidmapping_3`.`myGUID` AS `myGUID`,`cst_guidmapping_3`.`cstGUID` AS `cstGUID`,`cst_guidmapping_3`.`sourceBiz` AS `sourceBiz`,`cst_guidmapping_3`.`subSource` AS `subSource`,`cst_guidmapping_3`.`createTime` AS `createTime`,`cst_guidmapping_3`.`modifyTime` AS `modifyTime` from `cst_guidmapping_3` union all select `cst_guidmapping_4`.`myGUID` AS `myGUID`,`cst_guidmapping_4`.`cstGUID` AS `cstGUID`,`cst_guidmapping_4`.`sourceBiz` AS `sourceBiz`,`cst_guidmapping_4`.`subSource` AS `subSource`,`cst_guidmapping_4`.`createTime` AS `createTime`,`cst_guidmapping_4`.`modifyTime` AS `modifyTime` from `cst_guidmapping_4` union all select `cst_guidmapping_5`.`myGUID` AS `myGUID`,`cst_guidmapping_5`.`cstGUID` AS `cstGUID`,`cst_guidmapping_5`.`sourceBiz` AS `sourceBiz`,`cst_guidmapping_5`.`subSource` AS `subSource`,`cst_guidmapping_5`.`createTime` AS `createTime`,`cst_guidmapping_5`.`modifyTime` AS `modifyTime` from `cst_guidmapping_5` union all select `cst_guidmapping_6`.`myGUID` AS `myGUID`,`cst_guidmapping_6`.`cstGUID` AS `cstGUID`,`cst_guidmapping_6`.`sourceBiz` AS `sourceBiz`,`cst_guidmapping_6`.`subSource` AS `subSource`,`cst_guidmapping_6`.`createTime` AS `createTime`,`cst_guidmapping_6`.`modifyTime` AS `modifyTime` from `cst_guidmapping_6` union all select `cst_guidmapping_7`.`myGUID` AS `myGUID`,`cst_guidmapping_7`.`cstGUID` AS `cstGUID`,`cst_guidmapping_7`.`sourceBiz` AS `sourceBiz`,`cst_guidmapping_7`.`subSource` AS `subSource`,`cst_guidmapping_7`.`createTime` AS `createTime`,`cst_guidmapping_7`.`modifyTime` AS `modifyTime` from `cst_guidmapping_7` union all select `cst_guidmapping_8`.`myGUID` AS `myGUID`,`cst_guidmapping_8`.`cstGUID` AS `cstGUID`,`cst_guidmapping_8`.`sourceBiz` AS `sourceBiz`,`cst_guidmapping_8`.`subSource` AS `subSource`,`cst_guidmapping_8`.`createTime` AS `createTime`,`cst_guidmapping_8`.`modifyTime` AS `modifyTime` from `cst_guidmapping_8` union all select `cst_guidmapping_9`.`myGUID` AS `myGUID`,`cst_guidmapping_9`.`cstGUID` AS `cstGUID`,`cst_guidmapping_9`.`sourceBiz` AS `sourceBiz`,`cst_guidmapping_9`.`subSource` AS `subSource`,`cst_guidmapping_9`.`createTime` AS `createTime`,`cst_guidmapping_9`.`modifyTime` AS `modifyTime` from `cst_guidmapping_9` union all select `cst_guidmapping_a`.`myGUID` AS `myGUID`,`cst_guidmapping_a`.`cstGUID` AS `cstGUID`,`cst_guidmapping_a`.`sourceBiz` AS `sourceBiz`,`cst_guidmapping_a`.`subSource` AS `subSource`,`cst_guidmapping_a`.`createTime` AS `createTime`,`cst_guidmapping_a`.`modifyTime` AS `modifyTime` from `cst_guidmapping_a` union all select `cst_guidmapping_b`.`myGUID` AS `myGUID`,`cst_guidmapping_b`.`cstGUID` AS `cstGUID`,`cst_guidmapping_b`.`sourceBiz` AS `sourceBiz`,`cst_guidmapping_b`.`subSource` AS `subSource`,`cst_guidmapping_b`.`createTime` AS `createTime`,`cst_guidmapping_b`.`modifyTime` AS `modifyTime` from `cst_guidmapping_b` union all select `cst_guidmapping_c`.`myGUID` AS `myGUID`,`cst_guidmapping_c`.`cstGUID` AS `cstGUID`,`cst_guidmapping_c`.`sourceBiz` AS `sourceBiz`,`cst_guidmapping_c`.`subSource` AS `subSource`,`cst_guidmapping_c`.`createTime` AS `createTime`,`cst_guidmapping_c`.`modifyTime` AS `modifyTime` from `cst_guidmapping_c` union all select `cst_guidmapping_d`.`myGUID` AS `myGUID`,`cst_guidmapping_d`.`cstGUID` AS `cstGUID`,`cst_guidmapping_d`.`sourceBiz` AS `sourceBiz`,`cst_guidmapping_d`.`subSource` AS `subSource`,`cst_guidmapping_d`.`createTime` AS `createTime`,`cst_guidmapping_d`.`modifyTime` AS `modifyTime` from `cst_guidmapping_d` union all select `cst_guidmapping_e`.`myGUID` AS `myGUID`,`cst_guidmapping_e`.`cstGUID` AS `cstGUID`,`cst_guidmapping_e`.`sourceBiz` AS `sourceBiz`,`cst_guidmapping_e`.`subSource` AS `subSource`,`cst_guidmapping_e`.`createTime` AS `createTime`,`cst_guidmapping_e`.`modifyTime` AS `modifyTime` from `cst_guidmapping_e` union all select `cst_guidmapping_f`.`myGUID` AS `myGUID`,`cst_guidmapping_f`.`cstGUID` AS `cstGUID`,`cst_guidmapping_f`.`sourceBiz` AS `sourceBiz`,`cst_guidmapping_f`.`subSource` AS `subSource`,`cst_guidmapping_f`.`createTime` AS `createTime`,`cst_guidmapping_f`.`modifyTime` AS `modifyTime` from `cst_guidmapping_f` */;

/*View structure for view v_org_city_area */

/*!50001 DROP TABLE IF EXISTS `v_org_city_area` */;
/*!50001 DROP VIEW IF EXISTS `v_org_city_area` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=``@`` SQL SECURITY DEFINER VIEW `v_org_city_area` AS select `a`.`orgGUID` AS `city_code`,`a`.`orgName` AS `city_name`,`b`.`orgGUID` AS `big_code`,`b`.`orgName` AS `big_name` from (`b_org` `a` left join `b_org` `b` on((`a`.`parentGUID` = `b`.`orgGUID`))) where (`a`.`subType` = 3) */;

/*View structure for view v_prj_commpany_area_old */

/*!50001 DROP TABLE IF EXISTS `v_prj_commpany_area_old` */;
/*!50001 DROP VIEW IF EXISTS `v_prj_commpany_area_old` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=``@`` SQL SECURITY DEFINER VIEW `v_prj_commpany_area_old` AS select `a`.`projGUID` AS `ProjGUID`,`a`.`projName` AS `ProjName`,`a`.`companyGUID` AS `companyGUID`,`b`.`hierarchyCode` AS `hierarchyCode`,substring_index(substring_index(`b`.`hierarchyCode`,'.',2),'.','-1') AS `area_id`,substring_index(substring_index(`b`.`hierarchyCode`,'.',3),'.','-1') AS `cityCode` from (`b_proj` `a` join `b_area_company` `b`) where (`a`.`companyGUID` = `b`.`companyGUID`) */;

/*View structure for view v_proj_area_city_name_new */

/*!50001 DROP TABLE IF EXISTS `v_proj_area_city_name_new` */;
/*!50001 DROP VIEW IF EXISTS `v_proj_area_city_name_new` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=``@`` SQL SECURITY DEFINER VIEW `v_proj_area_city_name_new` AS select `a`.`projGUID` AS `projGUID`,`a`.`projName` AS `projName`,`a`.`companyGUID` AS `city_Code`,`b`.`orgName` AS `city_name`,`c`.`orgGUID` AS `big_code`,`c`.`orgName` AS `big_name` from ((`b_proj` `a` left join `b_org` `b` on((`a`.`companyGUID` = `b`.`orgGUID`))) left join `b_org` `c` on((`c`.`orgGUID` = `b`.`parentGUID`))) */;

/*View structure for view v_s_product_order */

/*!50001 DROP TABLE IF EXISTS `v_s_product_order` */;
/*!50001 DROP VIEW IF EXISTS `v_s_product_order` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=``@`` SQL SECURITY DEFINER VIEW `v_s_product_order` AS select `v_s_product_order_desc`.`productCode` AS `productCode`,substring_index(group_concat(`v_s_product_order_desc`.`cstGUID` separator ','),',',1) AS `cstGUID`,group_concat(`v_s_product_order_desc`.`cstGUID` separator ',') AS `cstGUID_All`,count(1) AS `owner_num` from `v_s_product_order_desc` group by `v_s_product_order_desc`.`productCode` */;

/*View structure for view v_s_product_order_desc */

/*!50001 DROP TABLE IF EXISTS `v_s_product_order_desc` */;
/*!50001 DROP VIEW IF EXISTS `v_s_product_order_desc` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=``@`` SQL SECURITY DEFINER VIEW `v_s_product_order_desc` AS select `d`.`productCode` AS `productCode`,`d`.`cstGUID` AS `cstGUID`,`d`.`propertyRate` AS `propertyRate` from `s_product_order` `d` order by `d`.`productCode`,`d`.`propertyRate` desc */;

/*View structure for view v_shhfxb */

/*!50001 DROP TABLE IF EXISTS `v_shhfxb` */;
/*!50001 DROP VIEW IF EXISTS `v_shhfxb` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=``@`` SQL SECURITY DEFINER VIEW `v_shhfxb` AS select `rpt_format_sale_analyse`.`city_name` AS `cityName`,sum((case when ((`rpt_format_sale_analyse`.`receivedate` >= '2001-01-01') and (`rpt_format_sale_analyse`.`receivedate` <= '2016-12-12')) then 1 else 0 end)) AS `compPromNum`,sum((case when ((`rpt_format_sale_analyse`.`receivedate` >= '2001-01-01') and (`rpt_format_sale_analyse`.`receivedate` <= '2016-12-12') and (`rpt_format_sale_analyse`.`status` = 1) and (`rpt_format_sale_analyse`.`RwwcSj` is not null) and (isnull(`rpt_format_sale_analyse`.`RwclSx`) or (isnull(`rpt_format_sale_analyse`.`RwclSx`) and (`rpt_format_sale_analyse`.`RwwcSj` <= `rpt_format_sale_analyse`.`RwclSx`)))) then 1 else 0 end)) AS `finishedNum`,sum((case when ((`rpt_format_sale_analyse`.`receivedate` >= '2001-01-01') and (`rpt_format_sale_analyse`.`receivedate` <= '2016-12-12') and (`rpt_format_sale_analyse`.`status` = 1) and (`rpt_format_sale_analyse`.`RwwcSj` is not null) and (`rpt_format_sale_analyse`.`RwclSx` is not null) and (`rpt_format_sale_analyse`.`RwwcSj` > `rpt_format_sale_analyse`.`RwclSx`)) then 1 else 0 end)) AS `timeoFinishedNum`,sum((case when (((`rpt_format_sale_analyse`.`RwwcSj` > '2016-12-12') or isnull(`rpt_format_sale_analyse`.`RwwcSj`)) and (`rpt_format_sale_analyse`.`status` = 1) and (`rpt_format_sale_analyse`.`receivedate` <= '2016-12-12')) then 1 else 0 end)) AS `waitDealPromble` from `rpt_format_sale_analyse` group by `rpt_format_sale_analyse`.`city_name` */;

/*View structure for view v_user_attach_values */

/*!50001 DROP TABLE IF EXISTS `v_user_attach_values` */;
/*!50001 DROP VIEW IF EXISTS `v_user_attach_values` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=``@`` SQL SECURITY DEFINER VIEW `v_user_attach_values` AS select `a`.`cstGUID` AS `cstGUID`,max((case `c`.`attachCode` when 'cst_childnum' then `c`.`label` else '' end)) AS `cst_childnum`,max((case `c`.`attachCode` when 'cst_workarea' then `c`.`label` else '' end)) AS `cst_workarea`,max((case `c`.`attachCode` when 'cst_lifeArea' then `c`.`label` else '' end)) AS `cst_lifeArea` from (`cst_attach` `a` left join `b_def_attach_values` `c` on(((`a`.`attachCode` = `c`.`attachCode`) and (`a`.`values` = `c`.`attachKey`)))) group by `a`.`cstGUID` */;

/*View structure for view v_zgcptz */

/*!50001 DROP TABLE IF EXISTS `v_zgcptz` */;
/*!50001 DROP VIEW IF EXISTS `v_zgcptz` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=``@`` SQL SECURITY DEFINER VIEW `v_zgcptz` AS select `rpt_cst_repeat_buy_detail`.`deal_date` AS `deal_date`,`b`.`orgName` AS `orgname`,(case when (`rpt_cst_repeat_buy_detail`.`big_code` = '23C065B7-58AC-4AC0-8020-FEED208ACF41') then '华东区域总部' when (`rpt_cst_repeat_buy_detail`.`big_code` = '14A2BCEA-2E37-427C-968C-EF266628CD42') then '华中区域总部' when (`rpt_cst_repeat_buy_detail`.`big_code` = 'B581FE54-6018-4AB0-B091-DF6FE22FB3A6') then '华北区域总部' when (`rpt_cst_repeat_buy_detail`.`big_code` = 'F9ADB9FD-628F-43C0-B0CD-3D1805F71FA8') then '华南区域总部' end) AS `countType`,count(0) AS `total`,(case when (`rpt_cst_repeat_buy_detail`.`big_code` = '23C065B7-58AC-4AC0-8020-FEED208ACF41') then 1 when (`rpt_cst_repeat_buy_detail`.`big_code` = '14A2BCEA-2E37-427C-968C-EF266628CD42') then 2 when (`rpt_cst_repeat_buy_detail`.`big_code` = 'B581FE54-6018-4AB0-B091-DF6FE22FB3A6') then 3 when (`rpt_cst_repeat_buy_detail`.`big_code` = 'F9ADB9FD-628F-43C0-B0CD-3D1805F71FA8') then 4 end) AS `countCode`,sum((case when (`rpt_cst_repeat_buy_detail`.`sex` = '男') then 1 else 0 end)) AS `nan`,sum((case when (`rpt_cst_repeat_buy_detail`.`sex` = '女') then 1 else 0 end)) AS `nv`,sum((case when ((`rpt_cst_repeat_buy_detail`.`sex` = '未知') or (`rpt_cst_repeat_buy_detail`.`sex` = NULL) or (`rpt_cst_repeat_buy_detail`.`sex` = '')) then 1 else 0 end)) AS `wzq`,sum((case when (`rpt_cst_repeat_buy_detail`.`room_acre_segment` = '90㎡以下') then 1 else 0 end)) AS `jl`,sum((case when (`rpt_cst_repeat_buy_detail`.`room_acre_segment` = '91-120㎡') then 1 else 0 end)) AS `jy`,sum((case when (`rpt_cst_repeat_buy_detail`.`room_acre_segment` = '121-145㎡') then 1 else 0 end)) AS `yey`,sum((case when (`rpt_cst_repeat_buy_detail`.`room_acre_segment` = '146-200㎡') then 1 else 0 end)) AS `ysl`,sum((case when (`rpt_cst_repeat_buy_detail`.`room_acre_segment` = '200㎡以上') then 1 else 0 end)) AS `ell`,sum((case when ((`rpt_cst_repeat_buy_detail`.`room_acre_segment` = '未知') or isnull(`rpt_cst_repeat_buy_detail`.`room_acre_segment`) or (`rpt_cst_repeat_buy_detail`.`room_acre_segment` = '')) then 1 else 0 end)) AS `wz`,sum((case when (`rpt_cst_repeat_buy_detail`.`cstCurYl` = '20岁以下') then 1 else 0 end)) AS `el`,sum((case when (`rpt_cst_repeat_buy_detail`.`cstCurYl` = '21-34岁') then 1 else 0 end)) AS `ey`,sum((case when (`rpt_cst_repeat_buy_detail`.`cstCurYl` = '35-44岁') then 1 else 0 end)) AS `sw1`,sum((case when (`rpt_cst_repeat_buy_detail`.`cstCurYl` = '45-54岁') then 1 else 0 end)) AS `sw`,sum((case when (`rpt_cst_repeat_buy_detail`.`cstCurYl` = '55-64岁') then 1 else 0 end)) AS `ww`,sum((case when (`rpt_cst_repeat_buy_detail`.`cstCurYl` = '64岁以上') then 1 else 0 end)) AS `ls`,sum((case when ((`rpt_cst_repeat_buy_detail`.`cstCurYl` = '未知') or isnull(`rpt_cst_repeat_buy_detail`.`cstCurYl`) or (`rpt_cst_repeat_buy_detail`.`cstCurYl` = '')) then 1 else 0 end)) AS `nl`,sum((case when (`rpt_cst_repeat_buy_detail`.`product_type` = '别墅') then 1 else 0 end)) AS `bs`,sum((case when (`rpt_cst_repeat_buy_detail`.`product_type` = '洋房') then 1 else 0 end)) AS `yf`,sum((case when (`rpt_cst_repeat_buy_detail`.`product_type` = '普通多房') then 1 else 0 end)) AS `pdf`,sum((case when (`rpt_cst_repeat_buy_detail`.`product_type` = '小高层') then 1 else 0 end)) AS `xgc`,sum((case when (`rpt_cst_repeat_buy_detail`.`product_type` = '超高层') then 1 else 0 end)) AS `cgc`,sum((case when ((`rpt_cst_repeat_buy_detail`.`product_type` = '未知') or isnull(`rpt_cst_repeat_buy_detail`.`product_type`) or (`rpt_cst_repeat_buy_detail`.`product_type` = '')) then 1 else 0 end)) AS `wzw`,sum((case when (`rpt_cst_repeat_buy_detail`.`proj_house_type` = '1室') then 1 else 0 end)) AS `1s`,sum((case when (`rpt_cst_repeat_buy_detail`.`proj_house_type` = '2室') then 1 else 0 end)) AS `2s`,sum((case when (`rpt_cst_repeat_buy_detail`.`proj_house_type` = '3室') then 1 else 0 end)) AS `3s`,sum((case when (`rpt_cst_repeat_buy_detail`.`proj_house_type` = '4室') then 1 else 0 end)) AS `4s`,sum((case when (`rpt_cst_repeat_buy_detail`.`proj_house_type` = '5室以上') then 1 else 0 end)) AS `5s`,sum((case when ((`rpt_cst_repeat_buy_detail`.`proj_house_type` = '未知') or isnull(`rpt_cst_repeat_buy_detail`.`proj_house_type`) or (`rpt_cst_repeat_buy_detail`.`proj_house_type` = '')) then 1 else 0 end)) AS `wz1` from (`rpt_cst_repeat_buy_detail` left join `b_org` `b` on((`b`.`orgGUID` = `rpt_cst_repeat_buy_detail`.`city_code`))) group by (case when (`rpt_cst_repeat_buy_detail`.`big_code` = '23C065B7-58AC-4AC0-8020-FEED208ACF41') then '华东区域总部' when (`rpt_cst_repeat_buy_detail`.`big_code` = '14A2BCEA-2E37-427C-968C-EF266628CD42') then '华中区域总部' when (`rpt_cst_repeat_buy_detail`.`big_code` = 'B581FE54-6018-4AB0-B091-DF6FE22FB3A6') then '华北区域总部' when (`rpt_cst_repeat_buy_detail`.`big_code` = 'F9ADB9FD-628F-43C0-B0CD-3D1805F71FA8') then '华南区域总部' end),`rpt_cst_repeat_buy_detail`.`deal_date`,`b`.`orgName` having (`countType` is not null) */;

/*View structure for view zgcptz1 */

/*!50001 DROP TABLE IF EXISTS `zgcptz1` */;
/*!50001 DROP VIEW IF EXISTS `zgcptz1` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=``@`` SQL SECURITY DEFINER VIEW `zgcptz1` AS select `rpt_cst_repeat_buy_detail`.`deal_date` AS `deal_date`,(case when (`rpt_cst_repeat_buy_detail`.`big_code` = '23C065B7-58AC-4AC0-8020-FEED208ACF41') then '华东区域总部' when (`rpt_cst_repeat_buy_detail`.`big_code` = '14A2BCEA-2E37-427C-968C-EF266628CD42') then '华中区域总部' when (`rpt_cst_repeat_buy_detail`.`big_code` = 'B581FE54-6018-4AB0-B091-DF6FE22FB3A6') then '华北区域总部' when (`rpt_cst_repeat_buy_detail`.`big_code` = 'F9ADB9FD-628F-43C0-B0CD-3D1805F71FA8') then '华南区域总部' end) AS `countType`,count(0) AS `COUNT(*)`,(case when (`rpt_cst_repeat_buy_detail`.`big_code` = '23C065B7-58AC-4AC0-8020-FEED208ACF41') then 1 when (`rpt_cst_repeat_buy_detail`.`big_code` = '14A2BCEA-2E37-427C-968C-EF266628CD42') then 2 when (`rpt_cst_repeat_buy_detail`.`big_code` = 'B581FE54-6018-4AB0-B091-DF6FE22FB3A6') then 3 when (`rpt_cst_repeat_buy_detail`.`big_code` = 'F9ADB9FD-628F-43C0-B0CD-3D1805F71FA8') then 4 end) AS `countCode`,sum((case when (`rpt_cst_repeat_buy_detail`.`sex` = '男') then 1 else 0 end)) AS `nan`,sum((case when (`rpt_cst_repeat_buy_detail`.`sex` = '女') then 1 else 0 end)) AS `nv`,sum((case when ((`rpt_cst_repeat_buy_detail`.`sex` = '未知') or (`rpt_cst_repeat_buy_detail`.`sex` = NULL) or (`rpt_cst_repeat_buy_detail`.`sex` = '')) then 1 else 0 end)) AS `wzq`,sum((case when (`rpt_cst_repeat_buy_detail`.`room_acre_segment` = '90㎡以下') then 1 else 0 end)) AS `jl`,sum((case when (`rpt_cst_repeat_buy_detail`.`room_acre_segment` = '91-120㎡') then 1 else 0 end)) AS `jy`,sum((case when (`rpt_cst_repeat_buy_detail`.`room_acre_segment` = '121-145㎡') then 1 else 0 end)) AS `yey`,sum((case when (`rpt_cst_repeat_buy_detail`.`room_acre_segment` = '146-200㎡') then 1 else 0 end)) AS `ysl`,sum((case when (`rpt_cst_repeat_buy_detail`.`room_acre_segment` = '200㎡以上') then 1 else 0 end)) AS `ell`,sum((case when ((`rpt_cst_repeat_buy_detail`.`room_acre_segment` = '未知') or isnull(`rpt_cst_repeat_buy_detail`.`room_acre_segment`) or (`rpt_cst_repeat_buy_detail`.`room_acre_segment` = '')) then 1 else 0 end)) AS `wz`,sum((case when (`rpt_cst_repeat_buy_detail`.`cstCurYl` = '20岁以下') then 1 else 0 end)) AS `el`,sum((case when (`rpt_cst_repeat_buy_detail`.`cstCurYl` = '21-34岁') then 1 else 0 end)) AS `ey`,sum((case when (`rpt_cst_repeat_buy_detail`.`cstCurYl` = '35-44岁') then 1 else 0 end)) AS `sw1`,sum((case when (`rpt_cst_repeat_buy_detail`.`cstCurYl` = '45-54岁') then 1 else 0 end)) AS `sw`,sum((case when (`rpt_cst_repeat_buy_detail`.`cstCurYl` = '55-64岁') then 1 else 0 end)) AS `ww`,sum((case when (`rpt_cst_repeat_buy_detail`.`cstCurYl` = '64岁以上') then 1 else 0 end)) AS `ls`,sum((case when ((`rpt_cst_repeat_buy_detail`.`cstCurYl` = '未知') or isnull(`rpt_cst_repeat_buy_detail`.`cstCurYl`) or (`rpt_cst_repeat_buy_detail`.`cstCurYl` = '')) then 1 else 0 end)) AS `nl`,sum((case when (`rpt_cst_repeat_buy_detail`.`product_type` = '别墅') then 1 else 0 end)) AS `bs`,sum((case when (`rpt_cst_repeat_buy_detail`.`product_type` = '洋房') then 1 else 0 end)) AS `yf`,sum((case when (`rpt_cst_repeat_buy_detail`.`product_type` = '普通多房') then 1 else 0 end)) AS `pdf`,sum((case when (`rpt_cst_repeat_buy_detail`.`product_type` = '小高层') then 1 else 0 end)) AS `xgc`,sum((case when (`rpt_cst_repeat_buy_detail`.`product_type` = '超高层') then 1 else 0 end)) AS `cgc`,sum((case when ((`rpt_cst_repeat_buy_detail`.`product_type` = '未知') or isnull(`rpt_cst_repeat_buy_detail`.`product_type`) or (`rpt_cst_repeat_buy_detail`.`product_type` = '')) then 1 else 0 end)) AS `wzw`,sum((case when (`rpt_cst_repeat_buy_detail`.`proj_house_type` = '1室') then 1 else 0 end)) AS `1s`,sum((case when (`rpt_cst_repeat_buy_detail`.`proj_house_type` = '2室') then 1 else 0 end)) AS `2s`,sum((case when (`rpt_cst_repeat_buy_detail`.`proj_house_type` = '3室') then 1 else 0 end)) AS `3s`,sum((case when (`rpt_cst_repeat_buy_detail`.`proj_house_type` = '4室') then 1 else 0 end)) AS `4s`,sum((case when (`rpt_cst_repeat_buy_detail`.`proj_house_type` = '5室以上') then 1 else 0 end)) AS `5s`,sum((case when ((`rpt_cst_repeat_buy_detail`.`proj_house_type` = '未知') or isnull(`rpt_cst_repeat_buy_detail`.`proj_house_type`) or (`rpt_cst_repeat_buy_detail`.`proj_house_type` = '')) then 1 else 0 end)) AS `wz1` from `rpt_cst_repeat_buy_detail` group by (case when (`rpt_cst_repeat_buy_detail`.`big_code` = '23C065B7-58AC-4AC0-8020-FEED208ACF41') then '华东区域总部' when (`rpt_cst_repeat_buy_detail`.`big_code` = '14A2BCEA-2E37-427C-968C-EF266628CD42') then '华中区域总部' when (`rpt_cst_repeat_buy_detail`.`big_code` = 'B581FE54-6018-4AB0-B091-DF6FE22FB3A6') then '华北区域总部' when (`rpt_cst_repeat_buy_detail`.`big_code` = 'F9ADB9FD-628F-43C0-B0CD-3D1805F71FA8') then '华南区域总部' end),`rpt_cst_repeat_buy_detail`.`deal_date` having (`countType` is not null) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
