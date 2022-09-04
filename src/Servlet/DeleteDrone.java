package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.DroneDAO;
import Model.Droni;

@WebServlet("/DeleteDrone")
public class DeleteDrone extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteDrone() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try (PrintWriter out = response.getWriter()) {
			
			String id_drone = request.getParameter("id_drone");
			int idDrone = Integer.parseInt(id_drone);
			DroneDAO ddao = new DroneDAO();
			if (ddao.deleteDrone(idDrone)) {
				request.getSession().setAttribute("checked", "1");
				response.sendRedirect("adminDashboard.jsp");
			} else {
				out.println("Cancellazione non riuscito");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
