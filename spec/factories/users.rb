FactoryBot.define do
  factory :user do
    name                  {"test"}
    email                 {"test@example"}
    password              {"000000"}
    password_confirmation {password}
    nursing_history       {20}
    ward_id               {1}
  end
end