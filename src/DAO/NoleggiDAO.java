package DAO;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Model.Noleggi;
import Servlet.ConnessioneDb;
import java.sql.*;

public class NoleggiDAO {

	// inserimento noleggio utente
	public void insertNoleggio(Noleggi n) throws SQLException {
		ConnessioneDb con = new ConnessioneDb();
		try {
			con.connect();
			String query = "INSERT INTO noleggi (id_utente, id_drone, id_pacchetto, data, inizio_nol, fine_nol, importo) VALUES"
					+ "(?,?,?,?,?,?,?);";
			PreparedStatement st = con.getCon().prepareStatement(query);
			st.setInt(1, n.getUtenti());
			st.setInt(2, n.getDroni());
			st.setInt(3, n.getPacchetti());
			st.setDate(4, n.getData());
			st.setTime(5, n.getInizioNol());
			st.setTime(6, n.getFineNol());
			st.setDouble(7, n.getImporto());
			st.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		con.close();

	}

	// Select noleggio singolo
	public Noleggi selectNoleggio(int id) {
		Noleggi nol = null;
		ConnessioneDb con = new ConnessioneDb();
		try {
			con.connect();
			String query = "SELECT * from noleggi WHERE id_noleggio=?";
			PreparedStatement st = con.getCon().prepareStatement(query);

			st.setInt(1, id);

			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				int idUtente = rs.getInt("id_utente");
				int idDrone = rs.getInt("id_drone");
				int idPacchetto = rs.getInt("id_pacchetto");
				Date data = rs.getDate("data");
				Time inizioNol = rs.getTime("inizio_nol");
				Time fineNol = rs.getTime("fine_nol");
				double importo = rs.getDouble("importo");
				nol = new Noleggi(idUtente, idDrone, idPacchetto, data, inizioNol, fineNol, importo);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return nol;
	}

	// Select tutti noleggi(admin)
	public List<Noleggi> selectAllNoleggiAdmin() {
		List<Noleggi> noleggi = new ArrayList<>();
		Noleggi nol = null;
		ConnessioneDb con = new ConnessioneDb();
		try {
			con.connect();
			String query = "SELECT * from noleggi";
			PreparedStatement st = con.getCon().prepareStatement(query);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int idNoleggio = rs.getInt("id_noleggio");
				int idUtente = rs.getInt("id_utente");
				int idDrone = rs.getInt("id_drone");
				int idPacchetto = rs.getInt("id_pacchetto");
				Date data = rs.getDate("data");
				Time inizioNol = rs.getTime("inizio_nol");
				Time fineNol = rs.getTime("fine_nol");
				double importo = rs.getDouble("importo");
				nol = new Noleggi(idNoleggio, idUtente, idDrone, idPacchetto, data, inizioNol, fineNol, importo);
				noleggi.add(nol);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return noleggi;
	}

	// Select tutti i noleggi del singolo utente
	public List<Noleggi> selectAllNoleggi(int id_utente) {
		List<Noleggi> noleggi = new ArrayList<>();
		Noleggi nol = null;
		ConnessioneDb con = new ConnessioneDb();
		try {
			con.connect();
			String query = "SELECT * from noleggi where id_utente=?";
			PreparedStatement st = con.getCon().prepareStatement(query);
			st.setInt(1, id_utente);

			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int idNoleggio = rs.getInt("id_noleggio");
				int idUtente = rs.getInt("id_utente");
				int idDrone = rs.getInt("id_drone");
				int idPacchetto = rs.getInt("id_pacchetto");
				Date data = rs.getDate("data");
				Time inizioNol = rs.getTime("inizio_nol");
				Time fineNol = rs.getTime("fine_nol");
				double importo = rs.getDouble("importo");
				nol = new Noleggi(idNoleggio, idUtente, idDrone, idPacchetto, data, inizioNol, fineNol, importo);
				noleggi.add(nol);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return noleggi;
	}

	// UPDATE NOLEGGIO
	public boolean terminaNoleggio(Noleggi nol, Time fineNol, double importo) throws SQLException {
		boolean righeAggiornate = false;
		ConnessioneDb con = new ConnessioneDb();
		try {
			con.connect();
			String query = "UPDATE noleggi SET fine_nol=?, importo=? WHERE id_utente=? AND id_drone=? AND id_pacchetto=? AND data=? AND inizio_nol=?;";
			PreparedStatement st = con.getCon().prepareStatement(query);
			st.setTime(1, fineNol);
			st.setDouble(2, importo);
			st.setInt(3, nol.getUtenti());
			st.setInt(4, nol.getDroni());
			st.setInt(5, nol.getPacchetti());
			st.setDate(6, nol.getData());
			st.setTime(7, nol.getInizioNol());
			righeAggiornate = st.executeUpdate() > 0;
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return righeAggiornate;
	}

}
