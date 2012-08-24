class Page < ActiveRecord::Base
  belongs_to :chapter
  attr_accessible :number, :image

  mount_uploader :image, ImageUploader

  before_validation :set_number

  validates :number, :presence => true

  def previous_page
  	Page.find_by_number_and_chapter_id(number - 1, chapter.id)
  end

  def next_page
  	Page.find_by_number_and_chapter_id(number + 1, chapter.id)
  end

  def manga_name
    chapter.manga_name
  end

  def chapter_number
    chapter.number
  end

  def to_param
    "#{number}"
  end

  private
    def set_number
      previous = chapter.pages.order("number").last

      self.number = previous ? previous.number + 1 : 0
    end

end
