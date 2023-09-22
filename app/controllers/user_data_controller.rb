class UserDataController < ApplicationController
  def index
    @users = User.all
    @user_options = @users.map {|u| u.as_options}
    @groups = UserDataGroup.all
    @group_options = @groups.map {|g| g.as_options}
  end

  def show
  end
end
