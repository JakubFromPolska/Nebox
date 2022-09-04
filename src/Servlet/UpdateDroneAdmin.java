package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.DroneDAO;
import Model.Droni;


@WebServlet("/UpdateDroneAdmin")
public class UpdateDroneAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateDroneAdmin() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			Droni d1 = (Droni)request.getSession().getAttribute("drone");			
			String nome = request.getParameter("nomeDrone");
			String id_stazione = request.getParameter("id_stazione");
			int idStazione = Integer.parseInt(id_stazione);
			int idDrone = d1.getIdDrone();
			DroneDAO ddao = new DroneDAO();
			ddao.updateDrone(idDrone, nome, idStazione);
			request.getSession().setAttribute("checked", "1");
			response.sendRedirect("adminDashboard.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
