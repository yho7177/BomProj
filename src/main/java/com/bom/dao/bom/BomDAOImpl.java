package com.bom.dao.bom;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bom.domain.BomProcess;
import com.bom.domain.Finished;
import com.bom.domain.Product;

@Repository
public class BomDAOImpl implements BomDAO {
	@Inject
	private SqlSession ses;
	
	public static final String NS = "com.bom.bomprocess";
	
	@Override
	public List<Finished> getFinished() throws Exception {
		return ses.selectList(NS + ".getFinished", NS);
	}
	
	@Override
	public List<BomProcess> bomProcess(String recipeno, String qty) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("recipeno", recipeno);
		map.put("qty", Integer.parseInt(qty));
		return ses.selectList(NS + ".bomProcess", map);
	}

	@Override
	public Finished getFinishedOne(String recipeno) throws Exception {
		return ses.selectOne(NS + ".getFinishedOne", recipeno);
	}

	@Override
	public List<BomProcess> orderProcess(String rno, String qty) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rno", rno);
		map.put("qty", Integer.parseInt(qty));
		return ses.selectList(NS + ".orderProcess", map);
	}

	@Override
	public int outOfStockOrder(List<BomProcess> bom) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		int tmp = 0;
		int totcost = 0;
		for(BomProcess b : bom) {
			map.put("productno", b.getProductno());
			map.put("howmany", b.getOutofstock());
			tmp += b.getOutofstock();
			totcost += b.getTotalCost();
			ses.insert(NS + ".outOfStockInsert", map);
			map.remove("productno");
			map.remove("howmany");
		}
		
		tmp = tmp * -1;
		Map<String, Integer> map2 = new HashMap<String, Integer>();
		map2.put("outofstock", tmp);
		map2.put("totcost", totcost);
		return ses.insert(NS + ".outOfStockDuration", map2);
	}

}
