class AddValueVisible < ActiveRecord::Migration[6.1]
  def change
    add_column :user_data_values, :visible, :boolean, default: false
  end
end
