FactoryBot.define do
  factory :technique do
    title              {"test"}
    priority_id        {1}
    description        {"ttt"}
    target_at          {"2021/02/30"}
    completed_at       {"2021/10/30"}

    association :user
  end

end
