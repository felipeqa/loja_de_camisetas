Rails.application.routes.draw do
  resources :departamentos
  #/path => controller#method
  # get 'produtos' => 'produtos#index'
  # post '/produtos' => 'produtos#create'
  # get 'produtos/new' => 'produtos#new'
  # delete 'produtos/:id' => 'produtos#destroy', as: :produto
  #resources :produtos gera todas as rotas possíveis
  resources :produtos, only: [:new, :create, :destroy, :edit, :update]
  get '/produtos/busca' => 'produtos#busca', as: :busca_produto
  root 'produtos#index'
end
