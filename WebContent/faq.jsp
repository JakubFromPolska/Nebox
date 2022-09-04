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
<link rel="stylesheet" href="home.css">
<link rel="stylesheet" href="faq.css">
<title>FAQ</title>
</head>

<body>

	<!--Header-->
	<header style="position: sticky;">
		<a href="#" class="logo"><img src="img/icon.png" alt=""></a>

		<div class="bx bx-menu" id="menu-icon"></div>
		<ul class="navbar">
			<li><a href="index.jsp#home">Home</a></li>
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
				href="indexMap.jsp"><label class="sign-in" id="modal-btn">Noleggia</label></a>
			<a href="myProfile.jsp"><label class="sign-in" id="modal-btn">
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

	<section class="registration">
		<div class="container">

			<div class="title">Faq</div>
			<br>
			<div class="content">
				<div class="accordion">
					<div class="accordion-item">
						<button id="accordion-button-1" aria-expanded="false">
							<span class="accordion-title">Qual è il Regolamento di
								riferimento in Italia che integra la normativa europea?</span><span
								class="icon" aria-hidden="true"></span>
						</button>
						<div class="accordion-content">
							<p>Il Regolamento UAS-IT che può essere consultato al
								seguente link: Regolamento UAS-IT. Nella pagina Normativa Droni
								sono disponibili ulteriori riferimenti.</p>
						</div>
					</div>
					<div class="accordion-item">
						<button id="accordion-button-2" aria-expanded="false">
							<span class="accordion-title">E' possibile far volare un
								UAV vicino a un aeroporto?</span><span class="icon" aria-hidden="true"></span>
						</button>
						<div class="accordion-content">
							<p>Nelle vicinanze degli aeroporti, all'interno delle ATZ
								(Aerodrome Traffic Zone) o del CTR è possibile volare senza
								riserva dello spazio aereo, in accordo alle prescrizioni
								contenute nella Circolare ATM-09A.</p>
						</div>
					</div>
					<div class="accordion-item">
						<button id="accordion-button-3" aria-expanded="false">
							<span class="accordion-title">Come si possono individuare
								esattamente le aree con divieto di sorvolo?</span><span class="icon"
								aria-hidden="true"></span>
						</button>
						<div class="accordion-content">
							<p>
								Consultando il sito <a
									href="https://www.d-flight.it/new_portal/"> D-flight</a>
								conforme alle carte aeronautiche e le AIP (Aeronautical
								Information Publication).
							</p>
						</div>
					</div>
					<div class="accordion-item">
						<button id="accordion-button-4" aria-expanded="false">
							<span class="accordion-title">In presenza di altro
								aeromobile che vola nelle immediate vicinanze, chi ha la
								precedenza?</span><span class="icon" aria-hidden="true"></span>
						</button>
						<div class="accordion-content">
							<p>Sempre l'altro aeromobile.</p>
						</div>
					</div>
					<div class="accordion-item">
						<button id="accordion-button-5" aria-expanded="false">
							<span class="accordion-title">Operando in Categoria Aperta
								(Open Category) è possibile sorvolare strade o ferrovie?</span><span
								class="icon" aria-hidden="true"></span>
						</button>
						<div class="accordion-content">
							<p>Operando in Categoria Aperta, le operazioni non devono
								essere condotte vicino o sopra strade o ferrovie poichè in
								quell'area saranno presenti persone non coinvolte. L'unica
								eccezione è nella sottocategoria A1 ma limitata ai droni con
								peso sotto 250 g o con marcatura C0 poichè, secondo la
								UAS.OPEN.020(2), soltanto questi droni possono sorvolare persone
								non coinvolte purchè non vi sia assembramento di persone. Si
								tenga comunque presente che strade ad alto traffico (come
								un'autostrada) possono essere considerate equivalenti ad
								assembramenti di persone e quindi non sarà  consentita alcuna
								operazione di droni di categoria aperta su di esse</p>
						</div>
					</div>
					<div class="accordion-item">
						<button id="accordion-button-5" aria-expanded="false">
							<span class="accordion-title">Cosa fare in caso di furto
								del drone?</span><span class="icon" aria-hidden="true"></span>
						</button>
						<div class="accordion-content">
							<p>In caso di furto, ai fini di sollevare la responsabilità 
								dell'operatore da usi malevoli di chi opera con un drone
								derubato, ENAC raccomanda di tenere nota del numero di serie del
								proprio drone sin dall'acquisto oppure utilizzare la funzione
								non obbligatoria di registrare il numero seriale del drone sul
								portale d-flight in modo da poter specificare nella denuncia
								alle Forze dell'ordine il numero di serie del drone derubato.</p>
						</div>
					</div>
					<div class="accordion-item">
						<button id="accordion-button-5" aria-expanded="false">
							<span class="accordion-title">Perchè affittare un drone?</span><span
								class="icon" aria-hidden="true"></span>
						</button>
						<div class="accordion-content">
							<p>Provare un drone prima di comprarlo Se parlando di
								automobili sappiamo di poter prenotare al concessionario una
								prova a costo zero o quasi, per quanto riguarda i droni è ancora
								molto difficile trovare questo servizio. La soluzione?
								Affittarne uno per un paio di giorni e provarlo e riprovarlo per
								capire se è il drone giusto per noi. Al di là delle
								caratteristiche tecniche e delle funzioni avanzate, in fondo,
								deve sbocciare un vero e proprio feeling tra i pollici del
								pilota e i movimenti del quattroruote ehm..quattroeliche!</p>
						</div>
					</div>
					<br> <br>
				</div>
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


	<%@include file="footer.html"%>

	<!--FINEMODALE-->
	<%@include file="timer.jsp"%>

	<script src="https://unpkg.com/scrollreveal"></script>
	<script src="media.js"></script>
	<script src="script.js"></script>
	<script src="faq.js"></script>

</body>

</html>