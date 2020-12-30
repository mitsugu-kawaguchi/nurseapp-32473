FactoryBot.define do
  factory :technique do
    title              {"test"}
    priority_id        {1}
    description        {"ttt"}
    target_at          {"2020/12/31"}
    completed_at       {"2021/06/16"}

    association :user
  end

end
