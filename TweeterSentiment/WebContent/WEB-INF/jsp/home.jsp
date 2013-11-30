<%@page import="twitter4j.QueryResult"%>
<%@page import="twitter4j.Query"%>
<%@page import="twitter4j.Status"%>
<%@page import="java.util.List"%>
<%@page import="twitter4j.TwitterException"%>
<%@page import="twitter4j.Twitter"%>
<%@page import="twitter4j.TwitterFactory"%>
<%@page import="twitter4j.conf.ConfigurationBuilder"%>
<%@page import="servlets.HomeServlet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stweema</title>
</head>
<body>
	<h1>Stweema Sentiment Analysis Result</h1>
	<%
	//get uploaded txt files..
	Part posPart = request.getPart("posfile");
    Part negPart = request.getPart("negfile");
	InputStream posfilecontent = posPart.getInputStream();
	InputStream negfilecontent = negPart.getInputStream();
    BufferedReader posReader = new BufferedReader(new InputStreamReader(posfilecontent));
    BufferedReader negReader = new BufferedReader(new InputStreamReader(negfilecontent));
    //.. and convert their content into string  
    int temp;
	String s1 = "", s2 = "";
	while ((temp = posReader.read()) != -1) {
		s1 += (char) temp;
	}
	while ((temp = negReader.read()) != -1) {
		s2 += (char) temp;
	}
	
	
	//properties needed to access twitter api
	ConfigurationBuilder cb = new ConfigurationBuilder();
	cb.setDebugEnabled(true)
	  .setOAuthConsumerKey("LselEEvuLa2KbzGu03Bmg")
	  .setOAuthConsumerSecret("RVp4OXLfhsyC0iOpnuPxYXXyxxuTra8ISLtXwtbQJ4")
	  .setOAuthAccessToken("2219872879-0bi6R64rxhdIbUPSmeHgcIPh6oSZpSZw4t5mK0Q")
	  .setOAuthAccessTokenSecret("c1KXy9HxZYxU0bs9ioXjdtIorsiW8HiYwwtRb7JVCEGwb")
	  //.setHttpProxyHost("cache.itb.ac.id")
	  //.setHttpProxyPort(8080)
	  //.setHttpProxyUser("mohamad.rivai")
	  //.setHttpProxyPassword("stimatubes")
	  ;
	TwitterFactory tf = new TwitterFactory(cb.build());
	Twitter twitter = tf.getInstance();
    
	
	try {
		//get request parameters
    	String qString = request.getParameter("query") == null ? "" : request.getParameter("query");
    	String pString = request.getParameter("positive") == null ? "" : request.getParameter("positive");
    	String nString = request.getParameter("negative") == null ? "" : request.getParameter("negative");
    	
    	//append keywords entries from file input into textfield input
    	if (posPart != null){
    		if (!pString.equals("")) pString +=  ";";
    		pString += s1;
    	}
    	if (negPart != null){
    		if (!nString.equals("")) nString +=  ";";
    		nString += s2;
    	}
    
    	//split keywords and store them in arrays
    	String[] pWords;
    	String[] nWords;
	  	pWords= pString.split(";");
    	for (int i = 0; i < pWords.length; i++) {
    		pWords[i].trim();
    	}
    	nWords= nString.split(";");
    	for (int i = 0; i < nWords.length; i++) {
    		nWords[i].trim();
    	}
    	   	
    	//make up the query object
    	Query query = new Query(qString);
        QueryResult result;
      
        
        //do {
        	//retrieve result from twitter
            result = twitter.search(query);
            List<Status> tweets = result.getTweets();
            Status tweet;
            
//            ArrayList<String> tweets = new ArrayList<String>();
//            HomeServlet.initDummyTweets(tweets);
//            String tweet = "";
            
            
			//print query arguments
            out.println("<p>Query : " + qString + "</p>");
            out.println("<p>Positive keywords :");
            for (int i = 0; i < pWords.length; i++) {
            	out.print(pWords[i] );
            	if (i != pWords.length-1) out.print(", ");
            }
            out.println("</p>");
            out.println("<p>Negative keywords :");
            for (int i = 0; i < nWords.length; i++) {
            	out.print(nWords[i] );
            	if (i != nWords.length-1) out.print(", ");
            }
            out.println("</p>");
            out.println("<p>Algorithm : " + (request.getParameter("algorithm") == null ? "" : request.getParameter("algorithm"))  + "</p>");
            
            //Determine sentiment for each tweets and populate them into appropiate list based on their sentiment
            ArrayList<Status> posTweets = new ArrayList<Status>();
            ArrayList<Status> negTweets = new ArrayList<Status>();
            ArrayList<Status> neuTweets = new ArrayList<Status>();
            
            if (tweets.size() > 0) {
            	String sentiment = "";
            	for (int j = 0; j < 50; j++) {
            		if (j >= tweets.size()) break;
                	tweet = tweets.get(j);
            		//Analyze tweet's sentiment
                    sentiment = HomeServlet.validateSentiment(tweet.getText().toLowerCase(), pWords, nWords);
            		if (sentiment.toLowerCase().equals("positive")) {
            			posTweets.add(tweet);
            		} else if (sentiment.toLowerCase().equals("negative")) {
            			negTweets.add(tweet);
            		} else if (sentiment.toLowerCase().equals("neutral")) {
            			neuTweets.add(tweet);
            		}
                    //sentiment = HomeServlet.validateSentiment(tweet, pWords, nWords);
                }
            	
            	
            	StringBuffer address;
            	String tweetURL="";
            	//Print result if found
                out.println("<h2>Tweet(s) with Positive Sentiment :</h2><br>");
            	for (int i = 0; i < posTweets.size(); i++) {
            		tweet = posTweets.get(i);
            		
            		//get link to tweet in twitter's site            	
                	address = new StringBuffer();
                	address.append("http://twitter.com/#!/");
                	address.append(tweet.getUser().getScreenName());
                	address.append("/status/");
                	address.append(tweet.getId());
	               	tweetURL = address.toString();
            		
            		//print user profile picture
                	out.println("<img src="+ tweet.getUser().getProfileImageURL().toString() +" alt=\"Default\" width=\"50\" height=\"50\">");
                	
                	//print the tweet
                	out.println("<p>");
                	out.println("@" + tweet.getUser().getScreenName() + " - ");
                	out.println("<a href=\""+ tweetURL + "\"> " + tweet.getText() + "</a>");
                	//out.println(tweet);
                	out.println("</p>");

             	}
            	out.println("<h2>Tweet(s) with Negative Sentiment :</h2><br>");
            	for (int i = 0; i < negTweets.size(); i++) {
            		tweet = negTweets.get(i);
            		
            		//get link to tweet in twitter's site            	
                	address = new StringBuffer();
                	address.append("http://twitter.com/#!/");
                	address.append(tweet.getUser().getScreenName());
                	address.append("/status/");
                	address.append(tweet.getId());
                	tweetURL = address.toString();
            		
            		//print user profile picture
                	out.println("<img src="+ tweet.getUser().getProfileImageURL().toString() +" alt=\"Default\" width=\"50\" height=\"50\">");
                	
                	//print the tweet
                	out.println("<p>");
                	out.println("@" + tweet.getUser().getScreenName() + " - ");
                	out.println("<a href=\""+ tweetURL + "\"> " + tweet.getText() + "</a>");
                	//out.println(tweet);
                	out.println("</p>");
            	}
            	out.println("<h2>Tweet(s) with Neutral Sentiment :</h2><br>");
            	for (int i = 0; i < neuTweets.size(); i++) {
            		tweet = neuTweets.get(i);

            		//get link to tweet in twitter's site            	
                	address = new StringBuffer();
                	address.append("http://twitter.com/#!/");
                	address.append(tweet.getUser().getScreenName());
                	address.append("/status/");
                	address.append(tweet.getId());
                	tweetURL = address.toString();
            		
            		//print user profile picture
                	out.println("<img src="+ tweet.getUser().getProfileImageURL().toString() +" alt=\"Default\" width=\"50\" height=\"50\">");
                	
                	//print the tweet
                	out.println("<p>");
                	out.println("@" + tweet.getUser().getScreenName() + " - ");
                	out.println("<a href=\""+ tweetURL + "\"> " + tweet.getText() + "</a>");
                	//out.println(tweet);
                	out.println("</p>");
                    
            	}
            } else {
            	out.println("<h2>No Tweets about " + qString + " found. Sorry bro!</h2>");
            }
        //} while ((query = result.nextQuery()) != null);
    } catch (TwitterException te) {
	//} catch (Exception te) {
        te.printStackTrace();
        out.println("<p>");
        out.println("Failed to search tweets: " + te.getMessage());
        out.println("</p>");
    }
    
    
    %>
</body>
</html>