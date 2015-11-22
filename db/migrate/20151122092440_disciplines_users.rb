class DisciplinesUsers < ActiveRecord::Migration
  def self.up
		create_table :disciplines_users, :id => false do |t|
			t.references :discipline
			t.references :user
		end
		add_index :disciplines_users, [:discipline_id, :user_id]
		add_index :disciplines_users, :user_id
	end

	def self.down
		drop_table :disciplines_users
	end
end
