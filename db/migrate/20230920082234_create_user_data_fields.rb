class CreateUserDataFields < ActiveRecord::Migration[6.1]
  def change
    create_table :user_data_fields do |t|
      t.string :code
      t.string :label

      t.timestamps
    end
  end
end
