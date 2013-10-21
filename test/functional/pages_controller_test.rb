require 'test_helper'

class PagesControllerTest < ActionController::TestCase

  setup do
    @page = pages(:page_one)
    @chapter = @page.chapter
    @manga = @chapter.manga
  end

  test "should get new" do
    get :new, :manga_id => @manga, :chapter_id => @chapter
    assert_response :success
  end

  test "should create page" do
    assert_difference('Page.count') do
      post :create, page: {image: Rails.root.join('public/images/test.jpg') }, :manga_id => @manga, :chapter_id => @chapter
    end
    assert_response :success
  end

  test "should show page" do
    get :show, id: @page, manga_id: @manga, chapter_id: @chapter
    assert_response :success
  end
end
