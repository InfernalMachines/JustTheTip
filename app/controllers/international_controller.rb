class InternationalController < ApplicationController
  def home
  	@int_datasource = currency_exchange 
  end

  def currency_exchange

    uri = URI("https://openexchangerates.org/api/latest.json?app_id=0ccb5c5d253345f5b4e51ac6ab815fd3&base=USD")
    #uri = URI("http://www.apilayer.net/api/live?access_key=05cee63cbf4c339e875c5a5a969fb5bf&format=1")
    @response = JSON.parse(Net::HTTP.get(uri))
  end

  def inter_tipping
  end

end
