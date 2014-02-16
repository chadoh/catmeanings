FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "jane.doe.#{n}@catmeanings.com" }
    password SecureRandom.base64
    password_confirmation { password }
    auth_token SecureRandom.uuid
    password_reset_token SecureRandom.uuid
  end
end
