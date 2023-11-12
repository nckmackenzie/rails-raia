class CreateInterests < ActiveRecord::Migration[7.0]
    def change
      create_table :interests, id: :uuid,default: 'uuid_generate_v4()' do |t|
        t.string :name
        t.references :user, null: false, foreign_key: true,type: :uuid
  
        t.timestamps
      end
    end
  end
  