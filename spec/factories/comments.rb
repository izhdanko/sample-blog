FactoryBot.define do
  factory :comment do
    author { "Test Username" }
    sequence(:body) { |n| "Comment body #{n}" }
  end
end