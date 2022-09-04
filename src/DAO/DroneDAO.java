package DAO;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.Droni;
import Model.Utenti;
import Servlet.ConnessioneDb;

public class DroneDAO {

	// inserimento drone
	public boolean insertDroni(Droni d) throws SQLException {
		boolean righeAggiornate = false;
		ConnessioneDb con = new ConnessioneDb();
		try {
			con.connect();
			String query = "INSERT INTO droni (nome, id_stazione, disponibile) VALUES" + "(?,?,?);";
			PreparedStatement st = con.getCon().prepareStatement(query);
			st.setString(1, d.getNome());
			st.setInt(2, d.getIdStazione());
			st.setBoolean(3, d.getDisponibile());
			righeAggiornate = st.executeUpdate() > 0;
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return righeAggiornate;
	}

	// Select drone per un utente (modificato da Chiara 04/03)
	public Droni noleggiaDrone(int id_stazione) {
		Droni drone = null;
		ConnessioneDb con = new ConnessioneDb();

		try {
			con.connect();
			String query = "SELECT * from droni WHERE id_stazione=? AND disponibile=? LIMIT 1";
			PreparedStatement st = con.getCon().prepareStatement(query);
			st.setInt(1, id_stazione);
			st.setString(2, "1");
			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				int idStazione = rs.getInt("id_stazione");
				String nomeStazione = rs.getString("nome");
				boolean disponibile = rs.getBoolean("disponibile");
				int idDrone = rs.getInt("id_drone");

				drone = new Droni(idDrone, nomeStazione, idStazione, disponibile);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return drone;
	}

	// Select drone per ID (uso admin)
	public Droni selectDroni(int id) {
		Droni drone = null;
		ConnessioneDb con = new ConnessioneDb();
		try {
			con.connect();
			String query = "SELECT nome, id_stazione from droni WHERE id_drone=?";
			PreparedStatement st = con.getCon().prepareStatement(query);

			st.setInt(1, id);
			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				String nome = rs.getString("nome");
				int idStazione = rs.getInt("id_stazione");
				drone = new Droni(id, nome, idStazione);
			}

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return drone;
	}

	// Select di tutti i droni admin
	public List<Droni> selectAllDroni() {
		List<Droni> droni = new ArrayList<>();
		ConnessioneDb con = new ConnessioneDb();
		try {
			con.connect();
			String query = "SELECT * from droni";
			PreparedStatement st = con.getCon().prepareStatement(query);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int idDrone = rs.getInt("id_drone");
				String nome = rs.getString("nome");
				int idStazione = rs.getInt("id_stazione");
				boolean disponibile = rs.getBoolean("disponibile");
				Droni drone = new Droni(idDrone, nome, idStazione, disponibile);
				droni.add(drone);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return droni;
	}

	// Select di tutti i droni di un singolo utente
	public List<Droni> selectAllDroni(int id) {
		List<Droni> droni = new ArrayList<>();
		ConnessioneDb con = new ConnessioneDb();
		try {
			con.connect();
			String query = "SELECT nome, id_stazione, disponibile from droni";
			PreparedStatement st = con.getCon().prepareStatement(query);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int idDrone = rs.getInt("id_drone");
				String nome = rs.getString("nome");
				int idStazione = rs.getInt("id_stazione");
				boolean disponibile = rs.getBoolean("disponibile");
				Droni drone = new Droni(idDrone, nome, idStazione, disponibile);
				droni.add(drone);
			}

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return droni;
	}

	// metodo per rendere il drone disponibile/non disponibile
	public boolean updateDisponibilita(int idDrone, boolean disponibile) {

		boolean righeAggiornate = false;

		ConnessioneDb con = new ConnessioneDb();
		try {
			con.connect();
			String query = "UPDATE droni SET disponibile=? WHERE id_drone=?";
			PreparedStatement ps = con.getCon().prepareStatement(query);

			ps.setBoolean(1, disponibile);
			ps.setInt(2, idDrone);
			righeAggiornate = ps.executeUpdate() > 0;
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return righeAggiornate;
	}

	// DELETE DRONE
	public boolean deleteDrone(int idDrone) {

		boolean righeAggiornate = false;
		ConnessioneDb con = new ConnessioneDb();
		try {
			con.connect();
			String query = "DELETE FROM droni WHERE id_drone=?;";
			PreparedStatement ps = con.getCon().prepareStatement(query);
			ps.setInt(1, idDrone);
			righeAggiornate = ps.executeUpdate() > 0;
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return righeAggiornate;
	}

	// UPDATE DRONE
	public boolean updateDrone(int idDrone, String nome, int idStazione) {
		boolean righeAggiornate = false;
		ConnessioneDb con = new ConnessioneDb();
		try {
			con.connect();
			String query = "UPDATE droni SET nome=?, id_stazione=? WHERE id_drone=?;";
			PreparedStatement st = con.getCon().prepareStatement(query);
			st.setString(1, nome);
			st.setInt(2, idStazione);
			st.setInt(3, idDrone);
			righeAggiornate = st.executeUpdate() > 0;
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return righeAggiornate;
	}

}