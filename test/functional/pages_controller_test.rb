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

  test "should get edit" do
    @page = pages(:with_number)
    get :edit, id: @page.number, :manga_id => @manga.id, :chapter_id => @chapter.id
    assert_response :success
  end

  test "should update page" do
    @page = pages(:with_number)
    put :update, id: @page.number, page: { number: @page.number + 1, image: File.open(File.join(Rails.root.join('public/images/test.jpg'))) }, :manga_id => @manga.id, :chapter_id => @chapter.id
    assert_redirected_to manga_chapter_path(@manga, @chapter)
  end

  test "should destroy page" do
    @page = pages(:with_number)
    assert_difference('Page.count', -1) do
      delete :destroy, id: @page, :manga_id => @manga, :chapter_id => @chapter.number
    end

    assert_redirected_to manga_chapter_path(@manga, @chapter)
  end
end
