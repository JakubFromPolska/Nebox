package Model;

import java.io.Serializable;
import java.sql.Time;
import java.sql.Date;
import java.time.Duration;

public class Noleggi implements Serializable {
	private static final long serialVersionUID = 1L;

	private int idNoleggio;

	private Date data;
	private Time fineNol;
	private double importo;
	private Time inizioNol;
	private int idDroni;
	private int idPacchetti;
	private int idUtenti;

	public Noleggi() {
	}

	// costruttore senza idNoleggio
	public Noleggi(int idUtenti, int idDroni, int idPacchetti, Date data, Time inizioNol, Time fineNol,
			double importo) {
		super();

		this.data = data;
		this.fineNol = fineNol;
		this.importo = importo;
		this.inizioNol = inizioNol;
		this.idDroni = idDroni;
		this.idPacchetti = idPacchetti;
		this.idUtenti = idUtenti;
	}

	// costruttore con idNoleggio
	public Noleggi(int idNoleggio, int idUtenti, int idDroni, int idPacchetti, Date data, Time inizioNol, Time fineNol,
			double importo) {
		super();
		this.idNoleggio = idNoleggio;
		this.data = data;
		this.fineNol = fineNol;
		this.importo = importo;
		this.inizioNol = inizioNol;
		this.idDroni = idDroni;
		this.idPacchetti = idPacchetti;
		this.idUtenti = idUtenti;
	}

	public int getIdNoleggio() {
		return this.idNoleggio;
	}

	public void setIdNoleggio(int idNoleggio) {
		this.idNoleggio = idNoleggio;
	}

	public Date getData() {
		return this.data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public Time getFineNol() {
		return this.fineNol;
	}

	public void setFineNol(Time fineNol) {
		this.fineNol = fineNol;
	}

	public double getImporto() {
		return this.importo;
	}

	public void setImporto(double importo) {
		this.importo = importo;
	}

	public Time getInizioNol() {
		return this.inizioNol;
	}

	public void setInizioNol(Time inizioNol) {
		this.inizioNol = inizioNol;
	}

	public int getDroni() {
		return this.idDroni;
	}

	public void setDroni(int droni) {
		this.idDroni = droni;
	}

	public int getPacchetti() {
		return this.idPacchetti;
	}

	public void setPacchetti(int pacchetti) {
		this.idPacchetti = pacchetti;
	}

	public int getUtenti() {
		return this.idUtenti;
	}

	public void setUtenti(int utenti) {
		this.idUtenti = utenti;
	}

	public double calcolaImporto(double tariffa, Time inizio, Time fine) {
		long differenza = fine.getTime() - inizio.getTime();
		System.out.println(differenza);
		double diff = tariffa * (((double) differenza / 1000) / 60);
		if (diff < tariffa) {
			return tariffa;
		} else {
			double diffCents = Math.round(diff * 100);
			diff= diffCents/100;
			return diff;
		}
	}

}