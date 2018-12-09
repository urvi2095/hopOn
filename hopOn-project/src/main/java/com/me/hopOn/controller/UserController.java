package com.me.hopOn.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import com.captcha.botdetect.web.servlet.Captcha;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.me.hopOn.dao.UserDAO;
import com.me.hopOn.pojo.Location;
import com.me.hopOn.pojo.User;
import com.my.spring.exception.UserException;

@Controller
public class UserController {
	ArrayList<Location> location;
	public int i=0;
	public UserController(){
		this.location = new ArrayList<Location>();
		
	}
	
	@RequestMapping(value="/")
	public String index(HttpServletRequest request, ModelMap map) {
		HttpSession session = request.getSession();
		if(session.getAttribute("user") != null) {
			if(request.getParameter("action")!=null) {
				if(request.getParameter("action").equals("logout")) {
					session.setAttribute("user", null);;
					System.out.println("above index 1");
					return "index";
				}
			}
			User u = (User)session.getAttribute("user");
			map.addAttribute("firstname", u.getFirstName());
			if(u.getLicense() != null) {
				map.addAttribute("license", u.getLicense());
			}
			if(u.getLicense() == null) {
				session.setAttribute("currentUser", u);
			}
			System.out.println("above home 1");
			return "home";
		}		
		else {
				System.out.println("above index 2");
				return "index";
		}
	}
	
	@RequestMapping(value = "/login", method= RequestMethod.GET)
	public String loginCustomer(HttpServletRequest request, UserDAO userDao) {
		
		return "login";
	} 
	
	@RequestMapping(value = "/home", method= RequestMethod.POST)
	public String userHome(HttpServletRequest request, UserDAO userDao, ModelMap map) {
		HttpSession session = request.getSession(true);
		if(session.getAttribute("user")== null) {
		try {
			User u = userDao.get(request.getParameter("username"), request.getParameter("password"));
			
			if(u == null){
				System.out.println("UserName/Password does not exist");
				session.setAttribute("errorMessage", "UserName/Password does not exist");
				return "login";
			}
			else {
				session.setAttribute("user", u);
				System.out.println(u.getFirstName());
				map.addAttribute("firstname", u.getFirstName());
				if(u.getLicense() != null) {
					map.addAttribute("license", u.getLicense());
				}
				if(u.getLicense() == null) {
					session.setAttribute("currentUser", u);
				}
				
				return "home";
			}

		} catch (UserException e) {
			System.out.println("Exception: " + e.getMessage());
			session.setAttribute("errorMessage", "error while login");
			return "login";
		}
		}
		else {
			User u =  (User)session.getAttribute("user");
			System.out.println("Session was there here");
			map.addAttribute("firstname", u.getFirstName());
			if(u.getLicense() != null) {
				map.addAttribute("license", u.getLicense());
			}
			if(u.getLicense() == null) {
			session.setAttribute("currentUser", u);
			}
			
			return "home";
		}
		
	}
	
	@RequestMapping(value = "/new")
	public String signUpCustomer(HttpServletRequest request, ModelMap map) {
		if(request.getParameter("action") != null) {
			String action = request.getParameter("action");
			map.addAttribute("action", action);
			return "signup";
		}
		else {
			return "signup";
		}
	}
	
	@RequestMapping(value = "/signup", method= RequestMethod.POST)
	public String signedUp(HttpServletRequest request, UserDAO userDao, ModelMap map) throws Exception{
			//checking if username exists
		try {
			User u = userDao.get(request.getParameter("username"));
			if(u != null) {
				map.addAttribute("errorMessage", "Username already exits!");
				return "signup";
			}
			else {
				User user = new User();
				user.setFirstName(request.getParameter("firstName"));
				user.setLastName(request.getParameter("lastName"));
				user.setUsername(request.getParameter("username"));
				user.setPassword(request.getParameter("password"));
				user.setContact(request.getParameter("contact"));
				
				//UserEmail email = new UserEmail();
				//email.setEmailAddress(request.getParameter("email"));
				user.setEmail(request.getParameter("email"));
				if(request.getParameter("license") != null) {
					user.setLicense(request.getParameter("license"));
					user.setBooked(false);
					//Location loc = getListOfLocation().get((int)Math.random()*10);
					if(i>9) 
						i=-1;
					Location loc = getListOfLocation().get(++i);
					user.setLoc(loc);
				}
				User us = userDao.register(user);
				map.addAttribute("Message", "Successfully registered with HopOn!");
				return "login";
			}

		} catch (UserException e) {
			System.out.println("Exception: " + e.getMessage());
			return "signup";
		}
	}
	
	public ArrayList<Location> getListOfLocation(){
		//Boston Common
		Location loc1 = new Location(42.353821, -71.070930);
		location.add(loc1);
		//75 Peterborough Street
		Location loc2 = new Location(42.343793, -71.098106);
		location.add(loc2);
		//Boston Harbour
		Location loc3 = new Location(42.337638, -70.975530);
		location.add(loc3);
		//Fenway
		Location loc4 = new Location(42.342865 , -71.100288);
		location.add(loc4);
		//South Boston
		Location loc5 = new Location(42.338144, -71.047577);
		location.add(loc5);
		
		//Columbus Ave
		Location loc6 = new Location(42.343361, -71.078374);
		location.add(loc6);
		//Longwood
		Location loc7 = new Location(42.339836, -71.108878);
		location.add(loc7);
		//Harvard
		Location loc8 = new Location(42.377003, -71.116660);
		location.add(loc8);
		//MIT
		Location loc9 = new Location(42.360091, -71.094160);
		location.add(loc9);
		//Northeastern University
		Location loc10 = new Location(42.339807, -71.089172);
		location.add(loc10);
		
		return location;
	}
	
	//checking username availability using AJAX
//	@RequestMapping(value = { "/exist/{name}" }, method = RequestMethod.POST)
//	public void checkUsername(@PathVariable("name") String username, UserDAO userDao, HttpServletResponse response) throws IOException{
//		response.setContentType("text/html;charset=UTF-8");
//	    PrintWriter out = response.getWriter();
//	    try {
//			try {
//				User user = userDao.get(username);
//				if(user == null) {
//					 out.println("<font color=green><b>"+username+"</b> is avaliable");
//		        }
//		        else{
//		        out.println("<font color=red><b>"+username+"</b> is already in use</font>");
//		        }
//		        out.println(); 
//			
//			} catch (UserException e) {
//				System.out.println("User Exception: " + e.getMessage());
//			}
//		
//		} catch (Exception ex) {
//	
//	        out.println("Error ->" + ex.getMessage());
//	
//	    } finally {
//	        out.close();
//	    }
//	}
	
	
}
