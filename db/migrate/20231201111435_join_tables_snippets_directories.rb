class JoinTablesSnippetsDirectories < ActiveRecord::Migration[7.1]
  def change
    create_join_table(:snippets, :directories)
  end
end
