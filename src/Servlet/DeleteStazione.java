package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.StazioniDAO;

@WebServlet("/DeleteStazione")
public class DeleteStazione extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteStazione() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try (PrintWriter out = response.getWriter()) {
			String id_stazione = request.getParameter("id_stazione");
			int idStazione = Integer.parseInt(id_stazione);
			StazioniDAO sdao = new StazioniDAO();
			if (sdao.deleteStazione(idStazione)) {
				request.getSession().setAttribute("checked", "0");
				response.sendRedirect("adminDashboard.jsp");
			} else {
				out.println("Cancellazione non riuscita");
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
