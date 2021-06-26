class CreateTasksUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks_users do |t|
      t.references :user
      t.references :task
    end
  end
end
