<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="footer.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet" href="home.css">
<link rel="stylesheet" href="signup.css">

<title>NeboX Admin</title>
</head>
<body>

	<!--Header-->
	<header style="position: sticky;">
		<a href="#" class="logo"><img src="img/icon.png" alt=""></a>

		<div class="bx bx-menu" id="menu-icon"></div>

	<div class="header-btn">

			<a href="index.jsp"><label class="sign-in" id="modal-btn">Torna alla Home</label></a>
		</div>

	</header>

	<%
	request.getSession().setAttribute("checked", "0");
	%>

	<!-- LOGIN ADMIN -->
	<section class="registration">
		<div class="container">
			<div class="title">Admin Login</div>
			<div class="content">
				<form action="LoginAdmin" method="post">
					<div class="user-details">
						<div class="input-box">
							<span class="details"> Username</span> <input type="text"
								placeholder="Username" required name="admin-username">
						</div>
						<div class="input-box">
							<span class="details">Password</span> <input type="password"
								placeholder="Password" required name="admin-password">
						</div>
					</div>
					<div class="button">
						<input type="submit" value="Login">
					</div>
				</form>
			</div>
		</div>
	</section>

	<%@include file="footer.html"%>

</body>
</html>