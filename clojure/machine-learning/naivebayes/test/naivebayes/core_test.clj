(ns naivebayes.core-test
  (:require [clojure.test :refer :all]
            [naivebayes.core :refer :all]))

(deftest bayes-propability-negative-test
  (testing
    (is (= 0.0 (p "happy" "negative")))))

(deftest bayes-propability-positive-test
  (testing
    (is (= 0.21030992412487642 (p "happy" "positive")))))
