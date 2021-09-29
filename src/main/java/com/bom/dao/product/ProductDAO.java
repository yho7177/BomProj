package com.bom.dao.product;

import java.util.List;

import com.bom.domain.BomProcess;
import com.bom.domain.PagingInfo;
import com.bom.domain.Product;
import com.bom.domain.Search;

public interface ProductDAO {

	List<Product> getAllProduct(PagingInfo pi, Search sc) throws Exception;

	Product proInfo(String no) throws Exception;

	int getTotalProduct() throws Exception;

	int delPro(String no) throws Exception;

	int getTotalProduct2(Search sc) throws Exception;

	int addProduct(Product pr) throws Exception;

	int upadateProduct(Product pr) throws Exception;

	List<BomProcess> getBomProduct(PagingInfo pi, String qty, String recipeno);

	int getBomTotal(String recipeno) throws Exception;

}
