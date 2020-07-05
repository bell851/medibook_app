class ChangeBooksNameNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :books, :name, false
  end
end
