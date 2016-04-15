class StatesController < ApplicationController
  def index
   
  	@state = Jtp.all
  	@tip_origin = tip_origin
  	tip_origin = Jtp[:base_tip]

  end

  def states_calc(amount,tip)
  	billedAmt = amount
  	@billedAmt = billedAmt
  	stateTip = tip.to_i
	tipTotal = tip * amount
	@tipTotal = tipTotal
	recipt = tipTotal + amount
	@recipt = recipt
	return recipt
  end


end
