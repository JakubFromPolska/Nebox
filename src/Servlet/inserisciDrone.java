package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DroneDAO;
import Model.Droni;

@WebServlet("/inserisciDrone")
public class inserisciDrone extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public inserisciDrone() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {

			String nome = request.getParameter("nomeDrone");
			String id_stazione = request.getParameter("id_stazione");
			int idStazione = Integer.parseInt(id_stazione);
			Droni d = new Droni(nome, idStazione);
			DroneDAO ddao = new DroneDAO();
			if (ddao.insertDroni(d)) {
				request.getSession().setAttribute("checked", "1");
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
