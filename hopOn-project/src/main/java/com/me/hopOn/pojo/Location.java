package com.me.hopOn.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import com.me.hopOn.pojo.User;


@Entity
@Table(name = "Location_table")
//@Inheritance(strategy=InheritanceType.JOINED)
public class Location{

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="LocationId")
	private int locationId;
	
//	@OneToOne
//	private User user;
	
	@Column(name="Latitude")
	private double lat;
	
	@Column(name="Longitude")
	private double lon;
	
	public Location(double lat,double lon) {
		this.lat = lat;
		this.lon = lon;
	}
	
	public Location() {
		
		
	}

	public int getLocationId() {
		return locationId;
	}

	public double getLat() {
		return lat;
	}

	public double getLon() {
		return lon;
	}

	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public void setLon(double lon) {
		this.lon = lon;
	}

}
