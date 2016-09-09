require 'rails_helper'

describe "adding a word process" do
  it "adds a new word" do
    visit words_path
    click_link 'Create a new word'
    fill_in 'Img', :with => 'url'
    fill_in 'Word', :with => 'Ruby Hash'
    click_on 'Create Word'
    expect(page).to have_content 'Ruby Hash'
  end
end

describe "editting a word process" do
  it "edits a new word" do
    visit words_path
    click_link 'Create a new word'
    fill_in 'Img', :with => 'url'
    fill_in 'Word', :with => 'Ruby Hash'
    click_on 'Create Word'
    click_on 'Ruby Hash'
    click_on 'Edit'
    fill_in 'Img', :with => 'url'
    fill_in 'Word', :with => 'Hash in Ruby'
    click_on 'Update Word'
    expect(page).to have_content 'Hash in Ruby'
  end
end

describe "deleting a word process" do
  it "deletes a new word" do
    visit words_path
    click_link 'Create a new word'
    fill_in 'Img', :with => 'url'
    fill_in 'Word', :with => 'Ruby Hash'
    click_on 'Create Word'
    click_on 'Ruby Hash'
    click_on 'Delete'

    expect(page).not_to have_content 'Ruby Hash'
  end
end
