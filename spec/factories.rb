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
end

