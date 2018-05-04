class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :Tasks do |t|
      t.string :name
      t.string :description
      t.integer :volunteer_id
    end
  end
end
