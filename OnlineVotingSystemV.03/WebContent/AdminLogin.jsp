<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles.css">

<script>
	var input = document.getElementById("apassword");
	var text = document.getElementById("text");
	input.addEventListener("keyup", function(event) {

		if (event.getModifierState("CapsLock")) {
			text.display = "block";
		} else {
			text.style.display = "none";
		}
	});
</script>

<meta charset="UTF-8">
<title>Admin Login</title>
</head>
<body>
	<div class="header">
		<h1>Online Voting System</h1>
		<p>
			A <b>responsive </b>website created by me.
		</p>
	</div>

	<div class="navbar">
		<a href="http://localhost:8081/OnlineVotingSystemV.03/Website.jsp">Home</a>
		<a href="http://localhost:8081/OnlineVotingSystemV.03/AdminLogin.jsp"
			class="active">Admin</a> <a
			href="http://localhost:8081/OnlineVotingSystemV.03/VoterLogin.jsp">Voter
			login</a> <a
			href="http://localhost:8081/OnlineVotingSystemV.03/Registration"
			class="right">Register</a>


	</div>
	<form method="post" action="AdminLoginCheck">
		<div class="container">
			<p>
				<label for="name"><b>Username</b></label>
			<p>
				<input type="text" placeholder="Enter Username" name="aname"
					required><br>
			<p>
				<label for="psw"><b>Password</b></label>
			<p>
				<input type="password" placeholder="Enter Password" name="apassword"
					required>
			<p>
				<button type="submit">Login</button>
		</div>

		<p>
		<div class="container" style="background-color: #f1f1f1">
			<button type="reset" class="cancelbtn">Cancel</button>
		</div>
		<p>
		<div class="footer">
			<h3>Copyright © 2019 - 2020. Online Voting System. All rights
				reserved.</h3>
		</div>
	</form>
</body>
</html>