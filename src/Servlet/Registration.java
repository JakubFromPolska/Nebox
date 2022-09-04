package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.sql.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Utenti;
import DAO.UtentiDAO;


@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Registration() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			
//			HttpSession session = request.getSession() ; 
//			System.out.println(session.getId());
			
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

			Utenti user = new Utenti(nome, cognome, dataNascita, indirizzo, citta, email, numTel, codFiscale, nazionalita, username, password) ; 
			UtentiDAO udao = new UtentiDAO();
			List <String> usernames = udao.selectAllUsername();
			List <String> emails = udao.selectAllEmail();
			List <String> codici = udao.selectAllCodFiscale();
			
			
			//controllo username, email, codice fiscale sul db
			if (!usernames.contains(username) && !emails.contains(email)&&!codici.contains(codFiscale)) {
				request.getSession().setAttribute("register", user); 
				response.sendRedirect("creditCard.jsp"); 
			}else if(usernames.contains(username)) {
				//out.println("Username già esistente");
				request.getSession().setAttribute("errore", "username");
				response.sendRedirect("signup.jsp");
			}else if(emails.contains(email)) {
				//out.println("Email già associata ad un account");
				request.getSession().setAttribute("errore", "email");
				response.sendRedirect("signup.jsp");
			}else if(codici.contains(codFiscale)) {
				//out.println("Codice fiscale già associato ad un account");
				request.getSession().setAttribute("errore", "codFiscale");
				response.sendRedirect("signup.jsp");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}