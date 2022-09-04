package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalTime;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.*;
import Servlet.ConnessioneDb;
import Model.*;

@WebServlet("/prenotazione")
public class PrenotazioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PrenotazioneServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {

			String stazione = request.getParameter("stazione");
			String pacchetto = request.getParameter("pacchetto");
			String tariffa = request.getParameter("tariffa");
			Utenti utente = (Utenti) request.getSession().getAttribute("auth");
			int id_utente = utente.getIdUtente();
			long millis = System.currentTimeMillis();
			Date dataNol = new Date(millis); // data noleggio (serve una data di fine?)
			Time inizioNol = Time.valueOf(LocalTime.now()); // inizio tempo noleggio

			// queste tre righe sotto servono a trovare l'id dell'utente che dovrebbe essere
			// loggato
//			UtentiDAO udao = new UtentiDAO ();
//			Utenti user = udao.selectUtenteByUsername(username);
//			int id_utente=user.getIdUtente();

			// queste tre righe sotto servono a trovare l'id della stazione scelta
			// dall'utente
			StazioniDAO sdao = new StazioniDAO();
			Stazioni staz = sdao.selectStazioneByName(stazione);
			int id_stazione = staz.getIdStazione();

			// seleziona un drone disponibile dalla stazione selezionata
			DroneDAO dDao = new DroneDAO();
			Droni drone = dDao.noleggiaDrone(id_stazione);
			int id_drone = drone.getIdDrone();

			PacchettiDAO pdao = new PacchettiDAO();
			Pacchetti pack = pdao.selectPacchettiByName(pacchetto);
			int id_pacchetto = pack.getIdPacchetto();

			Noleggi noleggio = new Noleggi(id_utente, id_drone, id_pacchetto, dataNol, inizioNol, null, 0);

			NoleggiDAO ndao = new NoleggiDAO();
			ndao.insertNoleggio(noleggio);

			dDao.updateDisponibilita(id_drone, false);

			request.getSession().setAttribute("noleggio", noleggio);
			request.getSession().setAttribute("logout", "no");
			if (id_pacchetto == 1) {
				response.sendRedirect("postNoleggioStandard.jsp");
			} else if (id_pacchetto == 2) {
				response.sendRedirect("postNoleggioPremium.jsp");
			} else if (id_pacchetto == 3) {
				response.sendRedirect("postNoleggioArte.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
