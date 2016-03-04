package com.dengbiao.test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Iterator;

import junit.framework.TestCase;

import com.alibaba.fastjson.JSONObject;

public class Test extends TestCase {

	
	public void test1(){
		File file = new File("d:/conditions.json");
		System.out.println(file);
		
		
		// read file content from file
        StringBuffer sb= new StringBuffer("");
       
        FileReader reader = null;
		try {
			reader = new FileReader(file);
			BufferedReader br = new BufferedReader(reader);
		       
	        String str = null;
	       
	        while((str = br.readLine()) != null) {
	              sb.append(str+"");
//	              System.out.println(str);
	        }
	        
	        JSONObject json = JSONObject.parseObject(sb.toString());
	        System.out.println(json);
	        
	        for (Iterator iterator = json.keySet().iterator(); iterator.hasNext();) {
				String key_lv1 = (String) iterator.next();
				
				
				
			}
	        
	       
	        br.close();
	        reader.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
        
		
	}
	
}
