class CreateTeamMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :team_members do |t|
      t.boolean :admin
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
