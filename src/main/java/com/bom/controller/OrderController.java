package com.bom.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bom.domain.Billing;
import com.bom.service.order.OrderService;

@Controller
public class OrderController {
	@Inject
	private OrderService service;
	
	@RequestMapping("/order")
	public void order(Model model) {
		try {
			List<Billing> lst = service.selectBilling();
			List<Integer> percent = new ArrayList<Integer>(); 
			float tmp = 0;
			for(Billing b : lst) {
				tmp = (float)(b.getDuration().getTime() - System.currentTimeMillis()) / (float)(b.getDuration().getTime() - b.getOrderdate().getTime());
				tmp = 100 - (int) (tmp * 100);
				if(tmp > 100) {
					tmp = 100;
					service.statusUpdate(b.getNo());
				}
				percent.add((int) tmp);
			}
			
			model.addAttribute("percent", percent);
			model.addAttribute("billing", lst);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/searchType")
	public void searchType(@RequestParam("searchType")String searchType, Model model, HttpServletResponse resp) throws IOException {
		JSONObject json = new JSONObject();
		try {
			List<Billing> lst =  service.getBillOfType(searchType);
			JSONArray arr = new JSONArray();
			for(Billing b : lst) {
				JSONObject obj = new JSONObject();
				obj.put("no", b.getNo());
				obj.put("cost", b.getTotcost());
				obj.put("date", b.getOrderdate().toLocalDateTime());
				obj.put("status", b.getStatus());
				arr.add(obj);
				obj = null;
			}
			json.put("items", arr);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		resp.getWriter().print(json);
	}
}
