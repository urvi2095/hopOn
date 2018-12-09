package com.me.hopOn.pojo;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "user_table")
@PrimaryKeyJoinColumn(name = "personID")
public class User extends Person {

	@Column(name = "userName")
	private String username;

	@Column(name = "password")
	private String password;
	
	@Column(name = "contact")
	private String contact;

	//@OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
	@Column(name = "Email")
	private String email;
	
	@Column(name="driver_license")
	private String license;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "locationId")
	private Location loc;
	
	@Column(name="booked_status")
	private boolean booked;
	
	@Column(name="status")
	private boolean status;
	
	public User(String username, String password) {
		this.username = username;
		this.password = password;
	}

	public User() {
		
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public Location getLoc() {
		return loc;
	}

	public void setLoc(Location loc) {
		this.loc = loc;
	}

	public boolean isBooked() {
		return booked;
	}

	public void setBooked(boolean booked) {
		this.booked = booked;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}
}