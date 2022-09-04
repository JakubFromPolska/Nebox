package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UtentiDAO;
import Model.Utenti;

/**
 * Servlet implementation class AggiornaDatiUtente
 */
@WebServlet("/AggiornaDatiUtente")
public class AggiornaDatiUtente extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AggiornaDatiUtente() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			
			Utenti user1 =(Utenti)request.getSession().getAttribute("auth");
			
			int id_utente = user1.getIdUtente();
			int id_carta = user1.getIdCarta();
			String nome = request.getParameter("nome");
			String cognome = request.getParameter("cognome");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String indirizzo = request.getParameter("indirizzo");
			String citta = request.getParameter("citta");	
			String numTel = request.getParameter("cell");
			String codFiscale = request.getParameter("codicefiscale");
			String nazionalita = request.getParameter("nazionalita");
			String username = request.getParameter("username");
			String dataNascita = request.getParameter("nascita");
			
			Utenti user = new Utenti(id_utente, nome, cognome, dataNascita, indirizzo, citta, email, numTel, codFiscale, nazionalita, username, password, id_carta) ; 
			UtentiDAO udao = new UtentiDAO();
			udao.updateUtente(user);
			request.getSession().removeAttribute("auth");
			request.getSession().setAttribute("auth", user);
			
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
