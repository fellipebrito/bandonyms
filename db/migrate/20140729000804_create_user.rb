class CreateUser < ActiveRecord::Migration
  def change
    create_table :user do |t|
      t.string :name
      t.string :access_token
    end
  end
end
