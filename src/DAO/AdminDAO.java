package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Model.Admin;
import Servlet.ConnessioneDb;

public class AdminDAO {

	// select admin 
	public Admin selectAdmin(String username, String password) {

		Admin admin = null;
		ConnessioneDb con = new ConnessioneDb();
		try {
			con.connect();
			String query = "SELECT * from admin WHERE username=? AND password=?;";
			PreparedStatement st = con.getCon().prepareStatement(query);
			st.setString(1, username);
			st.setString(2, password);
			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				int idAdmin = rs.getInt("id_admin");
				admin = new Admin(idAdmin, username, password);
			}
			con.close() ; 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return admin;
	}
}
