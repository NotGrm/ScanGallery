require 'test_helper'

class ChapterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save chapter without number" do
    manga = mangas(:one)

  	chapter = manga.chapters.build
  	assert !chapter.save, "Saved the chapter without a number"
  end

  test "should have a unique number for a manga" do
    manga = mangas(:one)

    chapter = manga.chapters.build
    chapter.number = 10
    assert chapter.save, "Chapter not saved"

    chapter_bis = manga.chapters.build
    chapter_bis.number = 10
    assert !chapter_bis.save, "Saved chapter_bis with a duplicated number"
  end
end
