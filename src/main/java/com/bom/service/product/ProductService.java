package com.bom.service.product;


import java.util.HashMap;

import java.util.Map;

import javax.inject.Inject;


import org.springframework.stereotype.Service;

import com.bom.dao.product.ProductDAO;
import com.bom.domain.PagingInfo;
import com.bom.domain.Product;
import com.bom.domain.Search;


@Service
public class ProductService {
	@Inject
	ProductDAO dao;
	
	public Map<String, Object> getAllProduct(int pageNo, Search sc) throws Exception {
		PagingInfo pi = pagingProcess(pageNo, sc);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pi", pi);
		map.put("product", dao.getAllProduct(pi, sc));
		
		return map;
	}
	
	public PagingInfo pagingProcess(int pageNo, Search sc) throws Exception {
		PagingInfo pi = new PagingInfo();
		
		pi.setStartNum(pageNo); 
		int totalPost = 0;
		if(sc == null) {
			totalPost = dao.getTotalProduct();
		} else {
			totalPost = dao.getTotalProduct2(sc);
		}
		

		pi.setTotalPage(totalPost); 
		pi.setCurrentPagingBlock(pageNo);

		pi.setStartPageNoOfBlock(pi.getCurrentPagingBlock());
		pi.setEndPageNoOfBlock(pi.getStartPageNoOfBlock());
		pi.setTotalPagingBlockCnt(pi.getTotalPage());
		return pi;
	}
	

	public Product proInfo(String no) throws Exception {
		return dao.proInfo(no);
	}

	public int delPro(String no) throws Exception {
		return dao.delPro(no);
	}

	public int upadateProduct(Product pr) throws Exception {
		return dao.upadateProduct(pr);
	}

	public int addProduct(Product pr) throws Exception {
		return dao.addProduct(pr);
	}

	public Map<String, Object> getBomProduct(int pageNo, String qty, String recipeno) throws Exception {
		PagingInfo pi = pagingProcess2(pageNo, null, recipeno);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pi", pi);
		map.put("product", dao.getBomProduct(pi, qty, recipeno));
		return map;
	}
	
	public PagingInfo pagingProcess2(int pageNo, Search sc, String recipeno) throws Exception {
		PagingInfo pi = new PagingInfo();
		
		pi.setStartNum(pageNo); 
		int totalPost = 0;
		if(sc == null) {
			totalPost = dao.getBomTotal(recipeno);
		}
		

		pi.setTotalPage(totalPost); 
		pi.setCurrentPagingBlock(pageNo);

		pi.setStartPageNoOfBlock(pi.getCurrentPagingBlock());
		pi.setEndPageNoOfBlock(pi.getStartPageNoOfBlock());
		pi.setTotalPagingBlockCnt(pi.getTotalPage());
		return pi;
	}
	
}
