class Word<ActiveRecord::Base
  belongs_to :user
  has_many :definitions
  validates :img, :presence => true
  validates :title, :presence => true

end
