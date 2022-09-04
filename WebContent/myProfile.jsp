<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="DAO.*"%>
<%@page import="Model.*"%>
<%@page import="java.util.*"%>

<%
Utenti user = (Utenti) request.getSession().getAttribute("auth");
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="footer.css">
<link rel="stylesheet" href="img/tableStorico/css/main.css">
<link rel="stylesheet" href="img/tableStorico/css/util.css">
<link rel="stylesheet" href="myProfile.css">
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet" href="home.css">

<title>Il mio profilo</title>

</head>

<body>
	<!--Header-->
	<%@include file="navbar.jsp"%>


	<div class="limiter">

		<h1
			style="color: #3db1fe; font-size: 2.5rem; font-weight: 600; margin: 0; position: relative; text-align: center; background-color: #fff; padding-top: 20px">Profilo</h1>

		<h2
			style="color: #3db1fe; font-size: 1.8rem; font-weight: 500; margin: 0; position: relative; text-align: center; background-color: #fff; padding-top: 20px">I
			miei dati</h2>

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
								<td class="column3 text-center">***********</td>
							</tr>
							<tr>
								<td class="column4 text-center" style="font-weight: bold">Carta
									Registrata</td>
								<td class="column3 text-center"><%=card.getNumCarta()%></td>
							</tr>
						</tbody>
					</table>

					<div class="header-btn" style="margin-top: 50px;">
						<a href="aggiornaDati.jsp"> <label class="sign-in"
							id="modal-btn">Modifica dati</label></a> <a
							href="aggiornaMetodoPagamento.jsp"> <label class="sign-in"
							id="modal-btn" style="margin-left: 520px;">Modifica
								metodo di pagamento</label></a>
					</div>
					<br> <br> <br>

				</div>
			</div>
		</div>


		<h2
			style="color: #3db1fe; font-size: 1.8rem; font-weight: 500; margin: 0; position: relative; text-align: center; background-color: #fff">I
			miei noleggi</h2>

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

	<%@include file="footer.html"%>
	<%@include file="timer.jsp"%>

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