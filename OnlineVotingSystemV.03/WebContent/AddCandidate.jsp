<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles.css">
<meta charset="UTF-8">
<title>AddCandidate</title>
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
		<a href="http://localhost:8081/OnlineVotingSystemV.03/AdminLogin.jsp">Admin</a>
		<a href="http://localhost:8081/OnlineVotingSystemV.03/VoterLogin.jsp"
			class="active">Voter login</a> <a
			href="http://localhost:8081/OnlineVotingSystemV.03/Registration"
			class="right">Register</a>


	</div>
	<form method="post" action="AddCandidateServlet">
		<div class="container">

			<p>
				<label for="cname"><b>Candidate name</b></label>
			<p>
				<input type="text" placeholder="Enter Candidate name" name="cname"
					required><br>
			<p>


				<label for="fcname"><b>First name</b></label>
			<p>
				<input type="text" placeholder="Enter First name" name="fcname"
					required><br>
			<p>
				<label for="lcname"><b>Last name</b></label>
			<p>
				<input type="text" placeholder="Enter last name" name="lcname"
					required><br>
			<p>
				<label for="city"><b>City </b></label>
			<p>
				<input type="text" placeholder="Enter city" name="city" required><br>
			<p>

				<label for="cemail"><b>Email ID </b></label>
			<p>
				<input type="text" placeholder="Enter email id" name="cemail"
					required><br>
			<p>
			<p>
				<button type="submit">Add Candidate</button>
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