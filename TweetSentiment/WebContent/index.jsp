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
		<a id="perihal"></a>
		<a id="borang"></a>
		<div class="container-fluid" id="perihal">
			<div class="hero-unit">
				<h1 id="title">Tweet Sentiment Analytics</h1>
				<p id="subtitle">We tell you how tweets feel today.</p>
				<p id="button"><a class="btn btn-primary btn-large" id="main-btn" href="#borang">Tell Me Now!</a></p>
			</div>
			<footer>
				<p><b>Copyright by Vai's Group 2013</b></p>
				<p>Baharudin Afif Suryanugraha - 13511021 | Mohamad Rivai Ramandhani - 13511043 | Muhammad Nassirudin - 13511044</p>
			</footer>
		</div>
		<div class="container-fluid" id="borang">
			<legend id="header">
				<a id="about" href="#perihal">About Us</a>
			</legend>
			<form class="form-horizontal">
				<fieldset>
					<!-- Form Name -->
					<legend id="formtitle">How do they feel today?</legend>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">Tweet</label>  
 							<div class="col-md-5">
 								<input id="textinput" name="tweet" placeholder="lulusan informatika ITB" class="form-control input-md" type="text">
   						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
			  			<label class="col-md-4 control-label" for="textinput">Positive Sentiment</label>  
			  			<div class="col-md-5">
			  				<input id="textinput" name="pos" placeholder="keren hebat jago" class="form-control input-md" type="text">
			    		</div>
					</div>
			
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">Negative Sentiment</label>  
						<div class="col-md-5">
							<input id="textinput" name="neg" placeholder="sombong aneh" class="form-control input-md" type="text">
						</div>
					</div>
			
					<!-- Multiple Radios -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="radios">Algorithm</label>
						<div class="col-md-4">
							<div class="radio">
								<label for="radios-0">
							    	<input name="algo" id="radios-0" value="1" checked="checked" type="radio">
							     	Boyer-Moore
							   </label>
							</div>
							<div class="radio">
								<label for="radios-1">
							    	<input name="algo" id="radios-1" value="2" type="radio">
							    	KMP
								</label>
							</div>
						</div>
					</div>
			
					<!-- Button -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="singlebutton"></label>
						<div class="col-md-4">
					    	<button id="singlebutton" name="find" class="btn btn-primary">Find them!</button>
						</div>
					</div>
					
					<!-- File Button --> 
					<!-- <div class="form-group">
						<label class="col-md-4 control-label" for="filebutton">File Button</label>
						<div class="col-md-4">
							<input id="filebutton" name="filebutton" class="input-file" type="file">
						</div>
					</div> -->
				</fieldset>
			</form>
		</div>

		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	    <!-- <script src="https://code.jquery.com/jquery.js"></script> -->
	    <script src="js/jquery.js"></script>
	    <!-- Include all compiled plugins (below), or include individual files as needed -->
	    <script src="js/bootstrap.min.js"></script>
	</body>
</html>