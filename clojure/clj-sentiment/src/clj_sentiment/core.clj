(ns clj-sentiment.core
  (:import (java.io StringReader)
           (org.apache.lucene.analysis.br BrazilianAnalyzer)
           (org.apache.lucene.analysis.tokenattributes CharTermAttribute))
  (:gen-class))

(println (java.util.Date.))

(def analyzer (BrazilianAnalyzer.))

(def stream (.tokenStream analyzer "text" (StringReader. "Eu gosto de você")))
(.reset stream)
(while (.incrementToken stream)
		(do (println (.getAttribute stream CharTermAttribute)) ))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (println "Hello, World!"))
