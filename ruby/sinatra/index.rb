# -*- coding: utf-8 -*-

require "json"
require "sinatra"
require "sinatra/reloader"
require "sinatra/json"

lang = ["clojure", "python", "ruby", "lisp"]
item = ["cassandra", "neo4j"]

get '/' do
	'Hello with Sinatra'
end

get '/:name' do
	"Hi, #{params['name'].capitalize}"
end

get '/api/items' do
	json({
			:data => item,
			:count => item.count,
			:next => nil,
			:previus => nil,
		})
end

get '/api/item/:id' do
	id = Integer(params[:id])
	json :name => item[id]
end

get '/api/lang' do
	json({
			:data => lang,
			:count => lang.count,
			:next => nil,
			:previus => nil,
		})
end

get '/api/lang/:id' do
	id = Integer(params[:id])
	json :name => lang[id]
end