package com.me.hopOn.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.me.hopOn.dao.LocationDAO;
import com.me.hopOn.dao.UserDAO;
import com.me.hopOn.pojo.Location;
import com.me.hopOn.pojo.User;
import com.my.spring.exception.LocationException;
import com.my.spring.exception.UserException;

@Controller
public class RideController {
	
	@RequestMapping(value="/ride")
	public String ride(HttpServletRequest request, ModelMap map) {
		HttpSession session = request.getSession();
		if(session.getAttribute("user")!= null) {
			return "ride";
		}
		else
			return "redirect:/";	
	}
	
	@RequestMapping(value = "/book", method= RequestMethod.POST)
	public String bookCab(HttpServletRequest request, UserDAO userDao, LocationDAO locationDao, ModelMap map) {
		HttpSession session = request.getSession();
		map.addAttribute("message", "");
		String latitude = request.getParameter("latitude");
		String longitude = request.getParameter("longitude");
		System.out.println("longi:"+request.getParameter("longitude"));
		String location = request.getParameter("location");
		String pickup_lat = request.getParameter("pickup_latitude");
		String pickup_lon = request.getParameter("pickup_longitude");
		session.setAttribute("pickup_lat", pickup_lat);
		session.setAttribute("pickup_lon", pickup_lon);
		System.out.println("Pickup latitude"+pickup_lat);
		System.out.println("Pickup longitude"+pickup_lon);
		
		List<Location> results = null;
		try {
			//getting location with this lat, long;
			 results = locationDao.getLocation(Double.parseDouble(latitude), Double.parseDouble(longitude));
			 System.out.println("size of locationlist"+results.size());
		} catch (LocationException e) {
			System.out.println("Exception: " + e.getMessage());
		}
			//getting all users(driver) with location at loc;
		List<User> drivers = null;
			try {
				drivers= userDao.getUserAtLocation(results);
			} catch(UserException e) {
				System.out.println("Exception: "+e.getMessage());
			}
			boolean check = false;
				if(drivers != null){
					map.addAttribute("message", "");
					System.out.println("inside drivers not null1");
					User driver = null;
					for(User user : drivers) {
						if(!user.isBooked()) {
							System.out.println("inside drivers not null2");
							user.setBooked(true);
							try {
								userDao.updateUser(user);
							} catch(UserException e) {
								System.out.println("Exception: "+e.getMessage());
							}
							driver = user;
							System.out.println(driver.getFirstName());
							map.addAttribute("driverFound", driver);
							session.setAttribute("driver", driver);
							map.addAttribute("destination", location);
							map.addAttribute("pickup_lat", pickup_lat);
							map.addAttribute("pickup_lon", pickup_lon);
							check = true;
							}
							break;
						}
						if(check)
							return "book";
						else {
							System.out.println("inside drivers null");
							map.addAttribute("message", "Sorry!All drivers are booked at the moment!");
							return "ride";
						}
					}
					else{
						System.out.println("inside drivers null");
							map.addAttribute("message", "Sorry! No Drivers at that Location at the moment!");
							return "ride";
					}
							
				}
}
