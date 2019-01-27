class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    t.string :user_id
    t.string :location
    t.integer :radius
    end
  end
end
