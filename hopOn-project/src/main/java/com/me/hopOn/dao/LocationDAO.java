package com.me.hopOn.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

import com.me.hopOn.pojo.Location;
import com.my.spring.exception.LocationException;

public class LocationDAO extends DAO{

//	public List<Location> getLocation(double latitude, double longitude) throws LocationException{
//		System.out.println("inside dao lati:"+latitude);
//		try {
//			begin();
//			Query q = getSession().createQuery("from Location where lat = :latitude and lon = :longitude");
//			System.out.println("Inside locationDao starting query");
//			q.setDouble("latitude", latitude);
//			q.setDouble("longitude", longitude);
//			List<Location> results = (List<Location>) q.list();
//			System.out.println("size inside dao:"+results.size());
//			commit();
//			return results;
//		} catch (HibernateException e) {
//			rollback();
//			throw new LocationException("Could not get user " + latitude, e);
//		}
//	}
	
	public List<Location> getLocation(double latitude, double longitude) throws LocationException{
		System.out.println("Inside locationDao starting query"+ latitude + longitude );
		try {
		Criteria crit = getSession().createCriteria(Location.class);
		crit.add(Restrictions.eq("lat", 42.343793));
		//crit.add(Restrictions.eq("lon", 71.098106));
		List<Location> results = (List)crit.list();
		System.out.println("Inside locationDao starting query" + results.size());
		return results;
	} catch (HibernateException e) {
		rollback();
		throw new LocationException("Could not get user " + latitude, e);
	}
		
	}
	

}
