 package Model;

import java.io.Serializable;
import java.util.List;


public class Pacchetti implements Serializable {
	private static final long serialVersionUID = 1L;


	private int idPacchetto;

	private String nome;

	private double tariffa;


	private List<Noleggi> noleggis;
	
	
	public Pacchetti() {
	}
	

	public Pacchetti(int idPacchetto, String nome, double tariffa) {
		this.idPacchetto = idPacchetto;
		this.nome = nome;
		this.tariffa = tariffa;
	}
	
	public Pacchetti( String nome, double tariffa) {
		this.nome = nome;
		this.tariffa = tariffa;
	}


	public int getIdPacchetto() {
		return this.idPacchetto;
	}

	public void setIdPacchetto(int idPacchetto) {
		this.idPacchetto = idPacchetto;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public double getTariffa() {
		return this.tariffa;
	}

	public void setTariffa(double tariffa) {
		this.tariffa = tariffa;
	}

	public List<Noleggi> getNoleggis() {
		return this.noleggis;
	}

	public void setNoleggis(List<Noleggi> noleggis) {
		this.noleggis = noleggis;
	}



}