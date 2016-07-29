(ns waveform.core
  (:require ))

(enable-console-print!)

(.log js/console (js/waveform) {:container (.getElementById js/document "teste")})

(println "This text is printed from src/waveform/core.cljs. Go ahead and edit it and see reloading in action.")

;; define your app data so that it doesn't get over-written on reload

(defonce app-state (atom {:text "Hello world!"}))


(defn on-js-reload []
  ;; optionally touch your app-state to force rerendering depending on
  ;; your application
  ;; (swap! app-state update-in [:__figwheel_counter] inc)
)
