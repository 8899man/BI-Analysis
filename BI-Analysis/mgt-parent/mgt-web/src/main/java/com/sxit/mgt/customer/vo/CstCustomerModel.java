package com.sxit.mgt.customer.vo;

import java.util.HashSet;
import java.util.Set;
import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * @公司:深讯信科
 * @功能:客户画像 Model
 * @作者:xiongj    
 * @日期:2015-09-22 10:35:59  
 * @版本:1.0
 * @修改:
 */
 
public class CstCustomerModel {

	/**
	 *客户GUID 
	 */
	private String cstguid;
	
	public CstCustomerModel(){
		super();
	}
	
	public String getCstguid() {
		return cstguid;
	}
	public void setCstguid(String cstguid) {
		this.cstguid = cstguid;
	} 
	
}
