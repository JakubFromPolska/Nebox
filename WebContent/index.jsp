<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>

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
			<li><a href="#home">Home</a></li>
			<li><a href="#dettagli"> Dettagli </a></li>
			<li><a href="#pacchetti"> Pacchetti </a></li>
			<li><a href="dettagli2.jsp"> Servizi </a></li>
			<li><a href="faq.jsp">Faq</a></li>
		</ul>

		<%
		if (request.getSession().getAttribute("auth") != null) {
		%>
		<div class="header-btn">
			<label class="sign-up"> <a href="Logout"> Logout </a></label> <a
				href="indexMap.jsp"><label class="sign-in">Noleggia</label></a> <a
				href="myProfile.jsp"><label class="sign-in"> Il mio
					profilo </label></a>
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

	<!--landing-->
	<section class="home" id="home">
		<div class="text">
			<h1>
				<span>Nebo</span>X <br>Noleggio Droni
			</h1>
			<p>
				Abbiamo quello che cerchi! <br> Scegli la stazione, prenota con
				3 semplici click <br> e ritira il drone in giornata!
			</p>
			<div class="app-stores">
				<img src="img/ios.png" alt=""> <img src="img/play.png" alt="">
			</div>
		</div>
	</section>

	<!-- PAGINA DETTAGLI DEL NOLEGGIO -->
	<section class="details" id="dettagli">
		<div class="heading">
			<span>Come funziona?</span>
			<h1>Bastano 3 semplici step :</h1>
		</div>
		<div class="details-container">
			<div class="box">
				<i class='bx bxs-map'></i>
				<h2>Scegli la location</h2>
				Scegli la stazione di consegna e di ritiro <br> del drone più
				vicina e comoda per te.
			</div>

			<div class="box">
				<i class='bx bxs-calendar-check'></i>
				<h2>Scegli il pacchetto</h2>
				Puoi decidere comodamente il pacchetto <br> con le
				caratteristiche più adatte alle tue esigenze!
			</div>

			<div class="box">
				<i class='bx bxs-calendar-star'></i>
				<h2>Ritira il drone</h2>
				Finito! Ora ti basta soltanto ritirare il drone noleggiato nel luogo
				scelto. <br>
			</div>

			<div class="box">
				<i class='bx bxs'><img src="img/droneIcon.png"
					style="width: 30px; height: 30px" id="imgChange"></i>
				<h2>Parti!</h2>
				Inizia il tuo viaggio seguito dal tuo drone personale con tutte le
				funzionalità che hai scelto!<br>
			</div>
		</div>
	</section>


	<!--Banner laterale-->
	<section class="banner" id="servizi">
		<div class="heading">
			<span>I nostri servizi</span>
			<h1>
				Esplora il mondo da una nuova prospettiva con i nostri droni <br>dei
				pacchetti Standard, Plus e Arte!
			</h1>
		</div>

		<div class="banner-container">

			<div class="banner-img">
				<img src="img/drone.png" alt="">
			</div>
			<div class="banner-text">
				<span>Standard e Plus</span>
				<p>
					Una volta provata l'ebbrezza del volo con i nostri droni, quando
					sarai di nuovo coi piedi per terra, continuerai a guardare il
					cielo. <br>Scopri il nostro pacchetto standard che include il
					più affidabile Navigatore sul mercato e la illuminazione notturna.
					Acquistando il pacchetto Plus avrai in più il servizio di
					Videosorveglianza di ultima generazione in qualità 4k.
				</p>


			</div>
		</div>

		<div class="heading">
			<br>

		</div>

		<div class="banner-container2">
			<div class="banner-text2">
				<span>Arte</span>
				<p>Il nostro pacchetto Arte include tutto il contenuto dei
					precedenti pacchetti, in più una guida turistica personalizzabile
					che riconosce i monumenti a te circostanti e ne racconta la storia
					attraverso la nostra app</p>


			</div>
			<div class="banner-img2">
				<img src="img/drone.png" alt="">
			</div>
		</div>
	</section>

	<!--PRICING-->
	<section class="services" id="pacchetti">
		<div class="heading">

			<h1>
				Pacchetti: <br>
			</h1>
		</div>
		<div class="services-container">
			<!--FIRST-->
			<div class="boxo">
				<div class="box">
					<div class="img">
						<i class='bx bxs-calendar-check'></i>
					</div>
					<div class="title">Standard</div>
					<div class="price">
						<b>0,30 $</b> <span>al minuto</span>
					</div>
					<div class="features">
						<div>Illuminazione</div>
						<div>Navigatore</div>

					</div>

				</div>
			</div>
			<!--second-->
			<div class="boxo2">
				<div class="box professional">
					<div class="img">
						<i class='bx bxs-calendar-check'></i>
					</div>
					<div class="title">Premium</div>
					<div class="price">
						<b>0,40 $</b> <span>al minuto</span>
					</div>
					<div class="features">
						<div>Illuminazione</div>
						<div>Navigatore</div>
						<div>Videosorveglianza</div>

					</div>

				</div>
			</div>
			<!--THIRD-->
			<div class="boxo">
				<div class="box">
					<div class="img">
						<i class='bx bxs-calendar-check'></i>
					</div>
					<div class="title">Arte</div>
					<div class="price">
						<b>0,50 $</b> <span>al minuto</span>
					</div>
					<div class="features">
						<div>Illuminazione</div>
						<div>Navigatore</div>
						<div>Video sorveglianza</div>
						<div>Guida turistica</div>
					</div>

				</div>
			</div>
		</div>
	</section>



	<!--RECENSIONI-->
	<section class="reviews" id="reviews">
		<div class="heading">
			<span>Reviews</span>
			<h1>Cosa i nostri clienti dicono di noi</h1>
		</div>
		<div class="reviews-container">
			<div class="box">
				<div class="rev-img">
					<img src="img/jack.jpg" alt="">
				</div>
				<h2>Jack Ma</h2>
				<div class="stars">
					<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
						class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
						class='bx bxs-star-empty'></i>
				</div>
				<p>Ho avuto modo di provare il servizio quando ero in visita a
					Milano e mi è piaciuto molto.Spero in un futuro potrà essere
					attivato anche nella mia città</p>
			</div>
			<div class="box">
				<div class="rev-img">
					<img src="img/mark.jpg" alt="">
				</div>
				<h2>Mark</h2>
				<div class="stars">
					<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
						class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
						class='bx bxs-star-half'></i>
				</div>
				<p>Il noleggio è stato una piacevole sorpresa, lo consiglierei a
					tutti soprattutto il pacchetto Arte con la guida turistica compresa</p>
			</div>
			<div class="box">
				<div class="rev-img">
					<img src="img/michela.jpg" alt="">
				</div>
				<h2>Michela</h2>
				<div class="stars">
					<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
						class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
						class='bx bxs-star-half'></i>
				</div>
				<p>Le funzioni di video-sorveglianza ed illuminazione mi ha
					fatto sentire decisamente più sicura mentre tornavo a casa di sera
				</p>
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
	<%@include file="timer.jsp"%>

	<script src="https://unpkg.com/scrollreveal"></script>
	<script src="media.js"></script>
	<script src="script.js"></script>

</body>
</html>
