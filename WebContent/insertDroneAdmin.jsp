<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="DAO.*"%>
<%@page import="Model.*"%>
<%@page import="java.util.*"%>

<%
StazioniDAO sdao = new StazioniDAO();
List<Stazioni> stazioni = sdao.selectAllStazioniAdmin();

%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Aggiungi Drone</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="footer.css">
<link rel="stylesheet" href="prenotazione.css">
<link rel="stylesheet" href="home.css">
<link rel="stylesheet" href="regis.css">
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css'
	rel='stylesheet'>
</head>
<body>


	<!-- Header-->
	<header style="position: sticky;">
		<a href="#" class="logo"><img src="img/icon.png" alt=""></a>
		<div class="bx bx-menu" id="menu-icon"></div>
		<div class="header-btn">
			<a href="LogoutAdmin"><label class="sign-in" id="modal-btn">Logout</label></a>
			<a href="adminDashboard.jsp"><label class="sign-in"
				id="modal-btn">Dashboard</label></a>
		</div>

	</header>

	<section class="registration">
		<div class="container">
			<div class="title">Aggiungi Drone</div>
			<div class="content">
				<form action="inserisciDrone" method="post">
					<div class="user-details">
						<div class="input-box">
							<span class="details"></span>Nome<input type="text"
								name="nomeDrone" id="stazione">
						</div>
						<div class="input-box">
							<span class="details">Stazione</span> <select name="id_stazione"
								id="pacchetto">
										<%
		if (!stazioni.isEmpty()) {
			for (Stazioni s : stazioni) {
			
		%>	
								<option value=<%=s.getIdStazione()%>><%=s.getNome()%></option>	
		<%
			}
		}
		%>						
							</select>
							
						</div>
					</div>
					<div class="button">
						<input type="submit" value="Aggiungi">
					</div>
				</form>
			</div>
		</div>
	</section>




	<script src="https://unpkg.com/scrollreveal"></script>
	<script src="media.js"></script>


</body>
</html>