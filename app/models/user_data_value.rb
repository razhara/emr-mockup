class UserDataValue < ApplicationRecord
  belongs_to :user_data_field
  belongs_to :user
end
