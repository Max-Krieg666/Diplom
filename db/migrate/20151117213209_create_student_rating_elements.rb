class CreateStudentRatingElements < ActiveRecord::Migration
  def change
    create_table :student_rating_elements, id: false do |t|
      t.integer :value, default: 0
      t.string :user_id
      t.string :rating_element_id

      t.timestamps null: false
    end
  end
end
