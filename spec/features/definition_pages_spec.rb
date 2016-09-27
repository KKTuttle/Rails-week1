require 'rails_helper'


describe "adding new def", js: true,  type: :feature do
  it "adds new def" do
    word = FactoryGirl.create(:word)
    # user =User.find(word.user_id)
    login_as(word.user, :scope => :user)
    visit user_word_path(word.user, word)
    click_link "Add a new definition"
    fill_in "Meaning/Definition", :with => "animal"
    click_button 'Save'
    expect(page).to have_content "animal"
  end
end
