require 'rails_helper'

describe "adding a definition process" do
  it "adds a new definition" do
    visit words_path
    click_link 'Create a new word'
    fill_in 'Img', :with => 'url'
    fill_in 'Word', :with => 'Ruby Hash'
    click_on 'Create Word'
    click_on 'Ruby Hash'
    click_on 'Add a new definition'
    fill_in 'Meaning/Definition', :with => 'Ruby hash is...'
    click_on 'Create Definition'
    expect(page).to have_content 'Ruby hash is...'
  end
end

describe "editting a definition process" do
  it "edits a definition" do
    visit words_path
    click_link 'Create a new word'
    fill_in 'Img', :with => 'url'
    fill_in 'Word', :with => 'Ruby Hash'
    click_on 'Create Word'
    click_on 'Ruby Hash'
    click_on 'Add a new definition'
    fill_in 'Meaning/Definition', :with => 'Ruby hash is...'
    click_on 'Create Definition'
    click_on 'Ruby hash is...'
    click_on 'Edit'
    fill_in 'Meaning/Definition', :with => 'A Hash is a dictionary-like collection of unique keys and their values.'

    expect(page).to have_content 'A Hash is a dictionary-like collection of unique keys and their values.'
  end
end
describe "deleting a definition process" do
  it "delete a saved definition" do
    visit words_path
    click_link 'Create a new word'
    fill_in 'Img', :with => 'url'
    fill_in 'Word', :with => 'Ruby Hash'
    click_on 'Create Word'
    click_on 'Ruby Hash'
    click_on 'Add a new definition'
    fill_in 'Meaning/Definition', :with => 'Ruby hash is...'
    click_on 'Create Definition'
    click_on 'Ruby hash is...'
    click_on 'Delete definition'
    expect(page).not_to have_content 'Ruby hash is...'
  end
end
