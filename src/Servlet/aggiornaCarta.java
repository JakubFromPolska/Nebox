package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CarteDAO;
import Model.Carte;
import Model.Utenti;

@WebServlet("/aggiornaCarta")
public class aggiornaCarta extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public aggiornaCarta() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			Utenti user = (Utenti) request.getSession().getAttribute("auth");
			int id_carta = user.getIdCarta();
			
			String num_carta = request.getParameter("numCarta");
			String scadenza = request.getParameter("scadenza");
			String cvv = request.getParameter("cvv");
			String intestatario = request.getParameter("intestatario");

			Carte card = new Carte(id_carta, num_carta, scadenza, cvv, intestatario);
			CarteDAO cdao = new CarteDAO();
			cdao.updateCarta(card);
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("myProfile.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
