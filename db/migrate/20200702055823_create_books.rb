class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name, limit: 50, null: false
      t.string :description, limit: 140

      t.timestamps
    end
  end
end
