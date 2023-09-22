class AddDataReferences < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_data_values, :user, foreign_key: true
    add_reference :user_data_values, :user_data_field, foreign_key: true
    add_reference :user_data_group_items, :user_data_field, foreign_key: true
    add_reference :user_data_group_items, :user_data_group, foreign_key: true
  end
end
