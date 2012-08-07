class Chapter < ActiveRecord::Base
  belongs_to :manga
  attr_accessible :number
end
