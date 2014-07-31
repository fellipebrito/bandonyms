class Clue < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :answer
end
