FactoryGirl.define do
  factory :user do
    username("KK")
    email("kk@kk")
    password("123456")
  end

  factory :word do
    img("url")
    title("Dog")
    user
  end
end
