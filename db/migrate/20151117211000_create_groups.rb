class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups, id: :uuid, default: 'uuid_generate_v4()' do |t|
      t.string :numer
      # добавить направление обучения

      t.timestamps null: false
    end
  end
end
