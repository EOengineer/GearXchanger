# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'EOengineer@gmail.com'
    first_name 'Eric'
    last_name 'Oligney'
    password 'password'
    password_confirmation 'password'
  end
end
