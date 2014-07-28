class Clue < ActiveRecord::Base
  validates :title
  belongs_to :answer
end
