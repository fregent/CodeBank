class ChangeContentTypeInSnippets < ActiveRecord::Migration[7.1]
  def change
      change_column :snippets, :content, :text
  end
end
