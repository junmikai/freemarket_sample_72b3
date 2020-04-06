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

    redirect_to :root
    # if @product.save
    #   flash[:success] = "商品を出品しました！"
    #   redirect_to :root
    # end
  end

  def edit
  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :status, :shipping_cost, :shipping_days, :category_id, :prefecture_id, images_attributes: [:image])
  end
end
