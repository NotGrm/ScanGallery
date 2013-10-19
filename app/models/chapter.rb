class Chapter < ActiveRecord::Base
  belongs_to :manga
  has_many :pages, :dependent => :destroy, :autosave => true

  attr_accessible :number, :team

  validates :number, :presence => true
  validate :number_cannot_be_duplicated

  def is_read?
    pages.to_a.count{|page|page.is_read} == pages.size
  end

  def read_percent
    total = pages.count
    reads = pages.to_a.count{|page| page.is_read }
    
    reads * 100 / total
  end

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

  def fullname
    "#{manga.name} - #{self.number}"
  end

  private
  def number_cannot_be_duplicated
    if manga.chapters.detect {|chapter| chapter.number == self.number && chapter != self}
      errors.add(:number, "can't be duplicated")
    end
  end
end
