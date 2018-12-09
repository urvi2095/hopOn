package com.me.hopOn.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.me.hopOn.dao.UserDAO;
import com.me.hopOn.pojo.User;

@Controller
public class AjaxController {
	
	@RequestMapping(value="/ajaxservice")
	public String ajaxService(HttpServletRequest request, UserDAO userDao)
	{
		String queryString = request.getParameter("username");
		String result = "";
		User user = null;
		try {
		user = userDao.get(queryString);
		}
		catch(Exception e){
			System.out.println("No user "+ e.getMessage());
		}
		result = user.getUsername();
		return result;
	}

}
