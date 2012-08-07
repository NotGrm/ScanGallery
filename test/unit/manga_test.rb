require 'test_helper'

class MangaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save manga without name" do
  	manga = Manga.new
  	assert !manga.save, "Saved the manga without a name"
  end
end
