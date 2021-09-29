package com.bom.domain;

public class BomProcess {
	private String productno;
	private String name;
	private String img;
	private String category;
	private String stock;
	private String qty;
	private String parent;
	private int outofstock;
	private int totalCost;
	public BomProcess() {
		super();
	}
	@Override
	public String toString() {
		return "BomProcess [productno=" + productno + ", name=" + name + ", img=" + img + ", category=" + category
				+ ", stock=" + stock + ", qty=" + qty + ", parent=" + parent + ", outofstock=" + outofstock
				+ ", totalCost=" + totalCost + "]";
	}
	public BomProcess(String productno, String name, String img, String category, String stock, String qty,
			String parent, int outofstock, int totalCost) {
		super();
		this.productno = productno;
		this.name = name;
		this.img = img;
		this.category = category;
		this.stock = stock;
		this.qty = qty;
		this.parent = parent;
		this.outofstock = outofstock;
		this.totalCost = totalCost;
	}
	public String getProductno() {
		return productno;
	}
	public void setProductno(String productno) {
		this.productno = productno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getStock() {
		return stock;
	}
	public void setStock(String stock) {
		this.stock = stock;
	}
	public String getQty() {
		return qty;
	}
	public void setQty(String qty) {
		this.qty = qty;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	public int getOutofstock() {
		return outofstock;
	}
	public void setOutofstock(int outofstock) {
		this.outofstock = outofstock;
	}
	public int getTotalCost() {
		return totalCost;
	}
	public void setTotalCost(int totalCost) {
		this.totalCost = totalCost;
	}
	
	
	
}
