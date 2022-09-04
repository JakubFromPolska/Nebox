package Model;

import java.io.Serializable;
import java.util.List;



public class Stazioni implements Serializable {
	private static final long serialVersionUID = 1L;

	private int idStazione;
	private String nome;
	private String posizione;

	public Stazioni() {
	}

	public Stazioni(String nome, String posizione) {
		super();
		this.nome = nome;
		this.posizione = posizione;
	}
	
	public Stazioni(int idStazione,String nome, String posizione) {
		super();
		this.idStazione=idStazione;
		this.nome = nome;
		this.posizione = posizione;
	}

	public int getIdStazione() {
		return this.idStazione;
	}

	public void setIdStazione(int idStazione) {
		this.idStazione = idStazione;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getPosizione() {
		return this.posizione;
	}

	public void setPosizione(String posizione) {
		this.posizione = posizione;
	}
}