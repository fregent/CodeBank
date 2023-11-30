class CreateSnippetsDirectories < ActiveRecord::Migration[7.1]
  def change
    create_table :snippets_directories do |t|
      t.integer :snippet_id
      t.integer :directory_id
      t.timestamps
    end
  end
end
