class RenameTypeToCategoryInSpaceships < ActiveRecord::Migration[7.0]
  def change
    rename_column :spaceships, :type, :category
  end
end
