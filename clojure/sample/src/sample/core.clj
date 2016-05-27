(ns sample.core
	(:use compojure.core)
	(:use ring.middleware.reload)
        (:use ring.middleware.json)
        (:use ring.util.response)
	(:use ring.adapter.jetty))

(defn date
	[]
	(java.util.Date.))

(defn handler [request]
  {:status 200
   :headers {"Content-Type" "text/html"}
   :body "Hello World"})

(defn api [request]
  (response {:spam "eggs"}))

(defn timestamp [request]
  {:status 200
   :headers {"Content-Type" "text/html"}
   :body (str (date))})

(defroutes app
  (GET "/" [] "<p>Hello Compojure!</p>")
  (GET "/api" [] (wrap-json-response api))
  (GET "/timestamp" [] timestamp)
  (GET "/clojure" [] handler))

(defn -main
	[& args]
	(run-jetty (wrap-reload #'app) {:port 8080}))
