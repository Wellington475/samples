(ns naivebayes.core
  (:import [java.lang Math]))

(def tweets [{:class "positive" :text "feel"}
             {:class "positive" :text "happy"}
             {:class "negative" :text "Larry"}])

(defn prob [a, b]
  (float (/ a b)))

(defn freq [label]
  (frequencies (map #(get % label) tweets)))

(defn freq_class [class text]
  (count (filter #(= (get % :class) class)
           (filter #(= (get %1 :text) text) tweets))))

(defn p [term, sentiment]
  ;; P(sentiment|term) = P(term | sentiment) * P(sentiment) / P(term)
  (let [count (count tweets)
        labels (freq :class) ;; P(a)
        text (freq :text) ;; P(b)
        text_class (freq_class sentiment term)] ;; P(a|b)
    (/ (* (prob text_class (get labels sentiment))
          (prob (get labels sentiment) count))
       (/ (Math/log count) (Math/log 2)))))

(defn -main
  "I don't do a whole lot."
  [& args]
  (println (p "happy" "positive")))
