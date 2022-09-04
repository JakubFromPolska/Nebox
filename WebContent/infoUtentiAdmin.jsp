<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="DAO.*"%>
<%@page import="Model.*"%>
<%@page import="java.util.*"%>

<%
Utenti user = (Utenti)request.getSession().getAttribute("user");
int idUtente = user.getIdUtente();
NoleggiDAO ndao = new NoleggiDAO();
List<Noleggi> listNoleggi = ndao.selectAllNoleggi(idUtente);

CarteDAO cdao = new CarteDAO();
Carte card = cdao.selectCartaByIdCarta(user.getIdCarta());
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
<title>Document</title>
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



	<div class="limiter">

		<h1
			style="color: #3db1fe; font-size: 2.5rem; font-weight: 600; margin: 0; position: relative; text-align: center; background-color: #fff; padding-top: 20px">Profilo Utente <%=user.getIdUtente()%></h1>

		<h2
			style="color: #3db1fe; font-size: 1.8rem; font-weight: 500; margin: 0; position: relative; text-align: center; background-color: #fff; padding-top: 20px">
			Dati</h2>

		<div class="container-table100" style="background-color: #fff">

			<div class="wrap-table100">
				<div class="table100">
					<table>
						<thead>
							<tr class="table100-head">
								<th class="column2 text-center"></th>
								<th class="column2 text-center"></th>
							</tr>
						</thead>
						<tbody>
							
							<tr>
								<td class="column4 text-center" style="font-weight: bold">Nome</td>
								<td class="column3 text-center"><%=user.getNome()%></td>
							</tr>
							<tr>
								<td class="column4 text-center" style="font-weight: bold">Cognome</td>
								<td class="column3 text-center"><%=user.getCognome()%></td>
							</tr>
							<tr>
								<td class="column4 text-center" style="font-weight: bold">Data
									di Nascita</td>
								<td class="column3 text-center"><%=user.getDataNascita()%></td>
							</tr>
							<tr>
								<td class="column4 text-center" style="font-weight: bold">Indirizzo</td>
								<td class="column3 text-center"><%=user.getIndirizzo()%></td>
							</tr>
							<tr>
								<td class="column4 text-center" style="font-weight: bold">Città</td>
								<td class="column3 text-center"><%=user.getCitta()%></td>
							<tr>
								<td class="column4 text-center" style="font-weight: bold">Email</td>
								<td class="column3 text-center"><%=user.getEmail()%></td>
							</tr>
							<tr>
								<td class="column4 text-center" style="font-weight: bold">Codice
									Fiscale</td>
								<td class="column3 text-center"><%=user.getCodFiscale()%></td>
							</tr>
							<tr>
								<td class="column4 text-center" style="font-weight: bold">Nazionalità</td>
								<td class="column3 text-center"><%=user.getNazionalita()%></td>
							</tr>
							<tr>
								<td class="column4 text-center" style="font-weight: bold">Username</td>
								<td class="column3 text-center"><%=user.getUsername()%></td>
							</tr>
							<tr>
								<td class="column4 text-center" style="font-weight: bold">Password</td>
								<td class="column3 text-center"><%=user.getPassword()%></td>
							</tr>
							<tr>
								<td class="column4 text-center" style="font-weight: bold">Carta
									Registrata</td>
								<td class="column3 text-center"><%=card.getNumCarta()%></td>
							</tr>
						</tbody>
					</table>

					<br> <br> <br>

				</div>
			</div>
		</div>


		<h2
			style="color: #3db1fe; font-size: 1.8rem; font-weight: 500; margin: 0; position: relative; text-align: center; background-color: #fff">
			Noleggi</h2>

		<div class="container-table100" style="background-color: #fff">

			<div class="wrap-table100">
				<div class="table100" id="tabNol">
					<table>
						<thead>
							<tr class="table100-head">
								<th class="column2 text-center">ID Noleggio</th>
								<th class="column2 text-center">ID Drone</th>
								<th class="column2 text-center">ID Pacchetto</th>
								<th class="column2 text-center">Data</th>
								<th class="column2 text-center">Orario Inizio</th>
								<th class="column2 text-center">Orario Fine</th>
								<th class="column2 text-center">Importo</th>
							</tr>
						</thead>
						<tbody>

							<%
							if (!listNoleggi.isEmpty()) {
								for (Noleggi n : listNoleggi) {
							%>
							<tr>
								<td class="column2 text-center"><%=n.getIdNoleggio()%></td>
								<td class="column2 text-center"><%=n.getDroni()%></td>
								<td class="column2 text-center"><%=n.getPacchetti()%></td>
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

	<script src="img/tableStorico/js/main.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/scrollreveal"></script>
	<script src="media.js"></script>
	<script src="script.js"></script>

</body>

</html>