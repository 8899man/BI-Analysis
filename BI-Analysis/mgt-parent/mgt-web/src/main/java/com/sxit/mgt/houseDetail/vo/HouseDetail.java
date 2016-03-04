package com.sxit.mgt.houseDetail.vo;

import java.util.Date;

/**
 * 房产明细
 * @author kenny
 */
public class HouseDetail {

	/**
	 * 序列号
	 */
	public int roomID;
	/** 
	 * 房屋GUID 
	 */
	public String roomGUID;
	/** 
	 * 公司GUID
	 */
	public String companyGUID;
	/** 
	 * 项目GUID
	 */
	public String projGUID;
	/** 
	 * 楼栋GUID
	 */
	public String bldGUID;
	/** 
	 * 主房间GUID
	 */
	public String mainRoomGUID;
	/** 
	 * 客户GUID列表　
	 */
	public String cstGUIDList;
	
	/**
	 * 住户？
	 */
	public String cstname;
	
	/** 
	 * 单元
	 */
	public String unit;
	/** 
	 * 楼层
	 */
	public String floor;
	/** 
	 * 号码
	 */
	public String no;
	/** 
	 * 房号
	 */
	public String room;
	/** 
	 * 房间编码
	 */
	public String roomCode;
	/** 
	 * 户型
	 */
	public String huXing;
	
	/**
	 * 销售状态？
	 */
	public String saleStatus;

	/** 
	 * 建筑面积
	 */
	public double bldArea;
	/** 
	 * 套内面积
	 */
	public double tnArea;
	/** 
	 * 实际交付日期
	 */
	public Date blRhDate;
	/** 
	 * 验房标准
	 */
	public String yFBZ;
	/** 
	 * 房间备注
	 */
	public String roomMemo;
	/** 
	 * 装修标准
	 */
	public String zxBz;
	/** 
	 * 建筑单价
	 */
	public double price;
	/** 
	 * 套内单价
	 */
	public double tnPrice;
	/** 
	 * 装修单价
	 */
	public double zxPrice;
	/** 
	 * 装修款
	 */
	public double zxTotal;
	/** 
	 * 装修性质
	 */
	public String bedeckKind;
	/** 
	 * 样板房
	 */
	public int isTempletRoom;
	
	/**
	 * ？
	 */
	public String west;
	
	/** 
	 * 是否选房
	 */
	public int chooseRoom;
	/** 
	 * 选房时间
	 */
	public Date chooseRoomDate;
	/** 
	 * 房间结构
	 */
	public String roomStru;
	
	/**
	 * ?
	 */
	public String absolutelyFloor;

	/** 
	 * 销售状态变更GUID
	 */
	public String statusChgGUID;
	
	
	/**
	 * ?
	 */
	public String salerenTable;

	/** 
	 * 产品类型全代码
	 */
	public String productTypeCode;
	/** 
	 * 合同房号
	 */
	public String htRoom;
	/** 
	 * 地下室面积
	 */
	public double dxsArea;
	/** 
	 * 车库面积
	 */
	public double carArea;
	/** 
	 * 露台面积
	 */
	public double ltArea;
	/** 
	 * 放盘日期
	 */
	public Date fpDate;
	/** 
	 * 指定放盘日期
	 */
	public Date zdFpDate;
	/** 
	 * 产权分证号
	 */
	public String cqfzNum;
	/** 
	 * 预售建筑面积
	 */
	public double ysBldArea;
	/** 
	 * 实测建筑面积
	 */
	public double scBldArea;
	/** 
	 * 实测套内面积
	 */
	public double scTnArea;
	/** 
	 * 预售套内面积
	 */
	public double ysTnArea;
	/** 
	 * 花园面积
	 */
	public double hyArea;
	/** 
	 * 平台面积
	 */
	public double flatArea;
	/** 
	 * 阳台面积
	 */
	public double ytArea;
	/** 
	 * 入户花园面积
	 */
	public double rhhyArea;
	/** 
	 * 取预售许可证日期
	 */
	public Date ysxkzDate;
	/** 
	 * 预售许可证号
	 */
	public String ysxkzNo;
	/** 
	 * 分证取得日期
	 */
	public Date cqfzGetDate;
	/** 
	 * 预约交房日期
	 */
	public Date yyjfDate;
	/** 
	 * 是否不可售
	 */
	public int isCannotSale;
	/** 
	 * 不可售原因
	 */
	public String cannotSaleReason;
	/** 
	 * 房号确认单号
	 */
	public int chooseRoomNo;
	/** 
	 * 品类
	 */
	public String variety;
	/** 
	 * 产品属性
	 */
	public String productAttribute;
	/** 
	 * 房间创建日期
	 */
	public Date createdOn;
	/** 
	 * 车位类型
	 */
	public String parkingType;
	/** 
	 * 车位当前处置方式
	 */
	public String parkingCurrentHandleMethod;
	/** 
	 * 车位出售方式
	 */
	public String parkingSaleType;
	/** 
	 * 车位处置时间
	 */
	public Date parkingHandleDate;
	/** 
	 * 是否可办理产权
	 */
	public int isParkingCq;
	/** 
	 * 产权年限(单位：年)
	 */
	public String businessCqLife;
	/** 
	 * 车位及商业备注信息
	 */
	public String remarkHTML;
	/** 
	 * 商业管理费
	 */
	public String businessManageFee;
	/** 
	 * 购买者房号
	 */
	public String buysRoomNo;
	
