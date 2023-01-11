package com.telusko;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/add")
public class AddServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		int i = Integer.parseInt(req.getParameter("num1"));
		int j = Integer.parseInt(req.getParameter("num2"));

		int k = i + j;
		
		
//		req.setAttribute("k", k);
		
		// 포워딩
//		RequestDispatcher rd = req.getRequestDispatcher("sqr");
//		rd.forward(req, res);
		
		// 세션 
//		HttpSession session = req.getSession();
//		session.setAttribute("k", k);
		
		Cookie cookie = new Cookie("k", Integer.toString(k));
		res.addCookie(cookie);
		
//		res.sendRedirect("sqr?k=" + k);
		res.sendRedirect("sqr");
	}

}
