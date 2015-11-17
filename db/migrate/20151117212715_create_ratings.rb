class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings, id: :uuid, default: 'uuid_generate_v4()' do |t|
      t.integer :max_score

      t.timestamps null: false
    end
  end
end
