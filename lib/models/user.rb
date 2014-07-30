class User < ActiveRecord::Base
  validates :name, presence: true
  validates :facebook_id, uniqueness: true
  has_many :matches, dependent: :destroy

  def signup facebook_user
    # :access_token => facebook_user["j"],
    self.facebook_id  = facebook_user["id"]
    self.name         = facebook_user["name"]
    self.gender       = facebook_user["gender"]
    self.link         = facebook_user["link"]

    save
  end
end
