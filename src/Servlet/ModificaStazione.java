package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.StazioniDAO;
import Model.Stazioni;

@WebServlet("/ModificaStazione")
public class ModificaStazione extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ModificaStazione() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {
			Stazioni s1 = (Stazioni)request.getSession().getAttribute("stazione");
			int idStazione = s1.getIdStazione();
			String nome = request.getParameter("nomeStazione");
			String posizione = request.getParameter("posizione");			
			Stazioni s = new Stazioni(idStazione, nome, posizione);
			StazioniDAO sdao = new StazioniDAO();
			if (sdao.updateStazione(s)) {
				request.getSession().setAttribute("checked", "0");
				request.getSession().removeAttribute("stazione");
				response.sendRedirect("adminDashboard.jsp");
			} else {
				out.println("Modifica non riuscita");
				request.getSession().removeAttribute("stazione");
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
