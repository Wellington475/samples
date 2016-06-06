(defproject clj-sentiment "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.8.0"]
                 [compojure "1.5.0"]
                 [ring "1.4.0"]
                 [ring/ring-json "0.4.0"]
                 [org.apache.lucene/lucene-core "6.0.1"]
                 [org.apache.lucene/lucene-analyzers-common "6.0.1"]]
  :main ^:skip-aot clj-sentiment.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}})
