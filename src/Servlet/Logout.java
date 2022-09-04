package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			if (request.getSession().getAttribute("auth") != null) {
				if (request.getSession().getAttribute("noleggio") != null) {
					request.getSession().setAttribute("logout", "si") ;
					response.sendRedirect("indexMap.jsp");
				} else {
					request.getSession().removeAttribute("auth");
					System.out.println("uscito");
					response.sendRedirect("index.jsp");
				}
			} else {
				out.println("Non sei loggato");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}
}
