package com.bom.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
			System.out.println(lst.get(0).toString());
			List<Integer> percent = new ArrayList<Integer>(); 
			float tmp = 0;
			for(Billing b : lst) {
				System.out.println(b.getDuration().getTime() - System.currentTimeMillis());
				System.out.println((b.getDuration().getTime() - b.getOrderdate().getTime()));
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
}
