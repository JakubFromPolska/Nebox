<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="DAO.StazioniDAO"%>
<%@page import="Model.*"%>
<%@page import="java.util.*"%>

<%
Noleggi noleggio = (Noleggi) request.getSession().getAttribute("noleggio");

if (noleggio != null && noleggio.getPacchetti() == 1) {
	response.sendRedirect("postNoleggioStandard.jsp");
} else if (noleggio != null && noleggio.getPacchetti() == 2) {
	response.sendRedirect("postNoleggioPremium.jsp");
} else if (noleggio != null && noleggio.getPacchetti() == 3) {
	response.sendRedirect("postNoleggioArte.jsp");
}
%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Noleggia il tuo drone</title>
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
	<%@include file="navbar.jsp"%>

	<section class="registration">
		<div class="container">
			<div class="title">Prenota</div>
			<div class="content">
				<form action="prenotazione" method="post">
					<div class="user-details">
						<div class="input-box">
							<span class="details">Stazione</span> <input readonly type="text"
								name="stazione" id="stazione">
							<script> 
                              var stazione = document.getElementById("stazione")                    	
                              stazione.value = localStorage.getItem('stazione')
                          </script>
						</div>
						<div class="input-box">
							<span class="details">Pacchetto</span> <select name="pacchetto"
								id="pacchetto" onclick=compilaTariffa()>
								<option value="standard" selected>Standard</option>
								<option value="premium">Premium</option>
								<option value="arte">Arte</option>
							</select>
							<script type="text/javascript">
                  function compilaTariffa(){
                    var pacchetto = document.getElementById("pacchetto")
                    var tariffa = document.getElementById("tariffa")
                    if (pacchetto.value=="standard"){
                      tariffa.value = "0,30 euro/min"
                    }else if(pacchetto.value=="premium"){
                      tariffa.value = "0,40 euro/min"
                    }else if(pacchetto.value="arte"){
                      tariffa.value = "0,50 euro/min"
                    }
                  }
                </script>
						</div>
						<div class="input-box">
							<span>Tariffa</span> <input readonly type="text" name="tariffa"
								id="tariffa" value="0,30 euro/min">
						</div>
						<div class="button">
							<input type="submit" value="Noleggia">
						</div>
				</form>
			</div>
		</div>
	</section>

	<%@include file="footer.html"%>



	<script src="https://unpkg.com/scrollreveal"></script>
	<script src="media.js"></script>


</body>
</html>