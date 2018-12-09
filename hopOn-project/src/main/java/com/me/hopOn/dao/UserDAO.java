package com.me.hopOn.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.me.hopOn.pojo.Location;
import com.me.hopOn.pojo.User;
import com.my.spring.exception.UserException;

public class UserDAO extends DAO{

	public User register(User u)
			throws UserException {
		try {
			begin();
			//UserEmail email = new UserEmail(u.getEmail().getEmailAddress());
			User user = new User(u.getUsername(), u.getPassword());
			
			user.setFirstName(u.getFirstName());
			user.setLastName(u.getLastName());
			user.setContact(u.getContact());
			user.setEmail(u.getEmail());
			System.out.println(user.getFirstName());
			if(u.getLicense() != null) {
				System.out.println(u.getLicense());
				user.setLicense(u.getLicense());
				user.setLoc(u.getLoc());
			}
			getSession().save(user);
			
			commit();
			return user;

		} catch (HibernateException e) {
			rollback();
			throw new UserException("Exception while creating user: " + e.getMessage());
		}
	}

	public User get(String username, String password) throws UserException {
		try {
			begin();
			Query q = getSession().createQuery("from User where username = :username and password = :password");
			q.setString("username", username);
			q.setString("password", password);			
			User user = (User) q.uniqueResult();
			commit();
			return user;
		} catch (HibernateException e) {
			rollback();
			throw new UserException("Could not get user " + username, e);
		}
	}
	
	public User get(String username) throws UserException {
		try {
			begin();
			Query q = getSession().createQuery("from User where username = :username");
			q.setString("username", username);
			q.setMaxResults(1);
			User user =(User) q.uniqueResult();
			commit();
			return user;
		} catch (HibernateException e) {
			rollback();
			throw new UserException("Could not get user " + username, e);
		}
	}
	
	public User getByEmail(String useremail) throws UserException {
		try {
			begin();
			Query q = getSession().createQuery("from User where email = :email");
			q.setString("email", useremail);
			q.setMaxResults(1);
			User user =(User) q.uniqueResult();
			commit();
			return user;
		} catch (HibernateException e) {
			rollback();
			throw new UserException("Could not get user " + useremail, e);
		}
	}

	public void updateUser(User user) throws UserException{
		// TODO Auto-generated method stub
		try {
            begin();
            getSession().update(user);
            commit();
        } catch (HibernateException e) {
            rollback();
            throw new UserException("Could not save the user", e);
        }
	}
	
	public boolean updateUser(String email) throws Exception {
		try {
			begin();
			System.out.println("inside DAO");
			Query q = getSession().createQuery("from User where userEmail = :useremail");
			q.setString("useremail", email);
			User user = (User) q.uniqueResult();
			if(user!=null){
				user.setStatus(true);
				getSession().update(user);
				commit();
				return true;
			}else{
				return false;
			}

		} catch (HibernateException e) {
			rollback();
			throw new Exception("Exception while creating user: " + e.getMessage());
		}
	
	}
	
	public List<User> getUserAtLocation(List<Location> locationList) throws UserException {
		System.out.println("inside userdao method");
		try {
			List<User> usersList = null;
			for(Location loc : locationList) {
				System.out.println("inside for:location id is :"+loc.getLocationId());
				begin();
				Query q = getSession().createQuery("from User where locationId= :locationID");
				q.setInteger("locationID", loc.getLocationId());
				usersList = (List) q.list();
				System.out.println("userList"+usersList.get(0).getFirstName());
				commit();
			}
			return usersList;
		} catch (HibernateException e) {
			rollback();
			throw new UserException("Could not get usersList ", e);
		}
	}
	
	

}
