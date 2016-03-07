# BI-Analysis
SpringMVC+mybaits+anguljs+html5+mysql+nodejs+BO报表+Mavne 集成的大数据地产分析项目


《招商项目模块分析》
项目模块报告





        姓    名：刘迪  
        部    门：行业大数据平台应用部
        提交日期：2016年03月07日




概   要

本文介绍了招商项目的各模块业务逻辑以及定义数据库各模块的关联，可以做为技术文档和实施文档使用






目  录

第一章 客户	1
1.1客户查询详细分解	3
1.2客户画像基本信息分解	4-9
1.3客户特征描摹分解	10-16
1.4客户轨迹详细分解	17-19
1.5客户关系信息详细分解	20-21
1.6客户关联房产画像详细分解	22-28
1.7客户关联房产画像详细分布表	29
1.8简单的客户测试脚本备份	30-34
个人总结	35
致谢	36
参考文献	37















第一章  客户
1.1客户查询详细分解
 
查询条件来源于cst_customer_0,1,2,3,4,5,6,7,8,9,10
 
模拟数据sql列子  （客户cstGUID = 321097）为列子
insert into `cst_customer_7` (`cstGUID`, `cstName`, `gender`, `birthDate`, `cstType`, `cardType`, `cardID`, `mobileTel`, `officeTel`, `homeTel`, `sourceApp`, `sourceBiz`, `activitySource`, `isMerge`, `isMaster`, `contact`, `myGUIDList`, `address`, `createTime`, `modifyTime`) values('321097','郭松华','2','1972-01-01 00:00:00','1','1','410102197201012582','13631671298','','','401','106','','11','0',NULL,'','深圳市蛇口太子路1号新时代广场3楼','2015-10-10 05:29:13','2013-05-08 18:25:46');

这里是cst_customer_7表。


1.2客户基本信息详细分解
 
红色：深圳工作，C级客户，低价值 （标签，贴在客户身上的）
蓝色：客户头像，随性别改变
黄色：地产公司logo
蓝色方框：客户基本信息
客户标签：rpt_l_cst_stand_label_storage表
模拟数据sql列子：（客户cstGUID = 321097）为列子
insert into `rpt_l_cst_stand_label_storage` (`ID`, `cstGUID`, `cstName`, `labeltype`, `labelGUID`, `labelName`, `createTime`, `cst_mobile`, `cst_email`, `cst_address`) values('0','321097',NULL,'区域位置','LB001','深圳工作',NULL,NULL,NULL,NULL); 
insert into `rpt_l_cst_stand_label_storage` (`ID`, `cstGUID`, `cstName`, `labeltype`, `labelGUID`, `labelName`, `createTime`, `cst_mobile`, `cst_email`, `cst_address`) values('0','321097',NULL,'意向等级','LB005','C级客户',NULL,NULL,NULL,NULL); 
insert into `rpt_l_cst_stand_label_storage` (`ID`, `cstGUID`, `cstName`, `labeltype`, `labelGUID`, `labelName`, `createTime`, `cst_mobile`, `cst_email`, `cst_address`) values('0','321097',NULL,'客户资产','LB007_1','低价值',NULL,NULL,NULL,NULL);

 

客户基本信息：
SELECT cc.cstguid cstguid, cc.cstname cstname, 
cc.gender gender, cc.birthdate birthdate, 
cc.csttype csttype, cc.cardtype cardtype, 
cc.cardid cardid, cc.mobiletel mobiletel, 
cc.officetel officetel, cc.hometel hometel, 
cc.sourceapp sourceapp, cc.sourcebiz sourcebiz, 
cc.activitysource activitysource, cc.ismerge ismerge, 
cc.ismaster ismaster, cc.contact contact, 
cc.myguidlist myguidlist, cc.address address, 
cc.createtime createtime, cc.modifytime modifytime, 
cm.memCode memCode FROM cst_customer_7 cc 
LEFT JOIN 
cst_member cm ON cc.cstguid = cm.cstGUID 
WHERE cc.cstguid = 321097
模拟数据sql列子：  （客户cstGUID = 321097）为列子
insert into `cst_customer_7` (`cstGUID`, `cstName`, `gender`, `birthDate`, `cstType`, `cardType`, `cardID`, `mobileTel`, `officeTel`, `homeTel`, `sourceApp`, `sourceBiz`, `activitySource`, `isMerge`, `isMaster`, `contact`, `myGUIDList`, `address`, `createTime`, `modifyTime`) values('321097','郭松华','2','1972-01-01 00:00:00','1','1','410102197201012582','13631671298','','','401','106','','11','0',NULL,'','深圳市蛇口太子路1号新时代广场3楼','2015-10-10 05:29:13','2013-05-08 18:25:46');
因为是多分表一起查询，所以造数据还要看分表cst_customer等
 


关联房产：rpt_b_proj_sum (项目汇总表)，
          b_building（楼栋表）
          b_room(房产表)
