FactoryBot.define do
  factory :comment do
    content {'Lorem ipsum dolor sit amet'}

    factory :comment_empty do
      content {''}
    end

    post
  end
end
