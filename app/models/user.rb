class User < ApplicationRecord
  has_many :user_data_values
  has_many :user_data_fields, through: :user_data_values

  def as_options
    [self.name, self.id]
  end
end