rpt_b_proj_sum（projName）+ b_building（bldName）+b_room（room）


客户类别：意向客户 | 已购客户
销售机会表(s_opp)
客户机会表(s_cst_opp)
客户成交表(t_cst_trade)
根据oppGUID【销售机会GUID】+ roomGUID【房间GUID
】 关联客户交易表查询tradeGUID 是否有交易
1.判断他是否有销售机会
2.有销售机会是否有交易信息
3.是否有交易记录

分解过程：
s_opp,s_cst_opp,t_cst_trade,b_proj，b_room

销售机会表  （客户cstGUID = 321097）为列子
SELECT * FROM s_cst_opp WHERE cstGUID = 321097 AND oppGuID IN('1CAA1CA4-62B5-4EA8-B087-4900CE92B04A','47275694-8110-42B5-A47B-127AAB7CA085',
'936B36CD-934E-4075-AAA1-AA9BAC660199');

客户机会表  （客户cstGUID = 321097）为列子
SELECT * FROM s_opp WHERE oppGuID IN('1CAA1CA4-62B5-4EA8-B087-4900CE92B04A','47275694-8110-42B5-A47B-127AAB7CA085',
'936B36CD-934E-4075-AAA1-AA9BAC660199');

项目表  （客户cstGUID = 321097）为列子
SELECT * FROM  b_proj WHERE projGUID IN ('4DCEC66D-8E49-4735-8E5C-10FAE19E6877','48C03362-F2FC-4294-9189-FD2B87E9021B','48C03362-F2FC-4294-9189-FD2B87E9021B');

客户成交表  （客户cstGUID = 321097）为列子
SELECT * FROM t_cst_trade WHERE cstGUID = '321097'

到这里可以判断出是否为意向客户，要造数据就得看
s_opp,s_cst_opp,t_cst_trade,b_room表，oppGUID要一一对应


下面这条是对应着意向特征中的意向项目，所以projGUID 不能乱
SELECT
		bp.projGUID projGUID,
		bp.projName projName
		FROM
		(
		SELECT
		oppGUID
		FROM
		s_cst_opp
		WHERE
		cstGUID = 321097
		AND
		oppGUID != ''
		GROUP BY
		oppGUID
		) cso
		LEFT JOIN
		s_opp so
		ON
		cso.oppGUID = so.oppGUID
		LEFT JOIN
		b_proj bp
		ON
		so.projGUID = bp.projGUID
到处意向类别完毕
模拟数据SQL：
s_opp,s_cst_opp,t_cst_trade,b_proj,b_room
这五张表的projGUID，oppGuID，roomGUID，cstGUID不能随便填，不然意向类别，意向特征都出不来。
sql脚本提供不了，照数据的人要一个表一个表去对应的添加，如果添加的不好会影响到项目的房源查询，房产画像，标签，客户的特征描摹







1.3客户特征描摹详细分解
 
五中不同的颜色代码五中不用的信息
动作分解：
---意向等级
SELECT  * FROM cst_attach_7 WHERE attachCode='cst_opp_huxingIntent' AND cstGUID = 321097  ---意向户型
----意向面积
SELECT  * FROM cst_attach_7 WHERE attachCode='cst_opp_roomAreaIntent'   AND CstGUID=321097
---区域特征
SELECT  * FROM cst_attach_7 WHERE  attachCode='cst_opp_totalIntent'  AND CstGUID=321097
SELECT  * FROM cst_attach_7 WHERE  attachCode='cst_opp_areaIntent' AND CstGUID=321097
SELECT  * FROM cst_attach_7 WHERE  attachCode='cst_lifeArea' AND CstGUID=321097
----房产特征-房产类型：
SELECT a.productCode,b.projGUID,c.bldProPerty,b. FROM s_product_order a
LEFT JOIN b_room b ON a.productCode=b.roomGUID
LEFT JOIN b_building c ON b.bldGUID=c.bldGUID
WHERE cstGUID='321097'  

----房产特征-房产户型：
SELECT a.productCode,b.roomStru FROM s_product_order a
LEFT JOIN b_room b ON a.productCode=b.roomGUID
WHERE cstGUID='321097'  

----房产特征-房产面积：
SELECT a.productCode,b.bldArea FROM s_product_order a
LEFT JOIN b_room b ON a.productCode=b.roomGUID
WHERE cstGUID='321097'  

----房产特征-房产总价：
SELECT a.productCode,b.HtTotal FROM s_product_order a
LEFT JOIN t_contract b ON a.productCode=b.roomGUID	
WHERE a.cstGUID='321097'  

----房产特征-房产区域：
SELECT a.productCode,b.projGUID,c.projArea FROM s_product_order a
LEFT JOIN b_room b ON a.productCode=b.roomGUID	
LEFT JOIN b_proj c ON b.projGUID=c.projGUID
WHERE a.cstGUID='321097'  

