class Page < ActiveRecord::Base
  belongs_to :chapter
  attr_accessible :number, :image, :chapter

  mount_uploader :image, ImageUploader

  validates :number, :presence => true

  before_validation :set_number, :on => :create
  before_destroy :destroy_page_file

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

    def destroy_page_file
      remove_image!
    end

end
