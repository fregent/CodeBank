class EditColumnsToSnippets < ActiveRecord::Migration[7.1]
  def change
    rename_column :snippets, :upvotes, :likes
    add_column :snippets, :views, :integer, default: 0
    add_column :snippets, :comments_count, :integer, default: 0
    add_column :snippets, :shares_count, :integer, default: 0
  end
end
