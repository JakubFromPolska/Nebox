
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

<title>Termine Noleggio</title>
</head>

<body>
	<!--Header-->
	<%@include file="navbar.jsp"%>
	<div>
		<img src="img/drone.png" alt=""
			style="width: 700px; padding-top: 125px; display: block; margin: auto;">
	</div>

	<%
	double importo = (double) request.getSession().getAttribute("importo");
	%>

	<h1 style="clear: both; text-align: center;">Termine noleggio</h1>
	<h2 style="clear: both; text-align: center; font-size: 35px">
		Totale importo :
		<%=importo%>
		euro
	</h2>
	<%
	request.getSession().removeAttribute("importo");
	%>

	<%@include file="footer.html"%>
	<script>
		localStorage.removeItem("sec");
		localStorage.removeItem("min");
		localStorage.removeItem("ore");
		localStorage.removeItem("noleggio");
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/scrollreveal"></script>
	<script src="media.js"></script>
	<script src="script.js"></script>

</body>

</html>