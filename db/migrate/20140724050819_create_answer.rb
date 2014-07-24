class CreateAnswer < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :title
    end
  end
end
