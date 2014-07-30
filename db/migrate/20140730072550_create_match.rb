class CreateMatch < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.belongs_to :user, index: true
      t.belongs_to :answer, index: true

      t.timestamps
    end
  end
end
