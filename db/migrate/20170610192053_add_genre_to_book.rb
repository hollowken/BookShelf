class AddGenreToBook < ActiveRecord::Migration[5.1]
  def change
    add_column Book, :genre, :string
  end
end
