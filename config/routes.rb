Rails.application.routes.draw do
  root "home#index"
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      post "/create_driver" => "drivers#create_driver"
      get "/pay_later_amounts" => "pay_later#pay_later_amounts"
      resources :drivers do
        post '/add_cards' => 'card_details#add_cards'
        post "/create_purchase_fuel" => "fuel_purchases#create_purchase_fuel"
        get "/pay_later_transactions" => "pay_later#pay_later_transactions"
        patch "/is_paid_transaction" => "pay_later#is_paid_transaction" 
      end
    end
  end
end
