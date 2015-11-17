class CreateRatingElements < ActiveRecord::Migration
  def change
    create_table :rating_elements, id: :uuid, default: 'uuid_generate_v4()' do |t|
      t.string :title
      t.integer :score

      t.timestamps null: false
    end
  end
end
