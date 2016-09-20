require 'rails_helper'
describe "signing up a new user" do
  it "signs up a new user" do
    visit root_path
    click_link 'Sign Up'
    fill_in "Username", :with => 'KK'
    fill_in "Email", :with => 'kk@kk.com'
    fill_in "Password", :with => "123456"
    fill_in "Password confirmation", :with => "123456"
    click_button "Sign up"
    expect(page).to have_content "You have signed up successfully."
  end
end

describe "logging in a user" do
  it "logs in a user" do
    FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in "Email", :with => 'kk@kk'
    fill_in "Password", :with => "123456"
    click_on "Log in"
    expect(page).to have_content('Signed in as KK')
  end
end

describe "logging out a user" do
  it "logs out a user" do
    FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in "Email", :with => 'kk@kk'
    fill_in "Password", :with => "123456"
    click_on "Log in"
    click_on "Sign Out"
    expect(page).to have_content('Signed out successfully.')
  end
end
