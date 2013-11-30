package algorithm;

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
	 * Boyer Moore algorithm for string matching
	 */
	public static int BoyerMooreMatch(String text, String pattern) {
		int last[] = buildLast(pattern);
		int t = text.length();
		int p = pattern.length();
		
		if (p > t) return -1; // pattern longer than text, must be not matched
		
		int i = t-1; // for index usage of text
		int j = p-1; // for index usage of pattern
		do {
			if (pattern.charAt(j) == text.charAt(i)) { // looking-glass technique
				if (j == 0) return i; // match
				i--;
				j--;
			} else { // character jump technique
				int lo = last[text.charAt(i)];  //last occ
				i = i+p-Math.min(j, 1+lo);
				j = p-1;
			}
		} while (i < t);
		
		return -1; // does not match
	}
	
	/*
	 * Run Boyer-Moore Algorithm for each sentiment, returning the category it is in: negative, neutral, positive
	 */
	public static String run(String tweet, String pos, String neg) {
		
		return "CIPARAPICAP";
	}
}
