FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "jane.doe.#{n}@catmeanings.com" }
    password SecureRandom.base64
    password_confirmation { password }
    auth_token SecureRandom.uuid
    password_reset_token SecureRandom.uuid
  end

  factory :cat do
    sequence(:name) {|n| "Amazing Cat ##{n}" }
    image_url "http://0.media.collegehumor.cvcdn.com/47/92/9e17d515c9cd0ed0987454d4237b2f59-cat-and-person-eye-swap-is-fueled-by-your-nightmares.jpg"
    caption "Cat & human eye swap"
  end

  factory :comment do
    cat
    user
    text "OMG I <3 IT"
  end
end
