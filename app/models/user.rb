class User < ApplicationRecord
  has_many :user_data_values
  has_many :user_data_fields, through: :user_data_values
  accepts_nested_attributes_for :user_data_values, allow_destroy: true

  def as_options
    [self.name, self.id]
  end
end
