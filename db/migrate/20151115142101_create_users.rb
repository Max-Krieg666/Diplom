class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: :uuid, default: 'uuid_generate_v4()' do |t|
      t.string :login
      t.string :password_digest
      t.string :lastname
      t.string :firstname
      t.string :patronymic
      t.string :email
      t.integer :role, default: 0
			t.string :group_id
      t.boolean :is_active, default: true

      t.timestamps null: false
    end
  end
end
