(ns sample.core
	(:use compojure.core)
	(:use ring.middleware.reload)
        (:use ring.middleware.json)
        (:use ring.util.response)
	(:use ring.adapter.jetty)
        (:use clojure.pprint)
        (:use clojure.data.csv)
        (:use clojure.java.io))

(def stadiums
  (with-open [in-file (reader "stadiums.csv")]
    (doall
     (read-csv in-file))))

(defn date
	[]
	(java.util.Date.))

(defn handler [request]
  {:status 200
   :headers {"Content-Type" "text/html"}
   :body "Hello World with Clojure"})

(defn api [request]
  (response {:count (count stadiums)
             :next "null"
             :previus "null"
             :data stadiums}))

(defn profile [request]
  (let [id (Integer. (get-in request [:params :id]))]
    (response (take id stadiums))))


(defn timestamp [request]
  {:status 200
   :headers {"Content-Type" "text/html"}
   :body (str (date))})

(defroutes app
  (GET "/" [] "<p>Hello Compojure!</p>")
  (GET "/api" [] (wrap-json-response api))
  (GET "/api/:id" [id] (wrap-json-params profile))
  (GET "/timestamp" [] timestamp)
  (GET "/clojure" [] handler))

(defn -main
	[& args]
	(run-jetty (wrap-reload #'app) {:port 8080}))
