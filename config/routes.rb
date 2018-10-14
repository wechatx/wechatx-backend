Rails.application.routes.draw do

  scope :api do
    get 'transfer/index', to: 'transfer#index'
    get 'transfer/create/:id', to: 'transfer#create'
    get 'transfer/update/:id', to: 'transfer#update'
    get 'transfer/delete/:id', to: 'transfer#delete'
    get 'transfer/destroy', to: 'transfer#destroy'
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
