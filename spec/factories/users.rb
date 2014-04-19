# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| 'person#{n}@example.com'}
    first_name 'Homer'
    last_name 'Simpson'
    password 'password'
    password_confirmation 'password'
  end
end
