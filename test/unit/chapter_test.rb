require 'test_helper'

class ChapterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save chapter without number" do
  	chapter = Chapter.new
  	assert !chapter.save, "Saved the chapter without a number"
  end
end
