class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections, id: false do |t|
      t.string :id, primary: true, null: false
      t.string :title
      t.string :content
			t.string :page_id

      t.timestamps null: false
    end
  end
end
