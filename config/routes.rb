Gameheroku::Application.routes.draw do

	root "entrance#enter"
	post "/entrance/namewriter(/:name_prm)" , :to=> "entrance#namewriter"
	get "/lobby/top" , :to=> "lobby#top"
	get "/lobby/visitor_update" , :to=> "lobby#visitor_update"
	post "/chat/reader(/:room_prm)" , :to=> "chat#reader"
	post "/chat/writer(/:room_prm(/:content_prm))" , :to=> "chat#writer"
	get "/gameroom/top(/:room_prm)" , :to=> "gameroom#top"
	post "/gameroom/room_visitorlist(/:room_prm)" , :to=> "gameroom#room_visitorlist"
	post "/gameroom/room_creater(/:room_prm)" , :to=> "gameroom#room_creater"
	get "/gameroom/room_destroyer" , :to=> "gameroom#room_destroyer"
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
