class CreateClue < ActiveRecord::Migration
  def change
    create_table :clues do |t|
      t.belongs_to :answer, index: true
      t.string :title
    end
  end
end
