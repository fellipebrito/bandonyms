class Answer < ActiveRecord::Base
  validates_presence_of :title
  has_many :clues, dependent: :destroy
end
