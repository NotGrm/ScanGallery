class Manga < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :name
  has_many :chapters

  validates :name, :presence => true

  friendly_id :name, use: :slugged

  def self.last_ten_manga
  	Manga.order("created_at DESC").limit(10)
  end

  def ordered_chapters(order = "ASC")
    chapters.order("number #{order}")
  end

  def unread_chapters_number
    chapters.to_a.count{|chapter|chapter.is_read?}
  end
end
