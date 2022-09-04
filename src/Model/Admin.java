package Model;

public class Admin {

	private int idAdmin ;
	private String username ; 
	private String password ;
	public Admin(int idAdmin, String username, String password) {
		super();
		this.idAdmin = idAdmin;
		this.username = username;
		this.password = password;
	}
	public Admin(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	
	public int getIdAdmin() {
		return idAdmin;
	}
	public void setIdAdmin(int idAdmin) {
		this.idAdmin = idAdmin;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	} 
}
