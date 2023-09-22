class CreateUserDataGroupItems < ActiveRecord::Migration[6.1]
  def change
    create_table :user_data_group_items do |t|

      t.timestamps
    end
  end
end
