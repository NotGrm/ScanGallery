class Manga < ActiveRecord::Base
  attr_accessible :name
  has_many :chapters

  validates :name, :presence => true
end
