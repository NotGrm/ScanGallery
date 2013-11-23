class Manga < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :name, :author, :status, :presentation
  has_many :chapters, :dependent => :destroy

  validates :name, :presence => true
  validates_associated :chapters

  friendly_id :name, use: :slugged

  def self.last_ten_manga
  	Manga.order("created_at DESC").limit(10)
  end

  def ordered_chapters(order = "ASC")
    chapters.order("number #{order}")
  end

  def unread_chapters_number
    chapters.to_a.count{|chapter|!chapter.is_read?}
  end
end
