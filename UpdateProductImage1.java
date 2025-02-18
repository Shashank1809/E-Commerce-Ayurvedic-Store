package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class UpdateProductImage1
 */
@WebServlet("/UpdateProductImage1")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
maxFileSize=1024*1024*10,      // 10MB
maxRequestSize=1024*1024*50)   // 50MB

public class UpdateProductImage1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductImage1() {
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
	
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String image1 = "";
			
		    for (Part part : request.getParts()) {
		    	String fileName = extractFileName(part);
	
			    if(!fileName.equals("")){
			    	image1 = fileName;
			    	java.io.File d = new java.io.File(appPath + "images/products/"+name);
			    	d.delete();
	                part.write(appPath + "images/products/"+image1);
			    }
		    }
		    con.createStatement().executeUpdate("update products set productImage1='"+image1+"' where id="+id);
			response.sendRedirect("manage-products.jsp");
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
