class UserDataFieldsController < ApplicationController

  def index
    @fields = UserDataField.all
  end

  def show
    @field = UserDataField.find(params[:id])
  end

  def new
    @field = UserDataField.new
  end

  def create
    @field = UserDataField.new(field_params)
    if @field.save
      redirect_to @field
    else
      render :new, status: :unprocessable_entity  
    end
  end

  private
  def field_params
    params.require(:user_data_field).permit(:code,:label)
  end

end
