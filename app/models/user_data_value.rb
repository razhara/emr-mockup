class UserDataValue < ApplicationRecord
  belongs_to :user_data_field
  belongs_to :user
  after_commit :show_in_profile, on: [:create, :update]

  def show_in_profile
    if self.value && !self.visible
      self.update(visible: true)
    end
  end
end
