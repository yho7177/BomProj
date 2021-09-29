package com.bom.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bom.domain.PagingInfo;
import com.bom.domain.Product;
import com.bom.domain.Search;
import com.bom.service.product.ProductService;

@Controller
public class Page3Controller {
	@Inject
	ProductService service;
	
	@RequestMapping("/page3")
	public void page3(Model model, @RequestParam(value ="pageNo", required = false)String tmp, Search sc) {
		int pageNo = 0;
		if(tmp == null) {
			pageNo = 1;
		} else {
			pageNo = Integer.parseInt(tmp);
		}
		System.out.println(sc.toString());
		try {
			Map<String, Object> map = service.getAllProduct(pageNo, sc);
			List<Product> lst = (List<Product>) map.get("product");
			PagingInfo pi = (PagingInfo) map.get("pi");
			model.addAttribute("product", lst);
			model.addAttribute("pi", pi);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/proInfo")
	public void proInfo(@RequestParam("no")String no, HttpServletResponse resp) throws IOException {
		JSONObject json = null;
		try {
			Product pro = service.proInfo(no);
			json = new JSONObject();
			json.put("result", "success");
			json.put("productno", pro.getProductno());
			json.put("category", pro.getCategory());
			json.put("name", pro.getName());
			json.put("stock", pro.getStock());
			json.put("img", pro.getImg());
		} catch (Exception e) {
			json.put("result", "fail");
			e.printStackTrace();
		}
		resp.getWriter().print(json);
	}
	
	@RequestMapping("/delPro")
	public void delPro(@RequestParam("productno")String no, HttpServletResponse resp) throws IOException {
		int i = 0;
		try {
			i = service.delPro(no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(i == 1) {
			resp.sendRedirect("/page3?pageNo=1&searchText=&searchType=");
		} else {
			resp.sendRedirect("/common");
		}
	}
	@RequestMapping("/upadateProduct")
	public void upadateProduct(Product pr, HttpServletResponse resp) throws IOException {
		System.out.println(pr.toString());
		try {
			service.upadateProduct(pr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.sendRedirect("/page3?pageNo=1&searchText=&searchType=");
	}
	
	@RequestMapping("/addProduct")
	public void addProduct(Product pr, HttpServletResponse resp) throws IOException {
		try {
			service.addProduct(pr);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resp.sendRedirect("/page3?pageNo=1&searchText=&searchType=");
	}
}
