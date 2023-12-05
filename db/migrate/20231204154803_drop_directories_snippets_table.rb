class DropDirectoriesSnippetsTable < ActiveRecord::Migration[7.1]
    def up
      drop_table :directories_snippets
    end
end
