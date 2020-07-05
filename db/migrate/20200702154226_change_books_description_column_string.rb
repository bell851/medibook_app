class ChangeBooksDescriptionColumnString < ActiveRecord::Migration[6.0]
  def change
    change_column :books, :description, :string
  end
end
