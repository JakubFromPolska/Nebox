package Model;

import java.io.Serializable;

public class Droni implements Serializable {
	private static final long serialVersionUID = 1L;

	private int idDrone;
	private boolean disponibile;
	private String nome;
	private int idStazione;

	public Droni() {
	}

	public Droni(int idDrone, String nome, int idStazioni, boolean disponibile) {
		super();
		this.idDrone = idDrone;
		this.disponibile = disponibile;
		this.nome = nome;
		this.idStazione = idStazioni;
	}

	public Droni(String nome, int idStazioni, boolean disponibile) {
		super();
		this.disponibile = disponibile;
		this.nome = nome;
		this.idStazione = idStazioni;
	}

	public Droni(String nome, int idStazione) {
		super();
		this.nome = nome;
		this.idStazione = idStazione;
		this.disponibile = true;
	}
	

	public Droni(int idDrone, String nome, int idStazione) {
		super();
		this.idDrone = idDrone;
		this.nome = nome;
		this.idStazione = idStazione;
		this.disponibile = true;
	}

	public int getIdDrone() {
		return this.idDrone;
	}

	public void setIdDrone(int idDrone) {
		this.idDrone = idDrone;
	}

	public boolean getDisponibile() {
		return this.disponibile;
	}

	public void setDisponibile(boolean disponibile) {
		this.disponibile = disponibile;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getIdStazione() {
		return this.idStazione;
	}

	public void setIdStazione(int stazioni) {
		this.idStazione = stazioni;
	}

}