package com.me.hopOn.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

import com.me.hopOn.pojo.Car;
import com.my.spring.exception.CarException;
import com.my.spring.exception.UserException;

public class CarDAO extends DAO{
	
	public void registerCar(Car car)
			throws CarException {
		try {
			begin();
			getSession().save(car);
			commit();
		} catch (HibernateException e) {
			rollback();
			throw new CarException("Exception while creating car: " + e.getMessage());
		}
	}
	
	public List<Car> getSedanCars()
			throws CarException {
		try {
			begin();
			Criteria crit = getSession().createCriteria(Car.class);
			crit.add(Restrictions.like("type", "sedan"));
			List sedanCars = crit.list();
			commit();
			return sedanCars;
		} catch (HibernateException e) {
			rollback();
			throw new CarException("Exception while getting list: " + e.getMessage());
		}
	}
	
	public List<Car> getSUVCars()
			throws CarException {
		try {
			begin();
			Criteria crit = getSession().createCriteria(Car.class);
			crit.add(Restrictions.ilike("type", "suv"));
			List suvCars = crit.list();
			commit();
			return suvCars;
		} catch (HibernateException e) {
			rollback();
			throw new CarException("Exception while getting list: " + e.getMessage());
		}
	}
	
	public Car getAllCars(int id)
			throws CarException {
		try {
			begin();
			Query q = getSession().createQuery("from Car where id=:id");
			q.setInteger("id", id);
			Car car = (Car)q.uniqueResult();
			commit();
			return car;
		} catch (HibernateException e) {
			rollback();
			throw new CarException("Exception while getting list: " + e.getMessage());
		}
	}
	
	public void deleteCar(Car car)
			throws CarException {
		try {
			begin();
			getSession().delete(car);
			commit();
		} catch (HibernateException e) {
			rollback();
			throw new CarException("Exception while getting list: " + e.getMessage());
		}
	}
	
	
	
}
