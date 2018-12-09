package com.me.hopOn.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.me.hopOn.pojo.Car;

@Controller
public class ViewController {

	@RequestMapping(value = "/saveExcelForm")
	public ModelAndView saveForm(HttpServletRequest request, ModelMap map) {
		HttpSession session = request.getSession();
		Car car = (Car)session.getAttribute("car");
		map.addAttribute("action", "save");
		return new ModelAndView("XlsView", "car", car);
	}
	
	@RequestMapping(value = "/savePDFForm")
	public ModelAndView savePDFForm(HttpServletRequest request, ModelMap map) {
		HttpSession session = request.getSession();
		Car car = (Car)session.getAttribute("car");
		map.addAttribute("action", "save");
		return new ModelAndView("PdfView", "car", car);
	}
	
}
