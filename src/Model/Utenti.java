package Model;

import java.io.Serializable;
import java.util.List;



public class Utenti implements Serializable {
	private static final long serialVersionUID = 1L;

	private int idUtente;
	private int idCarta;
	private String citta;
	private String codFiscale;
	private String cognome;
	private String dataNascita;
	private String email;
	private String indirizzo;
	private String nazionalita;
	private String nome;
	private String numTel;
	private String password;
	private String username;


	private List<Noleggi> noleggis;

	public Utenti() {
	}

	//Creazione utente per login
	public Utenti(String password, String username) {
		super();
		this.password = password;
		this.username = username;
	}

	// creazione utente senza carta 
	public Utenti(String nome, String cognome, String dataNascita, String indirizzo, String citta, String email, String numTel, String codFiscale, String nazionalita, String username, String password) {
		super();
		this.codFiscale = codFiscale;
		this.nome = nome;
		this.cognome = cognome;
		this.dataNascita = dataNascita;
		this.indirizzo = indirizzo;
		this.citta = citta;
		this.email = email;
		this.numTel = numTel;
		this.nazionalita = nazionalita;
		this.username = username;
		this.password = password;
		this.idCarta = -1 ; 
	}

	// creazione utente con id_carta
	public Utenti(String nome, String cognome, String dataNascita, String indirizzo, String citta, String email, String numTel, String codFiscale, String nazionalita, String username, String password, int idCarta) {
		super();
		this.idCarta = idCarta;
		this.citta = citta;
		this.codFiscale = codFiscale;
		this.cognome = cognome;
		this.dataNascita = dataNascita;
		this.email = email;
		this.indirizzo = indirizzo;
		this.nazionalita = nazionalita;
		this.nome = nome;
		this.numTel = numTel;
		this.password = password;
		this.username = username;
	}
	
	// creazione utente con id 
	public Utenti(int id,String nome, String cognome, String dataNascita, String indirizzo, String citta, String email, String numTel, String codFiscale, String nazionalita, String username, String password, int idCarta ) {
		super();
		this.idUtente = id;
		this.idCarta = idCarta;
		this.citta = citta;
		this.codFiscale = codFiscale;
		this.cognome = cognome;
		this.dataNascita = dataNascita;
		this.email = email;
		this.indirizzo = indirizzo;
		this.nazionalita = nazionalita;
		this.nome = nome;
		this.numTel = numTel;
		this.password = password;
		this.username = username;
		this.noleggis = noleggis;
	}

	public int getIdUtente() {
		return this.idUtente;
	}

	public void setIdUtente(int idUtente) {
		this.idUtente = idUtente;
	}

	public int getIdCarta() {
		return this.idCarta;
	}

	public void setIdCarta(int idCarta) {
		this.idCarta = idCarta;
	}

	public String getCitta() {
		return this.citta;
	}

	public void setCitta(String citta) {
		this.citta= citta;
	}

	public String getCodFiscale() {
		return this.codFiscale;
	}

	public void setCodFiscale(String codFiscale) {
		this.codFiscale = codFiscale;
	}

	public String getCognome() {
		return this.cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getDataNascita() {
		return this.dataNascita;
	}

	public void setDataNascita(String dataNascita) {
		this.dataNascita = dataNascita;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIndirizzo() {
		return this.indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

	public String getNazionalita() {
		return this.nazionalita;
	}

	public void setNazionalita(String nazionalita) {
		this.nazionalita= nazionalita;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getNumTel() {
		return this.numTel;
	}

	public void setNumTel(String numTel) {
		this.numTel = numTel;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public List<Noleggi> getNoleggis() {
		return this.noleggis;
	}

	public void setNoleggis(List<Noleggi> noleggis) {
		this.noleggis = noleggis;
	}



}