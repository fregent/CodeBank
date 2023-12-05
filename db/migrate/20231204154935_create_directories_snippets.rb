class CreateDirectoriesSnippets < ActiveRecord::Migration[7.1]
  def change
    create_table :directories_snippets do |t|
    t.references :directory, foreign_key: true
    t.references :snippet, foreign_key: true
    t.timestamps
    end
  end
end
