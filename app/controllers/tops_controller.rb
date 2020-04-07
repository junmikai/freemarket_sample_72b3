class TopsController < ApplicationController

  def index
    @products = Product.all
    @images = @product.images.all
  end
end
