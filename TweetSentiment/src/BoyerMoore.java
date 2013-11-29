
public class BoyerMoore {
	
	public BoyerMoore() {
		
	}
	
	/*
	 * Return array storing index of last occurrence of each ASCII char in pattern.
	 */
	public static int[] buildLast(String pattern) {
		int last[] = new int[128]; // ASCII char set
		for (int i=0; i < 128; i++) last[i] = -1; // initialize array
		for (int i = 0; i < pattern.length(); i++) last[pattern.charAt(i)] = i;
		return last;
	}
	
	/*
	 * Run Boyer-Moore Algorithm, returning the category it is in: negative, neutral, positive
	 */
	public static String BoyerMooreMatch(String tweet, String pos, String neg) {
		
		return "CIPARAPICAP";
	}
}