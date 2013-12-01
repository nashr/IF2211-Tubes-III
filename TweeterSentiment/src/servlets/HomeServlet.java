package servlets;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import algorithm.BoyerMoore;
import algorithm.KMP;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet("/home")
@MultipartConfig
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String address = "/WEB-INF/jsp/home.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(address);
		dispatcher.forward(request, response);
	}
	
	//priority : positive
	public static String validateSentiment(String tweet, String[] pWords, String[] nWords, String algorithm){	
		/*String result = "Neutral";
		for (int i = 0; i < nWords.length; i++) {
			if (!nWords[i].equals("") && tweet.contains(nWords[i].toLowerCase())) result = "Negative";
		}
		for (int i = 0; i < pWords.length; i++) {
			if (!pWords[i].equals("") && tweet.contains(pWords[i].toLowerCase())) result = "Positive"; 
		}
		return result;*/
		if (algorithm.equals("BM")) {
			return BoyerMoore.runBM(tweet, pWords, nWords);
		} else {
			return KMP.runKMP(tweet, pWords, nWords);
		}
	}
	
	public static void initDummyTweets(ArrayList<String> list){
		list.add("@reka_vai - @dafin_chubby orang ganteng maksimal ada yang nyaingin > @Rioalfian4 orang ganteng sejagad raya");
		list.add("@Muhammad_Vai - abg mseh mude dek, muke jag agak tue, sikit... tpi tetap ganteng hehehe RT @atyrakheyla Nak PPL tepat waktu bah bg, ni lah org tue pikiran");
		list.add("@mega_winarti - Justin berber \"@Muhammad_Vai: kyak siape lh kre2 ye !! RT @mega_winarti Hahaha.. Gaanteng kyak siape y \"@Muhammad_Vai: tpi mseh ganteng kan ");
		list.add("@windameimei - Haha tadak sekali morgan tu. Cem iye2 RT @mega_winarti: Hahaha.. Gaanteng kyak siape y \"@Muhammad_Vai: tpi mseh ganteng kan kyak morgan ");
		list.add("@Muhammad_Vai - kyak siape lh kre2 ye !! RT @mega_winarti Hahaha.. Gaanteng kyak siape y \"@Muhammad_Vai: tpi mseh ganteng kan kyak morgan ehh ");
		list.add("@mega_winarti - Hahaha.. Gaanteng kyak siape y \"@Muhammad_Vai: tpi mseh ganteng kan kyak morgan ehh slah RT @mega_winarti Pantas lah.. Besalang lah idong\"");
		list.add("@Muhammad_Vai - tpi mseh ganteng kan kyak morgan ehh slah RT @mega_winarti Pantas lah.. Besalang lah idong ");
		list.add("@ibnu_vai - Makaci lo tit . Jadi malu :D \"@asriastita: suaranya menenangkan jiwa, mukanya ganteng pula. ahahaha\" ");
	}

}
