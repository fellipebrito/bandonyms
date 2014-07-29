class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :facebook_id
      t.string  :access_token
      t.string  :name
      t.string  :gender
      t.string  :link
    end
  end
end
