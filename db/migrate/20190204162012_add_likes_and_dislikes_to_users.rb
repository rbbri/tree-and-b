class AddLikesAndDislikesToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users  do |t|
      t.column :likes, :integer, array: true, default: []
      t.column :dislikes, :integer, array: true, default: []
    end
  end
end
