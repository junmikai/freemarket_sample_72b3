class SignupController < ApplicationController
  require 'payjp'

  def create
    @user = User.new()

    if @user.save
      session[:id] = @user.id
      sign_in User.find(session[:id]) unless user_signed_in?
    end
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY'] 

    card_params = { number: '4242424242424242', cvc: '123', exp_month: '1', exp_year: '2022' }
    token = Payjp::Token.create({ card: card_params }, x_payjp_direct_token_generate: true)

    customer = Payjp::Customer.create(card: token.id)
    Payjp::Charge.create(amount: 2000, customer: customer.id, currency: 'jpy')

      @card = Card.new(                  
        user_id: current_user.id,       
        customer_id: customer.id,        
        card_id: customer.default_card   
      )

      if @card.save
        redirect_to root_path
      else
        redirect_to signup_index_path 
      end
    end


    def destroy 
      card = Card.find_by(user_id: current_user.id)
      if card.blank?
      else
        Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
        customer = Payjp::Customer.retrieve(card.customer_id)
        customer.delete
        card.delete
      end
      redirect_to root_path
    end
  
    def show 
      card = Card.find_by(user_id: current_user.id)
      if card.blank?
        redirect_to root_path
      else
        Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
        customer = Payjp::Customer.retrieve(card.customer_id)
        @default_card_information = customer.cards.retrieve(card.card_id)
      end
    end

    
end
