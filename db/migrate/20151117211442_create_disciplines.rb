class CreateDisciplines < ActiveRecord::Migration
  def change
    create_table :disciplines, id: false do |t|
      t.string :id, primary: true, null: false
      t.string :title
			t.string :rating_id
			t.string :group_id

      t.timestamps null: false
    end
  end
end
