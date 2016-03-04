package com.sxit.mgt.reports.dto;

import java.util.List;

public class YeTaiDataDto {
	private List<YeTaiZhuanShuDataDto> yeTaiTabData;
	private YeTaiMap2 yeTaiMap2Data;
	
	public YeTaiDataDto(){
		super();
	}

	public List<YeTaiZhuanShuDataDto> getYeTaiTabData() {
		return yeTaiTabData;
	}

	public void setYeTaiTabData(List<YeTaiZhuanShuDataDto> yeTaiTabData) {
		this.yeTaiTabData = yeTaiTabData;
	}

	public YeTaiMap2 getYeTaiMap2Data() {
		return yeTaiMap2Data;
	}

	public void setYeTaiMap2Data(YeTaiMap2 yeTaiMap2Data) {
		this.yeTaiMap2Data = yeTaiMap2Data;
	}

}
