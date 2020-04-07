class TopsController < ApplicationController

  def index
    @products = Product.all
    # @product = @product.images.all
    # -view
    # @products.each do |product|
    #   = product.name
    #   product.images.each do |image|
    #     = image_tag image.image
  end
end
