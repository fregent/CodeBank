class AddLastViewedToSnippetsAndDirectories < ActiveRecord::Migration[7.1]
  def change
    add_column :snippets, :last_viewed, :datetime
    add_column :directories, :last_viewed, :datetime
  end
end
