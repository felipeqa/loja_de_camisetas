Rails.application.routes.draw do
  #/path => controller#method
  get "produtos" => 'produtos#index'
end
