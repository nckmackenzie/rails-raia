class CreateLeaderUploads < ActiveRecord::Migration[7.0]
    def change
      create_table :leader_uploads, id: :uuid,default: 'uuid_generate_v4()' do |t|
        t.references :user, foreign_key: true,type: :uuid
        t.string :upload_url
        t.timestamp :created_at, default: -> { 'CURRENT_TIMESTAMP' }, null: false
      end
    end
  end
  