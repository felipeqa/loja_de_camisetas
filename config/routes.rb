Rails.application.routes.draw do
  #/path => controller#method
  # get 'produtos' => 'produtos#index'
  # post '/produtos' => 'produtos#create'
  # get 'produtos/new' => 'produtos#new'
  # delete 'produtos/:id' => 'produtos#destroy', as: :produto
  #resources :produtos gera todas as rotas possíveis
  resources :produtos, only: [:new, :create, :destroy]
  get '/produtos/busca' => 'produtos#busca', as: :busca_produto
  root 'produtos#index'
end
