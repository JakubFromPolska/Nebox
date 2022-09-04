<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="DAO.StazioniDAO"%>
<%@page import="Model.*"%>
<%@page import="java.util.*"%>

<%
Noleggi noleggio = (Noleggi) request.getSession().getAttribute("noleggio");

if (noleggio != null && noleggio.getPacchetti() == 1) {
	response.sendRedirect("postNoleggioStandard.jsp");
} else if (noleggio != null && noleggio.getPacchetti() == 2) {
	response.sendRedirect("postNoleggioPremium.jsp");
} else if (noleggio != null && noleggio.getPacchetti() == 3) {
	response.sendRedirect("postNoleggioArte.jsp");
}

StazioniDAO stdao = new StazioniDAO();
List<Stazioni> numStazioni = stdao.selectAllStazioni();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mappa</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="footer.css">
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet" href="home.css">
<link rel="stylesheet" href="map.css">
</head>
<body>

	<!--Header-->
	<%@include file="navbar.jsp"%>


	<!-- MAPPA -->
	<div id="map"></div>

	<h2 id="scegli">Scegli una stazione</h2>

	<!-- CARDS -->

	<div class="row">
		<%
		if (!numStazioni.isEmpty()) {
			for (Stazioni s : numStazioni) {
				int quantita = stdao.quantityDroni(s.getNome());

				String link = "prenotazione.jsp";
				String style = "";
				if (quantita <= 0) {
			link = "#";
			style = "style='background-color: gray;'";
				}
		%>
		<div class="column">
			<a href=<%=link%> id=<%=s.getNome()%> onclick="passAttribute(this)"
				onmouseover="evidenzia(this)" onmouseout="togli(this)">
				<div class="card" <%=style%>>
					<h3><%=s.getNome()%></h3>
					<p>
						Droni disponibili:
						<%=quantita%></p>
				</div>
			</a>
		</div>
		<%
		}
		} else {
		out.println("There is no station");
		}
		%>
	</div>
	<%@include file="footer.html"%>

	<!-- END OF CARDS -->

	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCKNYTwiTiyiOM85MQaWLjv6XNoKO3uIvc&callback=initMap">		
	</script>
	<script src="map.js"></script>
	<script src="script.js"></script>
	<script src="https://unpkg.com/scrollreveal"></script>
	<script src="media.js"></script>
</body>
</html>