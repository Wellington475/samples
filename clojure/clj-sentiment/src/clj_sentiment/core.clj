(ns clj-sentiment.core
  (:gen-class))

;; Naive Bayes

(def trainset (atom {}))

(defn get-word-count [tag word]
	(get-in @trainset [tag word] 0))

(defn word-probability [word tag]
  (let [word-count 					(get-word-count tag word)
        word-in-tag 				(count (tag @trainset))]
    (Math/log
      (/ (+ word-count 1) (+ word-in-tag)))))

(defn train
  [word tag]
  (let [word-count (get-word-count tag word)]
		(swap! trainset assoc-in [tag word] (inc word-count))))

(defn classify
  [feature]
  (let [tag (count (keys @trainset))]
		(println tag))
  (println @trainset))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (train "oi" :positive)
  (classify "oi")
  (println "Hello, World!"))