class ProductsController < ApplicationController
  
  def show
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    # binding.pry
    @product = Product.create(product_params)
    if @product.save
      redirect_to :root
      flash[:notice] = "商品を出品しました！"
    else
      redirect_to new_product_path
    end
  end

  def edit
  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :status, :shipping_cost, :shipping_days, :category_id, :prefecture_id, :distination_id, images_attributes: {image: []}).merge(user_id: current_user.id)
  end
end
