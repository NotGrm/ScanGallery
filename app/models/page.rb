class Page < ActiveRecord::Base
  belongs_to :chapter
  attr_accessible :number

  validates :number, :presence => true
end
