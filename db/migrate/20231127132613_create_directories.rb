class CreateDirectories < ActiveRecord::Migration[7.1]
  def change
    create_table :directories do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.references :snippet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
