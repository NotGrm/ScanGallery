class Manga < ActiveRecord::Base
  attr_accessible :name
  has_many :chapters

  validates :name, :presence => true

  def self.last_ten_manga
  	Manga.order("created_at DESC").limit(10)
  end
end
