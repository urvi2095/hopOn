package com.me.hopOn.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.me.hopOn.dao.UserDAO;
import com.me.hopOn.pojo.User;
import com.my.spring.exception.UserException;

@Controller
public class DriveController {

	@RequestMapping(value = "/drive", method= RequestMethod.GET)
	public String driveNext(HttpServletRequest request, ModelMap map) {
		HttpSession session = request.getSession();
		User driver = (User)session.getAttribute("driver");
		User customer = (User)session.getAttribute("currentUser");
		if(driver == null) {
			map.addAttribute("errorMessage", "No Booking at the moment! Come Back Later");	
			return "drive";
		}
		else {
			System.out.println("Driver from session" + driver.getFirstName());
			map.addAttribute("customer", customer);
			map.addAttribute("pickup_lat", (String)session.getAttribute("pickup_lat"));
			map.addAttribute("pickup_lon", (String)session.getAttribute("pickup_lon"));
			if(driver.isBooked())
				map.addAttribute("driver",driver);
			return "drive";
		}
	}
	
	@RequestMapping(value = "/completeRide")
	public String completeRide(HttpServletRequest request, ModelMap map, UserDAO userDao) {
		HttpSession session = request.getSession();
		User customer = (User)session.getAttribute("currentUser");
		User driver = (User)session.getAttribute("driver");
		map.addAttribute("pickupAddress", session.getAttribute("pickupAddress"));
		driver.setBooked(false);
		try {
		userDao.updateUser(driver);
		} catch(UserException e) {
			System.out.println("Exception: "+e.getMessage());
		}
		map.addAttribute("customer", customer);
		return "completeRide";
	}
	
}
