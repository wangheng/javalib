package com.softrayn.library;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="admin")
public class AdminBean {
	private String adminName;
	private int id;
	private String password;

	public String getAdminName() {
		return adminName;
	}

	@Id
	public int getId() {
		return id;
	}

	public String getPassword() {
		return password;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
