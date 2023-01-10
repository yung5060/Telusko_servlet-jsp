package com.telusko;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SqrServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
//		int k = (int) req.getAttribute("k");
		int k = Integer.parseInt(req.getParameter("k"));
		
		k = k * k;
		
		PrintWriter out = res.getWriter();
		out.println("Result is " + k);
		
		System.out.println("sqr called");
	}

}
