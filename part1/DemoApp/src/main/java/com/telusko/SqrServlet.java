package com.telusko;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/sqr")
public class SqrServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
//		HttpSession session = req.getSession();
		
//		int k = (int) req.getAttribute("k");
//		int k = Integer.parseInt(req.getParameter("k"));
		
//		int k = (int) session.getAttribute("k");
		
//		session.removeAttribute("k");
		
		int k = 0;

		Cookie[] cookies = req.getCookies();
		
		for (Cookie c : cookies) {
			if (c.getName().equals("k")) {
				k = Integer.parseInt(c.getValue());
			}
		}
		
		
		k = k * k;
		
		PrintWriter out = res.getWriter();
		out.println("<html><body bgcolor='cyan'>");
		out.println("Result is " + k);
		out.println("</body></html>");
		
		System.out.println("sqr called");
	}

}
