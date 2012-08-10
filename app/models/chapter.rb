class Chapter < ActiveRecord::Base
  belongs_to :manga
  has_many :pages

  attr_accessible :number

  validates :number, :presence => true

  def manga_name
  	manga.name
  end
end
