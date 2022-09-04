<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="DAO.*"%>
<%@page import="Model.*"%>
<%@page import="java.util.*"%>

<%
if (request.getSession().getAttribute("admin") == null) {
	response.sendRedirect("index.jsp");
}
;
NoleggiDAO ndao = new NoleggiDAO();
DroneDAO ddao = new DroneDAO();
StazioniDAO sdao = new StazioniDAO();
UtentiDAO udao = new UtentiDAO();
List<Noleggi> noleggi = ndao.selectAllNoleggiAdmin();
List<Droni> droni = ddao.selectAllDroni();
List<Stazioni> stazioni = sdao.selectAllStazioniAdmin();
List<Utenti> users = udao.selectAllUtenti();
PacchettiDAO pdao = new PacchettiDAO();
String[] vaiA = { "", "", "", "" };
String attribute = (String) request.getSession().getAttribute("checked");

if (attribute != null) {
	int indexPage = Integer.parseInt(attribute);
	switch (indexPage) {
	case 0:
		vaiA[0] = "checked";
		break;
	case 1:
		vaiA[1] = "checked";
		break;
	case 2:
		vaiA[2] = "checked";
		break;
	case 3:
		vaiA[3] = "checked";
		break;
	}
}
%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="homeAdmin.css">
<link rel="stylesheet" href="adminPage.css">
<link rel="stylesheet" href="img/tableStorico/css/main.css">
<link rel="stylesheet" href="img/tableStorico/css/util.css">
<link rel="stylesheet" href="myProfile.css">

<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css'
	rel='stylesheet'>
