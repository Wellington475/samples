(ns naivebayes.core)

(def tweets {"feel" :yes
             "happy" :yes
             "Larry" :no})

(defn prob [a, b]
  (float (/ a b)))

(defn p [term]
  ;; P(sentiment|term) = P(term | sentiment) * P(sentiment) / P(term)
  (let [count (count tweets)]
    (prob 1 2)))

(defn -main
  "I don't do a whole lot."
  [& args]
  (println (p "happy")))
