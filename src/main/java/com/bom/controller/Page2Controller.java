package com.bom.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bom.domain.BomProcess;
import com.bom.domain.Finished;
import com.bom.domain.PagingInfo;
import com.bom.service.bom.BomService;
import com.bom.service.product.ProductService;

@Controller
public class Page2Controller {
	@Inject
	private BomService service;
	
	@Inject
	private ProductService service2;
	@RequestMapping("/page2")
	public void page2(Model model) {
		try {
			List<Finished> lst = service.getFinished();
			model.addAttribute("finished", lst);
			System.out.println(5/2);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value = "/bomProcess", method = RequestMethod.GET)
	public String bomProcess(Model model, @RequestParam("recipeno")String recipeno, @RequestParam("qty")String qty, @RequestParam(value ="pageNo", required = false)String tmp) {
		int pageNo = 0;
		if(tmp == null) {
			pageNo = 1;
		} else {
			pageNo = Integer.parseInt(tmp);
		}
//		System.out.println("page :" + pageNo);
		try {
			Map<String, Object> map = service2.getBomProduct(pageNo, qty, recipeno);
			List<BomProcess> lst = (List<BomProcess>) map.get("product");
			PagingInfo pi = (PagingInfo) map.get("pi");
			List<Finished> lst1 = service.getFinished();
			Finished lst2 = service.getFinishedOne(recipeno);
			model.addAttribute("finished", lst1);
			model.addAttribute("bom", lst);
			model.addAttribute("finishedOne", lst2);
			model.addAttribute("pi", pi);
			model.addAttribute("recipeno", recipeno);
			model.addAttribute("qty", qty);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "page2";
	}
	
	@RequestMapping("/orderProcess")
	public String orderProcess(@RequestParam("recipeno")String rno, @RequestParam("qty")String qty) {
		try {
			List<BomProcess> tmp = service.orderProcess(rno, qty);
			System.out.println(tmp.toString());
			List<BomProcess> bom = new ArrayList<BomProcess>();
			for(BomProcess b : tmp) {
				if(b.getOutofstock() < 0) {
					bom.add(b);
				}
			}
			
			if(bom != null) {
				service.outOfStockOrder(bom);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "page2";
	}
}