----房产特征-房产项目：
SELECT a.productCode,b.projGUID,c.projName FROM s_product_order a
LEFT JOIN b_room b ON a.productCode=b.roomGUID
LEFT JOIN b_proj c ON b.projGUID=c.projGUID
WHERE cstGUID='321097'

客户轨迹
SELECT * FROM s_followrecord_7 WHERE cstGUID='321097';
SELECT * FROM cst_attach_7 WHERE cstGUID='321097';
select * from cst_customer where cstGUID='321097';

----机会表
SELECT * FROM s_cst_opp WHERE cstGUID = 321097 AND oppGUID != '' GROUP BY oppGUID


客户特征描摹模拟sql： （客户cstGUID = 321097）为列子
insert into `cst_attach_7` (`cstGUID`, `projGUID`, `attachCode`, `attachName`, `values`, `remark`, `sourceChannel`, `sourceApp`, `createTime`, `modifyTime`, `userGUID`, `reportTime`, `oriCstGUID`) values('321097','48C03362-F2FC-4294-9189-FD2B87E9021B','cst_opp_roomAreaIntent','意向面积','180-220',NULL,'106','401','2015-10-09 20:23:37','2015-10-11 13:33:11',NULL,NULL,NULL);
insert into `cst_attach_7` (`cstGUID`, `projGUID`, `attachCode`, `attachName`, `values`, `remark`, `sourceChannel`, `sourceApp`, `createTime`, `modifyTime`, `userGUID`, `reportTime`, `oriCstGUID`) values('321097','48C03362-F2FC-4294-9189-FD2B87E9021B','cst_opp_huxingIntent','意向户型','住宅-高层（套内一层）(高层平面-高层平面)',NULL,'106','401','2015-10-09 20:23:37','2015-10-11 13:33:11',NULL,NULL,NULL);
insert into `cst_attach_7` (`cstGUID`, `projGUID`, `attachCode`, `attachName`, `values`, `remark`, `sourceChannel`, `sourceApp`, `createTime`, `modifyTime`, `userGUID`, `reportTime`, `oriCstGUID`) values('321097','48C03362-F2FC-4294-9189-FD2B87E9021B','cst_opp_areaIntent','意向区域','蛇口',NULL,'106','401','2015-10-09 20:23:37','2015-10-11 13:33:11',NULL,NULL,NULL);
insert into `cst_attach_7` (`cstGUID`, `projGUID`, `attachCode`, `attachName`, `values`, `remark`, `sourceChannel`, `sourceApp`, `createTime`, `modifyTime`, `userGUID`, `reportTime`, `oriCstGUID`) values('321097','48C03362-F2FC-4294-9189-FD2B87E9021B','cst_opp_intentLevel','意向级别','C级客户',NULL,'106','401','2015-10-09 20:23:37','2015-10-11 13:33:11',NULL,NULL,NULL);
insert into `cst_attach_7` (`cstGUID`, `projGUID`, `attachCode`, `attachName`, `values`, `remark`, `sourceChannel`, `sourceApp`, `createTime`, `modifyTime`, `userGUID`, `reportTime`, `oriCstGUID`) values('321097','48C03362-F2FC-4294-9189-FD2B87E9021B','cst_opp_projectIntent','意向项目','深圳鲸山九期-鲸山九期',NULL,'106','401','2015-10-09 20:23:37','2015-10-11 13:33:11',NULL,NULL,NULL);
insert into `cst_attach_7` (`cstGUID`, `projGUID`, `attachCode`, `attachName`, `values`, `remark`, `sourceChannel`, `sourceApp`, `createTime`, `modifyTime`, `userGUID`, `reportTime`, `oriCstGUID`) values('321097','4DCEC66D-8E49-4735-8E5C-10FAE19E6877','cst_opp_roomAreaIntent','意向面积','200以上',NULL,'106','401','2015-10-09 20:23:37','2015-10-11 13:35:35',NULL,NULL,NULL);
insert into `cst_attach_7` (`cstGUID`, `projGUID`, `attachCode`, `attachName`, `values`, `remark`, `sourceChannel`, `sourceApp`, `createTime`, `modifyTime`, `userGUID`, `reportTime`, `oriCstGUID`) values('321097','4DCEC66D-8E49-4735-8E5C-10FAE19E6877','cst_opp_huxingIntent','意向户型','复式',NULL,'106','401','2015-10-09 20:23:37','2015-10-11 13:35:35',NULL,NULL,NULL);
insert into `cst_attach_7` (`cstGUID`, `projGUID`, `attachCode`, `attachName`, `values`, `remark`, `sourceChannel`, `sourceApp`, `createTime`, `modifyTime`, `userGUID`, `reportTime`, `oriCstGUID`) values('321097','4DCEC66D-8E49-4735-8E5C-10FAE19E6877','cst_opp_areaIntent','意向区域','蛇口',NULL,'106','401','2015-10-09 20:23:37','2015-10-11 13:35:35',NULL,NULL,NULL);
insert into `cst_attach_7` (`cstGUID`, `projGUID`, `attachCode`, `attachName`, `values`, `remark`, `sourceChannel`, `sourceApp`, `createTime`, `modifyTime`, `userGUID`, `reportTime`, `oriCstGUID`) values('321097','4DCEC66D-8E49-4735-8E5C-10FAE19E6877','cst_opp_intentLevel','意向级别','C级客户',NULL,'106','401','2015-10-09 20:23:37','2015-10-11 13:35:35',NULL,NULL,NULL);
insert into `cst_attach_7` (`cstGUID`, `projGUID`, `attachCode`, `attachName`, `values`, `remark`, `sourceChannel`, `sourceApp`, `createTime`, `modifyTime`, `userGUID`, `reportTime`, `oriCstGUID`) values('321097','4DCEC66D-8E49-4735-8E5C-10FAE19E6877','cst_opp_projectIntent','意向项目','深圳海月-五期',NULL,'106','401','2015-10-09 20:23:37','2015-10-11 13:35:35',NULL,NULL,NULL);
insert into `cst_attach_7` (`cstGUID`, `projGUID`, `attachCode`, `attachName`, `values`, `remark`, `sourceChannel`, `sourceApp`, `createTime`, `modifyTime`, `userGUID`, `reportTime`, `oriCstGUID`) values('321097',NULL,'cst_address','通讯地址','深圳市蛇口太子路1号新时代广场3楼',NULL,'106','401','2015-10-08 11:07:26','2015-10-11 14:21:36',NULL,NULL,NULL);
insert into `cst_attach_7` (`cstGUID`, `projGUID`, `attachCode`, `attachName`, `values`, `remark`, `sourceChannel`, `sourceApp`, `createTime`, `modifyTime`, `userGUID`, `reportTime`, `oriCstGUID`) values('321097','FE4E2F3D-E2BD-413C-8886-08224882BB58','cst_opp_projectIntent','意向项目','深圳依山郡-一期',NULL,'106','401','2015-10-09 20:23:37','2015-10-11 14:34:19',NULL,NULL,NULL);
insert into `cst_attach_7` (`cstGUID`, `projGUID`, `attachCode`, `attachName`, `values`, `remark`, `sourceChannel`, `sourceApp`, `createTime`, `modifyTime`, `userGUID`, `reportTime`, `oriCstGUID`) values('321097',NULL,'cst_hometown','籍贯','河南省',NULL,'106','401','2015-10-10 05:29:13','2015-10-10 05:29:13',NULL,NULL,NULL);
insert into `cst_attach_7` (`cstGUID`, `projGUID`, `attachCode`, `attachName`, `values`, `remark`, `sourceChannel`, `sourceApp`, `createTime`, `modifyTime`, `userGUID`, `reportTime`, `oriCstGUID`) values('321097',NULL,'cst_hometown_city','籍贯','河南省-郑州市','410000-410100','106','401','2015-10-10 05:29:13','2015-10-10 05:29:13',NULL,NULL,NULL);
insert into `cst_attach_7` (`cstGUID`, `projGUID`, `attachCode`, `attachName`, `values`, `remark`, `sourceChannel`, `sourceApp`, `createTime`, `modifyTime`, `userGUID`, `reportTime`, `oriCstGUID`) values('321097',NULL,'cst_workArea','工作区域','广东省深圳市',NULL,'106','401','2015-10-10 05:29:13','2015-10-10 05:29:13',NULL,NULL,NULL);




