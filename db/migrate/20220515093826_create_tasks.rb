class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :details
      t.boolean :is_completed, :default => false
      t.date :due_at
      t.integer :user_id

      t.timestamps
    end
  end
end
