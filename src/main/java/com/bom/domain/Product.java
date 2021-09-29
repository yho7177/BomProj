package com.bom.domain;

import java.sql.Timestamp;

public class Product {
	private String productno;
	private String category;
	private String name;
	private String img;
	private Timestamp registerdate;
	private String stock;
	private String price;
	
	public Product() {
		super();
	}

	public Product(String productno, String category, String name, String img, Timestamp registerdate, String stock,
			String price) {
		super();
		this.productno = productno;
		this.category = category;
		this.name = name;
		this.img = img;
		this.registerdate = registerdate;
		this.stock = stock;
		this.price = price;
	}

	public String getProductno() {
		return productno;
	}

	public void setProductno(String productno) {
		this.productno = productno;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	public Timestamp getRegisterdate() {
		return registerdate;
	}

	public void setRegisterdate(Timestamp registerdate) {
		this.registerdate = registerdate;
	}

	public String getStock() {
		return stock;
	}

	public void setStock(String stock) {
		this.stock = stock;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Product [productno=" + productno + ", category=" + category + ", name=" + name + ", img=" + img
				+ ", registerdate=" + registerdate + ", stock=" + stock + ", price=" + price + "]";
	}

		
}
