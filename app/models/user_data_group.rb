class UserDataGroup < ApplicationRecord
  has_many :user_data_group_items
  has_many :user_data_fields, through: :user_data_group_items

  def user_data_field_ids
    self.user_data_fields.pluck(:id)
  end

  def as_options
    [self.title, self.id]
  end

end
