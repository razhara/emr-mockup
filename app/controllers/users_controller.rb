class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_back fallback_location: { action: "show", id: @user.id }
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      p "sukses"
      redirect_back fallback_location: { action: "show", id: @user.id }
    else
      p "gagal"
      render :new, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, 
      user_data_values_attributes: ::UserDataValue.attribute_names.map(&:to_sym).push(:_destroy)
    )
  end
end
