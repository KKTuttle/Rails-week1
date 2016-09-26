FactoryGirl.define do
  factory :user do
    username("KK")
    email("kk@kk")
    password("123456")
  end

  factory :word do
    img("testest")
    title("Dog")
    user
  end

  factory :definition do
    content("animal")
    word
  end
end
