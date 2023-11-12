class CreateUserTitles < ActiveRecord::Migration[7.0]
    def change
      create_table :user_titles, id: :uuid,default: 'uuid_generate_v4()' do |t|
        t.references :user, null: false, foreign_key: true,type: :uuid
        t.string :user, :title, null: false
        t.datetime :created_at, default: -> { 'CURRENT_TIMESTAMP' }
      end
    end
  end