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
        redirect_to action: "create"
      end



      # if card_params=token_submit
      #   @card.save
      #   redirect_to root_path
      # else
      #   redirect_to action: "create"
      # end


    end
  
 

end