<title>Dashboard</title>
</head>
<body>
	<!--Header-->
	<header style="position: sticky;">
		<a href="#" class="logo"><img src="img/icon.png" alt=""></a>
		<div class="bx bx-menu" id="menu-icon"></div>
		<div class="header-btn">
			<a href="LogoutAdmin"><label class="sign-in" id="modal-btn">Logout</label></a>
			<a href="adminDashboard.jsp"><label class="sign-in"
				id="modal-btn">Dashboard</label></a>
		</div>

	</header>
	<div class="container3">
		<div class="topic">Admin Dashboard</div>
		<div class="content3">
			<input type="radio" name="slider" <%=vaiA[0]%> id="stazioni">
			<input type="radio" name="slider" <%=vaiA[1]%> id="droni"> <input
				type="radio" name="slider" <%=vaiA[2]%> id="noleggi"> <input
				type="radio" name="slider" <%=vaiA[3]%> id="utenti">


			<div class="list">
				<label for="stazioni" class="stazioni"> <span class="title">Stazioni</span>
				</label> <label for="droni" class="droni"> <span class="title">Droni</span>
				</label> <label for="noleggi" class="noleggi"> <span class="title">Noleggi</span>
				</label> <label for="utenti" class="utenti"> <span class="title">Utenti</span>
				</label>
				<div class="slider"></div>
			</div>
			<div class="text-content">
				<div class="stazioni text">
					<div class="title">Stazioni</div>
					<div class="container-table100" style="background-color: #fff">
						<div class="wrap-table100">
							<div class="table100">
								<table>
									<thead>
										<tr class="table100-head">
											<th class="column2 text-center">ID Stazione</th>
											<th class="column2 text-center">Nome</th>
											<th class="column2 text-center">Posizione</th>
											<th class="column2 text-center"></th>
											<th class="column2 text-center"></th>
										</tr>
									</thead>
									<tbody>

										<%
										if (!stazioni.isEmpty()) {
											for (Stazioni s : stazioni) {
										%>
										<tr>
											<td class="column2 text-center"><%=s.getIdStazione()%></td>
											<td class="column2 text-center"><%=s.getNome()%></td>
											<td class="column2 text-center"><%=s.getPosizione()%></td>
											<td class="column2 text-center">
												<form method="post" id="<%=s.getIdStazione()%>"
													action="DeleteStazione"></form> <input type="hidden"
												value=<%=s.getIdStazione()%> name="id_stazione"
												form=<%=s.getIdStazione()%> />
												<button type="submit" form=<%=s.getIdStazione()%>>Elimina</button>
											</td>
											<td class="column2 text-center">

												<form method="post" id="<%=s.getNome()%>"
													action="modificaStazioneAdmin.jsp"></form> <input
												type="hidden" value=<%=s.getIdStazione()%>
												name="id_stazione" form=<%=s.getNome()%> />
												<button type="submit" form=<%=s.getNome()%>>Modifica</button>
											</td>

										</tr>
										<%
										}
										} else {
										%>
										<tr>
											<td class="column2 text-center">--</td>
											<td class="column2 text-center">--</td>
											<td class="column2 text-center">--</td>
											<td class="column2 text-center">--</td>
											<td class="column2 text-center">--</td>

										</tr>
										<%
										}
										%>
									</tbody>
								</table>


								<div class="header-btn" style="margin-top: 50px;">
									<a href="insertStazioneAdmin.jsp"> <label class="sign-in"
										id="modal-btn">Aggiungi Stazione</label></a>

								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="droni text">
					<div class="title">Droni</div>
					<div class="container-table100" style="background-color: #fff">
						<div class="wrap-table100">
							<div class="table100">

								<table>
									<thead>
										<tr class="table100-head">
											<th class="column2 text-center">ID Drone</th>
											<th class="column2 text-center">Nome</th>
											<th class="column2 text-center">Disponibilita</th>
											<th class="column2 text-center">ID Stazione</th>
											<th class="column2 text-center">Stazione</th>
											<th class="column2 text-center"></th>
											<th class="column2 text-center"></th>
										</tr>
									</thead>
									<tbody>

										<%
										if (!droni.isEmpty()) {
											for (Droni d : droni) {
												Stazioni s = sdao.selectStazione(d.getIdStazione());
										%>
										<tr>
											<td class="column2 text-center"><%=d.getIdDrone()%></td>
											<td class="column2 text-center"><%=d.getNome()%></td>
											<td class="column2 text-center"><%=d.getDisponibile()%></td>
											<td class="column2 text-center"><%=d.getIdStazione()%></td>
											<td class="column2 text-center"><%=s.getNome()%></td>
											<td class="column2 text-center">
												<form method="post" id="<%=d.getIdDrone()%>"
													action="DeleteDrone"></form> <input type="hidden"
												value=<%=d.getIdDrone()%> name="id_drone"
												form=<%=d.getIdDrone()%> />
												<button type="submit" form=<%=d.getIdDrone()%>>Elimina</button>
											</td>
											<td class="column2 text-center">

												<form method="post" id="<%=d.getNome()%>"
													action="modificaDroneAdmin.jsp"></form> <input
												type="hidden" value=<%=d.getIdDrone()%> name="id_drone"
												form=<%=d.getNome()%> />
												<button type="submit" form=<%=d.getNome()%>>Modifica</button>
											</td>
										</tr>
										<%
										}
										} else {
										%>
										<tr>
											<td class="column2 text-center">--</td>
											<td class="column2 text-center">--</td>
											<td class="column2 text-center">--</td>
											<td class="column2 text-center">--</td>
											<td class="column2 text-center">--</td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>



								<div class="header-btn" style="margin-top: 50px;">
									<a href="insertDroneAdmin.jsp"> <label class="sign-in"
										id="modal-btn">Aggiungi Drone</label></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="noleggi text">
					<div class="title">Noleggi</div>
					<div class="container-table100" style="background-color: #fff">
						<div class="wrap-table100">
							<div class="table100">
								<table>
									<thead>
										<tr class="table100-head">
											<th class="column2 text-center">ID Noleggio</th>
											<th class="column2 text-center">ID Utente</th>
											<th class="column2 text-center">ID Drone</th>
											<th class="column2 text-center">ID Pacchetto</th>
											<th class="column2 text-center">Pacchetto</th>
											<th class="column2 text-center">Data</th>
											<th class="column2 text-center">Inizio Noleggio</th>
											<th class="column2 text-center">Fine Noleggio</th>
											<th class="column2 text-center">Importo</th>

										</tr>
									</thead>
									<tbody>

										<%
										if (!noleggi.isEmpty()) {
											for (Noleggi n : noleggi) {
												Pacchetti p = pdao.selectPacchetti(n.getPacchetti());
										%>
										<tr>
											<td class="column2 text-center"><%=n.getIdNoleggio()%></td>
											<td class="column2 text-center"><%=n.getUtenti()%></td>
											<td class="column2 text-center"><%=n.getDroni()%></td>
											<td class="column2 text-center"><%=n.getPacchetti()%></td>
											<td class="column2 text-center"><%=p.getNome()%></td>
											<td class="column2 text-center"><%=n.getData()%></td>
											<td class="column2 text-center"><%=n.getInizioNol()%></td>
											<td class="column2 text-center"><%=n.getFineNol()%></td>
											<td class="column2 text-center"><%=n.getImporto()%></td>

										</tr>
										<%
										}
										} else {
										%>
										<tr>
											<td class="column2 text-center">--</td>
											<td class="column2 text-center">--</td>
											<td class="column2 text-center">--</td>
											<td class="column2 text-center">--</td>
											<td class="column2 text-center">--</td>
											<td class="column2 text-center">--</td>
											<td class="column2 text-center">--</td>
											<td class="column2 text-center">--</td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>


							</div>
						</div>
					</div>
				</div>
				<div class="utenti text">
					<div class="title">Utenti</div>
					<div class="container-table100" style="background-color: #fff">
						<div class="wrap-table100">
							<div class="table100">

								<table>
									<thead>
										<tr class="table100-head">
											<th class="column2 text-center">ID Utente</th>
											<th class="column2 text-center">Nome</th>
											<th class="column2 text-center">Cognome</th>
											<th class="column2 text-center">Username</th>
											<th class="column2 text-center">Password</th>
											<th class="column2 text-center">Email</th>
											<th class="column2 text-center">Telefono</th>
											<th class="column2 text-center">ID Carta</th>
											<th class="column2 text-center"></th>
										</tr>
									</thead>
									<tbody>

										<%
										if (!users.isEmpty()) {
											for (Utenti u : users) {
										%>

										<tr>
											<td class="column2 text-center"><%=u.getIdUtente()%></td>
											<td class="column2 text-center"><%=u.getNome()%></td>
											<td class="column2 text-center"><%=u.getCognome()%></td>
											<td class="column2 text-center"><%=u.getUsername()%></td>
											<td class="column2 text-center"><%=u.getPassword()%></td>
											<td class="column2 text-center"><%=u.getEmail()%></td>
											<td class="column2 text-center"><%=u.getNumTel()%></td>
											<td class="column2 text-center"><%=u.getIdCarta()%></td>
											<td class="column2 text-center">
												<form method="post" id="<%=u.getUsername()%>"
													action="InfoUtente"></form> <input type="hidden"
												value=<%=u.getUsername()%> name="username"
												form=<%=u.getUsername()%> />
												<button type="submit" form=<%=u.getUsername()%>>More</button>
											</td>
										</tr>
										<%
										}
										} else {
										%>

										<tr>
											<td class="column2 text-center">--</td>
											<td class="column2 text-center">--</td>
											<td class="column2 text-center">--</td>
											<td class="column2 text-center">--</td>
											<td class="column2 text-center">--</td>
											<td class="column2 text-center">--</td>
											<td class="column2 text-center">--</td>
											<td class="column2 text-center">--</td>
											<td class="column2 text-center">--</td>
											<td class="column2 text-center">--</td>
											<td class="column2 text-center">--</td>
											<td class="column2 text-center">--</td>
											<td class="column2 text-center">--</td>

										</tr>
										<%
										}
										%>
									</tbody>
								</table>

							</div>
						</div>
					</div>
				</div>

			</div>

		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>

	<script src="media.js"></script>
	<script src="script.js"></script>
</body>
</html>