	/** 
	 * 车位形态
	 */
	public String parkingPattern;
	/** 
	 * 选房客户GUID
	 */
	public String chooseRoomCstGUID;
	/** 
	 * 产品来源编码
	 */
	public String productFormCode;
	/** 
	 * 产品来源名称
	 */
	public String productFormName;
	
	/** 
	 * 楼层占用
	 */
	//public String floorUse;
	/** 
	 * 房产销售服务状态
	 */
	public int roomStatus;

	/** 
	 * 房产类别
	 */
	public int roomType;

	/** 
	 * 创建时间
	 */
	public Date createTime;
	/** 
	 * 修改时间
	 */
	public Date modifyTime;
	
	public int getRoomID() {
		return roomID;
	}
	public void setRoomID(int roomID) {
		this.roomID = roomID;
	}
	public String getRoomGUID() {
		return roomGUID;
	}
	public void setRoomGUID(String roomGUID) {
		this.roomGUID = roomGUID;
	}
	public String getCompanyGUID() {
		return companyGUID;
	}
	public void setCompanyGUID(String companyGUID) {
		this.companyGUID = companyGUID;
	}
	public String getProjGUID() {
		return projGUID;
	}
	public void setProjGUID(String projGUID) {
		this.projGUID = projGUID;
	}
	public String getBldGUID() {
		return bldGUID;
	}
	public void setBldGUID(String bldGUID) {
		this.bldGUID = bldGUID;
	}
	public String getMainRoomGUID() {
		return mainRoomGUID;
	}
	public void setMainRoomGUID(String mainRoomGUID) {
		this.mainRoomGUID = mainRoomGUID;
	}
	public String getCstGUIDList() {
		return cstGUIDList;
	}
	public void setCstGUIDList(String cstGUIDList) {
		this.cstGUIDList = cstGUIDList;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getFloor() {
		return floor;
	}
	public void setFloor(String floor) {
		this.floor = floor;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public String getRoomCode() {
		return roomCode;
	}
	public void setRoomCode(String roomCode) {
		this.roomCode = roomCode;
	}
	public String getHuXing() {
		return huXing;
	}
	public void setHuXing(String huXing) {
		this.huXing = huXing;
	}
	public double getBldArea() {
		return bldArea;
	}
	public void setBldArea(double bldArea) {
		this.bldArea = bldArea;
	}
	public double getTnArea() {
		return tnArea;
	}
	public void setTnArea(double tnArea) {
		this.tnArea = tnArea;
	}
	public Date getBlRhDate() {
		return blRhDate;
	}
	public void setBlRhDate(Date blRhDate) {
		this.blRhDate = blRhDate;
	}
	public String getyFBZ() {
		return yFBZ;
	}
	public void setyFBZ(String yFBZ) {
		this.yFBZ = yFBZ;
	}
	public String getRoomMemo() {
		return roomMemo;
	}
	public void setRoomMemo(String roomMemo) {
		this.roomMemo = roomMemo;
	}
	public String getZxBz() {
		return zxBz;
	}
	public void setZxBz(String zxBz) {
		this.zxBz = zxBz;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getTnPrice() {
		return tnPrice;
	}
	public void setTnPrice(double tnPrice) {
		this.tnPrice = tnPrice;
	}
	public double getZxPrice() {
		return zxPrice;
	}
	public void setZxPrice(double zxPrice) {
		this.zxPrice = zxPrice;
	}
	public double getZxTotal() {
		return zxTotal;
	}
	public void setZxTotal(double zxTotal) {
		this.zxTotal = zxTotal;
	}
	public String getBedeckKind() {
		return bedeckKind;
	}
	public void setBedeckKind(String bedeckKind) {
		this.bedeckKind = bedeckKind;
	}
	public int getIsTempletRoom() {
		return isTempletRoom;
	}
	public void setIsTempletRoom(int isTempletRoom) {
		this.isTempletRoom = isTempletRoom;
	}
	public int getChooseRoom() {
		return chooseRoom;
	}
	public void setChooseRoom(int chooseRoom) {
		this.chooseRoom = chooseRoom;
	}
	public Date getChooseRoomDate() {
		return chooseRoomDate;
	}
	public void setChooseRoomDate(Date chooseRoomDate) {
		this.chooseRoomDate = chooseRoomDate;
	}
	public String getRoomStru() {
		return roomStru;
	}
	public void setRoomStru(String roomStru) {
		this.roomStru = roomStru;
	}
	public String getStatusChgGUID() {
		return statusChgGUID;
	}
	public void setStatusChgGUID(String statusChgGUID) {
		this.statusChgGUID = statusChgGUID;
	}
	public String getProductTypeCode() {
		return productTypeCode;
	}
	public void setProductTypeCode(String productTypeCode) {
		this.productTypeCode = productTypeCode;
	}
	public String getHtRoom() {
		return htRoom;
	}
	public void setHtRoom(String htRoom) {
		this.htRoom = htRoom;
	}
	public double getDxsArea() {
		return dxsArea;
	}
	public void setDxsArea(double dxsArea) {
		this.dxsArea = dxsArea;
	}
	public double getCarArea() {
		return carArea;
	}
	public void setCarArea(double carArea) {
		this.carArea = carArea;
	}
	public double getLtArea() {
		return ltArea;
	}
	public void setLtArea(double ltArea) {
		this.ltArea = ltArea;
	}
	public Date getFpDate() {
		return fpDate;
	}
	public void setFpDate(Date fpDate) {
		this.fpDate = fpDate;
	}
	public Date getZdFpDate() {
		return zdFpDate;
	}
	public void setZdFpDate(Date zdFpDate) {
		this.zdFpDate = zdFpDate;
	}
	public String getCqfzNum() {
		return cqfzNum;
	}
	public void setCqfzNum(String cqfzNum) {
		this.cqfzNum = cqfzNum;
	}
	public double getYsBldArea() {
		return ysBldArea;
	}
	public void setYsBldArea(double ysBldArea) {
		this.ysBldArea = ysBldArea;
	}
	public double getScBldArea() {
		return scBldArea;
	}
	public void setScBldArea(double scBldArea) {
		this.scBldArea = scBldArea;
	}
	public double getScTnArea() {
		return scTnArea;
	}
	public void setScTnArea(double scTnArea) {
		this.scTnArea = scTnArea;
	}
	public double getYsTnArea() {
		return ysTnArea;
	}
	public void setYsTnArea(double ysTnArea) {
		this.ysTnArea = ysTnArea;
	}
	public double getHyArea() {
		return hyArea;
	}
	public void setHyArea(double hyArea) {
		this.hyArea = hyArea;
	}
	public double getFlatArea() {
		return flatArea;
	}
	public void setFlatArea(double flatArea) {
		this.flatArea = flatArea;
	}
	public double getYtArea() {
		return ytArea;
	}
	public void setYtArea(double ytArea) {
		this.ytArea = ytArea;
	}
	public double getRhhyArea() {
		return rhhyArea;
	}
	public void setRhhyArea(double rhhyArea) {
		this.rhhyArea = rhhyArea;
	}
	public Date getYsxkzDate() {
		return ysxkzDate;
	}
	public void setYsxkzDate(Date ysxkzDate) {
		this.ysxkzDate = ysxkzDate;
	}
	public String getYsxkzNo() {
		return ysxkzNo;
	}
	public void setYsxkzNo(String ysxkzNo) {
		this.ysxkzNo = ysxkzNo;
	}
	public Date getCqfzGetDate() {
		return cqfzGetDate;
	}
	public void setCqfzGetDate(Date cqfzGetDate) {
		this.cqfzGetDate = cqfzGetDate;
	}
	public Date getYyjfDate() {
		return yyjfDate;
	}
	public void setYyjfDate(Date yyjfDate) {
		this.yyjfDate = yyjfDate;
	}
	public int getIsCannotSale() {
		return isCannotSale;
	}
	public void setIsCannotSale(int isCannotSale) {
		this.isCannotSale = isCannotSale;
	}
	public String getCannotSaleReason() {
		return cannotSaleReason;
	}
	public void setCannotSaleReason(String cannotSaleReason) {
		this.cannotSaleReason = cannotSaleReason;
	}
	public int getChooseRoomNo() {
		return chooseRoomNo;
	}
	public void setChooseRoomNo(int chooseRoomNo) {
		this.chooseRoomNo = chooseRoomNo;
	}
	public String getVariety() {
		return variety;
	}
	public void setVariety(String variety) {
		this.variety = variety;
	}
	public String getProductAttribute() {
		return productAttribute;
	}
	public void setProductAttribute(String productAttribute) {
		this.productAttribute = productAttribute;
	}
	public Date getCreatedOn() {
		return createdOn;
	}
	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}
	public String getParkingType() {
		return parkingType;
	}
	public void setParkingType(String parkingType) {
		this.parkingType = parkingType;
	}
	public String getParkingCurrentHandleMethod() {
		return parkingCurrentHandleMethod;
	}
	public void setParkingCurrentHandleMethod(String parkingCurrentHandleMethod) {
		this.parkingCurrentHandleMethod = parkingCurrentHandleMethod;
	}
	public String getParkingSaleType() {
		return parkingSaleType;
	}
	public void setParkingSaleType(String parkingSaleType) {
		this.parkingSaleType = parkingSaleType;
	}
	public Date getParkingHandleDate() {
		return parkingHandleDate;
	}
	public void setParkingHandleDate(Date parkingHandleDate) {
		this.parkingHandleDate = parkingHandleDate;
	}
	public int getIsParkingCq() {
		return isParkingCq;
	}
	public void setIsParkingCq(int isParkingCq) {
		this.isParkingCq = isParkingCq;
	}
	public String getBusinessCqLife() {
		return businessCqLife;
	}
	public void setBusinessCqLife(String businessCqLife) {
		this.businessCqLife = businessCqLife;
	}
	public String getRemarkHTML() {
		return remarkHTML;
	}
	public void setRemarkHTML(String remarkHTML) {
		this.remarkHTML = remarkHTML;
	}
	public String getBusinessManageFee() {
		return businessManageFee;
	}
	public void setBusinessManageFee(String businessManageFee) {
		this.businessManageFee = businessManageFee;
	}
	public String getBuysRoomNo() {
		return buysRoomNo;
	}
	public void setBuysRoomNo(String buysRoomNo) {
		this.buysRoomNo = buysRoomNo;
	}
	public String getParkingPattern() {
		return parkingPattern;
	}
	public void setParkingPattern(String parkingPattern) {
		this.parkingPattern = parkingPattern;
	}
	public String getChooseRoomCstGUID() {
		return chooseRoomCstGUID;
	}
	public void setChooseRoomCstGUID(String chooseRoomCstGUID) {
		this.chooseRoomCstGUID = chooseRoomCstGUID;
	}
	public String getProductFormCode() {
		return productFormCode;
	}
	public void setProductFormCode(String productFormCode) {
		this.productFormCode = productFormCode;
	}
	public String getProductFormName() {
		return productFormName;
	}
	public void setProductFormName(String productFormName) {
		this.productFormName = productFormName;
	}
	
	public int getRoomStatus() {
		return roomStatus;
	}
	public void setRoomStatus(int roomStatus) {
		this.roomStatus = roomStatus;
	}
	public int getRoomType() {
		return roomType;
	}
	public void setRoomType(int roomType) {
		this.roomType = roomType;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
	public String getCstname() {
		return cstname;
	}
	public void setCstname(String cstname) {
		this.cstname = cstname;
	}
	public String getSaleStatus() {
		return saleStatus;
	}
	public void setSaleStatus(String saleStatus) {
		this.saleStatus = saleStatus;
	}
	public String getWest() {
		return west;
	}
	public void setWest(String west) {
		this.west = west;
	}
	public String getAbsolutelyFloor() {
		return absolutelyFloor;
	}
	public void setAbsolutelyFloor(String absolutelyFloor) {
		this.absolutelyFloor = absolutelyFloor;
	}
	public String getSalerenTable() {
		return salerenTable;
	}
	public void setSalerenTable(String salerenTable) {
		this.salerenTable = salerenTable;
	}
	
	
}
