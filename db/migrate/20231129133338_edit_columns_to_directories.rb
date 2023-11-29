class EditColumnsToDirectories < ActiveRecord::Migration[7.1]
  def change
    remove_column :directories, :snippet_id
    add_column :directories, :private, :boolean, default: true
  end
end
