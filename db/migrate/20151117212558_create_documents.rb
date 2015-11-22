class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents, id: :uuid, default: 'uuid_generate_v4()' do |t|
      t.string :title
      t.attachment :file
			t.string :user_id

      t.timestamps null: false
    end
  end
end
