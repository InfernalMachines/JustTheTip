class CurrencyController < ApplicationController
  
	require 'net/http' 
	require 'json'

  def index
  	@base_rate = currency_exchange
  	@current_rate = currency_exchange["rates"]
  	@rate_key = currency_exchange["rates"].keys
  end

  def currency_exchange
  	uri = URI("https://openexchangerates.org/api/latest.json?app_id=0ccb5c5d253345f5b4e51ac6ab815fd3&base=USD")
  	#uri = URI("http://www.apilayer.net/api/live?access_key=05cee63cbf4c339e875c5a5a969fb5bf&format=1")
	response = JSON.parse(Net::HTTP.get(uri))
	end

	# def current_location
	# 	@current_location = current_location
	# 	current_location = "USD"
	# end
end
