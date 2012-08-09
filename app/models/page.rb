class Page < ActiveRecord::Base
  belongs_to :chapter
  attr_accessible :number, :image

  image_accessor :image

  validates :number, :presence => true
  validates_presence_of :image
end
