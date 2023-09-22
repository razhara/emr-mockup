class UserDataGroupsController < ApplicationController

  def index
    @groups = UserDataGroup.all
  end

  def show
    @group = UserDataGroup.find(params[:id])
    @fields = UserDataField.all
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
    render json: { message: "add fields success" }, status: :ok
  end

  private
  def group_params
    params.require(:user_data_group).permit(:title)
  end

end
