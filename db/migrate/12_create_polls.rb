class CreatePolls < ActiveRecord::Migration[7.0]
    def change
      create_table :polls, id: :uuid,default: 'uuid_generate_v4()' do |t|
        t.string :question
        t.datetime :end_date
        t.references :user, null: false, foreign_key: true, type: :uuid
        t.datetime :created_at, default: -> { 'CURRENT_TIMESTAMP' }
      end
    end
  end