class Word<ActiveRecord::Base
  has_many :definitions
  validates :img, :presence => true
  validates :title, :presence => true

end
