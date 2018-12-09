package com.me.hopOn.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.me.hopOn.dao.UserDAO;
import com.me.hopOn.pojo.User;

@Controller
public class EmailController {

	@RequestMapping(value = "/forgotpassword", method = RequestMethod.GET)
	public String getForgotPasswordForm(HttpServletRequest request, ModelMap map) {
		
		map.addAttribute("forgot", "forgot");
		return "forgot-password";
	}

	@RequestMapping(value = "/user/forgotpassword", method = RequestMethod.POST)
	public String handleForgotPasswordForm(HttpServletRequest request, UserDAO userDao) {
		
		String useremail = request.getParameter("useremail");
		//Captcha captcha = Captcha.load(request, "CaptchaObject");
		//String captchaCode = request.getParameter("captchaCode");

		//if (captcha.validate(captchaCode)) {
		try {
			User user = userDao.getByEmail(useremail);
			sendEmail(useremail, "Your password is : " + user.getPassword(), "Forgot password");
		}
			catch(Exception e){
				System.out.println("Car not registered "+ e.getMessage());
			}
			
			return "forgot-password-success";
		//} else {
			//request.setAttribute("captchamsg", "Captcha not valid");
			//return "forgot-password";
		//}
		
	}
	
	@RequestMapping(value="/message" , method = RequestMethod.POST)
	public String sendMessage(HttpServletRequest request) {
		//HttpSession session =request.getSession();
		
			sendEmail("maru.u@husky.neu.edu", request.getParameter("message"), request.getParameter("subject"));
			return "index";
		
	}
	
	public void sendEmail(String adminemail, String message, String subject) {
		try {
		Email email = new SimpleEmail();
		email.setHostName("smtp.googlemail.com");
		email.setSmtpPort(465);
		email.setAuthenticator(new DefaultAuthenticator("hopOncontact2018@gmail.com", "urvi_project"));
		email.setSSLOnConnect(true);
		email.setFrom("no.reply@hopOn.com"); //This user email does not exist
		
		email.setSubject(subject);
		email.setMsg(message);
		email.addTo(adminemail);
		email.send();
		}
		catch(Exception e){
			System.out.println("Email was not send! Error: "+ e.getMessage());
		}
		
	}
}
