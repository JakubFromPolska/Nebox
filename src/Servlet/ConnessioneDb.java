package Servlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.jdbc.MysqlDataSource;

public class ConnessioneDb {

	private Connection con;
	private String jdbcURL = "jdbc:mysql://localhost:3306/drone?useSSL=false&serverTimezone=UTC";
	private String jdbcUsername = "root";
	private String jdbcPassword = "";

	public ConnessioneDb() {
		this.con = null;

	}

	public Connection getCon() {
		return con;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	public ResultSet executeQuery(String query) throws SQLException {
		PreparedStatement st = con.prepareStatement(query);
		ResultSet rs = st.executeQuery();
		return rs;

	}

	public boolean executeUpdate(String query) throws SQLException {
		PreparedStatement st = con.prepareStatement(query);
		boolean numRigheAggiornate = st.execute();
		return numRigheAggiornate;
	}

	public void close() throws SQLException {
		try {
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void connect() throws SQLException {
		if (con == null) {

			MysqlDataSource dataSource = new MysqlDataSource();
			dataSource.setURL(jdbcURL);
			dataSource.setUser(jdbcUsername);
			dataSource.setPassword(jdbcPassword);

			con = dataSource.getConnection();

			System.out.println("Connessione avvenuta con il database : " + con.getCatalog());

		}

	}
}
