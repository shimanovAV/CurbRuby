FactoryBot.define do
  factory :bet do
    trait :paper do
      name { "Paper" }
    end

    trait :rock do
      name { "Rock" }
    end

    trait :scissors do
      name { "Scissors" }
    end

    factory :paper_bet,   traits: [:paper]
    factory :rock_bet, traits: [:rock]
    factory :scissors_bet, traits: [:scissors]

  end
end