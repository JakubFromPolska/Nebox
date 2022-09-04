package Controller;

import java.sql.SQLException;

import DAO.DroneDAO;
import DAO.StazioniDAO;
import Model.Droni;

public class tester {

	public static void main(String[] args) {

		/* 
		Droni drone = new Droni("drone1", 3, "true");

		DroneDAO ddao = new DroneDAO();

		try {
			ddao.insertDroni(drone);
		} catch (SQLException e) {

			e.printStackTrace();

			ddao.selectDroni(0);
		} */
		
		StazioniDAO stdao = new StazioniDAO() ; 
		System.out.println(stdao.quantityDroni("San Siro"));
	}
}
