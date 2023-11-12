class CreateEventEnquiries < ActiveRecord::Migration[7.0]
    def change
      create_table :event_enquiries, id: :uuid,default: 'uuid_generate_v4()' do |t|
        t.text :message
        t.references :user, null: false, foreign_key: true, type: :uuid
        t.references :event, null: false, foreign_key: true, type: :uuid
        t.datetime :created_at, default: -> { 'CURRENT_TIMESTAMP' }
        
      end
    end
  end
  