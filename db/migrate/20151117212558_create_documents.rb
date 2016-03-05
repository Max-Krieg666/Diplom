class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents, id: false do |t|
      t.string :id, primary: true, null: false
      # t.string :title
      t.string :file
			# t.string :comment
			t.string :user_id

      t.timestamps null: false
    end
  end
end