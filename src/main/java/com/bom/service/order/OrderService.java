package com.bom.service.order;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bom.dao.order.OrderDao;
import com.bom.domain.Billing;

@Service
public class OrderService {
	@Inject
	private OrderDao dao;
	
	public List<Billing> selectBilling() throws Exception {
		return dao.selectBilling();
	}

	public int statusUpdate(int no) throws Exception {
		return dao.statusUpdate(no);
	}

}
