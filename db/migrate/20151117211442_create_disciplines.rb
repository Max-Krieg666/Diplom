class CreateDisciplines < ActiveRecord::Migration
  def change
    create_table :disciplines, id: :uuid, default: 'uuid_generate_v4()' do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
