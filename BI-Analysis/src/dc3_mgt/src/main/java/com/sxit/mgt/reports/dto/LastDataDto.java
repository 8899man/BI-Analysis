package com.sxit.mgt.reports.dto;

import java.util.List;

public class LastDataDto {

	private List<SplineSeriesDto>  ssDtoList;
	private List<SplineSeriesDto> ssDto;
	private List<ProductProjectData> ppDataList;
	
	public LastDataDto(){
		super();
	}

	public List<SplineSeriesDto> getSsDtoList() {
		return ssDtoList;
	}

	public void setSsDtoList(List<SplineSeriesDto> ssDtoList) {
		this.ssDtoList = ssDtoList;
	}

	public List<ProductProjectData> getPpDataList() {
		return ppDataList;
	}

	public List<SplineSeriesDto> getSsDto() {
		return ssDto;
	}

	public void setSsDto(List<SplineSeriesDto> ssDto) {
		this.ssDto = ssDto;
	}

	public void setPpDataList(List<ProductProjectData> ppDataList) {
		this.ppDataList = ppDataList;
	}
	
}
