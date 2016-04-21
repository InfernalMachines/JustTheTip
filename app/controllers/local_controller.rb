class LocalController < ApplicationController
 
  def index
    @select_state = Usadb.pluck(:base_state,:id)
    @service = Service.pluck(:general_service,:id)
  end

  def tip_query
    @service = Service.pluck(:general_service,:id)
    current_srv = Service.find(params[:srv])
    @current_srv = current_srv.service_tip_overide
    @current_id = current_srv.id
    
    @select_state = Usadb.pluck(:base_state,:id)  
    amount=params[:amount]
    tip_base = Usadb.find(params[:state])
    @tip_base = tip_base

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
      @small_tip = no_srv
    end
    states_calc(amount,revise_tip)
    render 'index'
  end

def states_calc(amount,revise_tip)
    @amount = amount
    if (@current_id == 4)
          @rev_total = revise_tip + amount.to_f
        else
  	@tipTotal = revise_tip * amount.to_f
  	recipt = @tipTotal + amount.to_f
  	@recipt = recipt
  	return recipt
  end
end
 
  
end
