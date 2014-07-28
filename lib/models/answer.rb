class Answer < ActiveRecord::Base
  validates :title
  has_many :clues, dependent: :destroy
end
