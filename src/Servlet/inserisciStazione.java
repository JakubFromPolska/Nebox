package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Stack;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DroneDAO;
import DAO.StazioniDAO;
import Model.Droni;
import Model.Stazioni;

@WebServlet("/inserisciStazione")
public class inserisciStazione extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public inserisciStazione() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try (PrintWriter out = response.getWriter()) {

			String nome = request.getParameter("nomeStazione");
			String posizione = request.getParameter("posizione");
			Stazioni s = new Stazioni(nome, posizione);
			StazioniDAO sdao = new StazioniDAO();
			if (sdao.insertStazione(s)) {
				request.getSession().setAttribute("checked", "0");
				response.sendRedirect("adminDashboard.jsp");
			} else {
				out.println("Inserimento non riuscito");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
