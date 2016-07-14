(ns cljscript.core
  (:require ))

(enable-console-print!)

(defn span []
  (str "eggs"))

(println "I love ClojureScript")

;; define your app data so that it doesn't get over-written on reload

(defonce app-state (atom {:text "Hello world!"}))


(defn on-js-reload []
  ;; optionally touch your app-state to force rerendering depending on
  ;; your application
  ;; (swap! app-state update-in [:__figwheel_counter] inc)
)
