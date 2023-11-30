class AddDescriptionToSnippets < ActiveRecord::Migration[7.1]
  def change
    add_column :snippets, :description, :text
    rename_column :snippets, :name, :title
  end
end
