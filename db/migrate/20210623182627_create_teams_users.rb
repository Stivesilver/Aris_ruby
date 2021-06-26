class CreateTeamsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :teams_users do |t|
      t.references :user
      t.references :team
    end
  end
end
