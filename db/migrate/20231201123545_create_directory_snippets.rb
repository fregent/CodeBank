class CreateDirectorySnippets < ActiveRecord::Migration[7.1]
  def change
    create_table :directory_snippets do |t|
      t.references :directory, null: false, foreign_key: true
      t.references :snippet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
