require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe 'adding a new word' do
  it "adds a new word" do
    user =FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit root_path
    click_on "Add a new word"
    fill_in "Img", :with => 'url'
    fill_in "Word", :with => 'Dog'
    click_button "Create Word"
    expect(page).to have_content "Word successfully added!"
  end
end

describe "displaying saved words" do
  it "displays saved words" do
    word = FactoryGirl.create(:word)
    user =User.find(word.user_id)
    login_as(user, :scope => :user)
    visit root_path
    click_on "Words"
    expect(page).to have_content "Dog"
  end
end

describe "edditing saved words" do
  it "edits saved words" do
    word = FactoryGirl.create(:word)
    user =User.find(word.user_id)
    login_as(user, :scope => :user)
    visit root_path
    click_on "Words"
    click_link "Dog"
    click_link "Edit"
    fill_in "Word", :with => 'Doooog'
    click_button "Update Word"
    expect(page).to have_content "Word successfully editted!"
  end
end

# describe "deleting saved words" do
#   it "deletes saved words" do
#     word = FactoryGirl.create(:word)
#     user =User.find(word.user_id)
#     login_as(user, :scope => :user)
#     visit root_path
#     click_on "Words"
#     click_link "Dog"
#     click_link "Delete"
#     click_on "OK"
#
#     expect(page).to have_content "Word successfully deleted!"
#   end
# end
