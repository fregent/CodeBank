class AddUserIdToSnippets < ActiveRecord::Migration[7.1]
  def change
    add_reference :snippets, :user, null: false, foreign_key: true
  end
end
