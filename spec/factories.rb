FactoryGirl.define do
  factory :answer do
    title "Queen"

    after(:create) do |answer, evaluator|
      create(:clue, answer: answer)
    end
  end

  factory :clue do
    title 'King'
  end

  factory :user do
    facebook_id  '123'
    access_token 'ABC'
    name         'Bruce Wayne'
    gender       'male'
    link         'http://facebook.com/batman'
  end
end

