package com.bom.domain;

public class Recipe {
	private String recipeno;
	private String productno;
	private String parent;
	private String name;
	private String img;
	public Recipe() {
		super();
	}
	public Recipe(String recipeno, String productno, String parent, String name, String img) {
		super();
		this.recipeno = recipeno;
		this.productno = productno;
		this.parent = parent;
		this.name = name;
		this.img = img;
	}
	public String getRecipeno() {
		return recipeno;
	}
	public void setRecipeno(String recipeno) {
		this.recipeno = recipeno;
	}
	public String getProductno() {
		return productno;
	}
	public void setProductno(String productno) {
		this.productno = productno;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
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
	@Override
	public String toString() {
		return "Recipe [recipeno=" + recipeno + ", productno=" + productno + ", parent=" + parent + ", name=" + name
				+ ", img=" + img + "]";
	}
	
	
	
	
}