1.4客户轨迹详细分解
 
轨迹表（s_followrecord_7） （客户cstGUID = 321097）为列子
insert into `s_followrecord_7` (`followRecordID`, `salesLeadGUID`, `oppGUID`, `type`, `cstGUID`, `followDate`, `userGUID`, `oriCstGUID`, `companyGUID`, `sequence`, `followType`, `subType`, `followContent`, `srouceApp`, `projGUID`, `parentProjGUID`, `myGUID`, `tradeGUID`, `nextFollowTime`, `nextFollowContent`, `cognizePath`, `activitySource`, `rate`, `remark`, `createTime`, `modifyTime`, `oriRate`) values('71897',NULL,NULL,'5','321097',NULL,NULL,NULL,'521B8726-9240-4D10-882D-6C54800EF935',NULL,'5',NULL,NULL,'406','FE4E2F3D-E2BD-413C-8886-08224882BB58',NULL,'66FBB04A-E361-447F-94AA-D15AFA451EBA','C316E000-9212-405D-8265-17D6753A6F14',NULL,NULL,NULL,NULL,'0',NULL,'2006-04-29 00:00:00','2015-10-13 09:32:53',NULL); 
insert into `s_followrecord_7` (`followRecordID`, `salesLeadGUID`, `oppGUID`, `type`, `cstGUID`, `followDate`, `userGUID`, `oriCstGUID`, `companyGUID`, `sequence`, `followType`, `subType`, `followContent`, `srouceApp`, `projGUID`, `parentProjGUID`, `myGUID`, `tradeGUID`, `nextFollowTime`, `nextFollowContent`, `cognizePath`, `activitySource`, `rate`, `remark`, `createTime`, `modifyTime`, `oriRate`) values('73449',NULL,NULL,'6','321097',NULL,NULL,NULL,'521B8726-9240-4D10-882D-6C54800EF935',NULL,'6',NULL,NULL,'406','FE4E2F3D-E2BD-413C-8886-08224882BB58',NULL,'C316E000-9212-405D-8265-17D6753A6F14','C316E000-9212-405D-8265-17D6753A6F14',NULL,NULL,NULL,NULL,'0',NULL,'2006-05-25 00:00:00','2015-10-13 09:32:53',NULL); 
insert into `s_followrecord_7` (`followRecordID`, `salesLeadGUID`, `oppGUID`, `type`, `cstGUID`, `followDate`, `userGUID`, `oriCstGUID`, `companyGUID`, `sequence`, `followType`, `subType`, `followContent`, `srouceApp`, `projGUID`, `parentProjGUID`, `myGUID`, `tradeGUID`, `nextFollowTime`, `nextFollowContent`, `cognizePath`, `activitySource`, `rate`, `remark`, `createTime`, `modifyTime`, `oriRate`) values('86430',NULL,NULL,'7','321097',NULL,NULL,NULL,NULL,NULL,'7',NULL,NULL,'406',NULL,NULL,'283920A4-EC49-44AB-824A-11D4DDC4D17E','C316E000-9212-405D-8265-17D6753A6F14',NULL,NULL,NULL,NULL,'0',NULL,'2015-10-10 17:31:50','2015-10-13 09:32:53',NULL); 
insert into `s_followrecord_7` (`followRecordID`, `salesLeadGUID`, `oppGUID`, `type`, `cstGUID`, `followDate`, `userGUID`, `oriCstGUID`, `companyGUID`, `sequence`, `followType`, `subType`, `followContent`, `srouceApp`, `projGUID`, `parentProjGUID`, `myGUID`, `tradeGUID`, `nextFollowTime`, `nextFollowContent`, `cognizePath`, `activitySource`, `rate`, `remark`, `createTime`, `modifyTime`, `oriRate`) values('86994',NULL,NULL,'7','321097',NULL,NULL,NULL,NULL,NULL,'7',NULL,NULL,'406',NULL,NULL,'421EF9F2-6370-4959-A8DA-1C227946948B','C316E000-9212-405D-8265-17D6753A6F14',NULL,NULL,NULL,NULL,'0',NULL,'2015-10-10 17:31:50','2015-10-13 09:32:53',NULL);

