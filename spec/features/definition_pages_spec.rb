require 'rails_helper'


describe "adding new def", js: true,  type: :feature do
  it "adds new def" do
    word = FactoryGirl.create(:word)
    # user =User.find(word.user_id)
    login_as(word.user, :scope => :user)
    visit user_word_path(word.user, word)
    click_link "Add a new definition"
    sleep 10
    fill_in "Meaning/Definition", :with => "animal"
    click_button 'Save'
    wait_for_ajax
    expect(page).to have_content "animal"
  end
end
