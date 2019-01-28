class CreateTrees < ActiveRecord::Migration[5.2]
  def change
    create_table :trees do |t|
      t.string :name
      t.string :description
      t.string :imageURL
      t.string :location
    end
  end
end
