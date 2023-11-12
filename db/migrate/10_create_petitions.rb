class CreatePetitions < ActiveRecord::Migration[7.0]
    def change
      create_table :petitions, id: :uuid,default: 'uuid_generate_v4()' do |t|
        t.string :title
        t.text :description
        t.string :topic
        t.references :user, null: false, foreign_key: true, type: :uuid
        t.string :petition_poster
        t.integer :target_signatures
  
        t.timestamps
      end
    end
  end
  