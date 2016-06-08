(ns chat.core
  (:use clojure.tools.logging)
  (:use org.httpkit.server)
  (:use compojure.core)
  (:gen-class))

(def users (atom {}))

(defn handler [request]
  (with-channel request channel
    (info channel "connected")
    (swap! users assoc channel true)
    (on-receive channel (fn [data]
                            (send! channel (apply str (reverse  data)))))))

(defroutes app
  (GET "/" [] handler))

(defn -main []
  (run-server #'app {:port 9090}))
