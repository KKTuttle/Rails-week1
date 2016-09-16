require 'rails_helper'

describe Word do
  it {should validate_presence_of :title}
  it {should validate_presence_of :img}
  it { should have_many :definitions }
  it { should belong_to :user }

end
