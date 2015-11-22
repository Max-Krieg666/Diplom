class CreateRatingElements < ActiveRecord::Migration
  def change
    create_table :rating_elements, id: :uuid, default: 'uuid_generate_v4()' do |t|
      t.string :title
      t.integer :score
			t.string :rating_id
			t.string :student_rating_element_id

      t.timestamps null: false
    end
  end
end
