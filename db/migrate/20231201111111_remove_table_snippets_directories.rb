class RemoveTableSnippetsDirectories < ActiveRecord::Migration[7.1]
  def change
    drop_table :snippets_directories
  end
end
