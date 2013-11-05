class Page < ActiveRecord::Base
  attr_accessible :number, :is_read, :image, :chapter

  belongs_to :chapter

  mount_uploader :image, ImageUploader

  validates :number, :presence => true

  before_validation :set_number, :on => :create
  before_destroy :destroy_page_file

  after_initialize :init, if: 'new_record?'

  def previous_page
    if chapter.pages.first == self
      previous_chapter_number = chapter.number - 1
      previous_chapter = Chapter.find_by_number_and_manga_id(previous_chapter_number, chapter.manga)
      previous_chapter.pages.last unless previous_chapter.nil?
    else
      Page.find_by_number_and_chapter_id(number - 1, chapter.id)
    end
  end

  def next_page
    if chapter.pages.last == self
      next_chapter_number = chapter.number + 1
      next_chapter = Chapter.find_by_number_and_manga_id(next_chapter_number, chapter.manga)
      next_chapter.pages.first unless next_chapter.nil?
    else
      Page.find_by_number_and_chapter_id(number + 1, chapter.id)
    end
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
  def init
    self.is_read = false
  end

  def set_number
    previous = chapter.pages.order("number").last

    self.number = previous ? previous.number + 1 : 0
  end

  def destroy_page_file
    remove_image!
  end

end
