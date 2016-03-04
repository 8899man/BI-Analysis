package com.sxit.model.pmp;


public class RptProjComplete{
	
		private Long proj_complete_id;  	private double yesterday_deal;  	private double month_deal; 	private double quarter_deal;  	private double year_deal; 	private double onsell_deal;  	private double complete_deal;	private java.sql.Timestamp create_time; 
	private String big_code;
	private String city_code;
	private String big_name;
	private String city_name;
	public String getBig_code() {
		return big_code;
	}
	public void setBig_code(String big_code) {
		this.big_code = big_code;
	}
	public String getCity_code() {
		return city_code;
	}
	public void setCity_code(String city_code) {
		this.city_code = city_code;
	}
	public String getBig_name() {
		return big_name;
	}
	public void setBig_name(String big_name) {
		this.big_name = big_name;
	}
	public String getCity_name() {
		return city_name;
	}
	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}
	public Long getProj_complete_id() {	    return this.proj_complete_id;	}	public void setProj_complete_id(Long proj_complete_id) {	    this.proj_complete_id=proj_complete_id;	}	public double getYesterday_deal() {	    return this.yesterday_deal;	}	public void setYesterday_deal(double yesterday_deal) {	    this.yesterday_deal=yesterday_deal;	}	public double getMonth_deal() {	    return this.month_deal;	}	public void setMonth_deal(double month_deal) {	    this.month_deal=month_deal;	}	public double getQuarter_deal() {	    return this.quarter_deal;	}	public void setQuarter_deal(double quarter_deal) {	    this.quarter_deal=quarter_deal;	}	public double getYear_deal() {	    return this.year_deal;	}	public void setYear_deal(double year_deal) {	    this.year_deal=year_deal;	}	public double getOnsell_deal() {	    return this.onsell_deal;	}	public void setOnsell_deal(double onsell_deal) {	    this.onsell_deal=onsell_deal;	}	public double getComplete_deal() {	    return this.complete_deal;	}	public void setComplete_deal(Integer complete_deal) {	    this.complete_deal=complete_deal;	}	public java.sql.Timestamp getCreate_time() {	    return this.create_time;	}	public void setCreate_time(java.sql.Timestamp create_time) {	    this.create_time=create_time;	}
}
