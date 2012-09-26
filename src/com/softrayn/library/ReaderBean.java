package com.softrayn.library;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="readers")
public class ReaderBean {
	private int categoryId;
	private int id;
	private String password;
	private String readersName;
	private String sex;

	public int getCategoryId() {
		return categoryId;
	}

	@Id
	public int getId() {
		return id;
	}

	public String getPassword() {
		return password;
	}

	public String getReadersName() {
		return readersName;
	}

	public String getSex() {
		return sex;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setReadersName(String readersName) {
		this.readersName = readersName;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

}
