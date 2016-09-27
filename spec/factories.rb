FactoryGirl.define do
  factory :user do
    username("KK")
    email("kk@kk")
    password("123456")
  end

  factory :word do
    img("http://blog.bestfriendspetcare.com/wp-content/themes/best-friends/images/img_dog_right-col-top.png")
    title("Dog")
    user
  end

  factory :definition do
    content("animal")
    word
  end
end
