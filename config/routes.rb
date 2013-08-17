Forttree::Application.routes.draw do
  resources :boards do
    resources :posts, except: :destroy
  end

  delete '/boards/:board_id/posts', to: 'posts#destroy', as: 'posts_destroy'

  root :to => 'boards#index'
end
