class Manga < ActiveRecord::Base
  attr_accessible :name
  has_many :chapters

  validates :name, :presence => true

  has_permalink :name, :param => true

  def self.last_ten_manga
  	Manga.order("created_at DESC").limit(10)
  end

  def ordered_chapters(order = "ASC")
    chapters.order("number #{order}")
  end

  def to_param
  	"#{permalink}"
  end
end
