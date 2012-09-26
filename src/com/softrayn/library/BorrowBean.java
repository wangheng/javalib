package com.softrayn.library;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "borrowreturn")
public class BorrowBean {

	private int booksId;
	private Date borrowDate;
	private int readersId;
	private Date returnDate;
	private Date shouldReturnDate;
	private Integer pay;

	public Integer getPay() {
		return pay;
	}

	public void setPay(Integer pay) {
		this.pay = pay;
	}

	@Id
	public int getBooksId() {
		return booksId;
	}

	public Date getBorrowDate() {
		return borrowDate;
	}

	public int getReadersId() {
		return readersId;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public Date getShouldReturnDate() {
		return shouldReturnDate;
	}

	public void setBooksId(int booksId) {
		this.booksId = booksId;
	}

	public void setBorrowDate(Date borrowDate) {
		this.borrowDate = borrowDate;
	}

	public void setReadersId(int readersId) {
		this.readersId = readersId;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	public void setShouldReturnDate(Date shouldReturnDate) {
		this.shouldReturnDate = shouldReturnDate;
	}
}
