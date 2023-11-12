class CreateUsers < ActiveRecord::Migration[7.0]
    def change
      create_table :users, id: :uuid,default: 'uuid_generate_v4()' do |t|
        t.string :email, null: false, unique: true
        t.string :full_name, null: false
        t.string :username, unique: true
        t.string :contact, null: false
        t.string :national_id
        t.string :gender
        t.date :date_of_birth
        t.string :user_uid, unique: true
        t.string :occupation
        t.string :title_description
        t.string :member_type
        t.string :interests
        t.string :country
        t.string :location
        t.integer :county_id
        t.string :ward
        t.integer :role
        t.string :elected_position
        t.string :profile_image
        t.string :password_digest
        t.boolean :verified
        t.boolean :active, default: true
        t.boolean :is_deleted, default: false
  
        t.timestamps
      end
    end
  end
  