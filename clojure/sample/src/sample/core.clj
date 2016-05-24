(ns sample.core
	(:use ring.adapter.jetty))

(defn square [x] (* x x))

(defn handler [request]
  {:status 200
   :headers {"Content-Type" "text/html"}
   :body "Hello World"})

(run-jetty handler {:port 8080})