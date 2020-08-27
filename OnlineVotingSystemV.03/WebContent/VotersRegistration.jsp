<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	//Function to check Whether both passwords 
	// is same or not. 
	function checkPassword(form) {
		password1 = form.vpassword.value;
		password2 = form.revpassword.value;

		// If password not entered 
		if (password1 == '')
			alert("Please enter Password");

		// If confirm password not entered 
		else if (password2 == '')
			alert("Please enter confirm password");

		// If Not same return False.     
		else if (password1 != password2) {
			alert("\nPassword did not match: Please try again...");
			return false;
		}

		// If same return True. 
		else {
			alert("Welcome to Voting System");
			return true;
		}
	}
</script>
<link rel="stylesheet" href="styles.css">
<meta charset="UTF-8">
<title>Voters Registration</title>
</head>
<body>

	<div>
		<form name="homepage" action="Registration" method="post"
			onSubmit="return checkPassword(this)">
			<div class="header">
				<h1>Online Voting System</h1>
				<p>
					A <b>responsive </b>website created by me.
				</p>
			</div>

			<div class="navbar">
				<a href="http://localhost:8081/OnlineVotingSystemV.03/Website.jsp">Home</a>
				<a
					href="http://localhost:8081/OnlineVotingSystemV.03/AdminLogin.jsp">Admin</a>

				<a
					href="http://localhost:8081/OnlineVotingSystemV.03/VoterLogin.jsp">Voter
					login</a> <a
					href="http://localhost:8081/OnlineVotingSystemV.03/Registration"
					class="right active">Register</a>
			</div>
			<div class="main">
				<p>
					<label for="name"><b>First name</b></label>
				</p>
				<p>
					<input type="text" name="fname" required="required"
						title="fill the field">
				</p>

				<p>
					<label for="name"><b>Last name</b></label>
				</p>
				<p>
					<input type="text" name="lname" required="required"
						title="fill the field">
				</p>

				<p>
					<label for="name"><b>User name</b></label>
				</p>
				<p>
					<input type="text" name="vname" required="required"
						title="fill the field">
				</p>

				<p>
					<label for="psw"><b>Password</b></label>
				<p>
					<input type="password" name="vpassword" id="vpassword"
						pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
						title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
						required="required">
				</p>
				<p>
					<b><label for="psw">Confirm Password</label></b>
				</p>
				<p>
					<input type="password" id="revpassword" class="text"
						name="revpassword">
				</p>
				<p>
					<button type="submit">Register</button>
				</p>
			</div>
			<div class="footer">
				<h3>Copyright © 2019 - 2020. Online Voting System. All rights
					reserved.</h3>
			</div>
		</form>
	</div>
</body>
</html>