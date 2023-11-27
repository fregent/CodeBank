class CreateSnippets < ActiveRecord::Migration[7.1]
  def change
    create_table :snippets do |t|
      t.string :name
      t.string :content
      t.boolean :private
      t.string :language

      t.timestamps
    end
  end
end
