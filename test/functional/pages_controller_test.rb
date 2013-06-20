require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  setup do
    @chapter = chapters(:with_id)
    @manga = @chapter.manga
  end

  test "should get new" do
    get :new, :manga_id => @manga.id, :chapter_id => @chapter.id
    assert_response :success
  end

  test "should create page" do
    @page = pages(:without_number)
    assert_difference('Page.count') do
      post :create, page: {image: Rails.root.join('public/images/test.jpg') }, :manga_id => @manga.id, :chapter_id => @chapter.id
    end

    assert_response :success
  end

  test "should show page" do
    page = pages(:with_number)
    chapter = page.chapter
    manga = chapter.manga
    get :show, id: page, manga_id: manga, chapter_id: chapter
    assert_response :success
  end
end
