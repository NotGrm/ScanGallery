class Page < ActiveRecord::Base
  belongs_to :chapter
  attr_accessible :number, :image

  mount_uploader :image, ImageUploader

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

end
