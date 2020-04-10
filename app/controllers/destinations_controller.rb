class DestinationsController < ApplicationController

  def new
    @destination = Destination.new

  end

  def create
    @destination = Destination.create(destination_params)
    if @destination.save
      redirect_to destination_path(@destination.id)
      flash[:notice] = "情報を登録しました"
    else
      redirect_to new_destination_path, flash: { error: @destination.errors.full_messages }
    end
    
  end
  def show
    @destination = Destination.find(params[:id])
  end

  def destroy
  end

  private 
  def destination_params
      params.require(:destination).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :post_code, :prefecture, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id)
  end
end

# destination_path(destination.id)