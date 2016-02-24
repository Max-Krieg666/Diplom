class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages, id: false do |t|
      t.string :id, primary: true, null: false
      t.string :title
      t.string :content
			t.string :discipline_id

      t.timestamps null: false
    end
  end
end
