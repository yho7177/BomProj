package com.bom.service.bom;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bom.dao.bom.BomDAO;
import com.bom.domain.BomProcess;
import com.bom.domain.Finished;
import com.bom.domain.Product;
import com.bom.service.product.ProductService;

@Service
public class BomService {
	@Inject
	private BomDAO dao;
	
	public List<Finished> getFinished() throws Exception {
		return dao.getFinished();
	}

	public List<BomProcess> bomProcess(String recipeno, String qty) throws Exception {
		return dao.bomProcess(recipeno, qty);
	}

	public Finished getFinishedOne(String recipeno) throws Exception {
		return dao.getFinishedOne(recipeno);
	}

	public List<BomProcess> orderProcess(String rno, String qty) throws Exception {
		return dao.orderProcess(rno, qty);
 	}

	public int outOfStockOrder(List<BomProcess> bom) throws Exception {
		return dao.outOfStockOrder(bom);
	}

	
	

}
