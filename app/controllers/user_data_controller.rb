class UserDataController < ApplicationController
  def index
    @users = User.all
    @user_options = @users.map {|u| u.as_options}
    @groups = UserDataGroup.all
    @group_options = @groups.map {|g| g.as_options}
  end

  def show
    user_id = params[:user_id]
    group_id = params[:group_id]
    group = UserDataGroup.find(group_id)
    field_ids = group.user_data_field_ids
    @field_values = []
    field_ids.each do |field_id|
      field_val = UserDataValue.find_or_create_by(user_id: user_id, user_data_field_id: field_id)
      if field_val
        @field_values.push(field_val)
      end
    end
    @user = User.find(user_id)
  end
end
