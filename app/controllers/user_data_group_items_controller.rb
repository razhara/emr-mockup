class UserDataGroupItemsController < ApplicationController
  def destroy
    @item = UserDataGroupItem.find(params[:id])
    @item.destroy
    render json: { message: 'item deleted' }, status: :ok
  end
end
