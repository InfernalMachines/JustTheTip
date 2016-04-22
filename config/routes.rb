Rails.application.routes.draw do

  root 'local#index'
  get 'international/home'

  post '/tip-query' => 'local#tip_query'
  post '/world-tipping' => 'international#int_tip'

end

