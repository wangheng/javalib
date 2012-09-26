package com.softrayn.library;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="readercategory")
public class ReaderCategoryBean {
	private int borrowDays;
	private int borrowNum;
	private int categoryId;
	private String categoryName;

	public int getBorrowDays() {
		return borrowDays;
	}

	public int getBorrowNum() {
		return borrowNum;
	}

	@Id
	public int getCategoryId() {
		return categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setBorrowDays(int borrowDays) {
		this.borrowDays = borrowDays;
	}

	public void setBorrowNum(int borrowNum) {
		this.borrowNum = borrowNum;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

}
