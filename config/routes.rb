Rails.application.routes.draw do
  resources :attendances, except: [:new, :edit]
  resources :current_days, except: [:new, :edit]
  resources :ratings, except: [:new, :edit]
  resources :evaluations, except: [:new, :edit] do
    post 'add_rating'
    post 'complete'
  end

  resources :evaluation_templates, except: [:new, :edit]
  resources :rating_types, except: [:new, :edit]

  get 'school_classes/available' => 'school_classes#available'
  resources :school_classes, except: [:new, :edit] do
    get 'evaluation_templates'
    get 'students'
    post 'reports'
    patch 'set_teacher' => 'school_classes#set_teacher'
    patch 'remove_teacher' => 'school_classes#remove_teacher'

  end

  resources :teachers, except: [:new, :edit] do
    get 'classes'
  end
  resources :students, except: [:new, :edit]
  resources :schools, except: [:new, :edit]
  resources :districts, except: [:new, :edit]
  resources :users, except: [:new, :edit]

  resources :sessions, except: [:new, :edit]

  post 'email_verification/generate_token' => 'email_verification#generate_token'
  post 'email_verification/verify_token' => 'email_verification#verify_token'

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
