package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.Utenti;
import Servlet.ConnessioneDb;

public class UtentiDAO {

	// Insert nuovo utente
	public void insertUtente(Utenti u) throws SQLException {
		ConnessioneDb con = new ConnessioneDb();
		try {
			con.connect();
			String query = "INSERT INTO utenti (nome, cognome, data_nascita, indirizzo, citta, email, num_tel, cod_fiscale, nazionalita, username, password, id_carta) VALUES"
					+ "(?,?,?,?,?,?,?,?,?,?,?,?);";
			PreparedStatement st = con.getCon().prepareStatement(query);
			st.setString(1, u.getNome());
			st.setString(2, u.getCognome());
			st.setString(3, u.getDataNascita());
			st.setString(4, u.getIndirizzo());
			st.setString(5, u.getCitta());
			st.setString(6, u.getEmail());
			st.setString(7, u.getNumTel());
			st.setString(8, u.getCodFiscale());
			st.setString(9, u.getNazionalita());
			st.setString(10, u.getUsername());
			st.setString(11, u.getPassword());
			st.setInt(12, u.getIdCarta());
			st.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// Select username e password per login

	public Utenti selectUsernamePassword(String username, String password) {

		Utenti user = null;
		ConnessioneDb con = new ConnessioneDb();
		try {
			con.connect();
			String query = "SELECT * from utenti WHERE username=? AND password=?;";
			PreparedStatement st = con.getCon().prepareStatement(query);
			st.setString(1, username);
			st.setString(2, password);
			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				int idUtente = rs.getInt("id_utente");
				String nome = rs.getString("nome");
				String cognome = rs.getString("cognome");
				String dataNascita = rs.getString("data_nascita");
				String indirizzo = rs.getString("indirizzo");
				String citta = rs.getString("citta");
				String email = rs.getString("email");
				String numTel = rs.getString("num_tel");
				String codFiscale = rs.getString("cod_fiscale");
				String nazionalita = rs.getString("nazionalita");
				int idCarta = rs.getInt("id_carta");
				user = new Utenti(idUtente, nome, cognome, dataNascita, indirizzo, citta, email, numTel, codFiscale,
						nazionalita, username, password, idCarta);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	// Select utente per admin
	public Utenti selectUtente(int id) {
		Utenti user = null;
		ConnessioneDb con = new ConnessioneDb();
		try {
			con.connect();
			String query = "SELECT * from utenti WHERE id_utente=?";
			PreparedStatement st = con.getCon().prepareStatement(query);

			st.setInt(1, id);

			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				String nome = rs.getString("nome");
				String cognome = rs.getString("cognome");
				String dataNascita = rs.getString("data_nascita");
				String indirizzo = rs.getString("indirizzo");
				String citta = rs.getString("citta");
				String email = rs.getString("email");
				String numTel = rs.getString("num_tel");
				String codFiscale = rs.getString("cod_fiscale");
				String nazionalita = rs.getString("nazionalita");
				String username = rs.getString("username");
				String password = rs.getString("password");
				int idCarta = rs.getInt("id_carta");
				user = new Utenti(nome, cognome, dataNascita, indirizzo, citta, email, numTel, codFiscale, nazionalita,
						username, password, idCarta);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	// Select di tutti gli utenti per admin
	public List<Utenti> selectAllUtenti() {
		List<Utenti> users = new ArrayList<>();
		Utenti user = null;
		ConnessioneDb con = new ConnessioneDb();
		try {
			con.connect();
			String query = "SELECT * from utenti";
			PreparedStatement st = con.getCon().prepareStatement(query);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int idUtente = rs.getInt("id_utente");
				String nome = rs.getString("nome");
				String cognome = rs.getString("cognome");
				String dataNascita = rs.getString("data_nascita");
				String indirizzo = rs.getString("indirizzo");
				String citta = rs.getString("citta");
				String email = rs.getString("email");
				String numTel = rs.getString("num_tel");
				String codFiscale = rs.getString("cod_fiscale");
				String nazionalita = rs.getString("nazionalita");
				String username = rs.getString("username");
				String password = rs.getString("password");
				int idCarta = rs.getInt("id_carta");
				user = new Utenti(idUtente, nome, cognome, dataNascita, indirizzo, citta, email, numTel, codFiscale,
						nazionalita, username, password, idCarta);
				users.add(user);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}

//	// Select di tutti gli utenti (senza idCarta) per controllo registrazione utente già esistente  (aggiunto da Chiara 04/03)
//	public List<Utenti> controllaUtenti() {
//		List<Utenti> users = new ArrayList<>();
//		Utenti user = null;
//		ConnessioneDb con = new ConnessioneDb();
//		try {
//			con.connect();
//			String query = "SELECT * from utenti";
//			PreparedStatement st = con.getCon().prepareStatement(query);
//			ResultSet rs = st.executeQuery();
//			while (rs.next()) {
//				String nome = rs.getString("nome");
//				String cognome = rs.getString("cognome");
//				String dataNascita = rs.getString("data_nascita");
//				String indirizzo = rs.getString("indirizzo");
//				String citta = rs.getString("citta");
//				String email = rs.getString("email");
//				String numTel = rs.getString("num_tel");
//				String codFiscale = rs.getString("cod_fiscale");
//				String nazionalita = rs.getString("nazionalita");
//				String username = rs.getString("username");
//				String password = rs.getString("password");
//				user = new Utenti(nome, cognome, dataNascita, indirizzo, citta, email, numTel, codFiscale, nazionalita,
//						username, password);
//				users.add(user);
//			}
//			con.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return users;
//	}

	// Select utente per admin
	public Utenti selectUtenteByUsername(String username1) {
		Utenti user = null;
		ConnessioneDb con = new ConnessioneDb();
		try {
			con.connect();
			String query = "SELECT * from utenti WHERE username=?";
			PreparedStatement st = con.getCon().prepareStatement(query);

			st.setString(1, username1);

			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				int id_utente = rs.getInt("id_utente");
				String nome = rs.getString("nome");
				String cognome = rs.getString("cognome");
				String dataNascita = rs.getString("data_nascita");
				String indirizzo = rs.getString("indirizzo");
				String citta = rs.getString("citta");
				String email = rs.getString("email");
				String numTel = rs.getString("num_tel");
				String codFiscale = rs.getString("cod_fiscale");
				String nazionalita = rs.getString("nazionalita");
				String username = rs.getString("username");
				String password = rs.getString("password");
				int idCarta = rs.getInt("id_carta");
				user = new Utenti(id_utente, nome, cognome, dataNascita, indirizzo, citta, email, numTel, codFiscale,
						nazionalita, username, password, idCarta);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	public List<String> selectAllUsername() {
		List<String> usernames = new ArrayList<>();
		ConnessioneDb con = new ConnessioneDb();
		try {
			con.connect();
			String query = "SELECT username from utenti";
			PreparedStatement st = con.getCon().prepareStatement(query);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String username = rs.getString("username");
				usernames.add(username);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return usernames;
	}

	public List<String> selectAllEmail() {
		List<String> emails = new ArrayList<>();
		ConnessioneDb con = new ConnessioneDb();
		try {
			con.connect();
			String query = "SELECT email from utenti";
			PreparedStatement st = con.getCon().prepareStatement(query);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String email = rs.getString("email");
				emails.add(email);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return emails;
	}

	public List<String> selectAllCodFiscale() {
		List<String> codici = new ArrayList<>();
		ConnessioneDb con = new ConnessioneDb();
		try {
			con.connect();
			String query = "SELECT cod_fiscale from utenti";
			PreparedStatement st = con.getCon().prepareStatement(query);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String codFiscale = rs.getString("cod_fiscale");
				codici.add(codFiscale);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return codici;
	}

	public void updateUtente(Utenti u) {

		ConnessioneDb con = new ConnessioneDb();
		try {
			con.connect();
			String query = "UPDATE utenti SET nome=?, cognome=?, data_nascita=?, indirizzo=?, citta=?, email=?, num_tel=?, cod_fiscale=?, nazionalita=?, password=? WHERE username=?;";
			PreparedStatement st = con.getCon().prepareStatement(query);

			st.setString(1, u.getNome());
			st.setString(2, u.getCognome());
			st.setString(3, u.getDataNascita());
			st.setString(4, u.getIndirizzo());
			st.setString(5, u.getCitta());
			st.setString(6, u.getEmail());
			st.setString(7, u.getNumTel());
			st.setString(8, u.getCodFiscale());
			st.setString(9, u.getNazionalita());
			st.setString(10, u.getPassword());
			st.setString(11, u.getUsername());
			st.executeUpdate();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// Select utente per admin
	public Utenti selectUtenteId(int id) {
		Utenti user = null;
		ConnessioneDb con = new ConnessioneDb();
		try {
			con.connect();
			String query = "SELECT * from utenti WHERE id_utente=?";
			PreparedStatement st = con.getCon().prepareStatement(query);

			st.setInt(1, id);

			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				int idUtente = rs.getInt("id_utente");
				String nome = rs.getString("nome");
				String cognome = rs.getString("cognome");
				String dataNascita = rs.getString("data_nascita");
				String indirizzo = rs.getString("indirizzo");
				String citta = rs.getString("citta");
				String email = rs.getString("email");
				String numTel = rs.getString("num_tel");
				String codFiscale = rs.getString("cod_fiscale");
				String nazionalita = rs.getString("nazionalita");
				String username = rs.getString("username");
				String password = rs.getString("password");
				int idCarta = rs.getInt("id_carta");
				user = new Utenti(idUtente, nome, cognome, dataNascita, indirizzo, citta, email, numTel, codFiscale,
						nazionalita, username, password, idCarta);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

}
