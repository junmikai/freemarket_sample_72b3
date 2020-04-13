class BuysController < ApplicationController
  def edit
    @product = Product.find(params[:id])
  end
  def update
    # binding.pry
    @product = Product.find(params[:id])
    @product.update(destination_id: current_user.id)
    redirect_to :root
    # if @product.update( destination_id: current_user.id)
    #   redirect_to :root
    #   flash[:notice] = "商品を購入しました！"
    # else
    #   render "buy_edit", flash: { error: @product.errors.full_messages }
    # end
    # @destination = Destination.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :status, :shipping_cost, :shipping_days, :category_id, :prefecture_id, :distination_id, images_attributes:[:image]).merge(user_id: current_user.id)
  end
end
