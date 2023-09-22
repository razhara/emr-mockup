class UserDataGroupItem < ApplicationRecord
  belongs_to :user_data_group
  belongs_to :user_data_field
end
