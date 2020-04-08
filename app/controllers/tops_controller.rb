class TopsController < ApplicationController

  def index
    @products = Product.all
  #   if params[:image] != nil
  #     image = MiniMagick::Image.read(params[:image])
  #     image.resize "300x300"
  #     image.write "public/images/hoge.jpg"
  #  end
  end
end
