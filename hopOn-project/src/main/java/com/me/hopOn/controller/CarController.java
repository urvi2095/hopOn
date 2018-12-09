package com.me.hopOn.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.me.hopOn.dao.CarDAO;
import com.me.hopOn.pojo.Car;
import com.my.spring.exception.CarException;

@Controller
public class CarController {

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView getCarRegisterationForm(HttpServletRequest request) {
		return new ModelAndView("registerCar", "car", new Car());
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registeredCarSuccess(HttpServletRequest request, ModelMap map,@ModelAttribute("car") Car car, CarDAO carDao) {
		HttpSession session = request.getSession();
		
//		MultipartFile file = car.getFilename();
//		String filename = null;
//		if(null != file) {
//				filename = file.getOriginalFilename();
//				System.out.println("filename"+filename);
//		}
		try {
			carDao.registerCar(car);
		}
			catch(Exception e){
				System.out.println("Car not registered "+ e.getMessage());
			}
		map.addAttribute("carPhoto", car.getFilename());
		System.out.println("filename"+car.getFilename());
		session.setAttribute("car", car);
		map.addAttribute("action", "register");
		return "success";
	}
	
	@RequestMapping(value = "/allCars")
	public String allCars(HttpServletRequest request, ModelMap map, CarDAO carDao) {
			String action = request.getParameter("action");
			try {
				if(action.equals("sedan")) {
					List<Car> sedanCars = carDao.getSedanCars();
					map.addAttribute("action", "sedan");
					map.addAttribute("sedanCars", sedanCars);
					System.out.println(sedanCars.get(0).getFirstname());
					return "allCars";
				}
				else if(action.equals("suv")) {
					List<Car> suvCars = carDao.getSUVCars();
					map.addAttribute("action", "suv");
					map.addAttribute("suvCars", suvCars);
					System.out.println(suvCars.get(0).getFirstname());
					return "allCars";
				}
				else{
					return "allCars";
				}
			}catch(CarException e){
				System.out.println("CarException: " + e.getMessage());
			}
			return "allCars";
	}
	
	@RequestMapping(value = "/delete")
	public String deleteCar(HttpServletRequest request, ModelMap map, CarDAO carDao) {
			if(request.getParameter("id") != null) {
				int carId = Integer.parseInt(request.getParameter("id"));
				String type = request.getParameter("type");
				try {
				Car c = carDao.getAllCars(carId);
				carDao.deleteCar(c);
					if(type.equals("sedan")) {
						List<Car> sedanCars = carDao.getSedanCars();
						map.addAttribute("action", "sedan");
						map.addAttribute("sedanCars", sedanCars);
						System.out.println(sedanCars.get(0).getFirstname());
						return "allCars";
					}
					else {
						List<Car> suvCars = carDao.getSUVCars();
						map.addAttribute("action", "suv");
						map.addAttribute("suvCars", suvCars);
						System.out.println(suvCars.get(0).getFirstname());
						return "allCars";
					}
				}catch(CarException e){
					System.out.println("CarException: " + e.getMessage());
				}
			}
			return "allCars";
	}
	
}
