Rails.application.routes.draw do

  devise_for :users
  resources :address_links, :address_types, :banks, :bank_accounts, :cities
  resources :city_parts, :countries, :currencies, :day_entries, :exchange_rates
  resources :house_numbers, :income_reports, :incomming_invoice_payments
  resources :incomming_invoice_sequences, :items, :outgoing_invoice_payments
  resources :outgoing_invoice_sequences, :payments, :payment_types, :projects
  resources :provinces, :reports, :report_types, :streets, :tasks, :task_types 
  resources :trade_subjects, :users, :vat_charges, :vat_reports
  
  resources :incomming_invoices do
    resources :incomming_invoice_items
  end
  
  resources :outgoing_invoices do
    resources :outgoing_invoice_items
  end 

  get 'home/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root :to => "home#index"

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
