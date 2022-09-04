<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="footer.css">
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet" href="home.css">
<link rel="stylesheet" href="signup.css">

<title>Registrati</title>
<style>
</style>
</head>

<body>

	<!--Header-->
	<header>
		<a href="#" class="logo"><img src="img/icon.png" alt=""></a>
		<div class="bx bx-menu" id="menu-icon"></div>
		<ul class="navbar">
			<li><a href="index.jsp#home">Home</a></li>
			<li><a href="index.jsp#dettagli">Dettagli</a></li>
			<li><a href="index.jsp#servizi">Servizi</a></li>
			<li><a href="index.jsp#pacchetti">Pacchetti</a></li>
			<li><a href="faq.jsp">Faq</a></li>
		</ul>
		<div class="header-btn">
			<label class="sign-up">Registrati</label> <label class="sign-in"
				id="modal-btn">Login</label>
		</div>
	</header>

	<section class="registration">
		<div class="container">
			<div class="title">Registrati</div>
			<div class="content">
				<form action="Registration">
					<div class="user-details">
						<div class="input-box">
							<span class="details">Nome</span> <input type="text"
								placeholder="Nome" required name="nome">
						</div>
						<div class="input-box">
							<span class="details">Cognome</span> <input type="text"
								placeholder="Cognome" required name="cognome">
						</div>
						<div class="input-box">
							<span class="details">Data di nascita</span> <input type="date"
								placeholder="Data di nascita" required name="nascita">
						</div>
						<div class="input-box">
							<span class="details">Indirizzo</span> <input type="text"
								placeholder="Indirizzo" required name="indirizzo">
						</div>
						<div class="input-box">
							<span class="details">Città </span> <input type="text"
								placeholder="Città" required name="citta">
						</div>

						<div class="input-box">
							<span class="details">Email</span> <input type="email"
								placeholder="Email" required name="email">
						</div>
						<div class="input-box">
							<span class="details">Username</span> <input type="text"
								placeholder="Username" required name="username">
						</div>
						<div class="input-box">
							<span class="details">Telefono</span> <input type="text"
								placeholder="Telefono" required name="cell">
						</div>
						<div class="input-box">
							<span class="details">Nazionalità</span> <input type="text"
								placeholder="Nazionalità" required name="nazionalita">
						</div>
						<div class="input-box">
							<span class="details">Codice Fiscale</span> <input type="text"
								placeholder="Codice" required name="codicefiscale">
						</div>
						<div class="input-box">
							<span class="details">Password</span> <input type="password"
								placeholder="Password" required name="password">
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
						<input type="submit" value="Registrati">
					</div>
				</form>
			</div>
		</div>
	</section>

	<!--MODALE -->
	<div id="my-modal" class="modal">
		<div class="modal-content">
			<div class="modal-header">
				<span class="close">&times;</span>
				<h2>Login To Continue</h2>
			</div>
			<div class="modal-body">
				<form action="Login" method="post">
					<div class="input-box">
						<span id="username">Username</span> <input type="text"
							name="login-username" id="" placeholder="Username" required>
					</div>

					<div class="input-box">
						<span id="pwd">Password</span> <input type="password"
							placeholder="Password" required name="login-password"> <a
							href="adminLogin.jsp">Sei un admin?</a>
					</div>
			</div>
			<div class="modal-footer">
				<input type="submit" class="btn" value="Entra"> <a
					href="signup.jsp">Create Account</a>
			</div>
			</form>
		</div>
	</div>


	<%@include file="footer.html"%>

	<!--FINEMODALE-->
	<%
	if ((String) request.getSession().getAttribute("errore") == "email") {
		request.getSession().removeAttribute("errore");
	%>
	<script>
		alert("Email già  associata ad un account")
	</script>
	<%
	} else if ((String) request.getSession().getAttribute("errore") == "username") {
	request.getSession().removeAttribute("errore");
	%>
	<script>
		alert("Username già  esistente")
	</script>
	<%
	} else if ((String) request.getSession().getAttribute("errore") == "codFiscale") {
	request.getSession().removeAttribute("errore");
	%>
	<script>
		alert("Codice fiscale già  associato ad un account")
	</script>
	<%
	}
	%>



	<script src="https://unpkg.com/scrollreveal"></script>
	<script src="media.js"></script>
	<script src="script.js"></script>

</body>
</html>