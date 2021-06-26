class CreateProjectsTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :projects_teams do |t|
      t.references :project
      t.references :team
    end
  end
end
