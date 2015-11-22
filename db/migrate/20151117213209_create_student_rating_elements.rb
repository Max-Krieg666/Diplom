class CreateStudentRatingElements < ActiveRecord::Migration
  def change
    create_table :student_rating_elements do |t|
      t.integer :value
			t.string :user_id

      t.timestamps null: false
    end
  end
end
