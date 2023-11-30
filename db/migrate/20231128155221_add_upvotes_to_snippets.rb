class AddUpvotesToSnippets < ActiveRecord::Migration[7.1]
  def change
    add_column :snippets, :upvotes, :integer, default: 0
  end
end
