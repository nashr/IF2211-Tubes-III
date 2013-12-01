package algorithm;

public class BoyerMoore {
	
	public BoyerMoore() {
		
	}
	
	/*
	 * Return array storing index of last occurrence of each ASCII char in pattern.
	 */
	public static int[] buildLast(String pattern) {
		int last[] = new int[65536]; // ASCII char set
		for (int i=0; i < 65536; i++) last[i] = -1; // initialize array
		for (int i = 0; i < pattern.length(); i++) last[pattern.charAt(i)] = i;
		return last;
	}
	
	/*
	 * Boyer Moore algorithm for string matching
	 */
	public static int BoyerMooreMatch(String text, String pattern) {
		int last[] = buildLast(pattern);
		int t = text.length();
		int p = pattern.length();
		
		if (p > t) return -1; // pattern longer than text, must be not matched
		
		int j = p-1; // for index usage of pattern
		int i = j; // for index usage of text
		do {
			if (pattern.charAt(j) == text.charAt(i)) { // looking-glass technique
				if (j == 0) return i; // match
				i--;
				j--;
			} else { // character jump technique
				int lo = last[text.charAt(i)];  //last occ
				System.out.println("Tweet : " + text + " lo: "  + lo);
				i = i+p-Math.min(j, 1+lo);
				j = p-1;
			}
		} while (i < t);
		
		return -1; // does not match
	}
	
	/*
	 * Run Boyer-Moore Algorithm for each sentiment, returning the category it belongs to: negative, neutral, positive
	 */
	public static String runBM(String tweet, String[] pos, String[] neg) {
		for (int i = 0; i < pos.length; i++) {
			if (!pos[i].equals("")) {
				if (BoyerMooreMatch(tweet, pos[i].toLowerCase()) != -1) return "Positive";
			}
		}
		for (int i = 0; i < neg.length; i++) {
			if (!neg[i].equals("")) {
				if (BoyerMooreMatch(tweet, neg[i].toLowerCase()) != -1) return "Negative";
			}
		}
		return "Neutral";
	}
}
