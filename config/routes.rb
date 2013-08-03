Forttree::Application.routes.draw do
  #resources :boards, shallow: true do
  #  resources :branches, except: :index do
  #    resources :leafs, except: :index
  #  end 
  #end

  # resources :leafs, :only => [:new, :create]

  # resources :branches, :except => :index

  # get 'leafs/new/:id' => 'leafs#new'
 
  #resources :boards

  get '/boards/:id', to: 'posts#new', as: 'post'
  post '/boards/:id', to: 'posts#create'
  get '/boards/:board_id/branch/:id', to: 'posts#edit', as: 'posts'
  patch '/boards/:board_id/branch/:id', to: 'posts#update'
  delete 'boards/:id', to: 'posts#destroy'

  root :to => 'posts#index'
end
