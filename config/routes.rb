RubyGarage::Application.routes.draw do
  root to: 'welcome#index'

  devise_for :users


  scope module: 'authenticated' do
    resources :projects, only: [ :index, :create, :update, :destroy ]
    resources :tasks, only: [ :create, :update ] do
      put :destroy,    :on => :collection
      put :complete,   :on => :member
      put :prioritize, :on => :member
    end
  end
end
