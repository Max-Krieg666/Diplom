class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups, id: false do |t|
      t.string :id, primary: true, null: false
      t.string :numer

      t.timestamps null: false
    end
  end
end
