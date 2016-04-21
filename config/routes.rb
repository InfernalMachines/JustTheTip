Rails.application.routes.draw do

  get 'international/home'
  post '/world-tipping' => 'international#inter_tipping'

  root 'local#index'

  post '/tip-query' => 'local#tip_query'

end
