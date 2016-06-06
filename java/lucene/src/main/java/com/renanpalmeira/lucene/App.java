package com.renanpalmeira.lucene;

import java.io.StringReader;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.apache.lucene.analysis.tokenattributes.OffsetAttribute;
import org.apache.lucene.util.Version;

import java.io.IOException;

public class App {

    public static void main(String[] args) throws IOException {
        Analyzer analyzer = new StandardAnalyzer();
        TokenStream ts = analyzer.tokenStream("default", new StringReader("some text goes here"));
        ts.reset();
    
        try {
            while (ts.incrementToken()) {
                System.out.println(ts.getAttribute(CharTermAttribute.class).toString());
            }
            ts.end();
        } 
        finally {
            ts.close();
        }
    }
}
