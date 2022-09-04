<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="footer.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet" href="home.css">

<title>NeboX</title>
</head>

<body>
	<!--Header-->
	<header style="position: sticky;">
		<a href="#" class="logo"><img src="img/icon.png" alt=""></a>

		<div class="bx bx-menu" id="menu-icon"></div>
		<ul class="navbar">
			<li><a href="index.jsp">Home</a></li>
			<li><a href="index.jsp#dettagli"> Dettagli </a></li>
			<li><a href="index.jsp#pacchetti"> Pacchetti </a></li>
			<li><a href="dettagli2.jsp"> Servizi </a></li>
			<li><a href="faq.jsp">Faq</a></li>
		</ul>

		<%
		if (request.getSession().getAttribute("auth") != null) {
		%>
		<div class="header-btn">
			<label class="sign-up"> <a href="Logout"> Logout </a></label> <a
				href="indexMap.jsp"><label class="sign-in">Noleggia</label></a>
			<a href="myProfile.jsp"><label class="sign-in">
					Il mio profilo </label></a>
		</div>
		<%
		} else {
		%>
		<div class="header-btn">
			<label class="sign-up"> <a href="signup.jsp"> Registrati
			</a></label> <label class="sign-in" id="modal-btn">Login</label>
		</div>
		<%
		}
		%>
	</header>

	<!--Banner laterale-->

	<section class="banner" id="servizi">
		<div class="heading">
			<span>I nostri servizi</span>
			<h1>
				Esplora il mondo da una nuova prospettiva con i nostri droni <br>dei
				pacchetti Standard, Premium e Arte!
			</h1>
		</div>

		<div class="banner-container">

			<div class="banner-img2 autoplay">
				<iframe width="560" height="315"
					src="https://www.youtube.com/embed/HXatzKZxemQ?fs=1&autoplay=1&showinfo=0&controls=0&mute=1&loop=1"
					frameborder="0" allowfullscreen></iframe>
			</div>

			<div class="banner-text2 ">
				<span>Sentiti sicuro sempre </span>
				<p>NeboX sarà in grado di riconoscere e distinguere soggetti
					diversi, come persone, biciclette, auto o imbarcazioni. I profili
					di tracciamento impostabili in base al soggetto determinano
					un'estrema funzionalità e precisione dei movimento di tracciamento.


				</p>


			</div>
		</div>
		<br> <br>
		<div class="banner-container" width="560px" height="315px";>

			<div class="banner-img ">
				<img src="img/pexels-tembela-bohle-2050718.jpg" alt="">
			</div>
			<div class="banner-text2">
				<span>Rilevamento ostacoli omnidirezionale </span>
				<p>NeboX garantisce voli sicuri e senza collisioni. Più sensori
					di visione grandangolari funzionano agevolmente con un motore di
					elaborazione della visione ad alte prestazioni, per rilevare gli
					ostacoli in tutte le direzioni con precisione e pianificare una
					rotta di volo sicura che li eviti</p>


			</div>
		</div>
		<br> <br>
		<div class="banner-container">

			<div class="banner-img2 autoplay">
				<iframe width="560" height="315" allow="autoplay *; fullscreen *"
					allowfullscreen="true"
					src="https://youtube.com/embed/6dnqGrSKudM?t=27?fs=1&autoplay=1&showinfo=0&controls=0&mute=1&loop=1"
					frameborder="0" allowfullscreen></iframe>
			</div>

			<div class="banner-text2 ">
				<span>Non Perderti mai più </span>
				<p>Grazie alla funzionalità ActiveNavigation NeboX riesce sempre
					a trovare il percoso migliore e in tempo reale grazie alla
					connessione satellitare sempre attiva che permette ai droni di
					cambiare percoso in base agli ostacoli segnalati</p>


			</div>
		</div>
		<br> <br>

	</section>
	<footer>
		<section class="newsletter">
			<h2>Subscribe to newsletter</h2>
			<div class="box">
				<input type="text" placeholder="Enter your email..."> <a
					href="#" class="btn">Subscribe</a>
			</div>
			<br>
			<div class="footer-content">

				<h2 style="font-weight: bold;">Seguici sui nostri social</h2>
				<p style="color: white;">Rimani sempre aggiornato ! Seguici sui
					nostri social per non perderti i nuovi prodotti, servizi e migliori
					offerte con incredibili sconti!</p>
				<ul class="socials">
					<li><a href="#"><i class="fa fa-facebook"></i> </a></li>
					<li><a href="#"><i class="fa fa-twitter"></i> </a></li>
					<li><a href="#"><i class="fa fa-instagram"></i> </a></li>
					<li><a href="#"><i class="fa fa-youtube"></i> </a></li>
					<li><a href="#"><i class="fa fa-linkedin-square"></i> </a></li>

				</ul>

			</div>


			<div>
				<p style="color: white;">copyright &copy;2022 NeboX - designed
					by NeboX Team</p>
			</div>

		</section>
	</footer>




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
							href="#">Forget Password</a>
					</div>
			</div>
			<div class="modal-footer">
				<input type="submit" class="btn" value="Entra"> <a
					href="signup.jsp">Create Account</a>

			</div>
			</form>
		</div>
	</div>

	<%@include file="timer.jsp"%>
	<!--FINEMODALE-->
	<script src="https://unpkg.com/scrollreveal"></script>
	<script src="media.js"></script>
	<script src="script.js"></script>

</body>

</html>
