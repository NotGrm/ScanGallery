require 'test_helper'

class MangaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should have a presentation" do
    manga = Manga.new
    assert_respond_to manga, :presentation, "Doesn't have presentation attribute"
  end

  test "should have a status" do
    manga = Manga.new
    assert_respond_to manga, :status, "Doesn't have status attribute"
  end

  test "should have an author" do
    manga = Manga.new
    assert_respond_to manga, :author, "Doesn't have author attribute"
  end

  test "should not save manga without name" do
  	manga = Manga.new
  	assert !manga.save, "Saved the manga without a name"
  end
end
