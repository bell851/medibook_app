class ChangeBooksColumnLimit < ActiveRecord::Migration[6.0]
  def up
    change_column :books, :name, :string, limit: 30
    change_column :books, :description, :string, limit: 140
  end
  def down
    change_column :books, :name, :string
    change_column :books, :description
  end
end
