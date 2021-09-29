package com.bom.dao.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bom.domain.BomProcess;
import com.bom.domain.PagingInfo;
import com.bom.domain.Product;
import com.bom.domain.Search;

@Repository
public class ProductDAOImpl implements ProductDAO {
	@Inject
	SqlSession ses;
	
	public static final String NS = "com.bom.product";
	
	@Override
	public Product proInfo(String no) throws Exception {
		return ses.selectOne(NS + ".proInfo", no);
	}
	@Override
	public int getTotalProduct() throws Exception {
		return ses.selectOne(NS + ".getTotalProduct");
	}
	
	@Override
	public int delPro(String no) throws Exception {
		return ses.delete(NS + ".delPro", no);
	}
	@Override
	public int getTotalProduct2(Search sc) throws Exception {
		return ses.selectOne(NS + ".getTotalProduct2", sc);
	}
	@Override
	public List<Product> getAllProduct(PagingInfo pi, Search sc) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchText", sc.getSearchText());
		map.put("searchType", sc.getSearchType());
		map.put("startNum", pi.getStartNum());
		map.put("postPerPage", pi.getPostPerPage());
		return ses.selectList(NS + ".getAllProduct", map);
	}
	@Override
	public int addProduct(Product pr) throws Exception {
		return ses.insert(NS + ".addProduct", pr);
	}
	@Override
	public int upadateProduct(Product pr) throws Exception {
		return ses.update(NS + ".upadateProduct", pr);
	}
	@Override
	public List<BomProcess> getBomProduct(PagingInfo pi, String qty, String recipeno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("recipeno", recipeno);
		map.put("qty", Integer.parseInt(qty));
		map.put("startNum", pi.getStartNum());
		map.put("postPerPage", pi.getPostPerPage());
		return ses.selectList(NS + ".getBomProduct", map );
	}
	@Override
	public int getBomTotal(String recipeno) throws Exception {
		return ses.selectOne(NS + ".getBomTotal", recipeno);
	}
	

}
