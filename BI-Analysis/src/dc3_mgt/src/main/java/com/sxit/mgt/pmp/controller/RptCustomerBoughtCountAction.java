package com.sxit.mgt.pmp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import com.sxit.mgt.pmp.dao.RptCustomerBoughtCountDao;
import com.sxit.model.pmp.RptCustomerBoughtCount;
import com.sxit.mgt.pmp.service.RptCustomerBoughtCountService;
 
@Controller
@RequestMapping("/rptCustomerBoughtCount") 
public class RptCustomerBoughtCountAction{
	
	private final static Logger log= Logger.getLogger(RptCustomerBoughtCountAction.class);
	
	
	@Autowired
	private RptCustomerBoughtCountService rptCustomerBoughtCountService; 
	
	
}
