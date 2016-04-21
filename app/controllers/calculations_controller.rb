class CalculationsController < ApplicationController
 
  def index
    @select_state = Usadb.pluck(:base_state,:id)
    @service = Service.pluck(:general_service,:id)
  end

  def tip_query
    @service = Service.pluck(:general_service,:id)
    current_srv = Service.find(params[:srv])
    @current_srv = current_srv.service_tip_overide
    @current_id = current_srv.id
    
    apple = current_srv

    @select_state = Usadb.pluck(:base_state,:id)  
    amount=params[:amount]
    tip_base = Usadb.find(params[:state])

     #finds tip in database
    @state = tip_base.base_state #finds States in database
    @national_average = tip_base.base_tip
    @tip = tip_base.base_tip

    if (@current_id == 1)
      revise_tip = @current_srv
    elsif (@current_id == 2)
      revise_tip = @tip
    elsif (@current_id == 3)
      revise_tip = @current_srv
    elsif (@current_id == 4)
      no_srv = @current_srv * 10
      revise_tip = no_srv
    end

    states_calc(amount,revise_tip)
    render 'index'
  end

  def states_calc(amount,revise_tip)
    @amount = amount
  	@tipTotal = revise_tip * amount.to_i
  	recipt = @tipTotal + amount.to_i
  	@recipt = recipt

  	return recipt
  end

 
  def currency_exchange
    uri = URI("https://openexchangerates.org/api/latest.json?app_id=0ccb5c5d253345f5b4e51ac6ab815fd3&base=USD")
    #uri = URI("http://www.apilayer.net/api/live?access_key=05cee63cbf4c339e875c5a5a969fb5bf&format=1")
    response = JSON.parse(Net::HTTP.get(uri))
  end

end
