ActiveRecord::Schema.define(version: 20_190_127_200_649) do
  enable_extension 'plpgsql'

  create_table 'trees', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.string 'imageURL'
    t.string 'location'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'user_id'
    t.string 'location'
    t.integer 'radius'
  end
end
