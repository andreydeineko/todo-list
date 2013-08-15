class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :project_id, null: false
      t.integer :position
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
