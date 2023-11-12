class CreateReviews < ActiveRecord::Migration[7.0]
    def change
      create_table :reviews, id: :uuid,default: 'uuid_generate_v4()' do |t|
        t.text :content
        t.decimal :rating
        t.string :category
        t.uuid :reviewer_id, null: false, foreign_key: { to_table: :users }
        t.uuid :leader_id, null: false, foreign_key: { to_table: :users }
  
        t.timestamps
      end
    end
  end
  