class CreateTicketReplies < ActiveRecord::Migration[7.0]
    def change
      create_table :ticket_replies, id: :uuid,default: 'uuid_generate_v4()' do |t|
        t.references :ticket, null: false, foreign_key: true, type: :uuid
        t.references :user, null: false, foreign_key: true, type: :uuid
        t.text :comment, null: false
        t.datetime :created_at, default: -> { 'CURRENT_TIMESTAMP' }
      end
    end
  end