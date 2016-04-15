class HomeController < ApplicationController
	require 'net/http' 
	require 'json'
	

		
	def index
		@itunes = itunes[artist]
		
		
	end

	def artist
		
	end


	def itunes(artist)
		uri = URI("http://itunes.apple.com/search?term=#{artist}&entity=song")  
		 response = JSON.parse(Net::HTTP.get(uri)) # => String end
		 
	end
	


end
