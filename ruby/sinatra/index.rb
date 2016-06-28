# -*- coding: utf-8 -*-

require "json"
require "sinatra"
require "sinatra/reloader"
require "sinatra/json"

item = ["clojure", "python", "ruby", "lisp"]

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