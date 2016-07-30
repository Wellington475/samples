(ns waveform.core
  (:require [wf]))

(enable-console-print!)

(wf/Waveform. (js-obj "container" (.getElementById js/document "teste") "data" (array [1 0.2 0.5])))

(println "This text is printed from src/waveform/core.cljs. Go ahead and edit it and see reloading in action.")

;; define your app data so that it doesn't get over-written on reload

(defonce app-state (atom {:text "Hello world!"}))

(defn on-js-reload []
  ;; optionally touch your app-state to force rerendering depending on
  ;; your application
  ;; (swap! app-state update-in [:__figwheel_counter] inc)
)
