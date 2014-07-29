class Answer < ActiveRecord::Base
  validates :title, presence: true
  has_many :clues, dependent: :destroy
end
