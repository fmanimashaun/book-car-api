FactoryBot.define do
  factory :car do
    name { 'MyString' }
    description { 'MyText with length of more than 10 characters' }
  end
end
