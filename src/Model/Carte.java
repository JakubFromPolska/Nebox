package Model;

public class Carte {
	
	private int idCarta;
	private String numCarta;
	private String scadenza;
	private String cvv;
	private String intestatario;
	
	
	//costruttore con id per le select
	public Carte(int idCarta, String numCarta, String scadenza, String cvv, String intestatario) {
		super();
		this.idCarta = idCarta;
		this.numCarta = numCarta;
		this.scadenza = scadenza;
		this.cvv = cvv;
		this.intestatario = intestatario;
	}
	
	//costruttore senza id per le insert
	public Carte(String numCarta, String scadenza, String cvv, String intestatario) {
		super();
		this.numCarta = numCarta;
		this.scadenza = scadenza;
		this.cvv = cvv;
		this.intestatario = intestatario;
	}

	public int getIdCarta() {
		return idCarta;
	}

	public void setIdCarta(int idCarta) {
		this.idCarta = idCarta;
	}

	public String getNumCarta() {
		return numCarta;
	}

	public void setNumCarta(String numCarta) {
		this.numCarta = numCarta;
	}

	public String getScadenza() {
		return scadenza;
	}

	public void setScadenza(String scadenza) {
		this.scadenza = scadenza;
	}

	public String getCvv() {
		return cvv;
	}

	public void setCvv(String cvv) {
		this.cvv = cvv;
	}

	public String getIntestatario() {
		return intestatario;
	}

	public void setIntestatario(String intestatario) {
		this.intestatario = intestatario;
	}
	
	
	
	
}
