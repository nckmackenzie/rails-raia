class CreateEvents < ActiveRecord::Migration[7.0]
    def change
      create_table :events, id: :uuid,default: 'uuid_generate_v4()' do |t|
        t.string :name
        t.text :description
        t.date :date
        t.references :county, null: false, foreign_key: true
        t.references :user, null: false, foreign_key: true, type: :uuid
        t.string :location
        t.text :poster_url
  
        t.timestamps
      end
    end
  end
  