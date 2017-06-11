class RenameDescriptionInBook < ActiveRecord::Migration[5.1]
  def change
    rename_column Book, :description, :note
  end
end
