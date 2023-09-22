class CreateUserDataGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :user_data_groups do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
