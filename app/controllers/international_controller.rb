class InternationalController < ApplicationController
  def home
    @data_ctry_select = Intdb.pluck(:country_name,:id)
  end

  def int_tip
    @data_ctry_select = Intdb.pluck(:country_name,:id)#grabs values from db and populates to pulldown
    find_country = Intdb.find(params[:country])#find values from db from pull down selection params
    iso = find_country.iso # pass value found as country and grab corresponding Iso code
    @iso_rate = find_country_rate(iso)#for view only
  
    form_amount=params[:amount]
    
    #Ok so now I want to find compare the corresponding Iso code against the api's Iso code and return currency exchange
       
    int_calculate(form_amount)
    render 'home'
  end

  def find_country_rate(target_iso)
    uri = URI("http://openexchangerates.org/api/latest.json?app_id=0ccb5c5d253345f5b4e51ac6ab815fd3&base=USD")
    @response = JSON.parse(Net::HTTP.get(uri))
    @api_key_iso = @response["rates"] #pull back only keys from api
    @api_key_iso.each do |iso, rate|
        if target_iso == iso
          return rate
        end
      # puts 'rate: ' + rate.to_s
      # puts 'iso: ' + iso.to_s
    end
  end

  def int_calculate(form_amount)
    #for view sake
    @amount = form_amount.to_f

    #create catch catch for null Iso
    @total_in_dollars = @amount * @iso_rate
  end



end