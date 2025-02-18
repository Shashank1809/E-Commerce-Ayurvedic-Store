package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class AddProductServlet
 */
@WebServlet("/AddProductServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
maxFileSize=1024*1024*10,      // 10MB
maxRequestSize=1024*1024*50)   // 50MB

public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(true);
		try{
			String appPath = request.getServletContext().getRealPath("/");
	
		    Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ayurcart_db","root","");
		
		    String category = request.getParameter("category");    
		    String brand = request.getParameter("brand");    
		    String productname = request.getParameter("productName");
		    String productprice = request.getParameter("productprice");
		    String productpricebd = request.getParameter("productpricebd");
		    String productdescription = request.getParameter("productDescription");
		    String productscharge = request.getParameter("productShippingcharge");
		    String productavailability = request.getParameter("productAvailability");
		    String mfgdate = request.getParameter("mfgDate");
		    String expdate = request.getParameter("expDate");
		    
		    String image1="", image2="", image3="";
		    
		    int cnt = 1;
		    
		    for (Part part : request.getParts()) {
		    	String fileName = extractFileName(part);
	
			    if(!fileName.equals("") && cnt==1){
			    	image1 = fileName;
			    	part.write(appPath + "images/products/"+image1);
			    	cnt++;
			    }
			    else if(!fileName.equals("") && cnt==2){
			    	image2 = fileName;
			    	part.write(appPath + "images/products/"+image2);
			    	cnt++;
			    }
			    else if(!fileName.equals("") && cnt==3){
			    	image3 = fileName;
			    	part.write(appPath + "images/products/"+image3);
			    	cnt++;
			    }
		    }

		    PreparedStatement ps = con.prepareStatement("insert into products(categoryId,brandId,productName,productPrice,productDescription,shippingCharge,productAvailability,productImage1,productImage2,productImage3,productPriceBeforeDiscount,mfgDate,expDate) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
		    ps.setInt(1, Integer.parseInt(category));
		    ps.setInt(2, Integer.parseInt(brand));
		    ps.setString(3, productname);
		    ps.setFloat(4, Float.parseFloat(productprice));
		    ps.setString(5, productdescription);
		    ps.setString(6, productscharge);
		    ps.setString(7, productavailability);
		    ps.setString(8, image1);
		    ps.setString(9, image2);
		    ps.setString(10, image3);
		    ps.setFloat(11, Float.parseFloat(productpricebd));
		    ps.setString(12, mfgdate);
		    ps.setString(13, expdate);
		    
		    ps.executeUpdate();
		    out.print("<script>alert('Product Added Successfully');</script>");
		    out.print("<script>window.location.href='manage-products.jsp'</script>");
		}
		catch(Exception e){
			out.println("<h4>"+e+"</h4>");
		}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }	
}
