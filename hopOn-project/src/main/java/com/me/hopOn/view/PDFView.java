package com.me.hopOn.view;
 
import java.util.Map;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.me.hopOn.pojo.Car;
 
/**
 * This view class generates a PDF document 'on the fly' based on the data
 * contained in the model.
 * @author www.codejava.net
 *
 */
public class PDFView extends AbstractITextPdfView {
 
    @Override
    protected void buildPdfDocument(Map<String, Object> model, Document doc,
            PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        // get data model which is passed by the Spring container
        Car carDetails = (Car) model.get("car");
         
        doc.add(new Paragraph("Car Registeration Form"));
         
        PdfPTable table = new PdfPTable(2);
        table.setWidthPercentage(100.0f);
        table.setWidths(new float[] {2.0f, 5.0f});
        table.setSpacingBefore(10);
         
        // define font for table header row
        Font font = FontFactory.getFont(FontFactory.HELVETICA);
        font.setColor(BaseColor.WHITE);
         
        // define table header cell
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(BaseColor.BLUE);
        cell.setPadding(5);
         
        // write table header
        cell.setPhrase(new Phrase("Details", font));
        table.addCell(cell);
         
        cell.setPhrase(new Phrase("Description", font));
        table.addCell(cell);
         
        // write table row data
        //for (Book aBook : listBooks) {
        table.addCell("FirstName");
        table.addCell(carDetails.getFirstname());
        
        table.addCell("LastName");
        table.addCell(carDetails.getLastname());
        
        table.addCell("Company");
        table.addCell(carDetails.getCompany());

        table.addCell("Street Address");
        table.addCell(carDetails.getAddress());
        
        table.addCell("Town");
        table.addCell(carDetails.getTown());
        
        table.addCell("States");
        table.addCell(carDetails.getState());
        
        table.addCell("Post Code");
        table.addCell(carDetails.getPostcode());
        
        table.addCell("Country");
        table.addCell(carDetails.getCountry());
        
        table.addCell("Mobile");
        table.addCell(carDetails.getMobile());
        
        table.addCell("Email");
        table.addCell(carDetails.getEmail());
        
        table.addCell("Car Registeration No.");
        table.addCell(carDetails.getRegisterationNo());
        
        table.addCell("Car Type");
        table.addCell(carDetails.getType());
        
        table.addCell("Model");
        table.addCell(carDetails.getModel());
        
        table.addCell("Colour");
        table.addCell(carDetails.getColour());
        
        table.addCell("Year");
        table.addCell(carDetails.getYear());
        
        table.addCell("Mileage");
        table.addCell(carDetails.getMileage());
        
        //}
         
        doc.add(table);
         
    }
 
}
