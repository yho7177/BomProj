package com.bom.domain;

public class Search {
	private String searchText;
	private String searchType;
	
	public Search() {
		super();
	}
	public Search(String searchText, String searchType) {
		super();
		this.searchText = searchText;
		this.searchType = searchType;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	@Override
	public String toString() {
		return "Search [searchText=" + searchText + ", searchType=" + searchType + "]";
	}

	
}
