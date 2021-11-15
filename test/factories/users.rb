FactoryBot.define do
  factory :user do
      first_name { "MyString" }
      last_name { "MyString" }
      nickname { "MyString" }
      email { "example@email.com" }
      password { "MyString" }
  end
end
