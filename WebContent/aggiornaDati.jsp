<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="DAO.*"%>
<%@page import="Model.*"%>

<%
Utenti user = (Utenti) request.getSession().getAttribute("auth");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Aggiorna Dati </title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="footer.css">
<link rel="stylesheet" href="signup.css">
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css'
	rel='stylesheet'>


</head>
<body>

	<%@include file="navbar.jsp"%>

	<section class="registration">
		<div class="container">
			<div class="title">Modifica dati</div>
			<div class="content">
				<form action="AggiornaDatiUtente" method="get">
					<div class="user-details">
						<div class="input-box">
							<span class="details">Nome</span> <input type="text"
								placeholder="Enter your name" required name="nome"
								value=<%=user.getNome()%>>

						</div>
						<div class="input-box">
							<span class="details">Cognome</span> <input type="text"
								placeholder="Enter your surname" required name="cognome"
								value=<%=user.getCognome()%>>
						</div>
						<div class="input-box">
							<span class="details">Data di nascita</span> <input type="date"
								placeholder="yyyy/mm/dd" required name="nascita"
								value=<%=user.getDataNascita()%>>
						</div>
						<div class="input-box">
							<span class="details">Indirizzo</span> <input type="text"
								placeholder="Enter your address" required name="indirizzo"
								value=<%=user.getIndirizzo()%>>
						</div>
						<div class="input-box">
							<span class="details">Città</span> <input type="text"
								placeholder="Enter your city" required name="citta"
								value=<%=user.getCitta()%>>
						</div>

						<div class="input-box">
							<span class="details">Email</span> <input type="email"
								placeholder="Confirm your email" required name="email"
								value=<%=user.getEmail()%>>
						</div>
						<div class="input-box">
							<span class="details">Username</span> <input type="text"
								placeholder="Confirm your username" readonly required
								name="username" value=<%=user.getUsername()%>>
						</div>
						<div class="input-box">
							<span class="details">Telefono</span> <input type="text"
								placeholder="Confirm your number" required name="cell"
								value=<%=user.getNumTel()%>>
						</div>
						<div class="input-box">
							<span class="details">Nazionalità</span> <input type="text"
								placeholder="Confirm your nationality" required
								name="nazionalita" value=<%=user.getNazionalita()%>>
						</div>
						<div class="input-box">
							<span class="details">Codice Fiscale</span> <input type="text"
								placeholder="xxxxh501xxxxx" required name="codicefiscale"
								value=<%=user.getCodFiscale()%>>
						</div>
						<div class="input-box">
							<span class="details">Password</span> <input type="password"
								placeholder="Confirm your password" required name="password"
								value=<%=user.getPassword()%>>
						</div>
					</div>
					<div class="gender-details">
						<input type="radio" name="gender" id="dot-1"> <span
							class="gender-title">Accettazione</span> <br>
						<div class="category">
							<label for="dot-1"> <span class="dot one"></span> <span
								class="gender">Accetto i Termini e condizioni secondo la
									legge in vigore</span>
							</label>
						</div>
					</div>
					<div class="button">
						<input type="submit" value="Modifica">
					</div>
				</form>
			</div>
		</div>
	</section>

	<%@include file="footer.html"%>

	<%
	if ((String) request.getSession().getAttribute("errore") == "email") {
	%>
	<script>
		alert("Email già associata ad un account")
	</script>
	<%
	} else if ((String) request.getSession().getAttribute("errore") == "username") {
	%>
	<script>
		alert("Username già esistente")
	</script>
	<%
	} else if ((String) request.getSession().getAttribute("errore") == "codFiscale") {
	%>
	<script>
		alert("Codice fiscale già associato ad un account")
	</script>
	<%
	}
	%>

	<%@include file="timer.jsp"%>
	<script src="https://unpkg.com/scrollreveal"></script>
	<script src="media.js"></script>
	<script src="script.js"></script>


</body>
</html>