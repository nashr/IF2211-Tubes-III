<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stweema</title>
</head>
<body>
<h1>Welcome to Stweema!</h1>
<fieldset>
  <legend>Search</legend>
  <form action="home" method="post" enctype="multipart/form-data"> 
    <p>Query:</p> <input type="text" name="query"><br>
    <fieldset>
    	<legend>Sentiment keywords (use semicolon as delimiter, and/or use a txt file with said format as an input)</legend>
    	<p>Positive keywords:</p> <input type="text" name="positive"> <input type="file" accept=".txt" name="posfile"><br>
    	<p>Negative keywords:</p> <input type="text" name="negative"> <input type="file" name="negfile"><br>
    </fieldset>
    <fieldset>
    	<legend>Algorithm</legend>
    	<input type="checkbox" name="algorithm" value="KMP" checked="checked">KMP<br>
   		<input type="checkbox" name="algorithm" value="BM">BM<br>
    </fieldset>
    <input type="submit" value="Search">
  </form>
</fieldset>
</body>
</html>