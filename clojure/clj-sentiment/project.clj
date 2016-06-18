(defproject clj-sentiment "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.8.0"]
                 [compojure "1.5.0"]
                 [ring "1.4.0"]
                 [ring/ring-json "0.4.0"]
                 [clojurewerkz/elastisch "2.2.1"]
                 [clojurewerkz/neocons "3.0.0"]]
  :main ^:skip-aot clj-sentiment.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}})
