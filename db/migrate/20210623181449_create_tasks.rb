class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :content
      t.blob :image
      t.string :status
      t.date :start_date
      t.date :due_date
      t.string :estimation
      t.references :project

      t.timestamps
    end
  end
end
