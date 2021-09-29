package com.bom.dao.bom;

import java.util.List;

import com.bom.domain.BomProcess;
import com.bom.domain.Finished;
import com.bom.domain.Product;

public interface BomDAO {

	List<Finished> getFinished() throws Exception;

	List<BomProcess> bomProcess(String recipeno, String qty) throws Exception;

	Finished getFinishedOne(String recipeno) throws Exception;

	List<BomProcess> orderProcess(String rno, String qty) throws Exception;

	int outOfStockOrder(List<BomProcess> bom) throws Exception;
	
}
