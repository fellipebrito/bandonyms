class Answer < ActiveRecord::Base
  validates_presence_of :title

  # has_many :tips, dependent: :destroy
end
