class UserDataGroupsController < ApplicationController

  def index
    @groups = UserDataGroup.all
  end

  def show
    @group = UserDataGroup.find(params[:id])
    group_field_ids = @group.user_data_field_ids
    @fields = UserDataField.where.not(id: group_field_ids)
  end

  def new
    @group = UserDataGroup.new
  end

  def create
    @group = UserDataGroup.new(group_params)
    if @group.save
      redirect_to @group
    else
      render :new, status: :unprocessable_entity  
    end
  end

  def add_fields
    @group = UserDataGroup.find(params[:id])
    field_ids = params[:field_ids]
    field_ids.each do |f|
      @group.user_data_group_items.create(user_data_field_id: f)
    end
    redirect_back fallback_location: { action: "show", id: params[:id] }
  end

  def remove_item
    @group = UserDataGroup.find(params[:id])
    item_id = params[:item_id]
    @item = UserDataGroupItem.find(item_id)
    if @item.destroy
      redirect_back fallback_location: { action: "show", id: params[:id] }
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def group_params
    params.require(:user_data_group).permit(:title)
  end

end
