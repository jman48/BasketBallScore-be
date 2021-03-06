Rails.application.routes.draw do

  post 'users' => 'users#create'
  get 'users' => 'users#showAll'
  get 'users/:id' => 'users#show'
  put 'users/:id/totalHoops' => 'users#changeTotalHoops'
  put 'users/:id/highestStreak' => 'users#changeHighestStreak'
  put 'users/:id/shootoutsWon' => 'users#changeShootoutsWon'
  delete 'users/:id' => 'users#destroy'

  post 'games' => 'games#create'
  get 'games' => 'games#showAll'
  get 'games/active' => 'games#showActive'
  get 'games/:id' => 'games#show'
  put 'games/:id/active' => 'games#updateActive'
  delete 'games/:id' => 'games#delete'
  delete 'games' => 'games#deleteAll'

  get 'players' => 'players#showAll'
  get 'players/:id' => 'players#show'
  get 'players/game/:id' => 'players#showAllInGame'
  put 'players/:username/game/:game_id' => 'players#update'
  delete 'players' => 'players#deleteAll'
  delete 'players/:id' => 'players#delete'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
