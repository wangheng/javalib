package com.softrayn.library;


public class BookBean {
	private String booksName;
	private String category;
	private int id;
	private String keyWords;
	private String remarks;

	public String getBooksName() {
		return booksName;
	}

	public String getCategory() {
		return category;
	}

	public int getId() {
		return id;
	}

	public String getKeyWords() {
		return keyWords;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setBooksName(String booksName) {
		this.booksName = booksName;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

}
