class Chapter < ActiveRecord::Base
  belongs_to :manga
  has_many :pages

  attr_accessible :number

  validates :number, :presence => true

  def self.last_ten_chapter
  	Chapter.order("created_at DESC").limit(10)
  end

  def full_name
  	"#{manga_name} #{number}"
  end

  def manga_name
  	manga.name
  end

  def to_param
    "#{number}"
  end

  def ordered_pages(order = "ASC")
    pages.order("number #{order}")
  end
end
