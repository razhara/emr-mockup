class UserDataField < ApplicationRecord
  has_many :user_data_group_items
  has_many :user_data_values
end