s_followrecord_7 中的principal 在客户中为经办人，在项目中为置业顾问，在房源画像中为互动关联人 都是来源principal字段。

s_product_order （交易关系： 查询项目名称、房号、交易日期、交易金额、交易类型先写死为“-手”）
insert into `s_product_order` (`pOrderGUID`, `cstGUID`, `oriCstGUID`, `cstName`, `type`, `subType`, `productCode`, `status`, `orderChangeTime`, `remark`, `startTime`, `endTime`, `count`, `price`, `totalMoney`, `discount`, `orderSrc`, `tradeGUID`, `createTime`, `modifyTime`, `cstNum`, `propertyRate`) values('8084','321097','E78FD295-877B-4071-A198-4A4082587CBF','','10','10.01','634C1772-861D-4C02-ADBE-C27E4E17DA1A','99',NULL,NULL,NULL,NULL,'1','0',NULL,NULL,'1','C316E000-9212-405D-8265-17D6753A6F14','0000-00-00 00:00:00','2015-11-10 17:06:53','1','100.000');
insert into `s_product_order` (`pOrderGUID`, `cstGUID`, `oriCstGUID`, `cstName`, `type`, `subType`, `productCode`, `status`, `orderChangeTime`, `remark`, `startTime`, `endTime`, `count`, `price`, `totalMoney`, `discount`, `orderSrc`, `tradeGUID`, `createTime`, `modifyTime`, `cstNum`, `propertyRate`) values('201817','321097','E78FD295-877B-4071-A198-4A4082587CBF','','10','10.01','634C1772-861D-4C02-ADBE-C27E4E17DA1A','99',NULL,NULL,NULL,NULL,'1','0',NULL,NULL,'1','C316E000-9212-405D-8265-17D6753A6F14','0000-00-00 00:00:00','2016-01-14 11:47:35','1','100.000');

1.5客户关系信息详细分解
 
