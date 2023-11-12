class CreateDiscussions < ActiveRecord::Migration[7.0]
    def change
      create_table :discussions, id: :uuid,default: 'uuid_generate_v4()' do |t|
        t.string :title
        t.text :content
        t.belongs_to :user, null: false, foreign_key: true, type: :uuid
        t.string :discussion_type
        t.boolean :is_deleted
  
        t.timestamps
      end
    end
  end
  