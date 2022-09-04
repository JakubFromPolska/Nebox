package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Model.Carte;
import Model.Utenti;
import Servlet.ConnessioneDb;

public class CarteDAO {

	// Insert nuova carta
	public void insertCarta(Carte card) throws SQLException {
		ConnessioneDb con = new ConnessioneDb();
		try {
			con.connect();
			String query = "INSERT INTO carte (num_carta, scadenza, cvv, intestatario) VALUES" + "(?,?,?,?);";
			PreparedStatement st = con.getCon().prepareStatement(query);
			st.setString(1, card.getNumCarta());
			st.setString(2, card.getScadenza());
			st.setString(3, card.getCvv());
			st.setString(4, card.getIntestatario());
			st.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int selectCardPerUtente(String numCarta) {

		int idCarta = -1;
		ConnessioneDb con = new ConnessioneDb();
		try {
			con.connect();
			String query = "SELECT id_carta FROM carte WHERE num_carta=?";
			PreparedStatement st = con.getCon().prepareStatement(query);
			st.setString(1, numCarta);

			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				idCarta = rs.getInt("id_carta");
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return idCarta;
	}

	public Carte selectCartaByIdCarta(int idCarta) {
		Carte card = null;
		ConnessioneDb con = new ConnessioneDb();
		try {
			con.connect();
			String query = "SELECT * FROM carte WHERE id_carta=?";
			PreparedStatement st = con.getCon().prepareStatement(query);
			st.setInt(1, idCarta);

			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String numCarta = rs.getString("num_carta");
				String scadenza = rs.getString("scadenza");
				String cvv = rs.getString("cvv");
				String intestatario = rs.getString("intestatario");

				card = new Carte(idCarta, numCarta, scadenza, cvv, intestatario);

			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return card;
	}

	// Update carta
	public void updateCarta(Carte card) throws SQLException {
		ConnessioneDb con = new ConnessioneDb();
		try {
			con.connect();
			String query = "UPDATE carte SET num_carta=?, scadenza=?, cvv=?, intestatario=? WHERE id_carta=?;";
			PreparedStatement st = con.getCon().prepareStatement(query);
			st.setString(1, card.getNumCarta());
			st.setString(2, card.getScadenza());
			st.setString(3, card.getCvv());
			st.setString(4, card.getIntestatario());
			st.setInt(5, card.getIdCarta());
			st.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}