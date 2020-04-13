class BuysController < ApplicationController
  def edit
    @product = Product.find(params[:id])
  end
  def update
    @product = Product.find(params[:id])
    @product.update(destination_id: current_user.id)
    if @product.save
      redirect_to :root
      flash[:notice] = "商品を購入しました！"
    else
      render "buy_edit", flash: { error: @product.errors.full_messages }
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :status, :shipping_cost, :shipping_days, :category_id, :prefecture_id, :distination_id, images_attributes:[:image]).merge(user_id: current_user.id)
  end
end
