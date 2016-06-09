package com.renanpalmeira.lucene;


import java.io.StringReader;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.analysis.br.BrazilianAnalyzer;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.apache.lucene.analysis.tokenattributes.OffsetAttribute;
import org.apache.lucene.util.Version;

import java.io.IOException;

public class App {
	public static void main(String[] args) throws IOException
	{
		Analyzer analyzer = new BrazilianAnalyzer(); // or any other analyzer
		TokenStream ts = analyzer.tokenStream("myfield", new StringReader("Eu gosto de você"));
                OffsetAttribute offsetAtt = ts.addAttribute(OffsetAttribute.class);

		try {
			ts.reset(); // Resets this stream to the beginning. (Required)
			while (ts.incrementToken()) {
				System.out.println("token: " + ts.toString());
			}
			ts.end();
		}
		finally {
			ts.close();
		}
	}
}