房产关系：
s_product_order+ s_followrecord_7 上面数据已造好





 
家庭关系：
没有数据...






 
交易关系
s_product_order+ s_followrecord_7 上面数据已造好







 
会员关系： （cst_member） （客户cstGUID = 321097）为列子
insert into `cst_member` (`memGUID`, `oriMemGUID`, `cstGUID`, `oriCstGUID`, `buGUID`, `memCode`, `logpwd`, `memStation`, `specialType`, `joinPath`, `joinDate`, `isSendJoinNote`, `ljPoint`, `applyDate`, `shr`, `shDate`, `cardStatus`, `makeCardReason`, `postCardDate`, `tjr`, `tjrMemCode`, `tjrRelation`, `tjRemark`, `projName`, `xckID`, `xckPwd`, `saler`, `getMemLevelWay`, `holdLevelBeginDate`, `holdLevelEndDate`, `oldMemCode`, `makeCardDate`, `memLevel`, `maxMemLevel`, `memStatus`, `oriMemStatus`, `statusDate`, `statusReason`, `statusHr`, `oldStatus`, `telList`) values('133663','F4C4BF90-2691-4CAF-8AB2-DCB3AFC79A39','321097','E78FD295-877B-4071-A198-4A4082587CBF','521B8726-9240-4D10-882D-6C54800EF935','80755262709','C4A1E45ED4B88FA953B687903B1145C2','业主','','购房入会','2010-11-02 00:00:00','0','0','2010-09-08 00:00:00',NULL,NULL,NULL,NULL,'2010-11-04 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'普通会员',NULL,'正式会员',NULL,NULL,NULL,NULL,NULL);






















1.6客户关联房产画像详细分解
 


查询信息
SELECT * FROM b_room WHERE roomID = 549607











房产画像sql脚本 以房间号549607 为例子
insert into `b_room` (`roomID`, `roomGUID`, `companyGUID`, `projGUID`, `bldGUID`, `mainRoomGUID`, `cstGUIDList`, `cstName`, `unit`, `floor`, `no`, `room`, `roomCode`, `huXing`, `saleStatus`, `bldArea`, `tnArea`, `blRhDate`, `YFBZ`, `roomMemo`, `zxBz`, `price`, `tnPrice`, `zxPrice`, `zxTotal`, `bedeckKind`, `isTempletRoom`, `west`, `chooseRoom`, `chooseRoomDate`, `roomStru`, `absolutelyFloor`, `statusChgGUID`, `saleRentable`, `productTypeCode`, `htRoom`, `dxsArea`, `carArea`, `ltArea`, `fpDate`, `zdFpDate`, `cqfzNum`, `ysBldArea`, `scBldArea`, `scTnArea`, `ysTnArea`, `hyArea`, `flatArea`, `ytArea`, `rhhyArea`, `ysxkzDate`, `ysxkzNo`, `cqfzGetDate`, `yyjfDate`, `isCannotSale`, `cannotSaleReason`, `chooseRoomNo`, `variety`, `productAttribute`, `createdOn`, `parkingType`, `parkingCurrentHandleMethod`, `parkingSaleType`, `parkingHandleDate`, `isParkingCq`, `businessCqLife`, `remarkHTML`, `businessManageFee`, `buysRoomNo`, `parkingPattern`, `chooseRoomCstGUID`, `productFormCode`, `productFormName`, `roomStatus`, `roomType`, `createTime`, `modifyTime`, `sourceApp`, `house_address`, `wy_tmpID`) values('549607','634C1772-861D-4C02-ADBE-C27E4E17DA1A','521B8726-9240-4D10-882D-6C54800EF935','FE4E2F3D-E2BD-413C-8886-08224882BB58','CC55C54F-4391-4C4D-A2E1-AFA3E6C327E0','','E78FD295-877B-4071-A198-4A4082587CBF',NULL,'2','1','C','1C','依山郡花园-10号楼-2-1C','平面三室两厅两卫','签约','125.62','114.3','0000-00-00 00:00:00',NULL,'','毛坯','9288','0','0','0',NULL,'0','','0','0000-00-00 00:00:00','平面三室两厅两卫','1','','出售','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'125.62','0','0','114.3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'2','0','0000-00-00 00:00:00','2016-01-11 11:43:52',NULL,NULL,NULL);











交易动态：


 
签约表 t_contract  以房间号549607 为例子
SELECT * FROM t_contract WHERE roomGUID='634C1772-861D-4C02-ADBE-C27E4E17DA1A'
是否激活状态：
        select
		tc.qsDate qsDate,
		tc.htTotal htTotal
		from
		t_contract tc
		where
		tc.roomGUID = roomGUID='634C1772-861D-4C02-ADBE-C27E4E17DA1A'
		and
	tc.status = '激活'

交易脚本：以房间号549607 为例子
insert into `t_contract` (`contractID`, `contractGUID`, `companyGUID`, `projGUID`, `tradeGUID`, `roomGUID`, `lastSaleGUID`, `lastSaleType`, `contractNO`, `qSDate`, `bldArea`, `tnArea`, `price`, `tnPrice`, `total`, `calMode`, `payformName`, `discntValue`, `discntRemark`, `bldCjPrice`, `tnCjPrice`, `roomTotal`, `zxBz`, `zxPrice`, `zxTotal`, `isZxkbrht`, `fsTotal`, `rmbHtTotal`, `bz`, `exRate`, `htTotal`, `ajBank`, `ajTotal`, `ajYear`, `gjjBank`, `gjjTotal`, `gjjYear`, `jFDate`, `bcFa`, `status`, `ywy`, `cstGUID`, `orderRemark`, `createdOn`, `createdBy`, `lastMender`, `modiDate`, `auditBy`, `auditingDate`, `roomBcTotal`, `fsRoomBcTotal`, `sjBcTotal`, `bcShr`, `bcShDate`, `bcJbr`, `bcJbDate`, `closeDate`, `ywblDate`, `closeReason`, `isValid`, `earnest`, `baDate`, `cstCircs`, `yjQyDate`, `baSjDate`, `htLqMemo`, `htLqDate`, `isYdBbc`, `baJbr`, `zCdiscntvalue`, `mysoftGUID`, `rhhtTotal`, `bankHzDate`, `ssdj`, `ydFkDate`, `ycFkDate`, `cxQyr`, `cxQyDate`, `payformType`, `bcBlJbr`, `bcSjDate`, `bcBlQk`, `isRequireBc`, `noRequireBcRemark`, `cxqyFl`, `cxqyMemo`, `employCardID`, `employName`, `htQsState`, `isJtChosen`, `createTime`, `modifyTime`) values('14051','C316E000-9212-405D-8265-17D6753A6F14','521B8726-9240-4D10-882D-6C54800EF935','FE4E2F3D-E2BD-413C-8886-08224882BB58','C316E000-9212-405D-8265-17D6753A6F14','634C1772-861D-4C02-ADBE-C27E4E17DA1A','66FBB04A-E361-447F-94AA-D15AFA451EBA',NULL,'深(龙)网预买字(2006)11631号','2006-05-25 00:00:00','125.64','114.33','9288','10206.8','1.16694e+06','按建筑面积','按揭付款','95',NULL,'8638','9492.33','1.08526e+06',NULL,'0','0','0','0','1.08526e+06','人民币','1','1085258','招商银行股份有限公司深圳新时代支行','860000','20',NULL,'0','0',NULL,NULL,'激活','熊美俊',NULL,NULL,'2006-05-25 00:00:00','戴琳','戴琳','2006-05-25 00:00:00',NULL,'2006-05-25 00:00:00','0','0','0',NULL,NULL,NULL,NULL,NULL,'2006-05-25 00:00:00',NULL,'0','30000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,'2015-09-29 15:28:59','0000-00-00 00:00:00'); 交易动态：
 
目前中没有数据：


insert into `a_tmp_repair` (`repairId`, `repairRy`, `repairCd`, `repairTime`, `repairXm`, `repairFy`, `repairSlr`, `repairType`, `roomId`, `repairSlrLx`) values('4','王大锤','房屋漏水','2016-03-04 16:12:29','深圳雍华府-雍华府一期-双拼1C','456','李华兵','1','392440','客服');
insert into `a_tmp_repair` (`repairId`, `repairRy`, `repairCd`, `repairTime`, `repairXm`, `repairFy`, `repairSlr`, `repairType`, `roomId`, `repairSlrLx`) values('5','张大明','水管堵塞','2016-03-04 16:12:29','深圳雍华府-雍华府一期-双拼1C','123','李晓华','2','392440','客服');
insert into `a_tmp_repair` (`repairId`, `repairRy`, `repairCd`, `repairTime`, `repairXm`, `repairFy`, `repairSlr`, `repairType`, `roomId`, `repairSlrLx`) values('6','梅松花','地板维修','2016-03-04 16:12:29','深圳雍华府-雍华府一期-双拼1C','30','李不送','3','392440','客服');
insert into `a_tmp_repair` (`repairId`, `repairRy`, `repairCd`, `repairTime`, `repairXm`, `repairFy`, `repairSlr`, `repairType`, `roomId`, `repairSlrLx`) values('7','宋花了','墙体维修','2016-03-04 16:12:29','深圳雍华府-雍华府一期-双拼1C','50','李不耀','4','392440','客服');
insert into `a_tmp_repair` (`repairId`, `repairRy`, `repairCd`, `repairTime`, `repairXm`, `repairFy`, `repairSlr`, `repairType`, `roomId`, `repairSlrLx`) values('8','李大锤','房屋漏水','2016-03-04 16:12:29','深圳雍华府-雍华府一期-双拼1C','456','胡华兵','1','392440','客服');
insert into `a_tmp_repair` (`repairId`, `repairRy`, `repairCd`, `repairTime`, `repairXm`, `repairFy`, `repairSlr`, `repairType`, `roomId`, `repairSlrLx`) values('9','王大明','水管堵塞','2016-03-04 16:12:29','深圳雍华府-雍华府一期-双拼1C','123','刘晓华','2','392440','客服');
insert into `a_tmp_repair` (`repairId`, `repairRy`, `repairCd`, `repairTime`, `repairXm`, `repairFy`, `repairSlr`, `repairType`, `roomId`, `repairSlrLx`) values('10','宋松花','地板维修','2016-03-04 16:12:29','深圳雍华府-雍华府一期-双拼1C','30','李如桦','3','392440','客服');
insert into `a_tmp_repair` (`repairId`, `repairRy`, `repairCd`, `repairTime`, `repairXm`, `repairFy`, `repairSlr`, `repairType`, `roomId`, `repairSlrLx`) values('11','张花了','墙体维修','2016-03-04 16:12:29','深圳雍华府-雍华府一期-双拼1C','50','王不耀','4','392440','客服');














1.7客户关联房产画像详细表分布

1. s_opp, 销售机会表
2. s_cst_opp --客户机会表
3. t_cst_trade --客户交易表
4. b_proj --项目表
5. s_product_order --交易表
6. b_room 房间表
7. rpt_b_room,
8. cst_attach,cst_attach_7 客户描摹特征表
9. s_followrecord,s_followrecord_7 轨迹表
10. b_building楼栋表
11. t_contract, 签约表
12. rpt_l_cst_stand_label_storage客户标签表
13. rpt_cst_customer_basic

14. a_tmp_repair 维修记录表

15. b_def_attach 标签特征表
16. b_def_attach_values




1.8 简单的客户测试脚本备份

SELECT * FROM cst_customer_7 WHERE cstGUID='321097';

SELECT * FROM rpt_l_cst_stand_label_storage WHERE cstGUID='321097';

SELECT cc.cstguid cstguid, cc.cstname cstname, 
cc.gender gender, cc.birthdate birthdate, 
cc.csttype csttype, cc.cardtype cardtype, 
cc.cardid cardid, cc.mobiletel mobiletel, 
cc.officetel officetel, cc.hometel hometel, 
cc.sourceapp sourceapp, cc.sourcebiz sourcebiz, 
cc.activitysource activitysource, cc.ismerge ismerge, 
cc.ismaster ismaster, cc.contact contact, 
cc.myguidlist myguidlist, cc.address address, 
cc.createtime createtime, cc.modifytime modifytime, 
cm.memCode memCode FROM cst_customer_7 cc 
LEFT JOIN 
cst_member cm ON cc.cstguid = cm.cstGUID 
WHERE cc.cstguid = 321097 



SELECT a.productCode,b.projGUID,c.bldProPerty,b.roomCode,b.roomGUID FROM s_product_order a
LEFT JOIN b_room b ON a.productCode=b.roomGUID
LEFT JOIN b_building c ON b.bldGUID=c.bldGUID
WHERE cstGUID=321097

SELECT * FROM b_building WHERE projGUID='FE4E2F3D-E2BD-413C-8886-08224882BB58' 
SELECT * FROM b_room WHERE projGUID='FE4E2F3D-E2BD-413C-8886-08224882BB58'
SELECT * FROM s_product_order WHERE cstGUID=321097 

销售机会表
SELECT * FROM s_cst_opp WHERE cstGUID = 321097 AND oppGuID IN('1CAA1CA4-62B5-4EA8-B087-4900CE92B04A','47275694-8110-42B5-A47B-127AAB7CA085',
'936B36CD-934E-4075-AAA1-AA9BAC660199');

客户机会表
SELECT * FROM s_opp WHERE oppGuID IN('1CAA1CA4-62B5-4EA8-B087-4900CE92B04A','47275694-8110-42B5-A47B-127AAB7CA085',
'936B36CD-934E-4075-AAA1-AA9BAC660199');

项目表
SELECT * FROM  b_proj WHERE projGUID IN ('4DCEC66D-8E49-4735-8E5C-10FAE19E6877','48C03362-F2FC-4294-9189-FD2B87E9021B','48C03362-F2FC-4294-9189-FD2B87E9021B');

客户成交表
SELECT * FROM t_cst_trade WHERE cstGUID = '321097'


SELECT
		bp.projGUID projGUID,
		bp.projName projName
		FROM
		(
		SELECT
		oppGUID
		FROM
		s_cst_opp
		WHERE
		cstGUID = 321097
		AND
		oppGUID != ''
		GROUP BY
		oppGUID
		) cso
		LEFT JOIN
		s_opp so
		ON
		cso.oppGUID = so.oppGUID
		LEFT JOIN
		b_proj bp
		ON
		so.projGUID = bp.projGUID
		
		
		
SELECT  * FROM cst_attach_7 WHERE cstGUID = 321097

SELECT * FROM s_followrecord_7 WHERE cstGUID='321097';

SELECT * FROM rpt_b_room WHERE projGUID = 'FE4E2F3D-E2BD-413C-8886-08224882BB58'


SELECT * FROM cst_member WHERE cstGUID = 321097

SELECT * FROM b_room WHERE roomID = 549607

SELECT * FROM t_contract WHERE roomGUID='634C1772-861D-4C02-ADBE-C27E4E17DA1A'
