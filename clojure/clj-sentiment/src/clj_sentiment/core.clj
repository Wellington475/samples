(ns clj-sentiment.core
  (:require [clojurewerkz.elastisch.rest :as elastic]
            [clojurewerkz.elastisch.rest.document :as esd])
  (:gen-class))

(def conn (elastic/connect "http://127.0.0.1:9200"))

(defn id [& args]
  (let [doc {:title "Elasticsearch with Clojure"
             :body "bye bye solr"
             :tag "clojure"
             :sentiment "positive"}]

    (esd/put conn "clojure" "twitter" doc)))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (println "Hello, World!"))
