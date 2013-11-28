<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Tweet Sentiment Analyzer</title>
		
		<!-- Bootstrap's template -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/vai.css" rel="stylesheet">
	</head>
	<body>
		<a id="beranda"></a>
		<a id="borang"></a>
		<div class="container-fluid" id="beranda">
			<div class="hero-unit">
				<h1 id="title">Vai's Group Sentiment Analytics</h1>
				<p>Tweets analyzer that shows you how they feel.</p>
				<p><a class="btn btn-primary btn-large" href="#borang">Analyze Now!</a></p>
			</div>
		</div>
		<div class="container-fluid" id="borang">
			<div class="hero-unit">
				<h1>Fill what you want to know</h1>
				<p>Express yourself here! :3</p>
				<p><a class="btn btn-primary btn-large" href="#beranda">About Us</a></p>
			</div>
		</div>

		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	    <!-- <script src="https://code.jquery.com/jquery.js"></script> -->
	    <script src="js/jquery.js"></script>
	    <!-- Include all compiled plugins (below), or include individual files as needed -->
	    <script src="js/bootstrap.min.js"></script>
	</body>
</html>