package com.me.hopOn.view;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.me.hopOn.pojo.Car;


public class XlsView extends AbstractExcelView{

	@Override
	protected void buildExcelDocument(Map model, HSSFWorkbook workbook,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		Car car = (Car) model.get("car");
		//create a wordsheet
		//List<CSVData> datalist=data.get("csvData").getData();
		System.out.println("in excel3");
		HSSFSheet sheet = workbook.createSheet("Sales order Report");
		
		HSSFRow header = sheet.createRow(0);
		header.createCell(0).setCellValue("Details");
		header.createCell(1).setCellValue("Description");
		
			//create the row data
			HSSFRow row1 = sheet.createRow(1);
			row1.createCell(0).setCellValue("Firstname");
			row1.createCell(1).setCellValue(car.getFirstname());
			
			HSSFRow row2 = sheet.createRow(2);
			row2.createCell(0).setCellValue("Lastname");
			row2.createCell(1).setCellValue(car.getLastname());
			
			HSSFRow row3 = sheet.createRow(3);
			row3.createCell(0).setCellValue("Company");
			row3.createCell(1).setCellValue(car.getCompany());
			
			HSSFRow row4 = sheet.createRow(4);
			row4.createCell(0).setCellValue("Address");
			row4.createCell(1).setCellValue(car.getAddress());
			
			HSSFRow row5 = sheet.createRow(5);
			row5.createCell(0).setCellValue("Town");
			row5.createCell(1).setCellValue(car.getTown());
			
			HSSFRow row6 = sheet.createRow(6);
			row6.createCell(0).setCellValue("State");
			row6.createCell(1).setCellValue(car.getState());
			
			HSSFRow row7 = sheet.createRow(7);
			row7.createCell(0).setCellValue("Country");
			row7.createCell(1).setCellValue(car.getCountry());
			
			HSSFRow row8 = sheet.createRow(8);
			row8.createCell(0).setCellValue("Postcode");
			row8.createCell(1).setCellValue(car.getPostcode());
			
			HSSFRow row9 = sheet.createRow(9);
			row9.createCell(0).setCellValue("Mobile");
			row9.createCell(1).setCellValue(car.getMobile());
			
			HSSFRow row10 = sheet.createRow(10);
			row10.createCell(0).setCellValue("Email");
			row10.createCell(1).setCellValue(car.getEmail());
			
			HSSFRow row11 = sheet.createRow(11);
			row11.createCell(0).setCellValue("RegisterationNo");
			row11.createCell(1).setCellValue(car.getRegisterationNo());
			
			HSSFRow row12 = sheet.createRow(12);
			row12.createCell(0).setCellValue("Car Type");
			row12.createCell(1).setCellValue(car.getType());
			
			HSSFRow row13 = sheet.createRow(13);
			row13.createCell(0).setCellValue("Model");
			row13.createCell(1).setCellValue(car.getModel());
			
			HSSFRow row14 = sheet.createRow(14);
			row14.createCell(0).setCellValue("Year");
			row14.createCell(1).setCellValue(car.getYear());
			
			HSSFRow row15 = sheet.createRow(15);
			row15.createCell(0).setCellValue("Colour");
			row15.createCell(1).setCellValue(car.getColour());
			
			HSSFRow row16 = sheet.createRow(16);
			row16.createCell(0).setCellValue("Mileage");
			row16.createCell(1).setCellValue(car.getMileage());

	}
}
