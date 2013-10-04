Hack4goodSantiago::Application.routes.draw do
  root :to => "home#index"
  get 'instructions', to: 'home#instructions', as: :instructions
end
