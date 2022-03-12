Rails.application.routes.draw do
  resources :school_classes do
    get 'estudantes', to: 'school_classes#estudantes', as: 'estudantes', on: :member
    resources :students
  end

  resources :students do
    post 'desativar', to: 'students#desativar_estudante', as: 'desativar', on: :member
  end

  resources :teachers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
