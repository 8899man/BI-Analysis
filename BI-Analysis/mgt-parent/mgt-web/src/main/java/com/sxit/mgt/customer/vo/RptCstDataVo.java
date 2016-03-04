package com.sxit.mgt.customer.vo;

import java.util.List;

import com.sxit.model.customer.RptClassification;
import com.sxit.model.customer.RptCstLabel;
import com.sxit.model.customer.RptCstNumber;
import com.sxit.model.customer.RptMutipleFormats;

public class RptCstDataVo {

	private RptCstNumber allCustomer;
	private List<RptCstNumber> customerSorts;
	private List<RptMutipleFormats> customerFormat;
	private List<RptClassification> customerTypeProportion;
	private List<RptCstLabel> labels;
	private RptChart chart1;
	private RptChart chart2;
	
	public RptCstDataVo(){
		super();
	}

	public RptCstNumber getAllCustomer() {
		return allCustomer;
	}

	public void setAllCustomer(RptCstNumber allCustomer) {
		this.allCustomer = allCustomer;
	}

	public List<RptCstNumber> getCustomerSorts() {
		return customerSorts;
	}

	public void setCustomerSorts(List<RptCstNumber> customerSorts) {
		this.customerSorts = customerSorts;
	}

	public List<RptMutipleFormats> getCustomerFormat() {
		return customerFormat;
	}

	public void setCustomerFormat(List<RptMutipleFormats> customerFormat) {
		this.customerFormat = customerFormat;
	}

	public List<RptClassification> getCustomerTypeProportion() {
		return customerTypeProportion;
	}

	public void setCustomerTypeProportion(
			List<RptClassification> customerTypeProportion) {
		this.customerTypeProportion = customerTypeProportion;
	}

	public List<RptCstLabel> getLabels() {
		return labels;
	}

	public void setLabels(List<RptCstLabel> labels) {
		this.labels = labels;
	}

	public RptChart getChart1() {
		return chart1;
	}

	public void setChart1(RptChart chart1) {
		this.chart1 = chart1;
	}

	public RptChart getChart2() {
		return chart2;
	}

	public void setChart2(RptChart chart2) {
		this.chart2 = chart2;
	}
	
}
