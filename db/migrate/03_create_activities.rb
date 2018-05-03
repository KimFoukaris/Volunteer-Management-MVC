class CreateActivities < ActiveRecord::Migration
  def change
    create_table :Activities do |t|
      t.string :name
      t.string :description
      t.integer :volunteer_id
    end
  end
end
