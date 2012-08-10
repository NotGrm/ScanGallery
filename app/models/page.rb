class Page < ActiveRecord::Base
  belongs_to :chapter
  attr_accessible :number, :image

  image_accessor :image

  validates :number, :presence => true
  validates_presence_of :image

  def previous_page
  	Page.find_by_number_and_chapter_id(number - 1, chapter.id)
  end

  def next_page
  	Page.find_by_number_and_chapter_id(number + 1, chapter.id)
  end

end
