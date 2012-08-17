class Page < ActiveRecord::Base
  belongs_to :chapter
  attr_accessible :number, :image

  mount_uploader :image, ImageUploader

  #validates :number, :presence => true

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

  #one convenient method to pass jq_upload the necessary information
  def to_jq_upload
    {
      "name" => read_attribute(:image),
      "size" => image.size,
      "url" => image.url,
      "thumbnail_url" => image.thumb.url,
      "delete_url" => picture_path(:id => id),
      "delete_type" => "DELETE" 
    }
  end

end
