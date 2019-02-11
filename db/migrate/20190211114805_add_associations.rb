class AddAssociations < ActiveRecord::Migration[5.2]
  def change
    change_table :trees do |t|
      t.references :user
    end
  end
end
