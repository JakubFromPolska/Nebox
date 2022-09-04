package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DroneDAO;
import DAO.NoleggiDAO;
import DAO.PacchettiDAO;
import DAO.StazioniDAO;
import Model.Droni;
import Model.Noleggi;
import Model.Pacchetti;
import Model.Stazioni;
import Model.Utenti;

/**
 * Servlet implementation class TerminaNoleggio
 */
@WebServlet("/TerminaNoleggio")
public class TerminaNoleggio extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TerminaNoleggio() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {

			Noleggi nol = (Noleggi) request.getSession().getAttribute("noleggio");
			Utenti utente = (Utenti) request.getSession().getAttribute("auth");
			if (nol != null) {
				Time fineNol = Time.valueOf(LocalTime.now()); // fine tempo noleggio
				Time inizioNol = nol.getInizioNol();
				int id_pacchetto = nol.getPacchetti();
				PacchettiDAO pdao = new PacchettiDAO();
				double tariffa = pdao.selectTariffaById(id_pacchetto);
				double importo = nol.calcolaImporto(tariffa, inizioNol, fineNol);
				NoleggiDAO ndao = new NoleggiDAO();
				ndao.terminaNoleggio(nol, fineNol, importo);
				DroneDAO ddao = new DroneDAO();
				ddao.updateDisponibilita(nol.getDroni(), true);

				request.getSession().removeAttribute("noleggio");
				request.getSession().setAttribute("importo", importo);
				response.sendRedirect("termineNoleggio.jsp");
			} else {
				response.sendRedirect("indexMap.jsp");
			
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
