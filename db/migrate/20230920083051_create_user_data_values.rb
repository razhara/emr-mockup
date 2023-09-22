class CreateUserDataValues < ActiveRecord::Migration[6.1]
  def change
    create_table :user_data_values do |t|
      t.string :value

      t.timestamps
    end
  end
end
