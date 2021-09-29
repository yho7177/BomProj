package com.bom.domain;

import java.sql.Timestamp;

public class Billing {
	private int no;
	private Timestamp orderdate;
	private String status;
	private Timestamp duration;
	private int totcost;
	public Billing() {
		super();
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Timestamp getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Timestamp orderdate) {
		this.orderdate = orderdate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Timestamp getDuration() {
		return duration;
	}
	public void setDuration(Timestamp duration) {
		this.duration = duration;
	}
	public int getTotcost() {
		return totcost;
	}
	public void setTotcost(int totcost) {
		this.totcost = totcost;
	}
	public Billing(int no, Timestamp orderdate, String status, Timestamp duration, int totcost) {
		super();
		this.no = no;
		this.orderdate = orderdate;
		this.status = status;
		this.duration = duration;
		this.totcost = totcost;
	}
	@Override
	public String toString() {
		return "Billing [no=" + no + ", orderdate=" + orderdate + ", status=" + status + ", duration=" + duration
				+ ", totcost=" + totcost + "]";
	}
	
	
}
