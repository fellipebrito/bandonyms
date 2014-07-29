require 'spec_helper'

describe User do
  describe '#create_facebook_user' do
    subject (:active_user) do
      {
        "id"          => "0123456789",
        "first_name"  => "Bruce",
        "gender"      => "male",
        "last_name"   => "Wayne",
        "link"        => "https://www.facebook.com/app_scoped_user_id/0123456789/",
        "locale"      => "en_US",
        "name"        => "Bruce Wayne",
        "timezone"    => -7,
        "updated_time"=> "2014-07-22T09:45:19+0000",
        "verified"    => true
      }
    end

    it 'registers a new user' do
      user = User.new
      user.signup active_user

      expect(user[:name]).to eql active_user["name"]
      expect(user[:link]).to eql active_user["link"]
      expect(user[:gender]).to eql active_user["gender"]
      expect(user[:facebook_id]).to eql active_user["id"].to_i
    end
  end
end
