package beans;

import java.awt.image.SampleModel;
import java.io.ObjectInputStream.GetField;
import java.util.ArrayList;

public class KMP {
	private static String SampleTweet="heiheiheihei @baharudinafif kapan-kapan lagi maenan gundu yuk";
	private static String SamplePattern="baharudinafif";

	public static ArrayList<Integer> prefixFunction(String Pattern, String Tweet){
		int k=0,q=0;
		Pattern="'"+Pattern;
		System.out.println(Pattern);
		ArrayList<Integer> prefixDummy = new ArrayList<Integer>();
		prefixDummy.add(0);
		
		prefixDummy.add(0);
		q=2;
		k=0;	
		for(q=2;q<Pattern.length();q++){
			while((k>0) && (Pattern.charAt(q) != Pattern.charAt(k+1))){
				k=prefixDummy.get(k);
			}
			if(Pattern.charAt(q) == Pattern.charAt(k+1)){
				k=k+1;
			}
			prefixDummy.add(q, k);
		}
		
		System.out.println(prefixDummy.toString());
		return prefixDummy;
	}
	
	public static void run(String tweet, String pattern){
		KMP kmp = new KMP();
		ArrayList<Integer> prefix=new ArrayList<Integer>();
		prefix=kmp.prefixFunction(pattern,tweet);
		
		pattern="`"+pattern;
		tweet="`"+tweet;
		
		int n=tweet.length();
		int m=pattern.length();
	
		int j=0;
		int i=1;
		boolean found=false;
		
		System.out.println(""+tweet+" "+n+" "+m);
		while((i<=n)&& !found){
			System.out.println(i+" "+j+" ");
			while((j>0) && (pattern.charAt(j+1)!=tweet.charAt(i))){
				j=prefix.get(j);
			}
			
			if(pattern.charAt(j+1)==tweet.charAt(i)){
				j=j+1;				
			}
			if(j==m-1){
				found=true;
			}else{
				i=i+1;
			}
		}
		
		int idxAwal;
		
		if (found){
			idxAwal=i-m;			
		}else{
			idxAwal=-1;
		}
		System.out.println("Indeks Ketemu Awal ="+idxAwal);
	}

	public static void main(String args[]) {
		KMP.run(SampleTweet,SamplePattern);	
	}
}
