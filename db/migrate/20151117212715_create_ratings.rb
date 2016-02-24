class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings, id: false do |t|
      t.string :id, primary: true, null: false
      t.integer :max_score
			t.string :discipline_id

      t.timestamps null: false
    end
  end
end
