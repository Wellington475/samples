# -*- coding: utf-8 -*-

require "test/unit"
require "rack/test"

class TestIndex < Test::Unit::TestCase
	
	def app
		Sinatra::Application
	end
  
  def test_simple
    get '/'
    assert_equal 'Hello with Sinatra', last_response.body
  end

end