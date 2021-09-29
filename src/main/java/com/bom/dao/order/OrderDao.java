package com.bom.dao.order;

import java.util.List;

import com.bom.domain.Billing;

public interface OrderDao {

	List<Billing> selectBilling() throws Exception;

	int statusUpdate(int no) throws Exception;

}
