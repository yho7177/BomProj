package com.bom.dao.order;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bom.domain.Billing;

@Repository
public class OrderDaoImpl implements OrderDao {
	@Inject
	private SqlSession ses;
	
	public static final String NS = "com.bom.order";
	
	@Override
	public List<Billing> selectBilling() throws Exception {
		return ses.selectList(NS + ".selectBilling");
	}

	@Override
	public int statusUpdate(int no) throws Exception {
		return ses.update(NS + ".statusUpdate", no);
	}

	@Override
	public List<Billing> getBillOfType(Object serchType) throws Exception {
		return ses.selectList(NS + ".getBillOfType", serchType);
	}

}
