class Answer < ActiveRecord::Base
  validates_presence_of :title
  has_many :clues, dependent: :destroy
end

class Clue < ActiveRecord::Base
  validates_presence_of :title
  belongs_to :answer
end
