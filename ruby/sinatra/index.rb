# -*- coding: utf-8 -*-
require "sinatra"
require "sinatra/reloader"

get '/' do
	'Hello with Sinatra'
end

get '/:name' do
	"Hi, #{params['name'].capitalize}"
end
