package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CarteDAO;
import DAO.UtentiDAO;
import Model.Carte;
import Model.Utenti;

@WebServlet("/RegisterCard")
public class RegisterCard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterCard() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		Utenti user = (Utenti) request.getSession().getAttribute("register") ;  
		String numCarta = request.getParameter("numCarta") ; 
		String scadenza = request.getParameter("scadenza") ; 
		String cvv = request.getParameter("cvv") ; 
		String intestatario = request.getParameter("intestatario") ;
		Carte card = new Carte(numCarta, scadenza, cvv, intestatario) ; 

		UtentiDAO udao = new UtentiDAO() ; 
		CarteDAO cdao = new CarteDAO() ;
		
		System.out.println(request.getSession().getId());
		try {
			cdao.insertCarta(card);
			int idCard = cdao.selectCardPerUtente(card.getNumCarta()) ;
			user.setIdCarta(idCard);
			udao.insertUtente(user);
			request.getSession().removeAttribute("register");
			request.getSession().setAttribute("auth", user);
			response.sendRedirect("indexMap.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}