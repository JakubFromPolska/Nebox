<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<link rel="stylesheet" href="toggle.css">

<title>Noleggio Arte</title>
</head>

<body>

	<!--Header-->
	<%@include file="navbar.jsp"%>

	<section class="bck" id="bck">
		<div class="text">
			<h1>
				<span>Pacchetto </span>Arte
			</h1>
			<h3>Navigatore - Illuminazione - Videosorveglianza - Guida</h3>
			<h2
				style="margin-left: 400px; font-size: 60px; font-family: 'Poppins', sans-serif; margin-top: 30px;">
				<time>00:00:00</time>
			</h2>
			<script>
				localStorage.setItem("noleggio", "true")
				var h2 = document.getElementsByTagName('h2')[0];
				var start = document.getElementById('strt');
				if (localStorage.getItem("sec") != null) {
					var sec = localStorage.getItem("sec");
					var min = localStorage.getItem("min");
					var hrs = localStorage.getItem("ore");
				} else {
					sec = 0;
					min = 0;
					hrs = 0;
				}
				var t;

				function tick() {
					sec++;
					if (sec >= 60) {
						sec = 0;
						min++;
						if (min >= 60) {
							min = 0;
							hrs++;
						}
					}
					localStorage.setItem("sec", sec);
					localStorage.setItem("min", min);
					localStorage.setItem("ore", hrs);
				}
				function add() {
					tick();
					h2.textContent = (hrs > 9 ? hrs : "0" + hrs) + ":"
							+ (min > 9 ? min : "0" + min) + ":"
							+ (sec > 9 ? sec : "0" + sec);
					timer();
				}
				function timer() {
					t = setTimeout(add, 1000);
				}
				timer();
				start.onclick = timer;
			</script>
		</div>
	</section>

	<!-- TIMER  -->


	<section class="banner" id="banner">
		<div class="banner-container3">
			<div class="banner-text3">

				<h2>Gestisci le funzionalità</h2>

				<label class="label">
					<div class="toggle">
						<input class="toggle-state" type="checkbox" name="check"
							value="check" />
						<div class="toggle-inner">
							<div class="indicator"></div>
						</div>
						<div class="active-bg"></div>
					</div>
					<div class="label-text">Illuminazione</div>
				</label> <label class="label">
					<div class="toggle">
						<input class="toggle-state" type="checkbox" name="check"
							value="check" />
						<div class="toggle-inner">
							<div class="indicator"></div>
						</div>
						<div class="active-bg"></div>
					</div>
					<div class="label-text">Navigatore</div>
				</label> <label class="label">
					<div class="toggle">
						<input class="toggle-state" type="checkbox" name="check"
							value="check" />
						<div class="toggle-inner">
							<div class="indicator"></div>
						</div>
						<div class="active-bg"></div>
					</div>
					<div class="label-text">Videosorveglianza</div>
				</label> <label class="label">
					<div class="toggle">
						<input class="toggle-state" type="checkbox" name="check"
							value="check" />
						<div class="toggle-inner">
							<div class="indicator"></div>
						</div>
						<div class="active-bg"></div>
					</div>
					<div class="label-text">Guida turistica</div>
				</label> <a href="TerminaNoleggio"> <label type="submit" class="btn">
						Termina noleggio</label>
				</a>

			</div>
			<div class="banner-img3">
				<img src="img/drone.png" alt="">
			</div>
		</div>
	</section>

	<!--NEWSLETTER-->
	<%@include file="footer.html"%>
	<%
	String notLogout = (String) request.getSession().getAttribute("logout");
	if (notLogout.equals("si")) {
	%>
	<script>
		alert("Hai un noleggio in corso... termina il noleggio prima di effettuare il logout")
	</script>
	<%
	}
	%>

	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/main.js"></script>
	<script src="img/tableStorico/js/main.js"></script>
	<script src="https://unpkg.com/scrollreveal"></script>
	<script src="media.js"></script>
	<script src="script.js"></script>

</body>

</html>