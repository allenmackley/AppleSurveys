Rails.application.routes.draw do
  root 'home#index'
  resources :surveys do 
    resources :survey_responses
  end
end
