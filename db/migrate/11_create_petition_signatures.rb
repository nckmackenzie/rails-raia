class CreatePetitionSignatures < ActiveRecord::Migration[7.0]
    def change
      create_table :petition_signatures, id: :uuid,default: 'uuid_generate_v4()' do |t|
        t.references :petition, null: false, foreign_key: true, type: :uuid
        t.references :user, null: false, foreign_key: true, type: :uuid
        t.text :reason_for_signing
  
        t.timestamps
      end
    end
  end
  