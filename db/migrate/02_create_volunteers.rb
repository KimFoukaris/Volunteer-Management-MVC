class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :Volunteers do |t|
      t.string :name
      t.string :interest
      t.integer :user_id
    end
  end
end
