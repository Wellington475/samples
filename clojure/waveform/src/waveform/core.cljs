(ns waveform.core
  (:require [org.waveform.Waveform]))

(enable-console-print!)

(println "This text is printed from src/waveform/core.cljs. Go ahead and edit it and see reloading in action.")

;; define your app data so that it doesn't get over-written on reload

(defonce app-state (atom {:text "Hello world!"}))

(defn on-js-reload []
  ;; optionally touch your app-state to force rerendering depending on
  ;; your application
  ;; (swap! app-state update-in [:__figwheel_counter] inc)
  )

(def w (js/Waveform.
        (clj->js {:container (.getElementById js/document "app")
                  :innerColor (fn [x y] (.toString (str "#" (.floor js/Math (* (.random js/Math) 16777215))) 16))
                  :data [1 0.2 0.5]})))

(.log js/console (.update w
                          (clj->js {:data [0.5 1.0 0.5 1.0 ]})))
