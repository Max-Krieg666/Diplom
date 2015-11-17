class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections, id: :uuid, default: 'uuid_generate_v4()' do |t|
      t.string :title
      t.string :content

      t.timestamps null: false
    end
  end
end
