require 'rails_helper'

describe Definition do
  it {should validate_presence_of :content}
end
