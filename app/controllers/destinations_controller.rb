class DestinationsController < ApplicationController
  before_action :set_destination, only: [:edit, :show, :update]
  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.new(destination_params)
    if @destination.save
      redirect_to destination_path(@destination.id)
      flash[:notice] = "情報を登録しました"
    else
      redirect_to new_destination_path, flash: { error: @destination.errors.full_messages }

    end
  end

  def show
  end

  def edit 
    # @destination = Destination.find(params[:id])
  end


  def update
    if @destination.update_attributes(destination_params)
      redirect_to :root
    else
      render action: :edit
    end
  end

  def set_destination
    @destination = Destination.find(params[:id])
  end
  private 
  def destination_params
      params.require(:destination).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id)
  end
end