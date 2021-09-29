package com.bom.domain;

import java.sql.Date;

public class Finished {
	private String productno;
	private String title;
	private String brick;
	private Date release;
	private String recipeno;
	private String series;
	private String img;
	public Finished() {
		super();
	}
	@Override
	public String toString() {
		return "Finished [productno=" + productno + ", title=" + title + ", brick=" + brick + ", release=" + release
				+ ", recipeno=" + recipeno + ", series=" + series + ", img=" + img + "]";
	}
	public Finished(String productno, String title, String brick, Date release, String recipeno, String series,
			String img) {
		super();
		this.productno = productno;
		this.title = title;
		this.brick = brick;
		this.release = release;
		this.recipeno = recipeno;
		this.series = series;
		this.img = img;
	}
	public String getProductno() {
		return productno;
	}
	public void setProductno(String productno) {
		this.productno = productno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBrick() {
		return brick;
	}
	public void setBrick(String brick) {
		this.brick = brick;
	}
	public Date getRelease() {
		return release;
	}
	public void setRelease(Date release) {
		this.release = release;
	}
	public String getRecipeno() {
		return recipeno;
	}
	public void setRecipeno(String recipeno) {
		this.recipeno = recipeno;
	}
	public String getSeries() {
		return series;
	}
	public void setSeries(String series) {
		this.series = series;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	
	
	
}
