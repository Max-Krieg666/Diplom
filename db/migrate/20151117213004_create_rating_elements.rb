class CreateRatingElements < ActiveRecord::Migration
  def change
    create_table :rating_elements, id: false do |t|
      t.string :id, primary: true, null: false
      t.string :title
      t.integer :score
			t.string :rating_id

      t.timestamps null: false
    end
  end
end
