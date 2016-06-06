(ns chat.core
  (:use immutant.web)
  (:use immutant.web.async)
  (:use immutant.web.middleware)
  (:use immutant.messaging)
  (:gen-class))

(def websocket 
  "Websocket messages"
  {:on-open   (fn [channel]
    (send! channel "Ready to reverse your messages!"))
  :on-close   (fn [channel {:keys [code reason]}]
    (println "close code:" code "reason:" reason))
  :on-message (fn [ch m]
    (println "Received" m)
    (send! ch (apply str (reverse m))))})

(defn -main [& args]
  (run 
    (-> 
        (wrap-session {:timeout 20})
        (wrap-websocket websocket))
    (merge {"host" "localhost", "port" 9090} args)))
