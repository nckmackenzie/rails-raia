class CreatePollOptions < ActiveRecord::Migration[7.0]
    def change
      create_table :poll_options, id: :uuid,default: 'uuid_generate_v4()' do |t|
        t.references :poll, null: false,foreign_key: true, type: :uuid
        t.string :option
      end
    end
  end
  